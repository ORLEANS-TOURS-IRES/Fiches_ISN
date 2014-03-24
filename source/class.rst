****************************
Définir ses propres «objets»
****************************

Un **objet** est une entité informatique qui possède :

* des **attributs**: noms qui font référence à d'autres objets.

  si l'objet ``o`` possède l'attribut ``x``, l'écriture ``o.x`` permet d'accéder à cet attribut et l'écriture ``o.x = ...`` permet de modifier cet attribut (ou de le créer s'il n'existait pas).

* des **méthodes**: fonctions internes qui détermine son «comportement»;

  si l'objet ``o`` possède une méthode ``f``, l'écriture ``o.f(...)`` sert à déclencher le comportement correspondant.

Chaque objet informatique est caractérisé par:

* une **identité**: son adresse mémoire - ``id(obj)``;
* un **type**: la *classe* à laquelle il appartient - ``type(obj)``;
* une **valeur**: qui peut être modifiable ou non.

Comme objets vous connaissez déjà les *int*, *float*, *str*, *list*, *dict* ... mais aussi les fonctions, modules ...;  Exemple::

        >>> o = -5 # o est une référence vers un objet de type int
        >>> # tout objet de type (classe) int possède un attribut «denominator»
        >>> o.denominator
        1
        >>> # il possède aussi divers méthodes internes dont  __bool__ qui
        >>> # donne la valeur de condition (dans un if par exemple) d'un tel objet
        >>> o.__bool__()
        True  # tout entier non nul est considéré comme vrai
        >>> dir(o) # affiche la liste des attributs et méthodes de l'objet ...
        ['__abs__', '__add__', '__and__', '__bool__', '__ceil__', '__class__', '__delattr__', '__divmod__', ...]

Définir un type d'objets - ``class``
====================================

Pour construire un objet, on commence par définir quels seront ces attributs et méthodes au sein d'une classe::

        class NomClasse:
                """ documentation de
                cette classe ...
                """

                # déclaration des attributs et méthodes de cette classe

Cela fait, pour construire un objet de type ``NomClasse``, on appelle la classe un peu comme une fonction::

        >>> # définition d'une classe Test minimale 
        >>> class Test(object):
        ...     "blah blah"
        ...
        >>> # Création d'un objet par l'intermédiaire de cette classe
        >>> o1 = Test()
        >>> o1
        <__main__.Test object at 0x23f1690>
        >>> o2 = Test()
        >>> o2
        <__main__.Test object at 0x23f1690>
        >>> type(o1)
        <class '__main__.Test'>
        >>> o1 == o2
        False

        
Une classe est en quelque sorte un «moule à objet». Chaque objet créé à partir d'elle possède une identité (son adresse en mémoire vive).


