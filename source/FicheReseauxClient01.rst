************************
Un client TCP en Python
************************

Structure du programme
======================

1. Création d’une variable *client* pour gérer la communication TCP/IP

   .. code-block :: python

           client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	
2. Connexion au serveur TCP d’adresse 172.16.180.10 et de port 6789

   .. code-block :: python

           client.connect((172.16.180.10, 6789))
	
3. Envoi d’une chaine de caractères vers le serveur

   .. code-block :: python

           client.send(‘Hello’)

4. Réception bloquante d’une chaine et stockage dans la variable *donnees* (1024 caractères maximum)

   .. code-block :: python

           donnees = client.recv(1024)
	
5. Déconnexion

   .. code-block :: python

           client.close()
	
Exemple complet
===============

.. code-block :: python

	import socket

	HOST = '172.16.180.10'
	PORT = 6789       

	client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	client.connect((HOST, PORT))
	print 'Connexion vers ' + HOST + ':' + str(PORT) + ' reussie.'

	message = 'Hello, world'
	print 'Envoi de :' + message
	n = client.send(message)
	if (n != len(message)):
		print 'Erreur envoi.'
	else:
		print 'Envoi ok.'

	print 'Reception...'
	donnees = client.recv(1024)
	print 'Recu :', donnees

	print 'Deconnexion.'
	client.close()

Ressources
==========

Tutoriel sur la programmation sockets Python : http://docs.python.org/2/howto/sockets.html



