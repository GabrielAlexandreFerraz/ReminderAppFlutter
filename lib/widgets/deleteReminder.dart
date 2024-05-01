import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> deleteReminder(BuildContext context, String id, String uid) async {
  try {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("reminder")
        .doc(id)
        .delete();
    Fluttertoast.showToast(msg: "Reminder Deleted");
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}

deleteReminderDialog(BuildContext context, String id, String uid) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        title: Text("Delete Reminder"),
        content: Text("Are you sure you want to delete?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              deleteReminder(context, id, uid);
              Navigator.of(context).pop(); // Fecha o diálogo após a exclusão
            },
            child: Text("Delete"),
          ),
        ],
      );
    },
  );
}
