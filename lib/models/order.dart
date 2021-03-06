import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String id;
  String restaurantID;
  String userID;
  String status;
  String toLocation;
  int total;
  Timestamp orderedOn;
  Timestamp acceptedOn;
  List<String> menuIDs;
  List<int> menuQty;

  Order({this.id, this.restaurantID, this.userID, this.status, this.toLocation, this.total, this.orderedOn,
      this.acceptedOn, this.menuIDs, this.menuQty});

  Order.fromSnapshot(QuerySnapshot snapshot) {
    id = snapshot.documents[0].data['id'];
    restaurantID = snapshot.documents[0].data['restaurantID'];
    userID = snapshot.documents[0].data['userID'];
    status = snapshot.documents[0].data['status'];
    toLocation = snapshot.documents[0].data['toLocation'];
    total = snapshot.documents[0].data['total'];
    orderedOn = snapshot.documents[0].data['orderedOn'];
    acceptedOn = snapshot.documents[0].data['acceptedOn'];
    menuIDs = List.from(snapshot.documents[0].data['menuIDs']);
    menuQty = List.from(snapshot.documents[0].data['menuQty']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'restaurantID': restaurantID,
      'userID': userID,
      'status': status,
      'toLocation': toLocation,
      'total': total,
      'orderedOn': orderedOn,
      'acceptedOn': acceptedOn,
      'menuIDs': menuIDs,
      'menuQty': menuQty
    };
  }
}
