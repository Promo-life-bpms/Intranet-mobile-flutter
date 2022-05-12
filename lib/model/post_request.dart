class RequestPost {
  final String token;
  final String typeRequest;
  final String payment;
  final String start;
  final String reason;
  final String days;

  const RequestPost({
    required this.token,
    required this.typeRequest,
    required this.payment,
    required this.start,
    required this.reason,
    required this.days,
    });

  factory RequestPost.fromJson(Map<String, dynamic> json) {
    return RequestPost(
      token: json['token'],
      typeRequest: json['typeRequest'],
      payment: json['payment'],
      start: json['start'],
      reason: json['reason'],
      days: json['days'],
    );
  }
}
