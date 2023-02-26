#!/bin/bash

aur=$(yay -Qua | wc -l)
rep=$(yay -Qu | wc -l)
echo "$rep $aur"
