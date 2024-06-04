#!/bin/bash

repertoire_racine="${1:-.}"

# 1. Déplacer linuxman vers tux dans le répertoire mascottes
mv "$repertoire_racine/personnages/super_heros/hommes/sans_cape/linuxman" "$repertoire_racine/personnages/mascottes/tux"

# 2. Renommer le répertoire super_heros en comics
mv "$repertoire_racine/personnages/super_heros" "$repertoire_racine/personnages/comics"

# 3. Écrire dans le fichier batman
echo "Bruce Wayne hides behind this character" > "$repertoire_racine/personnages/comics/hommes/cape/batman"

# 4. Ajouter au fichier batman
echo "he lives in Gotham" >> "$repertoire_racine/personnages/comics/hommes/cape/batman"

# 5. Écrire dans le fichier daredevil
echo "Homer Simpson se cache derrière ce personnage" > "$repertoire_racine/personnages/comics/hommes/sans_cape/daredevil"

# 6. Écraser le contenu du fichier daredevil
echo "Daredevil est un personnage de bande dessinée aveugle" > "$repertoire_racine/personnages/comics/hommes/sans_cape/daredevil"

# 7. Copier le contenu des fichiers batman et daredevil dans mascottes/mixdarbat
cat "$repertoire_racine/personnages/comics/hommes/cape/batman" "$repertoire_racine/personnages/comics/hommes/sans_cape/daredevil" > "$repertoire_racine/personnages/mascottes/mixdarbat"

# 8. Passer en mode root (nécessaire pour certaines opérations)
sudo su

# 9. Créer un utilisateur nommé "fanboy"
useradd -m fanboy

# 10. Copier le répertoire "$repertoire_racine/personnages dans /home/fanboy
cp -r "$repertoire_racine/personnages /home/fanboy"

# 11. Changer le propriétaire et le groupe du répertoire
chown -R fanboy:fanboy /home/fanboy/personnages

# 12. Créer un lien symbolique "persofanboy" pointant vers /home/fanboy/personnages
ln -s /home/fanboy/personnages /home/fanboy/persofanboy

# 13. Créer un lien symbolique "perso_votrenom" pointant vers /home/votrenom/personnages
votrenom=$(whoami)  # Obtenir le nom d'utilisateur actuel
ln -s /home/$votrenom/personnages /home/$votrenom/perso_$votrenom

# 14. Sauvegarder la structure complète de /home/fanboy/personnages dans 14.txt
ls -lR /home/fanboy/personnages > 14.txt

# 15. Enlever les occurrences du mot "total" de 14.txt et enregistrer dans 15.txt
grep -v "total" 14.txt > 15.txt

# 16. Sauvegarder les 250 dernières lignes de l'historique dans myhistory en enlevant les lignes contenant "cd"
history | grep -v "cd" | tail -n 250 > myhistory