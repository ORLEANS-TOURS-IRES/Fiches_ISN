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
   * Empêcher l'interpration des guillemets simples ou doubles comme délimiteur: ``\'`` ou ``\"``. Ex: ``'l\'utilisation de ": ok'``.
   * Insérer un backslash «\\» ? : ``\\``

* Une chaîne n'est **pas directement modifiable**.
* Chaque caractère d'une chaîne est numéroté par un entier (positif ou négatif) appelé **position** ou index:

   * Le premier caractère a la position 0, le second la position 1, etc.
   * Le dernier caractère a la position -1, l'avant dernier -2, etc.

Opérations de base
==================

* Créer une chaîne littéralement - ``'...'`` ou ``"..."``::

        >>> ch = "bonjour \u2600\n tout l'monde!"
        >>> ch # contenu de ch1, notez les guillemets
        "bonjour ☀\n tout l'monde!"
        >>> print(ch) # affichage à l'écran de ch1, différence ?
        bonjour ☀
         tout l'monde!
        >>> autre = 'bonjour \u2600\n tout l\'monde!'
        >>> ch == autre
        True

* Connaître le nombre de caractères qu'elle contient - ``len(chaine)``::

        >>> longueur = len(ch)
        >>> longueur
        24

* Savoir si une sous-chaîne ou un caractère apparaît dans la chaîne - ``ss_chaine in chaine``::

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

* Accéder à un caractère - ``chaine[pos]``::

        >>> ch1[0] # position positive du «soleil» ?
        'b'
        >>> ch1[-1] # position négative du «soleil» ?
        '!'
  
* Extraire une sous-chaîne - ``chaine[pos1:pos2]`` ou ``chaine[pos1:pos2:pas]``::

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

* 
