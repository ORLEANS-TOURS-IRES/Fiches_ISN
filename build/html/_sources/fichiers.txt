.. role:: raw-html(raw)
   :format: html

*********
Fichiers
*********

Pouvoir lire et/ou écrire dans un fichier est indispensable lorsqu'on souhaite, par exemple, récupérer/sauvegarder des informations entre deux exécutions d'un même programme. On parle alors de **persistance** de l'information.

Lire/écrire du texte dans un fichier
====================================

* **Créer** un nouveau fichier et y **écrire** - :code:`fich = open(<nom_fichier>, 'w')` et `fich.write(chaine)`::

        >>> # Dans quel dossier suis-je ?
        >>> from os import getcwd
        >>> getcwd()
        '/home/etienne/Python/Fichiers'
        >>> # votre fichier sera créé dans ce répertoire.
        >>> f = open('test.txt', 'w') # 'w' pour write -> écrire.
        >>> # f est un ojet qui représente le fichier créé.
        >>> f.write('Je découvre la gestion des fichiers.')
        36
        >>> f.write('Ça paraît assez simple ...')
        26
        >>> # C'est fini ? fermer votre fichier! 
        >>> f.close()

* **Lire** un fichier existant - ``fich = open(<nom_fichier>)`` et ``fich.read()``::

        >>> f = open('test') # oups ...
        Traceback (most recent call last):
                File "<stdin>", line 1, in <module>
        IOError: [Errno 2] No such file or directory: 'test'
        >>> f = open('test.txt') # ou open('test.txt', 'r')
        >>> contenu = f.read()
        >>> contenu
        'Je découvre la gestion des fichiers.Ça paraît assez simple ...'
        >>> f.read()
        ''
        >>> # car vous avez déjà tout lu ... il est temps de fermer !
        >>> f.close()

* **Ajouter** du texte à un fichier existant - ``fich = open(<nom_fichiers>, 'a')``::

        >>> f = open('test.txt', 'a') # 'a' pour append -> ajouter
        >>> f.write('\nligne2\nligne3\n\nblah blah') # rappel \n symbolise le caractère saut de ligne.
        25
        >>> f.close()
        >>> f = open('test.txt')
        >>> print(f.read())
        Je découvre la gestion des fichiers.Ça paraît assez simple ...
        ligne2
        ligne3

        blah blah
        >>> f.close()

* Récupérer la liste des lignes d'un fichier - ``fich.readlines()``::

        >>> f = open('test.txt')
        >>> lignes = f.readlines()
        >>> lignes # noter que les caractères de saut de lignes - \n - sont conservés.
        ['Je découvre la gestion des fichiers.Ça paraît assez simple ...\n', 'ligne2\n', 'ligne3\n', '\n', 'blah blah']
        >>> f.close()

* **Parcourir** les lignes d'un fichier - ``for ligne in fich``::

        >>> copie = open('copie', 'w')
        >>> orig = open('test.txt')
        >>> i = 0
        >>> for lgn in orig:
        ...     i += 1
        ...     lgn = str(i) + ": " + lgn 
        ...     copie.write(lgn)
        ...
        >>> orig.close()
        >>> copie.close()

* Options courantes d'ouverture d'un fichier - ``open(<nom_fichier>, option)``:

   ========= ===============================================================
   Option    Signification
   ========= ===============================================================
   ``'r'``   ouverture en lecture (par défaut)
   ``'w'``   ouverture en écriture (un fichier existant est perdu)
   ``'x'``   ouverture en écriture sécurisée (erreur si le fichier existe)
   ``'a'``   ouverture en ajout à la fin du fichier s'il existe
   ``'b'``   mode binaire - on lit ou écrit via une chaîne d'octes ``bytes``
   ``'t'``   mode texte (par défaut)
   ========= ===============================================================

  ``'wt'`` est équivalent à ``'w'``. Pour voir un fichier comme une chaîne d'octets, utiliser ``'rb'``, ``'wb'`` , etc.

Sauvegarder/restaurer des «objets»
==================================

``pickle`` est un module qui facilite considérablement la sauvegarde/récupération de données Python par l'intermédiaire de fichiers. 

.. warning:: Les fichiers doivent être ouverts en **mode binaire** - ``'b'``.

* **Sauvegarder** une ou des données dans un fichier - ``pickle.dump(donne, fichier)``::

        >>> import pickle
        >>> donnees = {"nom": 'Dupond', "Prénom": 'andré', "age": 32}
        >>> fsauv = open('donnees.pickle', 'wb') # ouverture en mode binaire !!
        >>> pickle.dump(donnees, fsauv)
        >>> fsauv.close()

* **Restaurer** une donnée sauvée via pickle - ``pickle.load(fichier)``::

        >>> import pickle
        >>> f = open('donnees.pickle', 'rb') # mode lecture binaire !!
        >>> restaure = pickle.load(f)
        >>> restaure
        {'nom': 'Dupond', 'age': 32, 'Prénom': 'andré'}
        >>> f.close()

Notion de chemin 
================

Pour ouvrir un fichier qui ne se trouve pas dans le répertoire courant, il faut être capable d'indiquer où il se trouve dans l'arborescence du disque c'est à dire son **chemin**.

Voici un exemple (volontairement très simple !) d'organisation d'un disque:

.. code-block:: text

   dossier1/
        fichier1.txt
        ...
        ss_dossier/
                fichier2.ppm
                ...
   fichier3.py
   ...

Les noms complets des fichiers dépendent d'un dossier de référence:

  * **Chemin absolu** - depuis la «racine» du disque notée ``/``:

    * de *fichier1.txt* : ``/dossier1/fichier1.txt``
    * de *fichier2.ppm* : ``/dossier1/ss_dossier/fichier2.ppm``

  * **chemin relatif** - à partir d'un dossier particulier (souvent le dossier courant):    

    * de *fichier1.txt* à partir de **dossier1** : ``fichier1.txt`` 
    * de *fichier3.py* à partir de **dossier1** : ``../fichier3.py`` (``..`` ~ dossier parent) 
    * de *fichier3.py* à partir de **ss_dossier** : ``../../fichier3.py``


.. note:: Un programme possède toujours un dossier de référence appelé **répertoire courant**. C'est normalement le dossier qui contient le fichier du programme. Pour s'en assurer:

   .. code-block:: python

        import os
        # ...
        rep_courant = os.getcwd() # cwd pour current working directory
        print(rep_courant)
