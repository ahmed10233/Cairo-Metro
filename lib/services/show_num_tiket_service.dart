

import 'package:metro/Api/api.dart';
import 'package:metro/models/show_num_ticket_model.dart';

class ShowNumOFTicketsService {

ShowNumOFTicketsService();
Future<ShowNumOFTicketModel> showTiket(
  {
     required ShowNumOFTicketModel tickeModel
  }
)async{
 
  Map<String, dynamic> data =
  await Api().get2(url: 'https://metro-app-shun.onrender.com/api/v1/ticket/showNumOfTickets',

   );
   return ShowNumOFTicketModel.fromJson(data);
}


}