inotifywait -q -m -e close_write presentation.md |
while read -r filename event; do
  ./build.sh
  echo "rebuilding"
done
