import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  final int taskId;

  const QuestionScreen({super.key, required this.taskId});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Map<String, dynamic>? questionData;

  @override
  void initState() {
    super.initState();
    loadDummyQuestion();
    // Later: replace with API call
  }

  void loadDummyQuestion() {
    questionData = {
      "QuestionID": 1,
      "Question": "Which item is displayed?",
      "QuestionSummary": "Check the availability",
      "Inputs": [
        {
          "InputType": "Photo",
          "Min": 1,
          "Max": 3,
          "Options": null,
        },
        {
          "InputType": "Dropdown",
          "Min": 1,
          "Max": 1,
          "Options": [
            {"OptionID": 101, "OptionName": "Yes"},
            {"OptionID": 102, "OptionName": "No"},
          ],
        }
      ]
    };
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (questionData == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(questionData!["Question"])),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            questionData!["QuestionSummary"],
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ...questionData!["Inputs"].map<Widget>((input) {
            switch (input["InputType"]) {
              case "Photo":
                return photoInput(input);
              case "Dropdown":
                return dropdownInput(input);
              default:
                return const SizedBox();
            }
          }).toList()
        ],
      ),
    );
  }

  Widget photoInput(Map input) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Upload Photo(s):",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          height: 120,
          color: Colors.grey[300],
          child: const Center(child: Text("Photo Picker Coming Soon")),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget dropdownInput(Map input) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Choose Option:",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        DropdownButtonFormField<int>(
          items: input["Options"]
              .map<DropdownMenuItem<int>>((opt) => DropdownMenuItem<int>(
                    value: opt["OptionID"] as int,
                    child: Text(opt["OptionName"]),
                  ))
              .toList(),
          onChanged: (value) {},
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
