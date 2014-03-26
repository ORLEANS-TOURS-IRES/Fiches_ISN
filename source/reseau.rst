******
Réseau
******

Pour faire dialoguer deux programmes sur le réseau, on utilise un canal de communication appelé **socket**. Le module *socket* sert à cela.

* Pour joindre un programme *prog1* qui tourne sur une machine *A*, on a besoin:
  * de l'**adresse IP** de la machine *A* qui est de la forme ``xxx.xxx.xxx.xxx`` (ex: 192.168.1.1)
  * d'un numéro pour identifier *prog1* qu'on appelle **port**. Pour un programme «normal», utiliser un port supérieur à 1000 (les autres sont réservés).

Le programme qui prend l'initiative de la communication est appelé **client**, celui qui attend qu'on le joigne est appelé **serveur**.

Dans tous les cas, le programme commence par **importer le module socket** - ``import socket as so``.
  
Création du serveur
===================

Structure du programme
----------------------

1. Création d’une variable serveur pour gérer la communication TCP/IP

   .. code-block :: python

           serveur = so.socket() # création du «canal de communication»

2. Choix du port d'écoute (supérieur à 1000), ici 6789

   .. code-block :: python

           ip = '' # chaîne vide pour adresse locale; sinon mettre l'ip
           port = 6789
           adresseServeur = ip, port # l'adresse complète de ce programme
           serveur.bind(addresseServeur) # qu'on associe au canal de communication
           serveur.listen(1) # déclenche l'écoute sur ce canal.
	
3. Attente bloquante d’une connexion d’un nouveau client. Suite à cette instruction, la variable *client* permettra de gérer la communication avec le nouveau client, et la variable *adresseClient* contient son adresse IP.

   .. code-block :: python

           client, adresseClient = serveur.accept()
           # bloquant = le code situé après la ligne précédente 
           # ne sera exécuté que lorsqu'un client se sera connecté
	
4. Envoi d’une chaine d'octets (*bytes*) vers le client

   .. code-block :: python

           mess = 'Salut !' # chaîne de caractères -> str
           messEnc = mess.encode('utf-8') # encodage: chaîne d'octets -> bytes
           client.send(messEnc) # envoie du message
	
5. Réception bloquante d’une chaine et stockage dans la variable *donnees* (1024 caractères maximum)

   .. code-block :: python

           recuEnc = client.recv(1024) # on reçoit une chaîne d'octets
           recu = recuEnc.decode('utf-8') # il faut la «décoder»
	
6. Déconnexion et arrêt du serveur

   .. code-block :: python

           client.close()
           serveur.close()
	
Exemple complet
---------------

.. code-block :: python

        import socket as so

        # Identification réseau
        IP = ''
        PORT = 6789
        ADRESSE = IP, PORT

        # Ouverture du canal de communication 
        serveur = so.socket()
        serveur.bind(ADRESSE)
        serveur.listen(1)

        # Attente d'une connexion entrante
        client, adresseClient = serveur.accept()
        print('Connexion de', adresseClient)

        # Boucle de dialogue (de type «perroquet»)
        while True:
            recuEnc = client.recv(1024)
            if not recuEnc:
                print('Erreur de réception.')
                break
            else:
                recu = recuEnc.decode('utf-8')
                print('Réception de:', recu)
                reponse = recu.upper()
                print('Envoi de :', reponse)
                reponseEnc = reponse.encode('utf-8')
                n = client.send(reponseEnc)
                if n != len(reponseEnc):
                    print('Erreur envoi.')
                    break
                else:
                    print('Envoi ok.')

        # on ferme la connexion proprement
        print('Fermeture de la connexion avec le client.')
        client.close()
        print('Arret du serveur.')
        serveur.close()

Un client TCP en Python
=======================

Structure du programme
----------------------

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
---------------

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
----------

Tutoriel sur la programmation sockets Python : http://docs.python.org/2/howto/sockets.html



