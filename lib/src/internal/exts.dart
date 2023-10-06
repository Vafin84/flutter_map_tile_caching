// Copyright © Luka S (JaffaKetchup) under GPL-v3
// A full license can be found at .\LICENSE

import 'dart:io';
import 'package:path/path.dart' as p;

extension DirectoryExtensions on Directory {
  String operator >(String sub) => p.join(
        absolute.path,
        sub,
      );

  Directory operator >>(String sub) => Directory(
        p.join(
          absolute.path,
          sub,
        ),
      );

  File operator >>>(String name) => File(
        p.join(
          absolute.path,
          name,
        ),
      );

  /// A safer version of [exists], but checks that the directory exists before listing it's contents
  ///
  /// Returns same result as [list] in future.
  Future<Stream<FileSystemEntity>> listWithExists({
    bool recursive = false,
    bool followLinks = true,
  }) async {
    if (!await exists()) return const Stream.empty();
    return list(
      recursive: recursive,
      followLinks: followLinks,
    );
  }
}

extension IterableNumExts on Iterable<num> {
  num get sum => reduce((v, e) => v + e);
}
