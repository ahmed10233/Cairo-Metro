
import 'package:metro/Api/api.dart';
import 'package:metro/Screens/AppHome/appHome_page.dart';
import 'package:metro/models/ticket_model.dart';



class BuyTicketService {
var context ;
final int price;
BuyTicketService( {required this.context, required this.price});
Future<TicketModel> buyTicket(
  {
     required TicketModel ticketModel
  }
)async{
 // debugPrint('Service: email ${logInModel} , pass $password');
  Map<String, dynamic> data =
  await Api().post(url: 'https://metro-app-shun.onrender.com/api/v1/ticket/BuyTicket/$price',
     context: context, 
     nextScreen: const AppHome()
   );
   return TicketModel.fromJson(data);
}


}

// class BuyTicketService {

// BuyTicketService();
// Future<TicketModel> user(
//   {
//      required TicketModel ticketModel
//   }
// )async{
 
//   Map<String, dynamic> data =
//   await Api().post(url: 'https://metro-app-shun.onrender.com/api/v1/user/getMyAccountBalance',
//     body:
//     jsonEncode (TicketModel.toJson()),
//      context: context, 
//      nextScreen: const AppHome()

//    );
//    return TicketModel.fromJson(data);
// }


// }