class CampaignFormData {
  final String campaignSubject;
  final String previewText;
  final String fromName;
  final String fromEmail;
  final bool runOncePerCustomer;
  final bool customAudience;

  CampaignFormData({
    this.campaignSubject = '',
    this.previewText = '',
    this.fromName = '',
    this.fromEmail = '',
    this.runOncePerCustomer = false,
    this.customAudience = false,
  });

  bool get isValid => campaignSubject.isNotEmpty && previewText.isNotEmpty && fromName.isNotEmpty && fromEmail.isNotEmpty && RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(fromEmail);



  CampaignFormData copyWith({
    String? campaignSubject,
    String? previewText,
    String? fromName,
    String? fromEmail,
    bool? runOncePerCustomer,
    bool? customAudience,
  }) {
    return CampaignFormData(
      campaignSubject: campaignSubject ?? this.campaignSubject,
      previewText: previewText ?? this.previewText,
      fromName: fromName ?? this.fromName,
      fromEmail: fromEmail ?? this.fromEmail,
      runOncePerCustomer: runOncePerCustomer ?? this.runOncePerCustomer,
      customAudience: customAudience ?? this.customAudience,
    );
  }
}