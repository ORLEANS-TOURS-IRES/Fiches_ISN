************************
Un serveur TCP en Python
************************

Structure du programme
======================

1. Création d’une variable serveur pour gérer la communication TCP/IP

   .. code-block :: python

           serveur = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

2. Mise en écoute sur le port 6789

   .. code-block :: python

           serveur.bind(('', 6789))
           serveur.listen(1)
	
3. Attente  bloquante d’une connexion d’un nouveau client. Suite à cette instruction, la variable *client* permettra de gérer la communication avec le nouveau client, et la variable *adresseClient* contient son adresse IP.

   .. code-block :: python

           client, adresseClient = serveur.accept()
	
4. Envoi d’une chaine de caractères vers le client

   .. code-block :: python

           client.send('Hello')
	
5. Réception bloquante d’une chaine et stockage dans la variable *donnees* (1024 caractères maximum)

   .. code-block :: python

           donnees = client.recv(1024)
	
6. Déconnexion et arrêt du serveur

   .. code-block :: python

           client.close()
           serveur.close()
	
Exemple complet
===============

.. code-block :: python

	import socket
	ADRESSE = ''
	PORT = 6789

	serveur = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	serveur.bind((ADRESSE, PORT))
	serveur.listen(1)
	client, adresseClient = serveur.accept()
	print 'Connexion de ', adresseClient

	donnees = client.recv(1024)
	if not donnees:
		print 'Erreur de reception.'
	else:
		print 'Reception de:' + donnees
		
		reponse = donnees.upper()
		print 'Envoi de :' + reponse
		n = client.send(reponse)
		if (n != len(reponse)):
		print 'Erreur envoi.'
		else:
		print 'Envoi ok.'


	print 'Fermeture de la connexion avec le client.'
	client.close()
	print 'Arret du serveur.'
	serveur.close()

Ressources
==========

Tutoriel sur la programmation sockets Python : http://docs.python.org/2/howto/sockets.html

