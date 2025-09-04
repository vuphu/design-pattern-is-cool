#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_folder> <sample_type>"
    exit 1
fi

SOURCE_FOLDER=$1
SOURCE_FILE=$(find "$SOURCE_FOLDER/samples" -name "*.$2" -print -quit)

if [ -z "$SOURCE_FILE" ]; then
    echo "No .$2 file is found in $SOURCE_DIR"
    exit 1
fi    

if [ $2 = 'kt' ]; then
    JAR_FILE="exec.jar"
    kotlinc $SOURCE_FILE -include-runtime -d $JAR_FILE
    java -jar $JAR_FILE
    rm $JAR_FILE
elif [ $2 = "py" ]; then
    python3 $SOURCE_FILE
elif [ $2 = 'java' ]; then
    javac $SOURCE_FILE
    cd $SOURCE_FOLDER/samples
    JAVA_FILE=$(find "./" -name "*.class" -print -quit)
    java $(basename $JAVA_FILE .class)
    rm $JAVA_FILE
elif [ $2 = 'ts' ]; then
    node $SOURCE_FILE
elif [ $2 = 'dart' ]; then
    dart $SOURCE_FILE
elif [ $2 = "cpp" ]; then
    EXECUTABLE="exec"
    g++ -std=c++20 -o $EXECUTABLE $SOURCE_FILE
    ./$EXECUTABLE
    rm $EXECUTABLE
elif [ $2 = "rs" ]; then
    EXECUTABLE="exec"
    rustc -o $EXECUTABLE $SOURCE_FILE
    ./$EXECUTABLE
    rm $EXECUTABLE
elif [ $2 = "swift" ]; then
    swift $SOURCE_FILE
elif [ $2 = "go" ]; then
    go run $SOURCE_FILE
elif [ $2 = "rb" ]; then
    ruby $SOURCE_FILE
fi