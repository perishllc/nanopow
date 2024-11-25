// // You have generated a new plugin project without specifying the `--platforms`
// // flag. A plugin project with no platform support was generated. To add a
// // platform, run `flutter create -t plugin --platforms <platforms> .` under the
// // same directory. You can also find a detailed instruction on how to add
// // platforms in the `pubspec.yaml` at
// // https://flutter.dev/to/pubspec-plugin-platforms.

// import 'nanopow_platform_interface.dart';

// class Nanopow {
//   static Future<String?> getPow(String hash, String threshold) {
//     return NanopowPlatform.instance.getPow(hash, threshold);
//   }
// }

import 'dart:ffi' as ffi;
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'dart:io';

// // C function: char* get_pow(char *hash, char *threshold)
// typedef GetPowNative = Pointer<Utf8> Function(Pointer<Utf8> hash, Pointer<Utf8> threshold);
// typedef GetPow = Pointer<Utf8> Function(Pointer<Utf8> hash, Pointer<Utf8> threshold);

// class PowLib {
//   static final ffi.DynamicLibrary _lib = _loadLibrary();

//   static ffi.DynamicLibrary _loadLibrary() {
//     if (Platform.isAndroid) {
//       return ffi.DynamicLibrary.open('libpow_lib.so');
//     } else if (Platform.isIOS) {
//       return ffi.DynamicLibrary.process();
//     } else if (Platform.isWindows) {
//       return ffi.DynamicLibrary.open('pow_lib.dll');
//     } else if (Platform.isMacOS) {
//       return ffi.DynamicLibrary.open('libpow_lib.dylib');
//     } else {
//       return ffi.DynamicLibrary.open('libpow_lib.so');
//     }
//   }

//   static String getPow(String hash, String threshold) {
//     final get_pow = _lib.lookupFunction<GetPow, GetPowNative>("get_proof_of_work");
//     return get_pow(hash.toNativeUtf8(), threshold.toNativeUtf8()).toDartString();
//   }
// }

// final DynamicLibrary nativeLib = Platform.isAndroid
//     ? DynamicLibrary.open("libpow_lib.so")
//     : DynamicLibrary.process();

// final getProofOfWork = nativeLib
//     .lookupFunction
//         Uint64 Function(Pointer<Utf8>, Pointer<Utf8>),
//         int Function(Pointer<Utf8>, Pointer<Utf8>)>('get_proof_of_work');

typedef GetProofOfWork = Uint64 Function(Pointer<Utf8> hash, Pointer<Utf8> threshold);
typedef GetProofOfWorkNative = int Function(Pointer<Utf8> hash, Pointer<Utf8> threshold);

class PowLib {
  static final DynamicLibrary _lib =
      Platform.isAndroid ? DynamicLibrary.open("libpow_lib.so") : DynamicLibrary.process();

  static final _getProofOfWork = _lib.lookupFunction<GetProofOfWork, GetProofOfWorkNative>('get_proof_of_work');

  static int? getProofOfWork(String hash, String threshold) {
    final hashPointer = hash.toNativeUtf8();
    final thresholdPointer = threshold.toNativeUtf8();

    try {
      return _getProofOfWork(hashPointer, thresholdPointer);
    } finally {
      calloc.free(hashPointer);
      calloc.free(thresholdPointer);
    }
  }
}
