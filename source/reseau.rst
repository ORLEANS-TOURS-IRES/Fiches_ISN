********************
Communication réseau
********************

Pour faire dialoguer deux programmes sur le réseau, on utilise des  *canaux de communication* appelés **sockets**.

* Pour joindre un programme «prog» qui tourne sur une machine A, on a besoin:

  * de l'**adresse IP de la machine A** qui est de la forme ``xxx.xxx.xxx.xxx`` (ex: 192.168.1.1)
  * d'un numéro, qui sert à identifier «prog» sur cette machine, appelé **port**.

Le programme qui prend l'initiative de la communication est appelé **client**, celui qui attend qu'on le joigne est appelé **serveur**.

Dans tous les cas, le programme commence par **importer le module socket** - ``import socket``.
  
Création du serveur
===================

Structure du programme
----------------------

1. **Création d’un canal de communication** - ``canalVersServeur = socket.socket()``

   .. code-block:: python
           
           import socket
           canalVersServeur = socket.socket() # création du «canal de communication»


2. Choix du port d'**écoute** (supérieur à 1000, ici 6789) - ``canalVersServeur.bind(adresse)`` et ``.listen(1)``

   .. code-block:: python

           ip = '' # chaîne vide pour adresse locale; sinon mettre l'ip de la machine
           port = 6789 # les ports inférieurs à 1000 sont «réservés»
           adresseServeur = ip, port # l'adresse complète de ce programme ...
           canalVersServeur.bind(addresseServeur) # ... qu'on associe au canal de communication
           canalVersServeur.listen(1) # puis on lance l'écoute de ce canal.
	
3. **Attente bloquante d’une connexion** d’un nouveau client - ``canalVersServeur.accept() -> canalVersClient, adresseClient``
   
   Suite à cette instruction, la variable *client* est un canal de communication qui permettra de gérer la communication avec le nouveau client; la variable *adresseClient* contient son adresse IP et son port.

   .. code-block:: python

           canalVersClient, adresseClient = canalVersServeur.accept() # «bloquant» ...
           # ... = le code situé après la ligne précédente 
           # ne sera exécuté que lorsqu'un client se sera effectivement connecté
	
4. **Envoi** d’une chaine d'octets (*bytes*) vers le client - ``canalVersClient.send(message)``

   .. code-block:: python

           mess = 'Salut !' # chaîne de caractères -> str
           messEnc = mess.encode('utf-8') # encodage: chaîne d'octets -> bytes
           canalVersClient.send(messEnc) # envoie du message
           # en une seule ligne ? canalVersClient.send('Salut'.encode('utf-8'))
	
5. **Réception** bloquante d’une chaîne d'octets envoyé par le client (1024 caractères maximum) - ``recuEnc = canalVersClient.recv()``

   .. code-block:: python

           recuEnc = canalVersClient.recv(1024) # bloque jusqu'à réception
           recu = recuEnc.decode('utf-8') # on a recu une chaîne d'octets : il faut la «décoder»
           # en une seule ligne ? recu = client.recv(1024).decode('utf-8')
	
6. **Déconnexion et arrêt** du serveur - ``canal*.close()``

   .. code-block:: python

           canalVersClient.close()
           canalVersServeur.close()
	

Exemple complet
---------------

.. code-block:: python

        import socket

        # Identification réseau
        IP = ''
        PORT = 6789
        ADRESSE = IP, PORT

        # Ouverture du canal de communication 
        canVersServ = socket.socket()
        canVersServ.bind(ADRESSE)
        canVersServ.listen(1)

        # Attente d'une connexion entrante
        canVersClient, adresseClient = canVersServ.accept()
        print('Connexion de', adresseClient)

        # Boucle de dialogue (de type «perroquet»)
        while True:
            recuEnc = canVersClient.recv(1024)
            if not recuEnc:
                print('Erreur de réception.')
                break
            else:
                recu = recuEnc.decode('utf-8')
                print('Réception de:', recu)
                reponse = recu.upper()
                print('Envoi de :', reponse)
                reponseEnc = reponse.encode('utf-8')
                n = canVersClient.send(reponseEnc)
                if n != len(reponseEnc):
                    print('Erreur envoi.')
                    break
                else:
                    print('Envoi ok.')

        # on ferme les connexions proprement
        print('Fermeture de la connexion avec le client.')
        canVersClient.close()
        print('Arret du serveur.')
        canVersServ.close()


Création du client
==================

Structure du programme
----------------------

1. **Création d’un canal** pour gérer la communication - ``socket.socket()``

   .. code-block:: python

           import socket 
           client = socket.socket()
	
2. **Connexion au serveur** en utilisant son adresse et son port - ``socketClient.connect(adresseServeur)``

   .. code-block:: python

           adrServ = '', 6789 # mettre la véritable ip à la place de ''
           client.connect(adrServ)
	
3. **Envoi** d’une chaîne d'octets vers le serveur - ``socketClient.send(message)``

   .. code-block:: python
           
           mess = 'Bonjour'
           messEnc = mess.encode('utf-8')
           client.send(messEnc)

4. **Réception** bloquante d’une chaîne (1024 octets maximum) - ``socketClient.recv(1024)``

   .. code-block:: python

           recuEnc = client.recv(1024)
           recu = recuEnc.decode('utf-8')
	
5. **Déconnexion** - ``socketClient.close()``

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
            messageEnc = message.encode('utf-8')
            n = client.send(messageEnc)
            if n != len(messageEnc):
                print('Erreur envoi.')
                break
           else:
                print('Envoi ok.')
                print('Reception...')
                recuEnc = client.recv(1024)
                recu = recuEnc.decode('utf-8')
                print('Recu :', recu)

        print('Déconnexion.')
        client.close()

