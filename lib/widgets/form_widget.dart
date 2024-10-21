import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/form_step_model.dart';
import '../constants/my_colors.dart';
import '../viewmodels/campain_form_notifier.dart';
import '../viewmodels/form_steps_notifier.dart';

class CampaignForm extends ConsumerWidget  {
  final FormStepModel step;
  final int currentStepIndex;
  final _formKey = GlobalKey<FormState>(); // Create a global key for the form
  CampaignForm({required this.step, required this.currentStepIndex});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isWideScreen = width > 900;

    final campaignFormData = ref.watch(campaignFormProvider);
    final campaignFormNotifier = ref.read(campaignFormProvider.notifier);


    return Form(

      key: _formKey, // Assign the key to the form
      child: Column(
        children: [
          Text(step.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(step.label,
              style: const TextStyle(fontSize: 15, color: Colors.grey)),
          const SizedBox(height: 16),

          const Align(
              alignment: Alignment.topLeft,
              child: Text("Campaign Subject", style: TextStyle(fontSize: 15))),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: clFFFFFF,
              boxShadow: [
                BoxShadow(
                  color: cl000000.withOpacity(0.10),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: TextFormField(
              cursorColor: clBlack,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: orange),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: "Enter Subject",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a campaign subject';
                }
                return null;
              },
              initialValue: campaignFormData.campaignSubject,
              onChanged: campaignFormNotifier.updateSubject,
            ),
          ),

          const SizedBox(height: 20),

          const Align(
              alignment: Alignment.topLeft,
              child: Text("Preview Text", style: TextStyle(fontSize: 15))),
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: clFFFFFF,
              boxShadow: [
                BoxShadow(
                  color: cl000000.withOpacity(0.10),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: TextFormField(
              cursorColor: clBlack,
              maxLines: 4,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: orange),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: "Enter text here..",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter preview text';
                }
                if (value.length > 50) {
                  return 'Keep it simple, max 50 characters';
                }
                return null;
              },
              initialValue: campaignFormData.previewText,
              onChanged: campaignFormNotifier.updatePreviewText,
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text("Keep this Simple 50 characters",
                  style: TextStyle(fontSize: 13, color: Colors.grey[400]))),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text("From Name", style: TextStyle(fontSize: 15))),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: clFFFFFF,
                        boxShadow: [
                          BoxShadow(
                            color: cl000000.withOpacity(0.10),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: clBlack,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: orange),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          hintText: "From Name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        initialValue: campaignFormData.fromName,
                        onChanged: campaignFormNotifier.updateFromName,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text("From Email", style: TextStyle(fontSize: 15))),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: clFFFFFF,
                        boxShadow: [
                          BoxShadow(
                            color: cl000000.withOpacity(0.10),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: clBlack,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: orange),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          hintText: "From Email",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          // Email validation logic
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        initialValue: campaignFormData.fromEmail,
                        onChanged: campaignFormNotifier.updateFromEmail,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              "Run only once per customer",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            value: campaignFormData.runOncePerCustomer,
            activeColor: orange,
            onChanged: (bool newValue) {
              campaignFormNotifier.toggleRunOncePerCustomer(newValue);
            },
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Custom audience",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[400]),
            ),
            value: campaignFormData.customAudience,
            activeColor: orange,
            onChanged: (bool newValue) {
              campaignFormNotifier.toggleCustomAudience(newValue);
            },
          ),

          const SizedBox(height: 10),

          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'You can set up a',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[400]),
              ),
              const TextSpan(
                text: ' Custom Domain or connect your email service provider ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: orange),
              ),
              TextSpan(
                text: 'to change this.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[400]),
              ),
            ]),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: !isWideScreen ? width / 5 : width / 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: cl000000.withOpacity(0.10),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    border: Border.all(color: orange)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: clFFFFFF,
                    foregroundColor: clFFFFFF.withOpacity(0.15),
                    backgroundColor: clFFFFFF,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () async {

                      await campaignFormNotifier.saveDraft();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Draft Saved!'),
                      ));

                  },
                  child: const Text(
                    "Save Draft",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: orange),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: !isWideScreen ? width / 3 : width / 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: cl000000.withOpacity(0.10),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    border: Border.all(color: orange)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: clFFFFFF,
                    foregroundColor: clFFFFFF.withOpacity(0.15),
                    backgroundColor: orange,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // FormNotifier.updateStep(currentStepIndex, campaignFormNotifier., isCompleted)
                      await campaignFormNotifier.clearDraft();
                      campaignFormNotifier.captureFormData(ref,currentStepIndex);

                      // ref.read(formStepsProvider.notifier).updateStep(currentStepIndex,); // Assume you have this logic
                    }
                  },
                  child: const Text(
                    "Next Step",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: clFFFFFF),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
