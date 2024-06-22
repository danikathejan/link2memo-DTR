import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:link2note_demo/models/workspace_model.dart';
import 'package:intl/intl.dart';
import 'package:link2note_demo/widgets/app_bar.dart';

class Workspaces extends StatefulWidget {
  Workspaces({super.key});

  @override
  State<Workspaces> createState() => _WorkspacesState();
}

class _WorkspacesState extends State<Workspaces> {
  List<WorkspaceModel> workspaces = [];

  void _getWorkspaces() {
    workspaces = WorkspaceModel.getWorkspaces();
  }

  @override
  Widget build(BuildContext context) {
    _getWorkspaces();
    return Scaffold(
      appBar: const ApplicationBar(topic: 'Workspaces'),
      body: ListView(
        children: [
          const SizedBox(
              height: 10), // Add some spacing between text and button
          _addNewButton(),
          const SizedBox(height: 10),
          _workspaces(),
        ],
      ),
    );
  }

  ListView _workspaces() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 30,
      ),
      itemCount: workspaces.length,
      itemBuilder: (context, index) {
        WorkspaceModel workspace = workspaces[index];
        String formattedDate =
            DateFormat('yyyy-MM-dd').format(workspace.createdDate);
        return Container(
          height: 170,
          width: 50,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 251, 252, 255),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: Colors.black,
                width: 0.8,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workspaces[index].name,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 29, 27, 32),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      workspaces[index].owner,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 105, 105, 105),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 29, 27, 32),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  workspaces[index].description,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 29, 27, 32),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row _addNewButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: SizedBox(
            width: 130,
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 251, 252, 255),
                      title: const Text(
                        'Create New Workspaces',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromARGB(255, 29, 27, 32)),
                      ),
                      content: SizedBox(
                        width: 300,
                        height: 380,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 245, 249, 254),
                                hintText: 'Name of the workspace',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 105, 105, 105),
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 169, 169, 169),
                                    width: 1,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                            const SizedBox(height: 17),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 245, 249, 254),
                                hintText: 'Owner of the workspace',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 105, 105, 105),
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 169, 169, 169),
                                    width: 1,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                            SizedBox(height: 17),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 245, 249, 254),
                                hintText: 'Created date',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 105, 105, 105),
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 169, 169, 169),
                                    width: 1,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                            const SizedBox(height: 17),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 245, 249, 254),
                                hintText: 'Description',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 105, 105, 105),
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 169, 169, 169),
                                    width: 1,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 30.0, horizontal: 10.0),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    style: TextButton.styleFrom(
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 61, 151, 253))),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 29, 27, 32)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 100,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 61, 151, 253),
                                    ),
                                    child: const Text(
                                      'Create',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 245, 247, 253)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      // actions: <Widget>[
                      //   TextButton(
                      //     onPressed: () {
                      //       Navigator.of(context).pop(); // Close the dialog
                      //     },
                      //     child: Text('Cancel'),
                      //   ),
                      //   TextButton(
                      //     onPressed: () {
                      //       // Perform action when the button in the dialog is pressed
                      //       Navigator.of(context).pop(); // Close the dialog
                      //     },
                      //     child: Text('OK'),
                      //   ),
                      // ],
                    );
                  },
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 61, 151, 253),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Add New   '),
                  SvgPicture.asset('assets/icons/add.svg'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
