typedef OnProgressUpdated = String Function();

abstract class ProgressIndicator {
  const ProgressIndicator({
    this.stopOnError = true,
  });

  final bool stopOnError;
}
