*****************
Les dictionnaires
*****************

Un **dictionnaire** est un moyen de mémoriser des *associations de la forme clé-valeur*.

* Littéralement, un **dictionnaire** est de la forme::
 
        {clé1: val1, clé2: val2, ...}

  * Les **clés** sont n'importe quelle valeur primaire (entiers, flottant, ..) ou n'importe quel objet *non modifiable* (chaîne, tuple, ...).
  * Les **valeurs** correspondantes sont de type arbitraire.

* La **longeur** d'un dictionnaire est le nombre de couple clé-valeur qu'il contient

Opérations de base
==================

* Créer un dictionnaire «littéralement» - ``{clé1: val1, clé2: val2, ...}``::

        >>> d = {"café": ":)", 0: ":(", "I": [1, 0]}
        >>> d
        {"café": ":)", 0: ":(", "I": [1, 0]}
  
* Connaître le nombre des couple clé-valeur contenu - ``len(dict)``::

        >>> len(d)
        >>> 3

* Savoir si une **clé** appartient au dictionnaire - ``cle in dict``::

        >>> "I" in dict
        True
        >>> "Café" in dict
        False

* Savoir si une **valeur** est associé à une clé - ``val in values(dict)``::

        >>> d
        {"café": ":)", 0: ":(", "I": [1, 0]}
        >>> ":-0" in values(d)
        False

* **Récupérer** la valeur associée à une *cle* - ``dict[cle]`` ou ``dict.get(key[, defaut])``::

        >>> x = d["I"]
        >>> x
        [1, 0]
        >>> x[0]
        1
        >>> d["I"][0]
        1
        >>> d[0]
        ":("
        >>> d["Café"] # attention aux erreurs si la clé n'existe pas !
        erreur !
        >>> d.get("Café") # si «defaut» n'est pas précisé, retourne None lorsque la clé n'existe pas.
        >>> d.get("café")
        ":)"
        >>> d.get("Café", 5)
        5
        >>> d.get("café", 5)
        ":)"

* **Modifier** ou **ajouter** un couple clé-valeur - ``dict[cle] = nouvelle_val``::

        >>> d
        {"café": ":)", 0: ":(", "I": [1, 0]}
        >>> cle = "café"
        >>> d[cle] = "clop :-O"
        >>> d
        {"café": "clop :-O", 0: ":(", "I": [1, 0]}
        >>> d["J"] = [0, 1]
        >>> d # attention, les couples ne sont pas ordonnés!
        {"café": "clop :-O", "J": [0, 1], 0: ":(", "I": [1, 0]}

* **Récupérer et supprimer** un couple choisi «au hasard» - ``dict.popitem()``::

        >>> d.popitem()
        (0, ":(")
        >>> d
        {"café": "clop :-O", "J": [0, 1], "I": [1, 0]}
        >>> cle, val = d.popitem()
        >>> cle
        "J"
        >>> val
        [0, 1]
        >>> d
        {"café": "clop :-O", "I": [1, 0]}
        >>> while len(d): # rappel: 0 -> False, tout autre entier -> True
        ...     c, v = d.popitem()
        ...     print(c,"=>", v)
        ...
        I => [1, 0]
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
