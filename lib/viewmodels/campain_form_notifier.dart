import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/campaign_form.dart';
import 'form_steps_notifier.dart';

class CampaignFormNotifier extends StateNotifier<CampaignFormData> {
  CampaignFormNotifier() : super(CampaignFormData(
    campaignSubject: '',
    previewText: '',
    fromName: '',
    fromEmail: '',
  )) {
    // Load saved form data when the notifier is initialized
    loadSavedDraft();
  }

  // Update form data methods
  void updateSubject(String subject) {
    state = state.copyWith(campaignSubject: subject);
  }

  void updatePreviewText(String preview) {
    state = state.copyWith(previewText: preview);
  }

  void updateFromName(String name) {
    state = state.copyWith(fromName: name);
  }

  void updateFromEmail(String email) {
    state = state.copyWith(fromEmail: email);
  }

  void toggleRunOncePerCustomer(bool value) {
    state = state.copyWith(runOncePerCustomer: value);
  }

  void toggleCustomAudience(bool value) {
    state = state.copyWith(customAudience: value);
  }

  // Save form data to SharedPreferences when "Save Draft" is pressed
  Future<void> saveDraft() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('campaignSubject', state.campaignSubject);
    await prefs.setString('previewText', state.previewText);
    await prefs.setString('fromName', state.fromName);
    await prefs.setString('fromEmail', state.fromEmail);
    await prefs.setBool('runOncePerCustomer', state.runOncePerCustomer);
    await prefs.setBool('customAudience', state.customAudience);
  }

  // Load saved form data from SharedPreferences when app is opened
  Future<void> loadSavedDraft() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    state = state.copyWith(
      campaignSubject: prefs.getString('campaignSubject') ?? '',
      previewText: prefs.getString('previewText') ?? '',
      fromName: prefs.getString('fromName') ?? '',
      fromEmail: prefs.getString('fromEmail') ?? '',
      runOncePerCustomer: prefs.getBool('runOncePerCustomer') ?? false,
      customAudience: prefs.getBool('customAudience') ?? false,
    );
  }

  // Clear the saved draft if needed
  Future<void> clearDraft() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('campaignSubject');
    await prefs.remove('previewText');
    await prefs.remove('fromName');
    await prefs.remove('fromEmail');
    await prefs.remove('runOncePerCustomer');
    await prefs.remove('customAudience');
    state = state.copyWith(
      campaignSubject: prefs.getString('campaignSubject') ?? '',
      previewText: prefs.getString('previewText') ?? '',
      fromName: prefs.getString('fromName') ?? '',
      fromEmail: prefs.getString('fromEmail') ?? '',
      runOncePerCustomer: prefs.getBool('runOncePerCustomer') ?? false,
      customAudience: prefs.getBool('customAudience') ?? false,
    );
  }

  void captureFormData(WidgetRef ref,int index) {


    print("${index}irshhhhhhhhhhhhh");
    final formData = {
      'subject': state.campaignSubject, // Assuming you have a subject field in your notifier
      'previewText': state.previewText,
      'fromName': state.fromName,
      'fromEmail': state.fromEmail,
      'runOncePerCustomer': state.runOncePerCustomer,
      'customAudience': state.customAudience,
    };

    // Update the step with the captured form data
    ref.read(formStepsProvider.notifier).updateStep(index, formData , true );
  }
}

// Riverpod provider for the form data
final campaignFormProvider = StateNotifierProvider<CampaignFormNotifier, CampaignFormData>((ref) {
  return CampaignFormNotifier();
});
