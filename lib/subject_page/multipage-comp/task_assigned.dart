import "package:flutter/material.dart";
import "package:intl/intl.dart";

import '../../models/test.dart';
import "../tests_comp/tests_modal.dart";

class TaskAssigned extends StatelessWidget {
  final List<Test> completedTasks;

  TaskAssigned(this.completedTasks);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 700,
        width: 10,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Stack(children: [
              GestureDetector(
                onTap: () => Navigator.of(ctx).pushNamed(TestsModal.routeName,
                    arguments: completedTasks[index].testId),
                child: Container(
                  height: 75,
                  alignment: Alignment.centerLeft,
                  width: 400,
                  padding: const EdgeInsets.only(left: 20),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    width: 225,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(completedTasks[index].testName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(DateFormat.yMMMMd()
                            .format(completedTasks[index].date)),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 25,
                bottom: 22,
                child: Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 30),
                    padding: const EdgeInsets.only(bottom: 10, top: 15),
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                width: 3, color: Colors.grey.shade400))),
                    child: Text(
                      completedTasks[index].gate,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ]);
          },
          itemCount: completedTasks.length,
        ),
      ),
    );
  }
}
