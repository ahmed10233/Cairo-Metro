import 'package:flutter/material.dart';
import 'package:metro/Screens/Buy_Ticket_Screen/buyingTicket1_page.dart';


class BuyYourTicket extends StatelessWidget {
  const BuyYourTicket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BuyingTicket1()),
        );
      },
      child:Container(
       
        decoration: BoxDecoration(
           color: const Color(0xffFFFF99),
          border: Border.all(width: 4, color: const Color.fromARGB(255, 34, 34, 34)),
          borderRadius: BorderRadius.circular(25),
        ),
        child:  const Card(
        
        elevation: 0,
          color: Color(0xffFFFF99),
        child: SizedBox(
          width: 350,
          height: 140,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Text(
                      'Buy your',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '  ticket now',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Image(
                image: AssetImage('assets/images/Home/ticket.png'),
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
