mkdir ios_build && cd ios_build
cmake .. -G Xcode -DCMAKE_BUILD_TYPE=Release -DCMAKE_SYSTEM_NAME=iOS
cmake --build . --config Release