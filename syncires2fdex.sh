#!/bin/bash
# Automatiser la synchronisation du moodle local et principal
cd /home/etienne/Python/Sphinx-1.2.1/IRES/source/
# récupérer les mises à jour sur le dépôt git
git pull --no-edit
# générer le html
cd /home/etienne/Python/Sphinx-1.2.1/IRES/
make html
# synchroniser avec fdex
rsync -a --delete --exclude=.git/ -e "ssh -i /home/etienne/.ssh/id_dsa_fdex_eu.pub" /home/etienne/Python/Sphinx-1.2.1/IRES/build/html/ root@fdex.eu:/var/www/ires/
