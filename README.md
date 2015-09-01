# Getting Started with SQL

### Install postgres : 
-brew install postgres

-Heed the post-install notes. There may be something like: 
  "To have launchd start postgresql at login:"
  <blockquote>
        ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  </blockquote>

-Then to load postgresql now:
  <blockquote>
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  <blockquote>
  
  

