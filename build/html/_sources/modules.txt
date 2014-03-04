******************
Modules et paquets
******************

Module
======

Un **module** est basiquement un fichier ``nom_module.py`` ordinaire. Les variables, fonctions, classes qui y sont  définies peuvent être **importées** afin d'être réutilisées.

Python est accompagné de nombreux modules, ils forment sa librairie standard. On y trouve par exemple les modules *random*, *math*, *tkinter* et beaucoup d'autres.

* Importer un module et l'utiliser - ``import <nom_module>``::

        >>> import random # random -> aléatoire
        >>> random.randint(1,6) # «dé electronique»
        2
        >>> def de(): # trop long à écrire ?
        ...     return random.randint(1,6)
        ...
        >>> de()
        3
        >>> de()
        1
        >>> random.choice('abcdefghijklmnop') # caractère aléatoire de la chaîne
        'h'

* Utiliser un alias - ``import <nom_module> as <alias>``::

        >>> import random as alea
        >>> l = [1, 2, 3, 4]
        >>> alea.shuffle(l)
        >>> l
        [1, 4, 2, 3]

* Importer une ou plusieurs fonctions d'un module - ``from module import f1, f2, ...``::

        >>> from math import sqrt as racine, exp, log as ln, e
        >>> r = racine(5)
        >>> r
        2.23606797749979
        >>> round(r,2)
        2.24
        >>> [(x, round(racine(x), 2) ) for x in [0,1,2,3,4,5]]
        [(0, 0.0), (1, 1.0), (2, 1.41), (3, 1.73), (4, 2.0), (5, 2.24)]
        >>> from random import uniform 
        >>> x = uniform(0, 100)
        >>> ln(exp(x)) == x
        True
        >>> exp(ln(x)) == x
        True
        >>> e
        2.718281828459045
        >>> ln(e)
        1.0


* Importer tout ce qu'un module définis - ``from <nom_module> import *``::

        >>> from tkinter import *
        >>> fenetre = Tk() # une fenêtre devrait apparaître
        >>> bouton = Button(fenetre, text="cliquez moi !", command=fenetre.destroy)
        >>> # le bouton n'apparaît pas ??? normal, il faut encore le positionner
        >>> bouton.pack()
        
  .. warning::
        
        Procéder de la sorte est **généralement déconseillé** car de nombreux «noms» sont alors introduis dans l'interpréteur Python ce qui peut être source de conflits (en cas de multiples imports par exemple).
        Vous pouvez toutefois utilisez cette facilité pour écrire de petits programmes de découvertes de tel ou tel module::

                >>> La fonction dir(truc) sert à connaître les noms définie dans le contenxte de «truc»
                >>> dir() # si «truc» est omis, c'est le contexte courant
                ['__builtins__', '__doc__', '__name__', '__package__']
                >>> a = 5
                >>> dir() # le nom «a» existe à présent
                ['__builtins__', '__doc__', '__name__', '__package__', 'a']
                >>> import tkinter
                >>> dir() # seul le nom «tkinter» (ou plutôt l'espace de nom) est importé
                ['__builtins__', '__doc__', '__name__', '__package__', 'a', 'tkinter']
                >>> from tkinter import *
                >>> dir() # et maintenant ? argh !
                ['ACTIVE', 'ALL', 'ANCHOR', 'ARC', 'At', 'AtEnd', 'AtInsert', 'AtSelFirst', 'AtSelLast', 'BASELINE', 'BEVEL', 'BOTH', 'BOTTOM', 'BROWSE', 'BUTT', 'BaseWidget', 'BitmapImage', 'BooleanVar', 'Button', 'CASCADE', 'CENTER', 'CHAR', 'CHECKBUTTON', 'CHORD', 'COMMAND', 'CURRENT' ... 


Paquet ou *Package*
===================

À faire ...
