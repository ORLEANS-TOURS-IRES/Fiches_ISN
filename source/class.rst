******************
Objets - ``class``
******************

Un **objet** est une entité informatique qui *possède* :

* des **attributs**: noms qui font référence à d'autres objets.

  si l'objet ``o`` possède l'attribut ``x``, l'écriture ``o.x`` permet d'accéder à cet attribut et l'écriture ``o.x = ...`` permet de modifier cet attribut (ou de le créer s'il n'existait pas).

* des **méthodes**: fonctions internes qui détermine son «comportement»;

  si l'objet ``o`` possède une méthode ``f``, l'écriture ``o.f(...)`` sert à déclencher le comportement correspondant.

Chaque objet informatique est *caractérisé* par:

* une **identité**: son adresse mémoire - ``id(obj)``;
* un **type**: la *classe* à laquelle il appartient - ``type(obj)``;
* une **valeur**

Comme objets vous connaissez déjà les *int*, *float*, *str*, *list*, *dict* ... mais aussi les *fonctions*, *modules* ...;  Exemple::

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

Définir une classe d'objets - ``class``
====================================

Pour construire des objets, on commence par définir une **classe** qui sert à préciser ce que les objets auront en commun. Voici la syntaxe d'une telle déclaration::

        class NomClasse:
                """ documentation de
                cette classe ...
                """

                # déclaration des attributs et méthodes de cette classe

Cela fait, pour construire des objets de type ``NomClasse``, on appelle la classe un peu comme une fonction::

        >>> # définition d'une classe Test minimale
        >>> class Test:
        ...     "blah blah"
        ...
        >>> # Création d'un objet par l'intermédiaire de cette classe
        >>> o1 = Test()
        >>> o1
        <__main__.Test object at 0x23f1690>
        >>> # 0x23f... ? c'est l'adresse en mémoire vive de l'objet
        >>> o2 = Test()
        >>> o2
        <__main__.Test object at 0x23f1690>
        >>> # observez que o1 et o2 ont des adresses différences
        >>> # donc ils sont distincts.
        >>> type(o1)
        <class '__main__.Test'>
        >>> o1 == o2
        False

        
Une classe est en quelque sorte un «moule à objet». Chaque objet créé à partir d'elle possède une **identité** (son adresse en mémoire vive) et un **type**, la classe elle-même.

L'opération qui consiste à créer un objet à partir de sa classe est appelé **instantiation**.

Attributs - ``def __init__(self,...):``
====================================================

Même si les objets que nous avons créés sont distincts puisqu'ils ont des adresses mémoires différentes, ils ont la même valeur (vide pour l'instant).

Pour les différencier, nous allons leur donner des **attributs** que nous initialiserons avec des valeurs différentes. Pour cela, on définit une **méthode spéciale** ``__init__()`` qui sera appelée automatiquement au moment de l'instantiation::

        class Individu:
            " ici la documentation ... "

            def __init__(self, nom, prenom, age):
                self.nom = nom.upper()
                self.prenom = prenom.capitalize()
                self.age = int(age)
        
        # Créons quelques «Individus»
        un_individu = Individu('durand', 'john', 16)
        autre_individu = Individu('dupont', 'alexandre', 36.7)
        print("{i.prenom} {i.nom} a {i.age} ans".format(i=un_individu))
        print("{i.prenom} {i.nom} a {i.age} ans".format(i=autre_individu))
      
L'exécution de se code donne

.. code-block:: text

        John DURAND a 16 ans
        Alexandre DUPONT a 36 ans

Voilà ce qui se passe lors de l'instantiation ``Individu('durand', 'john', 16)``:
        
  1. Python crée un objet `o` (vide pour l'instant) de type ``Individu`` ;
  2. puis, il appelle ``__init__`` en lui fournissant:
                
    * automatiquement **cet objet** `o` comme premier argument; donc, dans le code, ``self`` représente l'objet `o` fraîchement créé !
    *  les arguments fournis lors de l'instantiation pour les paramètres ``nom``, ``prenom``, ``age``.
          
  3. ``self.nom = ...`` signifie créer l'attribut ``nom`` pour **cet objet** (désigné par ``self``) et lui donner la valeur indiquée ;
  4. les autres lignes définissent de la même façon les attributs ``prenom`` et ``age`` pour cet objet.

.. important:: 

        **Retenir** : dans le code d'une classe, le mot ``self`` représente toujours l'objet individuel sur lequel on est en train d'agir. Ainsi, l'écriture ``self.attribut`` désigne la valeur particulière de l'attribut de **cet objet**.

Méthodes - ``def agir(self,...):``
==================================

Ajoutons deux méthodes ``est_majeur`` et ``vieillir`` à nos objets de type ``Individu``::

        class Individu:
            # ...

            def est_majeur(self):
                if self.age >= 18:
                    return True
                else:
                    return False

            def vieillir(self, ans=1):
                self.age = self.age + ans

        # ...
        john = un_individu
        print(john.est_majeur()) # -> False
        john.vieillir()
        print(john.age) # -> 17
        john.vieillir(2)
        print(john.age + " donc majeur: " + john.est_majeur()) # -> 19 donc majeur: True
        autre_individu.vieillir(5)
        if autre_individu.est_majeur():
            print(autre_individu.prenom + " a " + autre_individu.age + "ans !")
        # -> Alexandre a 41 ans !

Méthodes spéciales - ``__meth__(self,...)``
===========================================

Ces méthodes ont la particularité d'être **appelées automatiquement** par Python dans *certaines circonstances*. Par exemple, la méthode spéciale ``__init__`` est appelée automatiquement lors de l'**instantiation** d'une classe (création d'un objet).

À finir ...
