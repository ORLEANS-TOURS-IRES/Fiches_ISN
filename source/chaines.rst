.. role:: raw-html(raw)
   :format: html


*************************
Les chaînes de caractères
*************************

Les chaînes de caractères - type ``str`` pour *strings* - servent à représenter les textes.

* Une chaîne «basique» se reconnaît par l'utilisation de délimiteurs:

  * guillemets simples: ``'permet les guillemets "doubles"'`` ou
  * guillemets doubles: ``"permet les guillemets 'simple'"``.

* La **longueur** d'une chaînes est le nombre de caractères qu'elle contient.
* **Caractères «spéciaux»**:

  * Pour préciser un caractère non directement accessible au clavier, insèrer son «point de code» unicode via ``\u<code>`` où ``<code>`` doit être remplacé par la valeur adéquate (voir `ce site <http://unicode-table.com>`_). Par exemple, ``\u262F`` devrait donné « :raw-html:`&#9775;` ».
  * Saut de ligne: ``\n``,
  * Tabulation (touche Tab): ``\t``
  * Empêcher l'interpration des guillemets simples ou doubles comme délimiteur: ``\'`` ou ``\"``. Ex: ``'Pour écrire "\ '", il faut l'échapper avec \\'``.
  * Insérer un backslash «\\» ? : ``\\``

* Une chaîne n'est **pas directement modifiable**.
* Chaque caractère d'une chaîne est numéroté par un entier (positif ou négatif) appelé **position** ou index:

  * Le premier caractère a la position 0, le second la position 1, etc.
  * Le dernier caractère a la position -1, l'avant dernier -2, etc.

Opérations de base
==================

* **Créer** une chaîne littéralement - ``'...'`` ou ``"..."``::

        >>> ch = "bonjour \u2600\n tout l'monde!"
        >>> ch # contenu de ch1, notez les guillemets.
        "bonjour ☀\n tout l'monde!"
        >>> print(ch) # affichage à l'écran de ch1, différence ?
        bonjour ☀
         tout l'monde!
        >>> autre = 'bonjour \u2600\n tout l\'monde!'
        >>> ch == autre
        True

* Connaître le **nombre de caractères** qu'elle contient - ``len(chaine)``::

        >>> long = len(ch)
        >>> long
        24

* **Savoir si** une sous-chaîne ou un caractère apparaît dans la chaîne - ``ss_chaine in chaine``::

        >>> ch
        "bonjour ☀\n tout l'monde!"
        >>> " " in ch # l'espace est un caractère comme un autre ...
        True
        >>> "z" in ch
        False
        >>> "Jour" in ch # attention à la «casse» (majuscule/minuscule)
        False
        >>> "jour" in ch
        True

* **Accéder** à un caractère - ``chaine[pos]``::

        >>> ch[0] # position positive du «soleil» ?
        'b'
        >>> ch[-1] # position négative du «soleil» ?
        '!'
  
* **Extraire** une sous-chaîne - ``chaine[pos1:pos2]`` ou ``chaine[pos1:pos2:pas]``::

        >>> ch
        "bonjour ☀\n tout l'monde!"
        >>> ch[1:4] # Attention [pos1:pos2] = de pos1 inclus jusqu'à pos2 exclus !
        'onj'
        >>> ch[4:] # pos2 omis = jusqu'à la fin
        "our ☀\n tout l'monde!"
        >>> ch[:9] # pos1 omis = depuis le début
        'bonjour ☀'
        >>> ch[:10:2] # extraire pos 0, 2, 4, 6, 8 (10 exclus)
        'bnor☀'

* **Concaténer** deux chaînes ou plus - ``ch1 + ch2 + ...``::

        >>> "ab" + 'cd'
        'abcd'
        >>> ch = "Spaghetti"
        >>> ch = ch + " carbonara" + '.'
        >>> ch
        'spaghetti carbonara.'

* **Découper** une chaîne relativement à un caractère de séparation - ``str.split([sep])``::
        
        >>> "un deux    trois\nquatre  ".split() # si sep est omis, le découpage se fait sur les espaces ou les sauts de lignes
        ['un', 'deux', 'trois', 'quatre'] 
        >>> ch = 'un,2,,3, quatre'
        >>> ch.split(',') # Notez les petites différences dans le cas ou sep est précisé
        ['un', '2', '', '3', ' quatre']

Parcourt d'une chaîne
=====================

* **Direct** - ``car in chaine``::

        >>> ch = "huit"
        >>> for c in ch:
        ...     print(c)
        ...
        h
        u
        i
        t
        >>> res = ''
        >>> for c in ch:
        ...     print("res='" + res + "' et c='" + c + "' donc res=c+res ???")
        ...     res = c + res
        ...
        res='' et c='h' donc res=c+res ???
        res='h' et c='u' donc res=c+res ???
        res='uh' et c='i' donc res=c+res ???
        res='iuh' et c='t' donc res=c+res ???
        >>> res
        'tuih'

