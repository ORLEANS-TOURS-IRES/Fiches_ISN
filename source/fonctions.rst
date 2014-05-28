*******************
Fonctions - ``def``
*******************

Les fonctions sont utilisées lorsque des mêmes opérations doivent être réalisées plusieurs fois. Elles aident aussi, pour améliorer la lisibilité du code, à structurer un programme. 

Qu'est-ce qu'une fonction  ?
----------------------------

Typiquement, une fonction **retourne** un résultat (grâce à l'instruction ``return`` de python).

Par exemple la fonction ``max(x,y)`` retourne le maximum des variables ``x`` et ``y``.

Une fonction peut avoir zéro, un ou plusieurs **paramètres** (aussi appelé **arguments**); dans le cas de la fonction ``max``, elle *attend* deux paramètres (ici ``x`` et ``y`` lui ont été *passés* en paramètres).

Pour utiliser une fonction, il n'est pas nécessaire de connaître exactement son implémentation. Il suffit de savoir quels sont ses arguments (par exemple deux entiers) et quel résultat elle calcule (par exemple, le maximum de ces deux entiers).

En informatique, une fonction peut aussi interagir avec son environnement (modifier le contenu de la mémoire ou afficher un message). On appelle cela un **effet de bord**.

Et en python ?
--------------

Une fonction est définie par le mot clé ``def``. On indique ensuite, entre parenthèses, ses arguments, puis on termine par ``:``.

Le code de la fonction est ensuite écrit de façon indentée.

L'instruction ``return`` retourne le résultat calculé (et la fonction s'arête)::

        def maximum(a,b):
            if a > b:
                return a
            else:
                return b
			
Pour utiliser cette fonction ::

        >>> n = maximum(6,9) # ici a=6 et b=9
        >>> print(n*10)
        90


Fonctions récursives
--------------------

Une fonction peut être **récursive**, c'est-à-dire s'appeler soi-même ! ::

        def factorielle(n): # 1*2*3*...*n
            if n == 0:
                return 1
            else:
                return factorielle(n-1) * n

Attention, il faut qu'à un moment cette récursion se termine. En fait, c'est comme une récurrence, il faut un cas de base.
