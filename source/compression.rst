Sauvegarder des données en les compressant
==========================================

Il peut être utile de compresser certains « objets » Python volumineux (structures textuelles de grande taille, comme par exemple une base de données cartographiques libres issue du projet OpenStreeMap - la plus grosse dépasse les 30 Go !). Plusieurs bibliothèques permettent cela, entre autres ``zipfile`` et ``gzip``. La 1ère est plus complète et gère de nombreux algorithmes de compression, mais son emploi est bien plus complexe que la seconde. C'est donc elle (``gzip``) qu'on illustrera dans la suite.

**Note :** cette fiche suppose que vous savez à quoi sert le module ``pickle``. Se reporter à la `fiche de synthèse sur la sérialisation <fiche-python-serialisation.html>`_.


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
