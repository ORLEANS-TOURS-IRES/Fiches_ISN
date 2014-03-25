***************************
Les bases de donnees sqlite
***************************

Les bases de données peuvent être un moyen efficace de mémoriser des données, surtout si elles se structurent naturellement sous forme de table.
La base de données se présentera physiquement sous la forme d'un fichier de type sq3 sur le disque dur.
Il sera possible de compléter, de modifier et bien sûr de lire le contenu de la base de données.
Une base de donnée peut contenir plusieurs tables. Chaque table est composé de multiple lignes ayant la même structure.

Prérequis :
- les chaînes de caractères
- les listes


Importation du module sqlite
============================
.. code-block:: python
import sqlite3     

Création d'une base de donnée
=============================

1. Connexion à la base de données
.. code-block:: python

	connexion = sqlite3.connect("bd-celebrites.sq3")

Cette instruction crée la base si elle n'existe pas encore (le fichier est créé dans le répértoire courant).


2. Création d'un curseur sur la base

.. code-block:: python
	
	curseur = connexion.cursor()

Le curseur servira ensuite à manipuler la base de donnée.
Dans toute la suite, on exécute des commandes SQL (donnée sous forme de chaînes de caractères).

3. Création d'une table dans la base

.. code-block:: python

	curseur.execute("CREATE TABLE IF NOT EXISTS celebrites (nom TEXT, prenom TEXT, annee INTEGER)")

La commande crée la table "celebrite" si elle n'existe pas encore. 
On définit sa structure au moment de sa création : chaque ligne de la table est constitué d'un nom, d'un prénom et d'une année.

4. Ajout de données à la table

.. code-block:: python

	curseur.execute("INSERT INTO celebrites(nom, prenom, annee) VALUES('Turing','Alan', 1912)")
	curseur.execute("INSERT INTO celebrites(nom, prenom, annee) VALUES('Lovelace','Ada', 1815)")
	curseur.execute("INSERT INTO celebrites(nom, prenom, annee) VALUES('Shannon','Claude', 1916)")
	curseur.execute("INSERT INTO celebrites(nom, prenom, annee) VALUES('Hooper','Grace', 1906)")

5. Valider l'enregistrement dans la base

.. code-block:: python
	
	connexion.commit()

.. Warning:: 
	Sans cette instruction rien ne sera réellement enregistré dans la base de données.

6. Fermer la base

.. code-block:: python
	
	connexion.close()


Lecture de la base de donnée
============================

.. code-block:: python
	
	connexion = sqlite3.connect("bd-celebrites.sq3")
	curseur   = connexion.cursor()
	
	curseur.execute("SELECT * FROM celebrites")
	resultat  = curseur.fetchall()
	
La liste resultat contient alors tous les enregistrements.

.. code-block:: python
	>>> resultat[0]
	['Turing', 'Alan', 1912]
	>>> resultat[1][1]
	'Ada'
	

Modifier un enregistrement
==========================

.. code-block:: python
	
	connexion = sqlite3.connect("bd-celebrites.sq3")
	curseur   = connexion.cursor()
		
	curseur.execute("UPDATE celebrites SET prenom='Alan Mathison' WHERE nom='Turing'")
	connexion.commit()


Pour aller un peu plus loin
===========================

1. Une requête de recherche ciblée

.. code-block:: python

	curseur.execute("SELECT * FROM celebrites WHERE nom = 'Turing'")
	resultat = list(curseur)
	print(resultat)

La requête recherche et extrait seulement les lignes de la table dont l'entrée [nom] est 'Turing'.
On transforme (transtype) le curseur en liste avant de l'afficher en tant que résultat.

2. Utiliser une variable dans une requete

.. code-block:: python

	qui = "Shannon"
	curseur.execute("SELECT * FROM celebrites WHERE nom = '" + qui + "'")
	quand = 1515
	curseur.execute("SELECT * FROM celebrites WHERE annee >= " + str(quand))


Exemple complet
===============

.. code-block:: python

	import sqlite3     
	connexion = sqlite3.connect("bd-celebrites.sq3")
	curseur = connexion.cursor()

	# creation d'une table
	curseur.execute("CREATE TABLE IF NOT EXISTS celebrites (nom TEXT, prenom TEXT, annee INTEGER)")

	# ajout de données à la base
	curseur.execute("INSERT INTO celebrites(nom, prenom) VALUES('Turing','Alan', ???)")
	curseur.execute("INSERT INTO celebrites(nom, prenom) VALUES('Lovelace','Ada')")
	curseur.execute("INSERT INTO celebrites(nom, prenom) VALUES('Shannon','Claude')")
	curseur.execute("INSERT INTO celebrites(nom, prenom) VALUES('Hooper','Grace')")

	# valider l'enregistrement dans la base
	connexion.commit()

	# charger toutes les données de la base dans un tableau
	curseur.execute("SELECT * FROM celebrites")
	resultat = curseur.fetchall()

	# affichage en console du résultat
	print(resultat)
	for r in resultat:
		print(r[0],r[1],r[2])

	# Modifier un enregistrement
	curseur.execute("UPDATE celebrites SET prenom='Alan Mathison' WHERE nom='Turing'")
	connexion.commit()

	# Accèder à l'enregistrement
	curseur.execute("SELECT * FROM celebrites WHERE nom = 'Turing'")
	resultat = list(curseur)
	print(resultat)

	# fermer la base
	connexion.close()

 
 
