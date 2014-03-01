***********
Les listes
***********

* Forme littérale: ``l = [5, "liste", -2.3, (1,3)]``. 
        ``l`` fait alors référence à une liste qui contient 4 éléments - ``len(l)`` vaut 4 - de types divers, ici entier, chaîne, flottant, 2-tuple.

* Récupérer un élément connaissant sa position ``pos``: ``l[pos]``.
        dans cet exemple, ``pos`` est un entier de l'intervalle *[0,4[* - [0,len(l)[ - c'est à dire 0, 1, 2 ou 3. Par exemple ``l[2]`` vaut ``-2.3``.

        La position peut être un entier négatif de l'intervalle *[-4,0[* - [-len(l),0[ - c'est à dire -1, -2, -3 ou -4. Par exemple ``l[-1]`` vaut ``(1,3)``.

* Récupérer une portion de liste (sous-liste d'éléments contigus): ``l[pos1:pos2]``.
        On récupère la sous-liste formée des éléments de ``l`` dont la position est un entier de l'intervalle *[pos1,pos2[*. Par exemple ``l[1:3]`` vaut ``["liste", -2.3]``; ``l[-3:-1]`` vaut encore ``["liste", -2.3]``.

        Le fait de laisser une place vide pour ``pos1`` ou ``pos2`` peut s'interpréter comme «aller au bout». Par exemple ``l[:2]`` vaut ``[5,"list"]`` et ``l[2:]`` vaut ``[-2.3, (1,3)]``.

* Ajouter deux listes: ``l1 + l2``. 
         Crée une nouvelle liste formée des éléments de ``l1`` puis de ceux de ``l2``. Par exemple, si ``l1 = [5, "liste"]`` et ``l2 = [-2.3, (1,3)]``, alors ``l1 + l2`` vaut ``[5, "liste", -2.3, (1,3)]``.

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
