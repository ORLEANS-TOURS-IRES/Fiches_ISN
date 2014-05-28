Persistance des données et sérialisation
========================================

La **sérialisation** (en anglais *serialization* ou *marshalling*) est le processus par lequel on transforme des données présentes en mémoire en une suite de codes qui pourra :

- être enregistrée dans un fichier. Cela permet de **rendre persistant** un « objet informatique » (il survivra à un redémarrage du système, au terme duquel on pourra le reconstituer à l'identique) ;

- être transportée sur un réseau. Cela permet de **transférer à un ordinateur distant** un « objet informatique » (par exemple *via* un réseau).

L'opération réciproque (le décodage des informations pour créer une copie conforme à l'original), s'appelle la **désérialisation** (*deserialization* ou *unmarshalling*).

Il y a plusieurs façon de sérialiser des données :

- à l'aide de `JSON <fiche-python-serialisation-JSON.html>`_ pour des « données simples » ;

  **>> Fiche de synthèse sur** |JSON|_

- à l'aide de `Pickle <fiche-python-serialisation-pickle.html>`_ pour des « objets Python » plus complexes ;

  **>> Fiche de synthèse sur** |Pickle|_

- à l'aide de XML (proche de JSON, mais plus verbeux, plus riche et plus complexe) ;

- il arrive souvent que les données soient en outre compressées, afin d'économiser la place sur le disque dur et/ou la bande passante sur les réseaux.

  **>> Fiche de synthèse sur la** |compression|_

.. _JSON: fiche-python-serialisation-JSON.html
.. |JSON| replace:: **JSON**

.. _Pickle: fiche-python-serialisation-pickle.html
.. |Pickle| replace:: **Pickle**

.. _compression: fiche-python-compression.html
.. |compression| replace:: **compression**
