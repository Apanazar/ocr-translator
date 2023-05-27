#!/bin/bash

# Запускаем OCR для захвата текста
flatpak run com.github.dynobo.normcap

# Дожидаемся завершения предыдущей команды
sleep 6

# Получаем текст из буфера обмена
text=$(xsel -b -o)
text=$(echo "$text" | tr -dc '[:alnum:][:space:]')

# Переводим текст
translation=$(trans -b en:ru "$text")

# Выводим перевод
zenity --info --text="$translation"
