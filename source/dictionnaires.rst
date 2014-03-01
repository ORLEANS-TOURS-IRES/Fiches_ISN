*****************
Les dictionnaires
*****************

Un **dictionnaire** est un moyen de mémoriser des *associations de la forme clé-valeur*.

* Littéralement, un **dictionnaire** est de la forme ``{clé1: val1, clé2: val2, ...}``

  * Les **clés** sont n'importe quelle valeur primaire (entiers, flottant, ..) ou n'importe quel objet *non modifiable* (chaîne, tuple, ...).
  * Les **valeurs** correspondantes sont de type arbitraire.

* La **longeur** d'un dictionnaire est le nombre de couple clé-valeur qu'il contient

Opérations de base
==================

* **Créer** un dictionnaire «littéralement» - ``{clé1: val1, clé2: val2, ...}``::

        >>> d = {"café": ":)", 0: ":(", "I": [1, 0]}
        >>> d # Noter que l'ordre d'insertion n'est pas conservé
        {0: ':(', 'I': [1, 0], 'café': ':)'}
  
* Connaître le nombre des couple clé-valeur contenu - ``len(dict)``::

        >>> len(d)
        >>> 3

* Savoir si une **clé** appartient au dictionnaire - ``cle in dict``::

        >>> "I" in d
        True
        >>> "Café" in d
        False

* Savoir si une **valeur** est associé à une clé - ``val in dict.values()``::

        >>> d
        {0: ':(', 'I': [1, 0], 'café': ':)'}
        >>> ":-0" in d.values()
        False
        >>> ":)" in d.values()
        True

* **Récupérer** la valeur associée à une *cle* - ``dict[cle]`` ou ``dict.get(key[, defaut])``::

        >>> x = d["I"]
        >>> x
        [1, 0]
        >>> x[0]
        1
        >>> d["I"][0] # lire ...[0] premier élément de, d["I"] c'est à dire [1, 0]
        1
        >>> d[0] # Une clé peut être un entier
        ":("
        >>> d["Café"] # attention aux erreurs si la clé n'existe pas !
        Traceback (most recent call last):
        File "<stdin>", line 1, in <module>
        KeyError: 'Café'
        >>> d.get("Café") # si «defaut» n'est pas précisé, retourne None lorsque la clé n'existe pas.
        >>> d.get("café")
        ":)"
        >>> d.get("Café", 5) # si la clé n'est pas trouvée, retourne defaut=5
        5
        >>> d.get("café", 5) # sinon, retourne la valeur associée.
        ":)"

* **Modifier** ou **ajouter** un couple clé-valeur - ``dict[cle] = nouvelle_val``::

        >>> d
        {0: ':(', 'I': [1, 0], 'café': ':)'}
        >>> cle = "café"
        >>> d[cle] = "clop :-O"
        >>> d
        {0: ':(', 'I': [1, 0], 'café': 'clop :-O'}
        >>> d["J"] = [0, 1]
        >>> d # attention, les couples ne sont pas ordonnés!
        {0: ':(', 'I': [1, 0], 'J': [0, 1], 'café': 'clop :-O'}

* **Récupérer et supprimer** un couple choisi «au hasard» - ``dict.popitem()``::

        >>> d.popitem() # retourne un 2-tuple (clé, valeur) ...
        (0, ':(')
        >>> d # et supprime le couple du dictionnaire
        {'I': [1, 0], 'J': [0, 1], 'café': 'clop :-O'}
        >>> cle, val = d.popitem()
        >>> cle
        'I'
        >>> val
        [1, 0]
        >>> d
        {'J': [0, 1], 'café': 'clop :-O'}
        >>> while len(d): # rappel: 0 -> False, tout autre entier -> True
        ...     c, v = d.popitem()
        ...     print(c,"=>", v)
        ...
        J => [0, 1]
        café => clop :-O
        >>> d
        {}
  
* **Supprimer** un couple clé-valeur - ``del d[cle]``::

        >>> d = {"Python": "de la balle !"}
        >>> del d["Python"]
        >>> d
        {}

Parcourt d'un dictionnaire
==========================

Autres opérations utiles
========================
