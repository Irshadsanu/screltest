// import 'dart:convert';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Models/form_step_model.dart';
//
// class FormStepsNotifier extends StateNotifier<List<FormStepModel>> {
//   final StateNotifierProviderRef ref;
//   FormStepsNotifier(this.ref) : super([]) {
//     initializeSteps();
//   }
//
//   Future<void> updateStep(int index, Map<String, dynamic> formData, bool isCompleted) async {
//     state = [
//       for (int i = 0; i < state.length; i++)
//         if (i == index)
//           state[i].copyWith(formData: formData, isCompleted: isCompleted)
//         else
//           state[i],
//     ];
//
//     goToStep(index + 1);
//     await _saveToLocalStorage();
//     _updateCompletedStepIndex();
//   }
//
//   Future<void> _saveToLocalStorage() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final stepsJson = jsonEncode(state.map((step) => step.toJson()).toList());
//     await prefs.setString('formSteps', stepsJson);
//   }
//
//   void addStep(FormStepModel step) {
//     state = [...state, step];
//     _updateCompletedStepIndex();
//   }
//
//   void completeStep(int index) {
//     if (index < state.length) {
//       final step = state[index].copyWith(isCompleted: true);
//       state = [
//         ...state.sublist(0, index),
//         step,
//         ...state.sublist(index + 1),
//       ];
//       _saveToLocalStorage(); // Save after completing the step
//
//       // Move to the next step
//       if (index + 1 < state.length) {
//         goToStep(index + 1);
//       }
//       _updateCompletedStepIndex();  // Update the completedStepIndex after step completion
//     }
//   }
//
//   void initializeSteps() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final storedSteps = prefs.getString('formSteps');
//
//     if (storedSteps != null) {
//       final List<dynamic> stepsList = jsonDecode(storedSteps);
//       state = stepsList.map((step) => FormStepModel.fromJson(step)).toList();
//     } else {
//       state = [
//         FormStepModel(title: "Create New Campaign", label: "Fill out these details and get your campaign ready"),
//         FormStepModel(title: "Create Segments", label: "Get full control over your audience"),
//         FormStepModel(title: "Bidding strategy", label: "Optimize the campaign reach"),
//         FormStepModel(title: "Site links", label: "Setup your custom journey flow"),
//         FormStepModel(title: "Review Campaign", label: "Double-check your campaign is ready to go"),
//       ];
//     }
//     _updateCompletedStepIndex();
//   }
//
//   void goToStep(int index) {
//     if (index >= 0 && index < state.length) {
//       state = [
//         for (int i = 0; i < state.length; i++)
//           state[i].copyWith(isCompleted: i <= index)
//       ];
//     }
//   }
//
//   void _updateCompletedStepIndex() {
//     // Find the first step that is not completed
//     final completedStepIndex = state.indexWhere((step) => !step.isCompleted);
//     ref.read(completedStepIndexProvider.notifier).state =
//     completedStepIndex == -1 ? state.length - 1 : completedStepIndex;
//   }
// }
//
// final formStepsProvider =
// StateNotifierProvider<FormStepsNotifier, List<FormStepModel>>((ref) {
//   return FormStepsNotifier(ref);
// });
//
// // Provider for the first incomplete step (or completedStepIndex)
// final completedStepIndexProvider = StateProvider<int>((ref) {
//   return 0;
// });
//
// // Provider to track the current active step
// final activeStepProvider = StateProvider<int>((ref) => 0);
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/form_step_model.dart';

class FormStepsNotifier extends StateNotifier<List<FormStepModel>> {
  final StateNotifierProviderRef ref;

  FormStepsNotifier(this.ref) : super([]) {
    // Initialize steps outside constructor to avoid premature state update
    _initializeSteps();
  }

  // Public method to update the step at a specific index
  Future<void> updateStep(int index, Map<String, dynamic> formData, bool isCompleted) async {
    // Update the step at the specified index
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(formData: formData, isCompleted: isCompleted)
        else
          state[i],
    ];

    // Move to the next step
    goToStep(index);

    // Save state to local storage and update the completed step index
    await _saveToLocalStorage();
    _updateCompletedStepIndex();
  }

  // Adds a new step
  void addStep(FormStepModel step) {
    state = [...state, step];
    _updateCompletedStepIndex();
  }

  // Marks a specific step as completed and saves to local storage
  void completeStep(int index) {
    if (index < state.length) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index)
            state[i].copyWith(isCompleted: true)
          else
            state[i],
      ];

      _saveToLocalStorage();

      // Move to the next step if it exists
      if (index + 1 < state.length) {
        goToStep(index );
      }

      _updateCompletedStepIndex();
    }
  }

  // Helper method to initialize steps from local storage or defaults
  Future<void> _initializeSteps() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final storedSteps = prefs.getString('formSteps');

      if (storedSteps != null) {
        final List<dynamic> stepsList = jsonDecode(storedSteps);
        state = stepsList.map((step) => FormStepModel.fromJson(step)).toList();
      } else {
        // Default steps if no stored steps are found
        state = _defaultSteps();
      }
    } catch (e) {
      state = _defaultSteps(); // Fallback to default if an error occurs
    }

    _updateCompletedStepIndex();
  }

  // Helper method to save current steps to local storage
  Future<void> _saveToLocalStorage() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final stepsJson = jsonEncode(state.map((step) => step.toJson()).toList());
      await prefs.setString('formSteps', stepsJson);
    } catch (e) {
      // Handle save error
      print('Error saving form steps: $e');
    }
  }

  // Helper method to define default steps
  List<FormStepModel> _defaultSteps() {
    return [
      FormStepModel(title: "Create New Campaign", label: "Fill out these details and get your campaign ready"),
      FormStepModel(title: "Create Segments", label: "Get full control over your audience"),
      FormStepModel(title: "Bidding strategy", label: "Optimize the campaign reach"),
      FormStepModel(title: "Site links", label: "Setup your custom journey flow"),
      FormStepModel(title: "Review Campaign", label: "Double-check your campaign is ready to go"),
    ];
  }

  // Navigates to the specified step index
  void goToStep(int index) {
    if (index >= 0 && index < state.length) {
      state = [
        for (int i = 0; i < state.length; i++)
          state[i].copyWith(isCompleted: i <= index),
      ];
    }
  }

  // Updates the provider for the first incomplete step
  void _updateCompletedStepIndex() {
    final completedStepIndex = state.indexWhere((step) => !step.isCompleted);
    ref.read(completedStepIndexProvider.notifier).state =
    completedStepIndex == -1 ? state.length - 1 : completedStepIndex;
  }
}

// Providers for accessing the form steps and tracking the current active step
final formStepsProvider =
StateNotifierProvider<FormStepsNotifier, List<FormStepModel>>((ref) {
  return FormStepsNotifier(ref);
});

final completedStepIndexProvider = StateProvider<int>((ref) => 0);

final activeStepProvider = StateProvider<int>((ref) => 0);
