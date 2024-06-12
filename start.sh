if [[ ! -v DATABASE_URL ]]; then
  echo "DATABASE_URL is not set"
  exit 1
else
  pnpm migrate
fi
