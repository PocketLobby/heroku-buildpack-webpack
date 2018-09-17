head() {
  echo ""
  echo "-----> $*"
}

export_env_dir() {
  env_dir=$1
  whitelist_regex=${2:-'^(NODE_ENV|AWS_REGION|GOOGLE_ANALYTICS_KEY|MIXPANEL_KEY|VOTE_REDIRECT)$'}
  blacklist_regex=${3:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH)$'}
  echo "looking for environment variables"
  if [ -d "$env_dir" ]; then
    for e in $(ls $env_dir); do
      echo "parsing $e"
      # this was the original line
      # echo "$e" | grep -E "$whitelist_regex" | grep -qvE "$blacklist_regex" &&
      # Modifying this so env vars are imported into the app
      echo "$e" | grep -E "$whitelist_regex" &&
      export "$e=$(cat $env_dir/$e)"
      :
    done
  fi
}
