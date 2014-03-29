*******************************
Aléatoire - ``random``
*******************************

Prérequis:

* les types de nombres et de variables

* les listes

Le module qui gère l'aléatoire en python est le module ``random``::

        from random import *

Les nombres au hasard
=====================

1. Nombre flottant (réel) entre 0 et 1::

        >>> random()
        0.49852220170348827

2. Nombre flottant entre deux bornes.

   Pour tirer un nombre au hasard entre 10 et 12.5::

	y = uniform(10, 12.5)

3. Nombre entier entre deux bornes::

	>>> randint(0, 20)
	20

   Les deux bornes sont incluses dans les cas possibles.
 
4. Générer une probabilité p

   32 % de chance de gagner à ce jeu...
 
.. code-block:: python

        if random() <= 0.32:
            print("gagné")
        else:
            print("perdu")

Les listes aléatoires
=====================

1. Créer une liste aléatoire de 1000 nombres entiers entre 0 et 100::

        liste = []
        for i in range(1000):
            liste.append( randint(0, 100) )

2. Mélanger une liste::

	shuffle(liste)

3. Choisir au hasard un élément d'une liste::

	N = choice(liste)

3. Extraire au hasard k éléments d'une liste

   Extrait aléatoirement trois éléments de la liste::

	jeu = sample(liste, 3)

   .. warning::
        
           La liste n'est pas modifiée (les 3 éléments choisis sont encore présents dans la liste).

Exemple complet
===============

.. code-block:: python

        from random import *

        # un jeu de carte 
        couleur = ["pique", "coeur", "carreau", "trèfle"]
        hauteur = ["As", "Roi", "Dame", "Valet", "Dix", "Neuf", "Huit", "Sept"]

        jeu = []
        for c in couleur:
            for h in hauteur:
                jeu.append(h+" de "+c)
	
        print("Le jeu neuf :")
        print(jeu)

        # mélanger
        shuffle(jeu)
        print("Le jeu mélangé")
        print(jeu)

        # Choisir au hasard le nombre de carte à donner
        N = randint(3, 10)
        print("Je donne "+str(N)+" cartes")

        # Donner N cartes
        donne = sample(jeu, N)
        print("Les voilà :")
        print(donne)

        # Attention les cartes données sont encore dans le jeu
        print("Le jeu est-il complet ?")
        print(len(jeu))

