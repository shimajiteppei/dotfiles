#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")"
HERE=$(pwd)


# set archive name from input argument (required)
ARCHIVE_NAME=${1:-}
if [ -z "$ARCHIVE_NAME" ]; then
  echo "Usage: $0 <archive-name>"
  exit 1
fi
ARCHIVE_NAME=$(echo $ARCHIVE_NAME | tr ' ' '_' | tr '/' '_')


# prepare archive folder
NOW=$(date '+%Y%m%d%H%M%S')
ARCHIVE_DIRNAME="${NOW}__${ARCHIVE_NAME}"
mkdir -p $ARCHIVE_DIRNAME
cd ./$ARCHIVE_DIRNAME
mkdir -p 00_original
mkdir -p 01_process
mkdir -p 10_result


# create archiver script
cat << EOF > create-archive.sh
#!/usr/bin/env sh
set -eux
cd "$HERE/$ARCHIVE_DIRNAME"

# archive only original and result
tar -czf ../archive_$ARCHIVE_DIRNAME.tar.gz 00_original 10_result
EOF
chmod +x create-archive.sh
