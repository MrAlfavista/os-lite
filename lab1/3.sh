#!/bin/bash

while [ 1 ]
do
echo "Меню:"
echo "1. Nano"
echo "2. Vi"
echo "3. Links"
echo "4. Выход"

read -p "Введите номер пункта меню: " choice

case $choice in
  1)
    nano
    ;;
  2)
    vi
    ;;
  3)
    links
    ;;
  4)
    exit
    ;;
  *)
    echo "Неверный номер пункта"
	exit 1
    ;;
esac
done 