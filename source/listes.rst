**********
Les listes
**********

Une liste est un moyen de regrouper des éléments d'information ou donnés.

* La **longueur** d'une liste est le nombre d'éléments qu'elle contient;
* Les éléments d'une liste sont **ordonnés**;
* Chaque élément d'une liste est *numéroté* par un entier (positif ou négatif) appelé **position** ou index;

     * Le premier élément a la position 0, le second la position 1, etc.
     * Le dernier élément a la position -1, l'avant dernier la position -2, etc.

Opérations de base
==================

* **Créer** une liste «littéralement»::

        >>> l = [5, "liste", -2.3, (1,3)]
        >>> l
        [5, "liste", -2.3, (1,3)]

* Connaître sa «longeur» ou le nombre de ses éléments - ``len(list)``::

        >>> len(l)
        4

* Savoir si *elt* appartient ou non à une liste - ``elt in list``::

        >>> l
        [5, "liste", -2.3, (1,3)]
        >>> -2.3 in l
        True
        >>> 1.3 in l
        False

* **Récupérer** l'élément de position *pos* - ``l[pos]``::

        >>> l[2] # l[0] premier elt, l[1] deuxième, ...
        -2.3
        >>> l[-1] # l[-1] dernier elt, l[-2] avant dernier, ...
        (1, 3)

* **Modifier** l'élément de position *pos* - ``l[pos] = nouvel_elt``::

        >>> l
        [5, "liste", -2.3, (1,3)]
        >>> l[-1] = 0
        >>> l
        [5, "liste", -2.3, 0]

* **Ajouter** *elt* **à la fin** d'une liste - ``list.append(elt)``::

        >>> l.append(["b", "a", "c"])
        >>> l
        [5, "liste", -2.3, 0, ["b", "a", "c"]]
        >>> len(l)
        5

* **Insérer** *elt* à la postion *pos* - ``list.insert(pos, elt)``  ::

        >>> l
        [5, "liste", -2.3, 0, ["b", "a", "c"]]
        >>> l.insert(2, "truc")
        >>> l
        [5, "liste", "truc", -2.3, 0, ["b", "a", "c"]]

* **Récupérer et supprimer** le dernier élément (resp. celui de position *pos*) - ``list.pop([pos])``::

        >>> x = l.pop() # si pos est omis la suppression concerne le dernier élément
        >>> x
        ["b", "a", "c"]
        >>> l
        [5, "liste", "truc", -2.3, 0]
        >>> l.pop(2)
        "truc"
        >>> l
        [5, "liste", -2.3, 0]

* **Supprimer** l'élément de position *pos* - ``del l[pos]``::

        >>> del l[0]
        >>> l
        ["liste", -2.3, 0]


Parcourt d'une liste avec une boucle ``for``
============================================

* **Direct** - chaque élément est récupéré successivement::

        >>> l = [3, "truc", -2.5]
        >>> for elt in l:
        ...    print(elt)
        ...
        3
        truc
        -2.5
  
* **Indirect** - en utilisant les positions des éléments dans la liste::

        >>> # Rappels:
        >>> #   range(nb): intervalle d'entiers [0,nb[ (nb exclus),
        >>> #   len(l): nombre d'éléments de l,
        >>> #     donc range(len(l)) représente toutes les positions possibles
        >>> #
        >>> for pos in range(len(l)):
        ...     elt = l[pos]
        ...     print("Pos. de «", elt,"»:", pos)
        ...
        Pos. de « 3 »: 0
        Pos. de « truc »: 1
        Pos. de « -2.5 »: 2

  .. note:: Même si cette façon de parcourir une liste semble plus compliquée, la connaissance dans la boucle de la position de l'élément peut être déterminante dans certain problème.

  Autre façon de faire la même chose à l'aide de la fonction intégrée ``enumerate()``::
        
        >>> l = [3, "truc", -2.5]
        >>> # Rappels:
        >>> #   str(truc): convertit «truc» en chaîne de caractères
        >>> #   concaténation: "l[" + "3" + "]=" + "erreur" donne "l[3]=erreur"
        >>> for pos, elt in enumerate(l):
        ...    print("l[" + str(pos) + "]=«" + str(elt) + "»")
        ...
        l[0]=«3»
        l[1]=«truc»
        l[2]=«-2.5»

* Inverser le sens de parcourt - la fonction ``reversed()``::

        >>> for i in reversed(range(len(l))):
        ...    print(l[i])
        ...
        -2.5
        truc
        3
        >>> for elt in reversed(l):
        ...    print(elt)
        ...
        -2.5
        truc
        3

Autres opérations utiles
========================

* Extraire une sous-liste d'éléments consécutifs - ``list[pos1:pos2]``::

        >>> l = [3, 0, -2, 5]
        >>> # l[pos1:pos2] : positions récupérées = entiers de [pos1, pos2[ (pos2 exclus)
        >>> l[1:3]
        [0, -2]
        >>> # l[pos1:] ->  de pos1 (inclus) jusqu'à la fin de la liste
        >>> l[1:]
        [0, -2, 5]
        >>> # l[:pos2] -> du début de la liste jusqu'à pos2 (exclus)
        >>> l[:2]
        [3, 0]

* **Concaténer** deux listes - ``list1 + list2``::
 
        >>> l1 = [2, 5]
        >>> l2 = [3, 0]
        >>> l1 + l2
        [2, 5, 3, 0]

* **Inverser** l'ordre des éléments - ``list.reverse()``::

        >>> l = [2, 5, 3, 0]
        >>> l.reverse()
        >>> l
        [0, 3, 5, 2]

* **Trier** les éléments dans l'ordre croissant - ``list.sort()``::

        >>> l = [3, -1, 5, 0]
        >>> l.sort()
        >>> l
        [-1, 0, 3, 5]

* **Compter** le nombre de fois où *elt* apparaît dans la liste - ``list.count(elt)``::

        >>> l = [0, 1, 0, 2, 0]
        >>> l.count(0)
        >>> 3

* Produire une liste qui contient *n* fois le même élément - ``list * n``::

        >>> [0] * 5
        [0, 0, 0, 0, 0]

* **Convertir** un objet «composite» en liste - ``list(obj_composite)``::

        >>> list("abc")
        ["a", "b", "c"]
        >>> list(range(4))
        [0, 1, 2, 3]

* Construire une liste en «compréhension»::

        >>> [x**2 for x in range(9)]
        [0,1,4,9,16,25,36,49,64,81]
        >>> [(x, y) for x in [-1,1] for y in [-1,1]]
        [(-1, -1), (-1, 1), (1, -1), (1, 1)]
        >>> [(x, y) for x in [-1,1] for y in [-1,1] if x != y]
        [(-1, 1), (1, -1)]


