import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTicketWidget extends StatefulWidget {
    MyTicketWidget({
    Key? key,
    required this.color,
    required this.textColor,
    required this.ticketName,
    this.customOnPressed,
    required this.availableTicket, 
    required this.price,
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final String ticketName;
  final int availableTicket;
  final int price;

   dynamic customOnPressed;

  @override
  State<MyTicketWidget> createState() => _MyTicketWidgetState();
}

class _MyTicketWidgetState extends State<MyTicketWidget> {
   Widget? page;

  int ticketPrice = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 350,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  topLeft: Radius.circular(28),
                ),
              ),
              width: 26,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.ticketName} Ticket',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
              
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton( 
                  
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(160, 35),
                    backgroundColor: widget.color,
                  ),
                  onPressed: widget.customOnPressed,
                  child: Text(
                    'Use Ticket ',
                    style: TextStyle(
                      color: widget.textColor,
                      fontSize:16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              width: 117,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'You have',
                    style: TextStyle(
                        color: widget.textColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 25),
                  ),
                  Text(
                  "${widget.availableTicket}",
                    style: TextStyle(
                        color: widget.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                  Text(
                    'Tickets',
                    style: TextStyle(
                        color: widget.textColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
