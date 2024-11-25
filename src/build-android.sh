mkdir android_build && cd android_build
export ANDROID_NDK=~/Library/Android/sdk/ndk/25.1.8937393/
cd android_build
cmake .. -DCMAKE_SYSTEM_NAME=Android \
         -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
         -DANDROID_ABI=arm64-v8a \
         -DANDROID_PLATFORM=android-21 \
         -DCMAKE_BUILD_TYPE=Release
make