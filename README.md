
# Dotfiles

My dotfiles and common scripts. They work with zsh and oh-my-zsh so you're gonna
need those on your system.

## Integration

A good way to integrate these in your system is to have a local `.zshrc` that 
references the file in the repo. For example you could have the following.

```
# ~/.zshrc
[ -f ~/repos/dotfiles/zshrc ] && source ~/repos/dotfiles/zshrc

# Local corrections...
```

## Amazon Cloud Drive

The `macd` script mounts the encrypted cloud drive automatically. The
dependencies are

- acd_cli (get the acdcli package from pip3)
- encfs

The encfs config file is in insync.
