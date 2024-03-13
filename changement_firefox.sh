#!/bin/bash

# Chemin du répertoire des profils Firefox
profiles_dir=~/.mozilla/firefox/

# Boucle à travers tous les dossiers de profil
for profile_dir in $profiles_dir*; do
    if [ -d "$profile_dir" ]; then
        # Trouver le fichier prefs.js dans le dossier de profil
        prefs_file="$profile_dir/prefs.js"
        
        # Vérifier si le fichier prefs.js existe
        if [ -f "$prefs_file" ]; then
            # Modifier la valeur de app.update.interval dans prefs.js
            echo 'user_pref("app.update.interval", 604800);' >> "$prefs_file"
            echo "Modifications apportées à $prefs_file"
        fi
    fi
done

echo "Script terminé. Relancez Firefox pour appliquer les modifications."
