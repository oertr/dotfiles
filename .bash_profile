if [ -f ~/.profile ]; then
  source ~/.profile
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
  if [ -f ~/.bashrc ]; then
    source ~/.bashrc
  fi
fi

