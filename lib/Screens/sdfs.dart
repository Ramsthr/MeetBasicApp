import 'package:flutter/material.dart';

class Sdfs extends StatelessWidget {
  const Sdfs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Example')),
      body: Padding(
        padding: EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First column with three rows
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        DropdownButton<String>(
                          items: [
                            DropdownMenuItem(
                                value: 'Option 1', child: Text('Option 1')),
                            DropdownMenuItem(
                                value: 'Option 2', child: Text('Option 2')),
                            DropdownMenuItem(
                                value: 'Option 3', child: Text('Option 3')),
                          ],
                          onChanged: (selectedOption) {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        // Add your scrollable options here (e.g., DropdownButton, ListView.builder)
                        DropdownButton<String>(
                          items: [
                            DropdownMenuItem(
                                value: 'Option 1', child: Text('Option 1')),
                            DropdownMenuItem(
                                value: 'Option 2', child: Text('Option 2')),
                            DropdownMenuItem(
                                value: 'Option 3', child: Text('Option 3')),
                            // Add more options...
                          ],
                          onChanged: (selectedOption) {
                            // Handle option selection
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        // Add your scrollable options here (e.g., DropdownButton, ListView.builder)
                        DropdownButton<String>(
                          items: [
                            DropdownMenuItem(
                                value: 'Option 1', child: Text('Option 1')),
                            DropdownMenuItem(
                                value: 'Option 2', child: Text('Option 2')),
                            DropdownMenuItem(
                                value: 'Option 3', child: Text('Option 3')),
                            // Add more options...
                          ],
                          onChanged: (selectedOption) {
                            // Handle option selection
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 1.0), // Spacer between columns
            // Second column with scrollable options
            Expanded(
              child: ListView(
                children: [
                  // Add your scrollable options here (e.g., DropdownButton, ListView.builder)
                  DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                          value: 'Option 1', child: Text('Option 1')),
                      DropdownMenuItem(
                          value: 'Option 2', child: Text('Option 2')),
                      DropdownMenuItem(
                          value: 'Option 3', child: Text('Option 3')),
                      // Add more options...
                    ],
                    onChanged: (selectedOption) {
                      // Handle option selection
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//DropdownButton<String>(
              //   value: _currentlocation,
              //   onChanged: (value) {
              //     setState(() {
              //       _currentlocation = value;
              //     });
              //   },
              //   hint: const Center(
              //     child: Text(
              //       'Select the aniaml you love',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              //   dropdownColor: Colors.amber,
              //   icon: const Icon(
              //     Icons.fork_left_sharp,
              //     color: Colors.yellow,
              //   ),
              //   isExpanded: true,
              //   items: _locations
              //       .map(
              //         (e) => DropdownMenuItem(
              //           value: e,
              //           child: Container(
              //             alignment: Alignment.centerLeft,
              //             child: Text(
              //               e,
              //               style: const TextStyle(fontSize: 18),
              //             ),
              //           ),
              //         ),
              //       )
              //       .toList(),
              //   selectedItemBuilder: (BuildContext context) => _locations
              //       .map(
              //         (e) => Center(
              //           child: Text(
              //             e,
              //             style: const TextStyle(
              //               fontSize: 18,
              //               color: Colors.amber,
              //               fontStyle: FontStyle.italic,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),