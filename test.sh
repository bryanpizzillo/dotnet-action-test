set -x
## Start the app
which dotnet
dotnet ./out/dotnet-action-test.dll 2>&1 &
echo "Starting API"
until $(curl --output /dev/null --silent --fail http://localhost:5000/api/values); do
  echo $?
  printf '.'
  sleep 5
done
echo "Its up"