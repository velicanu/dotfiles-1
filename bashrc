#.bashrc
[ -d ~/bin ] && export PATH="$PATH:~/bin"

export EDITOR=emacs
export VISUAL=emacs
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# PS1 and colors
##################################################
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] '
fi
alias ls='ls --color=auto'
alias grep='grep --colour=auto'

# backup scripts
###################################################
alias mount_phone='mkdir -p ~/Nexus4 && go-mtpfs ~/Nexus4 &'
alias umount_phone='fusermount -u ~/Nexus4 && rmdir ~/Nexus4'

alias fox_local_backup='rsync -tvrumhk --delete --rsh="ssh -p51001" /home/alex/Pictures/Fox/ 192.168.1.6:/mnt/drive/Pictures/Fox/'
alias fox_remote_backup='rsync -tvrumhk --chmod=o-rwx --delete --rsh="ssh -p51001" /home/alex/Pictures/Fox/ moxie.no-ip.org:/mnt/drive/Pictures/Fox/'

alias music_to_pie='rsync -tvrumhk --delete --rsh="ssh -p51001" /home/alex/Music/ 192.168.1.6:/mnt/drive/Music/'
alias music_from_pie='rsync -tvrumhk --delete --rsh="ssh -p51001" 192.168.1.6:/mnt/drive/Music/  /home/alex/Music/'

alias music_to_moxie='rsync -tvrumhk --delete --rsh="ssh -p51001" /home/alex/Music/ moxie.no-ip.org:/mnt/drive/Music/'
alias music_from_moxie='rsync -tvrumhk --delete --rsh="ssh -p51001" moxie.no-ip.org:/mnt/drive/Music/  /home/alex/Music/'

alias music_to_hig='rsync -tvrumhk --delete /home/alex/Music/ higmini5.lns.mit.edu:/srv/subsonic/Music/'
alias music_from_hig='rsync -tvrumhk --delete higmini5.lns.mit.edu:/srv/subsonic/Music/  /home/alex/Music/'


# utility aliases
######################################################
alias la='ls -Ah --si'
alias ll='ls -lh --si'

alias em='emacs'
alias emn='emacs -nw'

alias root='root -l -x'
alias ls_full='ls -d $(pwd -P)/*'
alias pwd='pwd -P'


# ssh shortcuts
####################################################
alias svmit='ssh -Xt richard@lxplus.cern.ch "ssh -X svmithi01"'
alias lxplus='ssh -X richard@lxplus5.cern.ch'
alias cgate='ssh -Xt luck@portal.cmsaf.mit.edu "ssh -X hidsk0001"'
#alias higmini5='ssh -X 198.125.160.54'
alias higmini5='mosh higmini5.lns.mit.edu'

#alias pie='ssh -x 192.168.1.6 -p 51001'
#alias moxie='ssh -x moxie.no-ip.org -p 51001'
alias pie='mosh --ssh="ssh -p 51001" --port 51002 192.168.1.6'
alias moxie='mosh --ssh="ssh -p 51001" --port 51002 moxie.no-ip.org'
alias moxie_tunnel='ssh -p 51001 moxie.no-ip.org -L 2000:localhost:8080 -N'

alias emcgate='emacs "/ssh:luck@cgate.cmsaf.mit.edu|hidsk0001:~/"'
alias emlxplus='emacs /ssh:richard@lxplus5.cern.ch:~/'

alias cms904tunnel='ssh -t richard@lxplus.cern.ch -L 1080:localhost:1085 "ssh -ND 1085 richard@cms904usr"'
alias emcms='emacs "/ssh:richard@lxplus.cern.ch|richard@cms904usr|l1ts-rct-02:~/"'
alias cms904='ssh -Xt richard@lxplus.cern.ch "ssh -Xt richard@cms904usr \" ssh -X l1ts-rct-02 \""'
