import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/form_step_model.dart';
import '../constants/my_colors.dart';
import '../viewmodels/form_steps_notifier.dart';
import 'help_section.dart';

Widget buildSidebarSection(List<FormStepModel> formSteps, double width, {double height = 400, required WidgetRef ref,required int activeStepIndex}) {
  return Container(
    width: width / (width > 800 ? 5 : 1.2),  // Adjust width for narrow screens
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: Colors.white,
    ),
    child: Column(
      children: [
        // List of steps
        Expanded(
          child: ListView.builder(
            itemCount: formSteps.length,
            itemBuilder: (context, index) {
              final step = formSteps[index];
              final isActive = index == activeStepIndex;
              return ListTile(
                onTap: () {
                  if (step.isCompleted) {
                    ref.read(formStepsProvider.notifier).goToStep(index);
                  }
                },
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 19,
                    backgroundColor:step.isCompleted || isActive ? orange : clFFFFFF,
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color:step.isCompleted ||  isActive ? clFFFFFF : Colors.grey,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  step.title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    color: clBlack,
                  ),
                ),
                subtitle: Text(
                  step.label,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
              );
            },
          ),
        ),
        buildHelpSection(),
      ],
    ),
  );
}