import 'package:metro/Api/api.dart';
import 'package:metro/models/get_ticket_model.dart';

class GetTicketService{
final int price;
GetTicketService({required this.price});
Future<GetTicketModel> getTicket(
  {

  required GetTicketModel getTiketmodel
  }


)async{
    Map<String, dynamic> data =
  await Api().get3(url: 'https://metro-app-shun.onrender.com/api/v1/ticket/getATicket/$price',

   );
   return GetTicketModel.fromJson(data);
}


}