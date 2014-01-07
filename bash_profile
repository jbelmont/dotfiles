function httpdcount 
{
  ps aux | grep httpd | grep -v grep | wc -l
}

# Source the bashrc since Mac OS X source bash_profile by default first
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

