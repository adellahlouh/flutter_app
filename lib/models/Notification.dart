class Notification{


  String id ;
  String title ;
  String imageUrl ;
  String body ;
  dynamic time;

  Notification();


  factory Notification.getFromSnapshot(Map data){

    Notification notification = Notification();

    notification.id = data['id'];
    notification.title = data['title'];
    notification.imageUrl = data['imageUrl'] ?? "";
    notification.body = data['body'];
    notification.time = data['time'];


    return notification;
  }



}