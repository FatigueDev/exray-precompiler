BUILD_NAME="Linux_5.5.0"


OUTPUT_DIR="./build"

LIB_DIR="$OUTPUT_DIR/$BUILD_NAME/lib"
INCLUDE_DIR="$OUTPUT_DIR/$BUILD_NAME/include"

RAYLIB_SRC_DIR="./raylib/src"
RAYGUI_SRC_DIR="./raygui/src"

CUSTOM_CFLAGS=""

mkdir build

make -C ./raylib/src RAYLIB_LIBTYPE=SHARED RAYLIB_MODULE_RAYGUI=TRUE CUSTOM_CFLAGS=$CUSTOM_CFLAGS

mkdir -p $LIB_DIR
mkdir -p $INCLUDE_DIR

cp $RAYLIB_SRC_DIR/libraylib.so $RAYLIB_SRC_DIR/libraylib.so.5.5.0 $RAYLIB_SRC_DIR/libraylib.so.550 "$LIB_DIR"
cp $RAYLIB_SRC_DIR/raylib.h $RAYLIB_SRC_DIR/raymath.h $RAYLIB_SRC_DIR/rlgl.h $RAYGUI_SRC_DIR/raygui.h "$INCLUDE_DIR"

cd $OUTPUT_DIR

tar -czf $BUILD_NAME.tar.gz $BUILD_NAME