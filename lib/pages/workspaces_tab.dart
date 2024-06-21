import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:link2note_demo/models/workspace_model.dart';
import 'package:intl/intl.dart';

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
      appBar: _appBar(),
      body: ListView(
          children: [
            SizedBox(height: 10), // Add some spacing between text and button
            _addNewButton(),
            SizedBox(height: 10),
            _workspaces(),
          ],
        ),
    );
  }

  ListView _workspaces() {
    return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            separatorBuilder: (context, index) => SizedBox(height: 30,),
            itemCount: workspaces.length,
            itemBuilder: (context, index) {
              WorkspaceModel workspace = workspaces[index];
              String formattedDate = DateFormat('yyyy-MM-dd').format(workspace.createdDate);
              return Container(
                height: 170,
                width: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 251, 252, 255),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: Colors.black,
                    width: 0.8,
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workspaces[index].name,
                        style: TextStyle(
                          color: Color.fromARGB(255, 29, 27, 32),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 9,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            workspaces[index].owner,
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 105, 105),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            formattedDate,
                            style: TextStyle(
                              color: Color.fromARGB(255, 29, 27, 32),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      Text(
                        workspaces[index].description,
                        style: TextStyle(
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
              Spacer(),
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
                            backgroundColor: Color.fromARGB(255, 251, 252, 255),
                            title: Text('Create New Workspaces',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color.fromARGB(255, 29, 27, 32)
                            ),),
                            content: Container(
                              width: 300, 
                              height: 380, 
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromARGB(255, 245, 249, 254),
                                      hintText: 'Name of the workspace',
                                      hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 105, 105, 105),
                                        fontSize: 14,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255, 169, 169, 169),
                                          width: 1,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromARGB(255, 245, 249, 254),
                                      hintText: 'Owner of the workspace',
                                      hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 105, 105, 105),
                                        fontSize: 14,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255, 169, 169, 169),
                                          width: 1,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromARGB(255, 245, 249, 254),
                                      hintText: 'Created date',
                                      hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 105, 105, 105),
                                        fontSize: 14,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255, 169, 169, 169),
                                          width: 1,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromARGB(255, 245, 249, 254),
                                      hintText: 'Description',
                                      hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 105, 105, 105),
                                        fontSize: 14,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255, 169, 169, 169),
                                          width: 1,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close the dialog
                                          },
                                          style: TextButton.styleFrom(
                                            side: BorderSide(
                                              color: Color.fromARGB(255, 61, 151, 253)
                                            )
                                          ),
                                          child: Text('Cancel',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 29, 27, 32)
                                          ),),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        width: 100,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close the dialog
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: Color.fromARGB(255, 61, 151, 253),
                                          ),
                                          child: Text('Create',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 245, 247, 253)
                                          ),),
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
                      backgroundColor: Color.fromARGB(255, 61, 151, 253), 
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add New   '),
                        SvgPicture.asset(
                          'assets/icons/add.svg'
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              ],
          );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(180.0), // Increase app bar height
      child: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        flexibleSpace: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/appbar.png', 
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 75.0),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0), // Adjust the top padding as needed
                    child: Text(
                      'Workspaces',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 33.0),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff1D1617).withOpacity(0.11),
                          blurRadius: 40,
                          spreadRadius: 0.0,
                        )
                      ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 253, 251, 251), 
                        hintText: 'Search here...',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 105, 105, 105),
                          fontSize: 14,
                        ),
                        contentPadding: EdgeInsets.all(15),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SvgPicture.asset('assets/icons/magnifier.svg'),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide.none
                        )
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            // Handle back button tap
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/ArrowBack.svg',
              height: 20.62,
              width: 12.16,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15), // Adjust this value to move buttons to the right
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle bell icon tap
                  },
                  child: Container(
                    margin: EdgeInsets.all(0),
                    alignment: Alignment.center,
                    width: 37,
                    child: SvgPicture.asset(
                      'assets/icons/bell.svg',
                      height: 25,
                      width: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle settings icon tap
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0), // Maintain the reduced horizontal margin
                    alignment: Alignment.center,
                    width: 37,
                    child: SvgPicture.asset(
                      'assets/icons/settings.svg',
                      height: 25,
                      width: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}

