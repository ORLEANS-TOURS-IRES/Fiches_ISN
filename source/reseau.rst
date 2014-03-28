********************
Communication réseau
********************

Pour faire **communiquer** deux programmes (ou plus) sur le réseau, on utilise des  *canaux de communication* appelés **sockets**. Voici le minimum à avoir à l'esprit pour pouvoir s'en servir effectivement:

* Un tel programme commence par **importer le module socket** - ``import socket``.
  
* Pour joindre un programme «prog» qui tourne sur une machine A, on a besoin:

  * de l'**adresse IP de la machine A** qui est de la forme ``xxx.xxx.xxx.xxx`` (ex: 192.168.1.1)
  * d'un numéro, qui sert à identifier «prog» sur cette machine, appelé **port**.

* Il faut distinguer deux types de *canaux de communication* ou *sockets*:
  
  * **socket serveur**: elles écoutent le réseau en vue d'initier la communication - penser à l'opérateur téléphonique. 
  * **socket client**: elles servent à transmettre et recevoir effectivement les messages échangés - penser au téléphone lui-même.

* Les messages émis sur le réseau doivent-être des chaînes d'octets - de type *bytes*:

  * **encoder**: action de convertir une chaîne de caractères - *str* - en une chaîne d'octets - *bytes* - ``str.encode('utf-8')``.
  * **décoder**: action de convertir une chaîne d'octets - *bytes* - en une chaînes de caractère - *str* - ``bytes.decode('utf-8')``.

Création du serveur
===================

Structure du programme
----------------------

1. **Création d’un canal de communication** - ``serveur = socket.socket()``

   .. code-block:: python
           
           import socket
           serveur = socket.socket() # création du «canal de communication»

2. Choix du port d'**écoute** (supérieur à 1000, ici 6789) - ``serveur.bind(adresse)`` et ``.listen(1)``

   .. code-block:: python

           ip = '' # chaîne vide pour adresse locale; sinon mettre l'ip de la machine
           port = 6789 # choix du port (doit-être supérieur à 1000)
           adresseServeur = ip, port # adresse complète de ce programme ...
           serveur.bind(addresseServeur) # ... qu'on associe au canal de communication
           canalVersServeur.listen(1) # puis on lance l'écoute de ce canal.
	
3. **Attente bloquante d’une connexion** d’un nouveau client - ``serveur.accept() -> client, adresseClient``
   
   Suite à cette instruction, la variable *client* est un canal qui permettra de gérer la communication avec le nouveau client; la variable *adresseClient* contient son adresse IP et son port.

   .. code-block:: python

           client, adresseClient = serveur.accept() # «bloquant» ...
           # ... = le code situé après la ligne précédente 
           # ne sera exécuté que lorsqu'un client se sera effectivement connecté.
	
4. **Envoi** d’un message (*bytes*) vers le client - ``client.send(message)``

   .. code-block:: python

           mess = 'Salut !' # chaîne de caractères -> str
           messEnc = mess.encode('utf-8') # encodage: conversion str vers bytes
           client.send(messEnc) # envoie du message
           # en une seule ligne ? client.send('Salut'.encode('utf-8'))
	
5. **Réception** bloquante d’un message (*bytes*) envoyé par le client (1024 octets maximum) - ``recuEnc = client.recv(1024)``

   .. code-block:: python

           recuEnc = client.recv(1024) # bloque jusqu'à réception
           recu = recuEnc.decode('utf-8') # on a recu une chaîne d'octets : il faut la «décoder» (bytes -> str)
           # en une seule ligne ? recu = client.recv(1024).decode('utf-8')
	
6. **Déconnexion et arrêt** du serveur - ``.close()``

   .. code-block:: python

           client.close()
           serveur.close()
	

Exemple complet
---------------

.. code-block:: python

        import socket

        # Identification réseau de ce programme
        IP = ''
        PORT = 6789
        ADRESSE = IP, PORT

        # création d'un canal de communication - socket - de type serveur
        serveur = socket.socket() # création
        serveur.bind(ADRESSE) # association à l'adresse du programme ...
        serveur.listen(1) # écoute du réseau
        
        # si quelqu'un se connecte, on accepte la communication
        client, adresseClient = serveur.accept() # attente bloquante
        print('Connexion de', adresseClient)

        # Boucle de dialogue (ici de type «perroquet»)
        while True:
            recu = client.recv(1024)
            if not recu:
                print('Erreur de réception.')
                break
            else:
                recu = recu.decode('utf-8') # décodage du message reçu
                print('Réception de:', recu)
                reponse = recu.upper() # «perroquet»
                print('Envoi de :', reponse)
                reponse = reponse.encode('utf-8') # encodage du message à émettre
                n = client.send(reponse)
                if n != len(reponse):
                    print('Erreur envoi.')
                    break
                else:
                    print('Envoi ok.')

        # on ferme les connexions proprement
        print('Fermeture de la connexion avec le client.')
        client.close()
        print('On se débranche')
        serveur.close()


Création du client
==================

Structure du programme
----------------------

1. **Création d’un canal** pour gérer la communication - ``socket.socket()``

   .. code-block:: python

           import socket 
           client = socket.socket()
	
2. **Connexion au serveur** en utilisant son adresse et son port - ``client.connect(adresseServeur)``

   .. code-block:: python

           adrServ = '', 6789 # mettre la véritable ip du serveur à joindre à la place de ''
           client.connect(adrServ)
	
3. **Envoi** d’un message vers le serveur - ``client.send(message)``

   .. code-block:: python
           
           mess = 'Bonjour'
           messEnc = mess.encode('utf-8')
           client.send(messEnc)

4. **Réception** bloquante d’un message du serveur (1024 octets maximum) - ``client.recv(1024)``

   .. code-block:: python

           recuEnc = client.recv(1024)
           recu = recuEnc.decode('utf-8')
	
5. **Déconnexion** - ``client.close()``

   .. code-block:: python

           client.close()
	
Exemple complet
---------------

.. code-block:: python

        import socket

        IPSERVEUR = '' # pour test en local; sinon mettre la vraie ip
        PORT = 6789

        client = socket.socket()
        client.connect((HOST, PORT))
        print('Connexion vers ' + HOST + ':' + str(PORT) + ' reussie.')

        while True:
            message = input('>>> ')
            print('Envoi de :', message)
            message = message.encode('utf-8')
            n = client.send(message)
            if n != len(message):
                print('Erreur envoi.')
                break
           else:
                print('Envoi ok.')
                print('Reception...')
                recu = client.recv(1024)
                recu = recu.decode('utf-8')
                print('Recu :', recu)

        print('Déconnexion.')
        client.close()

