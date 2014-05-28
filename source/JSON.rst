JSON
====

**JSON** (**J**\ ava\ **S**\ cript **O**\ bject **N**\ otation) est un format de données textuelles permettant de représenter des informations structurées. JSON est utilisable par de nombreux langages de programmation. C'est une alternative moins verbeuse (mais également moins « parlante ») à XML.

En Python, la structure de base sera une liste, ou un dictionnaire dont les clés devront impérativement être des chaînes de caractères. Les valeurs seront uniquement des chaînes, des nombres, les valeurs ``True``, ``False`` ou ``None`` (traduit en ``null`` en terminologie JSON), ou d'autres listes ou dictionnaires respectant les mêmes contraintes. Le résultat après conversion sera une chaîne de caractères représentant cette structure au format JSON. Cette chaîne pourra être enregistrée dans un fichier ou transmise à un autre ordinateur via le réseau (c'est surtout dans ce dernier contexte que JSON est utile, cf. `AJAJ <http://fr.wikipedia.org/wiki/AJAJ>`_  versus `AJAX <http://fr.wikipedia.org/wiki/Ajax_%28informatique%29>`_).

**Remarque 1 :** le stockage JSON n'est possible que pour certains objets Python. `Voir par ici <http://stackoverflow.com/questions/7408647/convert-dynamic-python-object-to-json>`_ pour les plus curieux...

**Remarque 2** : JSON est incapable de figer l'ordre des données (dictionnaire Python). Si c'est un point important (utilisation d'`OrderedDict <http://docs.python.org/3/library/collections.html?highlight=ordereddict#collections.OrderedDict>`_), il faut impérativement recourir à Pickle...


``json.dump`` et ``json.dumps`` : sérialisation avec JSON
---------------------------------------------------------

Conversion en chaîne de caractères pour envoi via réseau : ::

    >>> personne = { "id" : 1, "nom" : "DUPONT", "prénom" : "Jean", "âge" : 25, "marié" : False, "conjoint" : None }
    >>> import json
    >>> json.dumps(personne)
    '{"nom": "DUPONT", "\\u00e2ge": 25, "mari\\u00e9": false, "conjoint": null, "pr\\u00e9nom": "Jean", "id": 1}'

Enregistrement dans un fichier : ::

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


