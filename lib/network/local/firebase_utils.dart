import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/models/task_data_model.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection("Tasks").withConverter(
        fromFirestore: (snapshot, options) => Task.fromJSON(snapshot.data()!),
        toFirestore: (task, options) => task.toJSON(),
      );
}

Future<void> addTaskToFirebase(Task task) {
  //FirebaseFirestore.instance.collection("Tasks").add()
  var collection = getTaskCollection(); // to get the collection
  var docRef = collection.doc(); //add a doc the collection with auto ID
  task.id = docRef.id; // set the task obj ID as the Doc
  return docRef
      .set(task); // set other task obj date to the Doc im already created
}

Stream<QuerySnapshot<Task>> getTasksFromFireStore(DateTime selectedDate) {
  return getTaskCollection().where("date", isEqualTo: selectedDate).snapshots();
}

Future<void> deleteTaskFromFirestore(String id) {
  return getTaskCollection().doc(id).delete();
}


// void addTaskUsingModel() {
//   FirebaseFirestore.instance.collection("Tasks").withConverter<Task>(
//     fromFirestore: (snapshot, options) => Task.fromJSON(snapshot.data()!),
//     toFirestore: (task, options) => task.toJSON(),).add(data)
// }
