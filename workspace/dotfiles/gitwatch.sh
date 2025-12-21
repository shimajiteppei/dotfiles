#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")"


# init archive repo
ARCHIVE_DIR="${HOME}/workspace/archive"
if [ ! -e "${ARCHIVE_DIR}/.git/config" ]; then
    mkdir -p "${ARCHIVE_DIR}"
	cd "${ARCHIVE_DIR}"
    git init
    git config --local user.name "shimajiteppei"
    git config --local user.email "shimajiteppei@gmail.com"
	sleep 10
fi


# run git watch
COMPOSE_FILE="${HOME}/workspace/dotfiles/compose.gitwatch.yaml"
cmd=${1:-start}
case "$cmd" in
	start)
		docker compose -f "$COMPOSE_FILE" up -d --build
		;;
	down)
		docker compose -f "$COMPOSE_FILE" down --volumes --remove-orphans
		;;
	*)
		echo "Usage: $0 start|down"
		;;
esac
