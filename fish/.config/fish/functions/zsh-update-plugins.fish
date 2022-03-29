function zsh-update-plugins --wraps=find\ /home/humberto/.config/zsh//plugins\ -type\ d\ -exec\ test\ -e\ \'\{\}/.git\'\ \'\;\'\ -print0\ \|\ xargs\ -I\ \{\}\ -0\ git\ -C\ \{\}\ pull\ -q --description alias\ zsh-update-plugins=find\ /home/humberto/.config/zsh//plugins\ -type\ d\ -exec\ test\ -e\ \'\{\}/.git\'\ \'\;\'\ -print0\ \|\ xargs\ -I\ \{\}\ -0\ git\ -C\ \{\}\ pull\ -q
  find /home/humberto/.config/zsh//plugins -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q $argv; 
end
