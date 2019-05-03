# add comment regarding include to adoc file
    
perl -0pi -e 's/include::(.*)/\/\/ start \1\ninclude::\1\n\/\/ end \1/g' $1
