#!/bin/bash

# Директорія для пошуку
DIRECTORY="/etc"

# Знайти та підрахувати звичайні файли, виключаючи каталоги та символічні посилання
file_count=$(find "$DIRECTORY" -type f | wc -l)

# Вивести результат
echo "Кількість звичайних файлів у $DIRECTORY: $file_count"

