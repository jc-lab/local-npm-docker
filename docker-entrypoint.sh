mkdir -p "$DATA_DIRECTORY"
chmod 700 "$DATA_DIRECTORY"
chown -R local-npm "$DATA_DIRECTORY"

su - "local-npm" -c "cd /local-npm; npm start -- --remote $REMOTE_REGISTRY \
  --remote-skim $REMOTE_REGISTRY_SKIMDB --directory $DATA_DIRECTORY \
  --url $BASE_URL"

