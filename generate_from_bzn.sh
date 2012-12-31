QUITS=0
COUNT=0
echo "Working on file  $1"
while [ $QUITS -ne 1 ]; do
  if [ $COUNT != 0 ]
  then 
    read -p  "Extract another article (y/n)?" yn
  else 
    yn="Y"
  fi
    case $yn in
      [Nn]* ) QUITS=1; break;;
      [Yy]* )  read -p "Page range:" pr
               read -p "Output filename (X.pdf)" op
               pdftk $1 cat $pr output $op.pdf
    esac
  ((COUNT++))
done

echo "$COUNT articles extracted from $1"
