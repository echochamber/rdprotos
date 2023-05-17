# Generates protos for vscode autocompletion and go to definition.
this_dir="$(realpath $( dirname -- "$0"; ))"
gendir="$this_dir/gen/vscodeprotos/"
mkdir -p $gendir
buf export $this_dir --output=$this_dir/gen/vscodeprotos/ 