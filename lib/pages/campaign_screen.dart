import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screltest/constants/my_colors.dart';

import '../Models/form_step_model.dart';
import '../viewmodels/form_steps_notifier.dart';
import '../widgets/form_widget.dart';
import '../widgets/help_section.dart';
import '../widgets/sidebar_section.dart';

class CampaignScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formSteps = ref.watch(formStepsProvider);
    final completedStepIndex = ref.watch(completedStepIndexProvider);
    final width = MediaQuery.of(context).size.width;
    final isWideScreen = width > 950;  // Set a breakpoint for wider screens

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              isWideScreen
                  ? _buildWideScreenLayout(formSteps, width, completedStepIndex, ref)
                  : _buildMobileLayout(formSteps, width, completedStepIndex, ref),
            ],
          ),
        ),
      ),
    );
  }

  // Build layout for wide screens
  Widget _buildWideScreenLayout(List<FormStepModel> formSteps, double width, int completedStepIndex, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildFormSection(formSteps[completedStepIndex], width, height: 630, ref: ref, index: completedStepIndex),
        SizedBox(width: 30),
        buildSidebarSection(formSteps, width, height: 630, ref: ref,activeStepIndex: completedStepIndex),
      ],
    );
  }

  // Build layout for mobile screens
  Widget _buildMobileLayout(List<FormStepModel> formSteps, double width, int completedStepIndex, WidgetRef ref) {
    return Column(
      children: [
        buildFormSection(formSteps[completedStepIndex], width, height: 630, ref: ref, index: completedStepIndex),
        const SizedBox(height: 20),
        buildSidebarSection(formSteps, width, height: 630, ref: ref,activeStepIndex: completedStepIndex),
      ],
    );
  }

  // Form Section Widget
  Widget buildFormSection(FormStepModel formStep, double width, {double height = 400, required WidgetRef ref, required int index}) {
    return Container(
      width: width / (width > 950 ? 3 : 1.2),  // Adjust width based on screen size
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CampaignForm(step: formStep, currentStepIndex: index),
      ),
    );
  }




}
