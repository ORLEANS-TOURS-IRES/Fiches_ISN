***********
Les listes
***********

Opérations de base
==================

* Créer une liste::

        l = [5, "liste", -2.3, (1,3)]

* Connaître sa longeur::

        len(l)

* Récupérer un élément de position *pos*::

        l[pos]

* Modifier l'élément de position *pos*::

        l[pos] = nouvel_elt

* Supprimer l'élément de position *pos*::

        del l[pos]

* Récupérer une «portion» de liste::

        l[pos1:pos2]

* «Concaténer» deux listes::
 
        l1 + l2

* Savoir si *elt* appartient ou non à une liste::

        elt in l

* Ajouter *elt* à la fin d'une liste::

        l.append(elt)

* Insérer *elt* à la postion *pos*::

        l.insert(pos, elt)

* Récupérer et supprimer le dernier élément (resp. celui de position *pos*)::

        l.pop()
        l.pop(pos)

* Inverser l'ordre des éléments::

        l.reverse()

* Ranger les éléments dans l'ordre croissant::

        l.sort()

* Compter le nombre de fois où *elt* apparaît dans la liste::

        l.count(elt)


Exemple::

    >>> l = [5, "liste", -2.3, (1,3)]
    >>> l # une liste peut contenir des éléments de type divers
    [5, "liste", -2.3, (1,3)]
    >>> len(l) # longueur de l ?
    4
    >>> l[0] # Numérotation à partir de 0.
    5
    >>> print("«{}» de type: {}".format(l[3], type(l[3])))
    «(1, 3)» de type: <class 'tuple'>
    >>> l[3] = 0
    >>>l
    [5, "liste", -2.3, 0]
    >>> l[-2] # -1 représente aussi la dernière position
    -2.3
    >>> l1 = l[1:3] # positions entières de l'intervalle [1;3[
    >>> l1
    ["liste", -2.3]
    >>> l2 = l[2:] # omission = jusqu'à l'extrémité concernée
    >>> l2
    [-2.3, 0]
    >>> l3 = l1 + l2 # concaténation = mettre bout à bout
    >>> l3
    ["liste", -2.3, -2.3, 0]


Méthodes applicables aux listes
===============================

.. list-table::
   :header-rows: 1

   * - Méthode
     - Description
     - Exemple
   * - .. py:method:: list.append(x)
     - Ajoute l'élément *x* à la fin de la liste.
     - ``l.append(5)`` transforme ``l`` en ``[5, "liste", -2.3, (1,3), 5]``.
       Donne le même résultat que l = l + [5]
   * - .. py:method:: list.insert(pos, x)
     - Insère *x* à la position *pos*.
     - ``l.insert(1, 0)`` transforme ``l`` en ``[5, 0, "liste", -2.3, (1,3), 5]``.
       Note: ``l.insert(len(l), 0)`` est équivalent à ``l.append(0)``.
   * - .. py:method:: list.pop([pos])
     - Retourne l'élément de position *pos* et le supprime de la liste. Si *pos* n'est pas précisé - cette possibilité est suggérée par les crochets autour de *pos* - retourne et supprime le dernier élément de la liste.
     - ``l.pop()`` vaut ``5`` et ``l`` vaut alors ``[5, 0, "liste", -2.3, (1,3)]``.
   * - .. py:method:: list.reverse()
     - Inverse la position des éléments de la liste
     - ::
           >>> a = [5, -3, 2, 0]
           >>> a.reverse()
           >>> a
           [0, 2, -3, 5] 
