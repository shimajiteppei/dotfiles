#!/usr/bin/env sh

cd $(dirname $0)

echo '{ "recommendations": [' > extensions.json
code --list-extensions | sed 's/.*/"&",/' >> extensions.json
sed -i '$ s/,$//' extensions.json
echo '] }' >> extensions.json
