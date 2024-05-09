class FeedbackItem {
  final int id;
  final String feedbackDescription;
  final int order;
  final int score;

  FeedbackItem({
    required this.id,
    required this.feedbackDescription,
    required this.order,
    required this.score,
  });

  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    return FeedbackItem(
      id: json['id'] as int,
      feedbackDescription: json['FeedbackDescription'] as String? ?? '',
      order: json['order'] as int,
      score: json['Score'] as int,
    );
  }
}