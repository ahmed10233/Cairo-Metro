import 'package:flutter/material.dart';



class BuyTicket extends StatefulWidget {
  const BuyTicket({
    Key? key,
    required this.color,
    required this.textColor,
    required this.ticketName,
    required this.stationsNumber,
    required this.price,
    required this.onPressed
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final String ticketName;
  final String stationsNumber;
  final int price;
  final VoidCallback onPressed;

  @override
  State<BuyTicket> createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 201, 200, 200).withOpacity(0.5),
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
                height: 8,
              ),
              Text(
                'Price: ${widget.price} EGP',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fixedSize: const Size(120, 35),
                  backgroundColor: widget.color,
                ),
                onPressed:widget.onPressed,
                child: Text(
                  'Buy',
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 22,
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
                  'Up to',
                  style: TextStyle(
                      color: widget.textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 25),
                ),
                Text(
                  widget.stationsNumber,
                  style: TextStyle(
                      color: widget.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
                Text(
                  'stations',
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
    );
  }
}
