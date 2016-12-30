wget $1
zipFile=`find ./ -name '*zip'`
unzip $zipFile
cur_dir=$(cd "$(dirname "$0")"; pwd)
cd $cur_dir
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
dSYMFile=`find ./ -name '*dSYM'`
echo "dSYMFile resut:"
dwarfdump --uuid $dSYMFile
echo "crashFile resut:"
grep "slice_uuid" original.crash
/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash original.crash $dSYMFile > dsym.crash
