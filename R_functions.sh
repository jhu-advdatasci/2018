function Rbatch {
  x="$1"
  mydir=`mktemp file.XXXX.sh`
  echo '#!/bin/bash' > $mydir
  # echo "R --no-save < ${x}" >> $mydir
  # echo "Rscript ${x}"
  echo "Rscript ${x}" >> $mydir
  # cat $mydir
  # echo $mydir
  shift
  # echo "$@"
  qsub -cwd "$@" $mydir
  rm $mydir
}

function Rnosave {
  x="$1"
  mydir=`mktemp file.XXXX.sh`
  echo '#!/bin/bash' > $mydir
  # echo "R --no-save < ${x}" >> $mydir
  # echo "Rscript ${x}"
  echo "R --no-save < ${x}" >> $mydir
  # cat $mydir
  # echo $mydir
  shift
  # echo "$@"
  qsub -cwd "$@" $mydir
  rm $mydir
}