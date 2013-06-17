# Add these as safe download sites that can run as scripts
defaults write com.apple.versioner.python Version 3.2
defaults write org.vim.MacVim MMVerticalSplit YES 
defaults write com.apple.LaunchServices LSQuarantine -bool NO
xattr -d -r com.apple.quarantine ~/JavaOnlineClasses/Java{,Adv,Adv2}
xattr -d -r com.apple.quarantine ~/LearningWebDesign/ 
xattr -d -r com.apple.quarantine ~/Documents/HomeWorkHelp4uFiles/
xattr -d -r com.apple.quarantine ~/Javascript_programming/
xattr -d -r com.apple.quarantine ~/RubyProgramLanguage/
xattr -d -r com.apple.quarantine ~/GNU_Make/ ~/ShellScripting/
xattr -d -r com.apple.quarantine ~/TCL_programming/
xattr -d -r com.apple.quarantine ~/ShellScripting/ ~/Java_programming/ 
xattr -d -r com.apple.quarantine /Users/jean-marcelbelmont/Documents/FSU/
xattr -d -r com.apple.quarantine ~/Documents/FSUComputerScience/
xattr -d -r com.apple.quarantine ~/Sites/
### defaults write com.apple.finder AppleShowAllFiles -bool true

#System_Paths
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/sbin/:/usr/bin:/bin:/usr/local/
export PYTHONPATH="/Users/jean-marcelbelmont/Python:$PYTHONPATH:~/Documents/FSU/Fall_2012/CSC220/"
export CLASSPATH=$CLASSPATH:~/Algorithms/stdlib.jar:~/Algorithms/algs4.jar
export MANPATH=$MANPATH:/usr/share/man:/usr/local/man:/usr/bin/man:/opt/local/share/man
export DYLS_LIBRARY_PATH=$DYLS_LIBRARY_PATH:/usr/local/lib:/usr/lib
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/lib