* **Indirect**: par les positions dans la chaîne - ``pos in range(len(chaine))``::

        >>> ch = "du feu"
        >>> str(5) # conversion d'un entier en chaîne
        '5'
        >>> # Note: range(nb) -> 0, 1, 2, 3, ..., nb - 1
        >>> # or pos dans chaîne -> 0, 1, 2, ..., len(ch) - 1 !!!
        >>> # donc range(len(ch)) -> positions possibles dans chaînes
        >>> for i in range(len(ch)):
        ...     print("ch[" + str(i) + "]=" + ch[i])
        ...
        ch[0]=d
        ch[1]=u
        ch[2]= 
        ch[3]=f
        ch[4]=e
        ch[5]=u

* **Par énumération** - ``pos, car in enumerate(chaine)``::

        >>> ch = "du feu"
        >>> for p, c in enumerate(ch):
        ...     print("ch[" + str(p) + "]=" + c)
        ...
        ch[0]=d
        ch[1]=u
        ch[2]= 
        ch[3]=f
        ch[4]=e
        ch[5]=u

Autres opérations utiles
========================

* Majuscule/minuscule - ``str.upper()``, ``.lower()``, ``.swapcase()`` et ``.capitalize()``::

        >>> "Bonjour".upper()
        'BONJOUR'
        >>> "PaS PossiBLE".lower()
        'pas possible'
        >>> 'PaS PossiBLE'.swapcase()
        'pAs pOSSIble'
        >>> 'aurevoir'.capitalize()
        'Aurevoir'

* **Formatage** «basiques» - ``str.format()``::
        
        >>> # Les «{}» sont remplacés par les valeurs correspondantes
        >>> ville = 'Bruxelle'
        >>> '{} est la capitale de la {}.'.format(ville, 'Belgique')
        'Bruxelle est la capitale de la Belgique.'
        >>> piece, pos = "cavalier", (3, 5)
        >>> "La position du {a} est ligne {b[0]} colonne {b[1]}.".format(a=piece, b=pos) 
        >>> conv = "En binaire {a}={a:b} et en hexadécimal {a}={a:x}."
        >>>> conv = conv.format(a=43)
        >>> print(conv)
        En binaire 43=101011 et en hexadécimal 43=2b.

* Chaînes **multilignes** - ``'''...'''`` ou ``"""...."""``::

        >>> discours = '''Bonjour chers amis,
        ...
        ...     Je tenais tout particulièrement à
        ... vous remercier pour blah blah blah ...
        ...   
        ... Sincèrement ...'''
        >>> discours
        'Bonjour chers amis,\n\n   Je tenais tout particulièrement à\nvous remercier pour blah blah blah ...\n\nSincèrement ...'
        >>> print(discours)
        Bonjour chers amis,
           
            Je tenais tout particulièrement à
        vous remercier pour blah blah blah ...

        Sincèrement ...

* **Joindre** les chaînes d'une «séquence» - ``str.join(seq)``::

        >>> '; '.join(['a', 'b'])
        'a; b'
        >>> l = ["un", "deux", "trois"]
        >>> sep = ' puis '
        >>> sep.join(l)
        'un puis deux puis trois'

* **Encoder** pour communiquer - ``str.encode()`` et ``bytes.decode()``:

  Python3 représente chaque caractère d'une chaîne par son identifiant unicode. Cela permet, virtuellement, de représenter toutes les langues du monde (ou presque). Pour connaître cet identifiant, utiliser ``ord(car)``. Inversement, pour trouver un caractère d'identifiant *id*, utiliser ``char(id)``.

  Lorsqu'on veut, par exemple, envoyer un message comme ``'bonjour'`` sur un réseau, il est en pratique nécessaire d'encoder le message (par défaut en Utf-8) de manière à le représenter (en interne) comme une chaîne d'octets ou *bytes* (regroupement de 8 bits - 0 ou 1). Pour en `savoir plus ... <http://python.developpez.com/cours/apprendre-python3/?page=page_12#L12-A-8>`_. 

  .. code-block:: python

        >>> mess = 'aïe' # chaîne de caractères
        >>> # encodage en un bytes (chaîne d'octets) via Utf-8
        >>> messUtf8 = mess.encode()
        >>> type(messEnc) # chaîne d'octet
        <class 'bytes'>
        >>> messUtf8 # le préfixe «b» précise qu'il s'agit d'un bytes
        b'a\xc3\xafe'
        >>> for car in mess:
        ...    print(ord(car), end=' ') # ord(caractère): identifiant unicode (en décimal)
        ...
        97 239 101
        >>> for octet in messEnc:
        ...    print(octet, end=' ') # chaque octet correspond à un entier de [0,256[
        97 195 175 101
        >>> # noter que le 'ï' est codé sur 2 octets en Utf-8
        >>> # pour décoder un bytes c'est à dire retrouver la chaîne de caractères correspondante
        >>> message = messUtf8.decode()
        >>> message
        'aïe'
