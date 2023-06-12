#!/bin/sh

# We check to make sure we are in the root directory.
if [ ! -f answers/test_answers.sh ]; then
    echo "Must be run from the project root directory."
    exit 1
fi

# We need to keep the old files.
mkdir -p answers/old
for broken in exercises/*.odin; do
    mv $broken answers/old/
done
mv out out_old

# Now move the answers to the exercises/ folder.
for answer in answers/*.odin; do
    cp $answer exercises/
done

# Now run odinlings.
mkdir out
./odinlings

# Finally, move the old answers back to the exercises/ folder.
rm -r exercises
mv answers/old exercises
rm -r out
mv out_old out
