TEST
====

.. image:: img/etienne/exo1.png
        :align: center
        :width: 200 

Le propos de la fiche...

.. warning:: 
        Prérequis:

        + il faut ...
        + il est aussi nécessaire de ...

Section 1
---------

test code console::

        >>> temp = [5,3,2,-1]
        >>> temp
        [5, 3, 2, -1]
        >>> temp[1]
        3
        >>> temp[1] = "a"
        >>> temp
        [5, 'a', 2, -1]
        >>> for truc in temp:
        ...     print(truc)
        ... 
        5
        a
        2
        -1

test code fichier::

        from tkinter import *

        # Construction de la fenêtre principale «root»
        root = Tk()
        v = StringVar()
        v.set('Allemagne Autriche Belgique Chypre Espagne\
              Estonie Finlande France Grèce Irlande Italie\
              Lettonie Luxembourg Malte Pays-Bas Portugal\
              Slovaquie Slovénie')
        # Construction d'un simple bouton
        lb = Listbox(root, listvariable=v)

        lb.grid()
        root.columnconfigure(0, weight=1)
        root.rowconfigure(0, weight=1)



        root.mainloop()

.. note:: Le constructeur ``Tk()`` ...

Section 2
---------

.. list-table:: Titre de la table
   :header-rows: 1

   + - Nom
     - Prénom
     - Observation
   + - DUCHMOL
     - Tristan
     - Veut bien faire mais ...
   + - TOTO
     - André
     - À part faire des blagues ...




