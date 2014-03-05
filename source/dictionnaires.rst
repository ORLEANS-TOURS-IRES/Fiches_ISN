*****************
Les dictionnaires
*****************

Un **dictionnaire** - type ``dict`` - est un moyen de mémoriser des *associations de la forme clé→valeur*.

* Littéralement, un **dictionnaire** est de la forme ``{clé1: val1, clé2: val2, ...}``

  * Les **clés** sont n'importe quelle valeur «primaire» ou *non modifiable* comme un entier, une chaîne, un tuple...
  * Les **valeurs** correspondantes sont de type arbitraire.

* La **longeur** d'un dictionnaire est le nombre de couple clé→valeur qu'il contient

Opérations de base
==================

* **Créer** un dictionnaire «littéralement» - ``{clé1: val1, clé2: val2, ...}``::

        >>> d = {"café": ":)", 0: ":(", "I": [1, 0]}
        >>> d # Noter que l'ordre d'insertion n'est pas conservé
        {0: ':(', 'I': [1, 0], 'café': ':)'}
  
* Connaître le nombre des couple clé→valeur contenu - ``len(dict)``::

        >>> len(d)
        >>> 3

* Savoir si une **clé** appartient au dictionnaire - ``cle in dict``::

        >>> "I" in d
        True
        >>> "Café" in d
        False

* Savoir si une **valeur** est associée à une clé d'un dictionnaire - ``val in dict.values()``::

        >>> d
        {0: ':(', 'I': [1, 0], 'café': ':)'}
        >>> ":-0" in d.values()
        False
        >>> ":)" in d.values()
        True

* **Récupérer** la valeur associée à une clé - ``dict[cle]``:: 

        >>> x = d["I"]
        >>> x
        [1, 0]
        >>> x[0]
        1
        >>> d["I"][0] # lire de droite à gauche: [0] premier élément de d["I"] c'est à dire [1, 0]
        1
        >>> d[0] # Une clé peut être un entier
        ':('
        >>> d["Café"] # attention aux erreurs si la clé n'existe pas !
        Traceback (most recent call last):
            File "<stdin>", line 1, in <module>
        KeyError: 'Café'

* **Modifier** ou **ajouter** un couple clé→valeur - ``dict[cle] = nouvelle_val``::

        >>> d
        {0: ':(', 'I': [1, 0], 'café': ':)'}
        >>> cle = "café"
        >>> d[cle] = "clop :-O" # la clé existe -> c'est une modification
        >>> d
        {0: ':(', 'I': [1, 0], 'café': 'clop :-O'}
        >>> d["J"] = [0, 1] # la clé n'existe pas, c'est un ajout
        >>> d # attention, les couples ne sont pas ordonnés!
        {0: ':(', 'I': [1, 0], 'J': [0, 1], 'café': 'clop :-O'}

* **Supprimer** un couple clé→valeur - ``del d[cle]``::

        >>> d = {"Python": "de la balle !"}
        >>> del d["Python"]
        >>> d
        {}

Parcourt d'un dictionnaire
==========================

* **Par les clés** - chaque clé est récupérée successivement - ``cle in dict``:: 

        >>> pts = {"A": [5, 3], "B": [-3, 5]}
        >>> for c in pts:
        ...    print(c, "=>", pts[c])
        ...
        A => [5, 3]
        B => [-3, 5]

* **Intégrale** - Chaque couple est récupéré successivement - ``cle, val in dict.items()``::

        >>> pts = {"A": [5, 3], "B": [-3, 5]}
        >>> for c, v in pts.items():
        ...    print("{}({};{})".format(c,v[0],v[1]))
        ...
        A(5;3)
        B(-3;5)

* **Par les valeurs** - chaque valeur est récupérée successivement - ``val in dict.values()``::

        >>> for coord in pts.values():
        ...     coord[1] -= 1
        ...
        >>> pts
        {'A': [5, 2], 'B': [-3, 4]}

Autres opérations utiles
========================

