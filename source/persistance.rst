***********************
Persistance des données
***********************

La **sérialisation** (en anglais *serialization* ou *marshalling*) est le processus par lequel on transforme des données présentes en mémoire en une suite de codes qui pourra :

- être enregistrée dans un fichier. Cela permet de **rendre persistant** un « objet informatique » (il survivra à un redémarrage du système, au terme duquel on pourra le reconstituer à l'identique) ;

- être transportée sur un réseau. Cela permet de **transférer à un ordinateur distant** un « objet informatique » (par exemple *via* un réseau).

L'opération réciproque (le décodage des informations pour créer une copie conforme à l'original), s'appelle la **désérialisation** (*deserialization* ou *unmarshalling*).

Il y a plusieurs façon de sérialiser des données :

- à l'aide de :ref:`JSON` pour des « données simples » ;

- à l'aide de :ref:`PICKLE` pour des « objets Python » plus complexes ;

- à l'aide de XML (proche de JSON, mais plus verbeux, plus riche et plus complexe) ;

- il arrive souvent que les données soient en outre compressées, afin d'économiser la place sur le disque dur et/ou la bande passante sur les réseaux. Voir :ref:`GZIP`.

.. |JSON| replace:: **JSON**

.. |Pickle| replace:: **Pickle**

.. |compression| replace:: **compression**

.. _JSON:

Module ``json``
===============

**JSON** (**J**\ ava\ **S**\ cript **O**\ bject **N**\ otation) est un format de données textuelles permettant de représenter des informations structurées. JSON est utilisable par de nombreux langages de programmation. C'est une alternative moins verbeuse (mais également moins « parlante ») à XML.

En Python, la structure de base sera une liste, ou un dictionnaire dont les clés devront impérativement être des chaînes de caractères. Les valeurs seront uniquement des chaînes, des nombres, les valeurs ``True``, ``False`` ou ``None`` (traduit en ``null`` en terminologie JSON), ou d'autres listes ou dictionnaires respectant les mêmes contraintes. Le résultat après conversion sera une chaîne de caractères représentant cette structure au format JSON. Cette chaîne pourra être enregistrée dans un fichier ou transmise à un autre ordinateur via le réseau (c'est surtout dans ce dernier contexte que JSON est utile, cf. `AJAJ <http://fr.wikipedia.org/wiki/AJAJ>`_  versus `AJAX <http://fr.wikipedia.org/wiki/Ajax_%28informatique%29>`_).

**Remarque 1 :** le stockage JSON n'est possible que pour certains objets Python. `Voir par ici <http://stackoverflow.com/questions/7408647/convert-dynamic-python-object-to-json>`_ pour les plus curieux...

**Remarque 2** : JSON est incapable de figer l'ordre des données (dictionnaire Python). Si c'est un point important (utilisation d'`OrderedDict <http://docs.python.org/3/library/collections.html?highlight=ordereddict#collections.OrderedDict>`_), il faut impérativement recourir à Pickle...


``json.dump`` et ``json.dumps`` : sérialisation avec JSON
---------------------------------------------------------

Conversion en chaîne de caractères pour envoi via réseau ::

    >>> personne = { "id" : 1, "nom" : "DUPONT", "prénom" : "Jean", "âge" : 25, "marié" : False, "conjoint" : None }
    >>> import json
    >>> json.dumps(personne)
    '{"nom": "DUPONT", "\\u00e2ge": 25, "mari\\u00e9": false, "conjoint": null, "pr\\u00e9nom": "Jean", "id": 1}'

Enregistrement dans un fichier ::

    >>> with open("test.js","w") as f:
    ... json.dump(personne,f)
    ...


``json.load`` et ``json.loads`` : désérialisation avec JSON
-----------------------------------------------------------

Conversion d'une chaîne de caractères contenant du code JSON en structure Python : ::

    >>> import json
    >>> json.loads('[ 1, 2, { "a":1, "b":[1,2], "c":true, "d":null}]')
    [1, 2, {'a': 1, 'b': [1, 2], 'c': True, 'd': None}]

Chargement depuis un fichier : ::

    >>> with open("test.js","r") as f:
    ... d = json.load(f)
    ...
    >>> print(d)
    {'conjoint': None, 'id': 1, 'marié': False, 'nom': 'DUPONT', 'prénom': 'Jean', 'âge': 25}


Tableau récapitulatif et astuce mnémotechnique
----------------------------------------------

+----------+----------------------------+-----------------------------+
| Fonction | Travaille avec des chaînes | Travaille avec des fichiers |
+----------+----------------------------+-----------------------------+
| Lit      | ``json.loads``             | ``json.load``               |
+----------+----------------------------+-----------------------------+
| Écrit    | ``json.dumps``             | ``json.dump``               |
+----------+----------------------------+-----------------------------+

**Astuce :** le **s** dans ``json.loads`` et ``json.dumps`` fait référence aux chaînes de caractères (**s**\ tring en anglais).


*>> Tout savoir sur la* |bibliothèque Python consacrée à JSON|_.

.. _bibliothèque Python consacrée à JSON: http://docs.python.org/3/library/json.html

.. |bibliothèque Python consacrée à JSON| replace:: *bibliothèque Python consacrée à JSON*

.. _PICKLE:

Module ``pickle``
=================

Le module ``pickle`` de Python 3 implémente une meilleure sérialisation que ce que l'on peut obtenir avec :ref:`JSON` : il permet de transformer en suite de bits des « objets » Python complexes. Seul Python peut désérialiser le résultat, Pickle n'est donc **pas** un bon moyen d'échanger des données entre des programmes écrits dans différents langages.


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

.. _GZIP:

Compresser avec ``gzip``
========================

Il peut être utile de compresser certains « objets » Python volumineux (structures textuelles de grande taille, comme par exemple une base de données cartographiques libres issue du projet OpenStreeMap - la plus grosse dépasse les 30 Go !). Plusieurs bibliothèques permettent cela, entre autres ``zipfile`` et ``gzip``. La 1ère est plus complète et gère de nombreux algorithmes de compression, mais son emploi est bien plus complexe que la seconde. C'est donc elle (``gzip``) qu'on illustrera dans la suite.

**Note :** cette fiche suppose que vous savez à quoi sert le module ``pickle``. Voir :ref:`PICKLE`.


Utilisation conjointe de ``gzip.open`` et ``pickle.dumps`` pour compresser des données sérialisées
--------------------------------------------------------------------------------------------------

::

    >>> import gzip, pickle
    >>> d={}
    >>> for i in range(100000):
    ...    d[i]=chr(i % 26 + 65)*100
    # NE SURTOUT PAS faire print(d), ce serait trèèèèèès long !
    >>> with gzip.open("test.pkz", "wb") as f:
    ...     f.write(pickle.dumps(d))

L'effet sur la taille des données est drastique (division par 10 !) : ::

    >>> import sys
    >>> sys.getsizeof(d)
    6291736
    >>> d2=open("test.pkz", "rb").read()
    >>> sys.getsizeof(d2)
    605077


Utilisation conjointe de ``gzip.open`` et ``pickle.loads`` pour décompresser des données sérialisées
----------------------------------------------------------------------------------------------------

::

    >>> with gzip.open("test.pkz","rb") as f:
    ...
    datas = pickle.loads(f.read())
    >>> datas == d
    True


Ressources sur l'utilisation du module ``zipfile``
--------------------------------------------------

**Note :** les liens donnés ci-dessous concernent Python 2, il faudra donc adapter le contenu à Python 3 !
 * `<http://pymotw.com/2/zipfile/>`_
 * `<http://effbot.org/librarybook/zipfile.htm>`_
