# Direcotory first
find . -type d -name "* *" | rename 's/ /_/g'
find . -type f -name "* *" | rename 's/ /_/g'
