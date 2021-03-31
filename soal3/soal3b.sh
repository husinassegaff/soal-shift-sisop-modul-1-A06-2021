bash ./soal3a.sh

current_date=$(date +"%d-%m-%Y")
mkdir "$current_date"
mv ./Koleksi_* "./$current_date/"
mv ./Foto.log "./$current_date/"

echo "Moved to $current_date"