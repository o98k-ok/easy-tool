#/bin/bash


assert_name="assets"
work_dir=$(dirname $1)

echo "current work dir is $work_dir\n"

all_files=$(ls $work_dir/$assert_name)
echo "all png files:"
echo "======================================"
echo "$all_files"
echo "======================================\n"

using_files=$(grep -h -o -E "$assert_name/[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}-image.png" $1)
echo "all using png files in markdown:"
echo "======================================"
echo "$using_files"
echo "======================================\n"



mkdir -p $work_dir/assets_tmp

echo "begin to cleanup unused png files:"
for f in $all_files
do
    if [[ ! "${using_files[@]}" =~ "$f" ]]
    then
        echo "clean $f ..."
        mv $work_dir/assets/$f $work_dir/assets_tmp/$f
    fi
done