* **Création** via ``dict(...)``, en «compréhension» ou via ``zip(list1,list2)``::

        >>> # genre fonction
        >>> d = dict(prenom="bob", nom="l'eponge", age=4)
        >>> d
        {'nom': "l'eponge", 'age': 4, 'prenom': 'bob'}
        >>> # à partir d'une liste de tuple
        >>> l = [("prenom", "bob"), ("nom", "l'eponge"), ("age", 4)]
        >>> dict(l)
        {'nom': "l'eponge", 'age': 4, 'prenom': 'bob'}
        >>> # en «compréhension»
        >>> {x: x**2 for x in range(10) if x not in (0,1,5,8)} 
        {2: 4, 3: 9, 4: 16, 6: 36, 7: 49, 9: 81}
        >>> # en zippant deux listes de même taille 
        >>> z = zip(("a", "b", "c"), (0, 1, 2))
        >>> dict(z)
        {'a': 0, 'c': 2, 'b': 1}
        >>> dict(zip(list("abcdefghijklmnopqrstuvwxyz"), range(26)))
        {'a': 0, 'c': 2, 'b': 1, 'e': 4, 'd': 3, 'g': 6, 'f': 5, 'i': 8, ...

* **Lecture** «sécurisée» - ``dict.get(cle[, defaut])``:: 

        >>> d = {"café": ":)", 0: ":(", "I": [1, 0]}
        >>> d.get("Café") # si «defaut» n'est pas précisé, retourne None lorsque la clé n'existe pas.
        >>> d.get("café")
        ':)'
        >>> d.get("Café", 5) # si la clé n'est pas trouvée, retourne defaut=5
        5
        >>> d.get("café", 5) # sinon, retourne la valeur associée.
        ':)'

* **Écriture** «sécurisée» - ``dict.setdefault(cle[, defaut])``::

        >>> d.setdefault("café", ":(") # pas de modification, la clé existe !
        ':)'
        >>> d.setdefault("Café") # la valeur par défaut est None
        >>> d
        {0: ':(', 'I': [1, 0], 'Café': None, 'café': ':)'}
        >>> del d["Café"]
        >>> d.setdefault("Café", ':]')
        ':]'
        >>> d
        {0: ':(', 'I': [1, 0], 'Café': ':]', 'café': ':)'}

* **Récupérer et supprimer** un couple - ``dict.pop(cle[, defaut])``::

        >>> cles = [0, 'café', 'i']
        >>> for c in cles:
        ...     ret = d.pop(c, None) #  defaut=None -> valeur renvoyée si la clé n'existe pas
        ...     print(ret)
        ...
        :(
        :)
        None
        >>> d
        {'I': [1, 0], 'Café': ':]'}
        >>> d.pop('i') # si defaut est omis et que la clé n'existe pas -> erreur !
        Traceback (most recent call last):
                File "<stdin>", line 1, in <module>
        KeyError: 0

* **Récupérer et supprimer** un couple choisi «au hasard» - ``dict.popitem()``::

        >>> # Utile pour parcourir «destructivement» un dictionnaire
        >>> d = {0: ':(', 'I': [1, 0], 'café': ':)'}
        >>> while len(d): # rappel: 0 -> False, tout autre entier -> True
        ...   print("len(d) =", len(d))
        ...   cle, val = d.popitem()
        ...   print(cle, "=>", val, "et len(d) =", len(d)) 
        ...
        0 => :( et len(d) = 2
        I => [1, 0] et len(d) = 1
        café => :) et len(d) = 0 
        >>> d # le dictionnaire est vide !
        {}

* **Mettre à jour** un dictionnaire à partir d'un autre - ``dict.update()``::

        >>> d1 = {"A": (1,2), "B": (5, 3)}
        >>> majd = {"O": (0, 0), "B": (-5, -3)}
        >>> d1.update(majd)
        >>> d1
        {'A': (1, 2), 'B': (-5, -3), 'O': (0, 0)}
   
