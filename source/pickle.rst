Pickle
======

Le module ``pickle`` de Python 3 implémente une meilleure sérialisation que ce que l'on peut obtenir avec `JSON <fiche-python-serialisation-JSON.html>`_ : il permet de transformer en suite de bits des « objets » Python complexes. Seul Python peut désérialiser le résultat, Pickle n'est donc **pas** un bon moyen d'échanger des données entre des programmes écrits dans différents langages.


``pickle.dump`` et ``pickle.dumps`` : sérialisation avec Pickle
---------------------------------------------------------------

Conversion en « chaîne de caractères **binaires** » (type |bytes|_) pour envoi via réseau : ::

    >>> personne = { "id" : 1, "nom" : "DUPONT", "prénom" : "Jean", "âge" : 25, "marié" : False, "conjoint" : None }
    >>> import pickle
    >>> pickle.dumps(personne)
    b'\x80\x03}q\x00(X\x03\x00\x00\x00nomq\x01X\x06\x00\x00\x00DUPONTq\x02X\x04\x00\x00\x00\xc3\xa2geq\x03K\x19X\x06
    \x00\x00\x00mari\xc3\xa9q\x04\x89X\x08\x00\x00\x00conjointq\x05NX\x07\x00\x00\x00pr\xc3\xa9nomq\x06X\x04\x00\x00
    \x00Jeanq\x07X\x02\x00\x00\x00idq\x08K\x01u.'

Enregistrement dans un fichier : ::

    >>> with open("test.pkl", "wb") as f:
    ... pickle.dump(personne, f)
    ...

*Remarque : l'option* ``b`` *d'ouverture de fichier en* **mode binaire** *est importante !*


``pickle.load`` et ``pickle.loads`` : désérialisation avec Pickle
-----------------------------------------------------------------

Conversion d'un objet |bytes|_ (« chaîne de caractères **binaires** ») en structure Python : ::

    >>> pickle.loads(b'\x80\x03]q\x00(K\x01K\x02}q\x01(X\x01\x00\x00\x00aq\x02K\x01X\x01\x00\x00\x00cq\x03\x88X
    \x01\x00\x00\x00bq\x04]q\x05(K\x01K\x02eX\x01\x00\x00\x00dq\x06Nue.')
    [1, 2, {'a': 1, 'b': [1, 2], 'c': True, 'd': None}]

Chargement depuis un fichier : ::

    >>> with open("test.pkl","rb") as f:
    ... d = pickle.load(f)
    ...
    >>> print(d)
    {'conjoint': None, 'id': 1, 'marié': False, 'nom': 'DUPONT', 'prénom': 'Jean',
    'âge': 25}

*Remarque : l'option* ``b`` *d'ouverture de fichier en* **mode binaire** *est importante !*


Tableau récapitulatif et astuce mnémotechnique
----------------------------------------------

+----------+----------------------------------------------------+-----------------------------+
| Fonction | Travaille avec des chaînes **binaires** (|bytes|_) | Travaille avec des fichiers |
+----------+----------------------------------------------------+-----------------------------+
| Lit      | ``pickle.loads``                                   | ``pickle.load``             |
+----------+----------------------------------------------------+-----------------------------+
| Écrit    | ``pickle.dumps``                                   | ``pickle.dump``             |
+----------+----------------------------------------------------+-----------------------------+

**Astuce :** le **s** dans ``pickle.loads`` et ``pickle.dumps`` fait référence aux chaînes de caractères (**s**\ tring en anglais).


*>> Tout savoir sur la* |bibliothèque Python consacrée à Pickle|_.

.. _bibliothèque Python consacrée à Pickle: http://docs.python.org/3/library/pickle.html
.. |bibliothèque Python consacrée à Pickle| replace:: *bibliothèque Python consacrée à Pickle*

.. _bytes: https://docs.python.org/3.4/library/stdtypes.html#bytes
.. |bytes| replace:: ``bytes``
