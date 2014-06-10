dotfiles
========

Create a .bash folder in home directory
```
  mkdir ~/.bash
```

For handy commands move the aliases and profile to the ~/.bash folder
```
  mv ./aliases ~/.bash; mv ./profile ~/.bash
```

Include profile into your ~/.bash_profile
```
  if [ -f ~/.bash/profile ]; then
    source ~/.bash/profile
  fi
```
