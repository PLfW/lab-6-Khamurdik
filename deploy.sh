#!/bin/bash

# Login with username or email
rhc setup -l Khamurdik@gmail.com

# Create php app
oc deploy core --latest -n dream-catcher

# Add postgreSQL
rhc cartridge-add postgresql --app dream-catcher

# Get remote SSH address
dream_catcher_ssh=$(rhc app-show dream-catcher --gears ssh)

# Add to git repository
git remote add production $dream_catcher_ssh

# Push to production
git push production master