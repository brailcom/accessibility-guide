#!/bin/sh
thisdir="`dirname "$0"`"
order="index overview overview-gnu-linux gnu-linux/gnu-linux gnu-linux/gnu-installation/gnu-installation gnu-linux/gnu-installation/ubuntu-desktop gnu-linux/gnu-installation/ubuntu-brltty gnu-linux/gnu-installation/ubuntu-festival gnu-linux/gnu-configuration gnu-linux/gnu-usage gnu-linux/gnu-troubleshooting windows/windows windows/windows-installation windows/windows-configuration windows/windows-usage macosx/macosx macosx/macosx-installation macosx/macosx-configuration ios/ios ios/ios-installation ios/ios-configuration ios/ios-usage"

lang="$1"
if [ -z "$lang" ]; then
    echo "Usage: mcms.sh <language>"
    exit 1
fi
echo "Starting in language ${lang}"
for i in $order; do
    path="${i}.${lang}.txt"
    [ -e "$path" ] || echo "File $path does not exist"
    "$thisdir"/cms.sh "${path}" | pbcopy
    label="`basename "${path}"`"
    printf "Paste page ${label}"
    read value
done
