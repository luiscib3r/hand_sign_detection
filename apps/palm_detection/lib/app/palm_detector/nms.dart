import 'dart:math';

List<int> nms(
  List<List<double>> bboxes, {
  double threshold = 0.5,
}) {
  final selectedIndex = <int>[];

  final sortedIndexMap = bboxes.asMap().entries.toList()
    ..sort((a, b) {
      final aScore = a.value[4];
      final bScore = b.value[4];

      return aScore.compareTo(bScore);
    });

  var sortedIndex = sortedIndexMap.map((e) => e.key).toList().reversed.toList();

  while (sortedIndex.isNotEmpty) {
    final currentIndex = sortedIndex.removeAt(0);
    selectedIndex.add(currentIndex);
    final currentBox = bboxes[currentIndex];

    final remainingIndex = <int>[];

    for (var i = 1; i < sortedIndex.length; i++) {
      final nextIndex = sortedIndex[i];
      final nextBox = bboxes[nextIndex];
      final iou = calculateIou(currentBox, nextBox);

      if (iou < threshold) {
        remainingIndex.add(nextIndex);
      }

      sortedIndex = remainingIndex;
    }
  }

  return selectedIndex;
}

double calculateIou(List<double> bbox1, List<double> bbox2) {
  final x1 = max(bbox1[0], bbox2[0]);
  final y1 = max(bbox1[1], bbox2[1]);
  final x2 = min(bbox1[2], bbox2[2]);
  final y2 = min(bbox1[3], bbox2[3]);

  final intersectionArea = max(0, x2 - x1) * max(0, y2 - y1);

  final areaBox1 = (bbox1[2] - bbox1[0]) * (bbox1[3] - bbox1[1]);
  final areaBox2 = (bbox2[2] - bbox2[0]) * (bbox2[3] - bbox2[1]);

  final unionArea = areaBox1 + areaBox2 - intersectionArea;

  final iou = unionArea > 0 ? intersectionArea / unionArea : 0.0;

  return iou;
}
