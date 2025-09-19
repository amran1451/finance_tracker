class OcrService {
  Future<String> extractTextFromImage(String path) async {
    // Stub: integrate with actual OCR provider in the future.
    await Future.delayed(const Duration(milliseconds: 200));
    return 'Receipt text from $path';
  }
}
