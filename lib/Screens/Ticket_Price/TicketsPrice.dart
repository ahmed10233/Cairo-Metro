import 'package:flutter/material.dart';
import 'package:metro/widgets/backIcon.dart';

class TicketsPrice extends StatefulWidget {
  const TicketsPrice({Key? key}) : super(key: key);

  @override
  State<TicketsPrice> createState() => _TicketsPriceState();
}

class _TicketsPriceState extends State<TicketsPrice> {
  String? startStation;
  String? endStation;
  int? startStationn;
  int? endStationn;
  int? numOfStations;
  int? ticketPrice;

  bool showPrice = false;
  final Map<String, int> line1 = {
    'Helwan': 1,
    'Ain Helwan': 2,
    'Helwan University': 3,
    'Wadi Hof': 4,
    'Hadayek Helwan': 5,
    'El-Maasara': 6,
    'Tora El-Asmant': 7,
    'Kozzika': 8,
    'Tora El-Balad': 9,
    'Sakanat El-Maadi': 10,
    'Maadi': 11,
    'Hadayek El-Maadi': 12,
    'Dar El-Salam': 13,
    'El-Zahraa': 14,
    'Mar Girgis': 15,
    'El-Malek El-Saleh': 16,
    'Al-Sayeda Zeinab': 17,
    'Saad Zaghloul': 18,
    'Sadat': 19,
    'Nasser': 20,
    'Orabi': 21,
    'Al-Shohadaa': 22,
    'Ghamra': 23,
    'El-Demerdash': 24,
    'Manshiet El-Sadr': 25,
    'Kobri El-Qobba': 26,
    'Hammamat El-Qobba': 27,
    'Saray El-Qobba': 28,
    'Hadayeq El-Zaitoun': 29,
    'Helmeyet El-Zaitoun': 30,
    'El-Matareyya': 31,
    'Ain Shams': 32,
    'Ezbet El-Nakhl': 33,
    'El-Marg': 34,
    'New El-Marg': 35,
  };

  // Define the map
  final Map<String, int> line2 = {
    'el-mounib': 10,
    'sakiat mekky': 11,
    'omm el-masryeen': 12,
    'el giza': 13,
    'faisal': 14,
    'cairo university': 15,
    'el bohoth': 16,
    'dokki': 17,
    'opera': 18,
    'mohamed naguib': 20,
    'attaba': 21,
    'masarra': 23,
    'road rl-farag': 24,
    'st-teresa': 25,
    'khalafawy': 26,
    'mezallat': 27,
    'kolleyyet el-zeraa': 28,
    'shubra el-kheima': 29,
  };

  void showSameLineDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffE5F6FE),
            borderRadius: BorderRadius.circular(7),
          ),
          height: 80,
          child: const Center(
            child: Column(
              children: [
                Text(
                  'You choose stations in different lines',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSameStationDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffE5F6FE),
            borderRadius: BorderRadius.circular(7),
          ),
          height: 80,
          child: const Center(
            child: Column(
              children: [
                Text(
                  'You can\'t choose the same station',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '❌❌',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showPriceDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        child: Container(
          height: 170,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xffE5F6FE),
          ),
          child: Column(
            children: [
              const Text(
                'Trip information:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              const Divider(
                endIndent: 30,
                indent: 30,
                color: Colors.black,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Price                   ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 21,
                          ),
                        ),
                        Text(
                          'Stations number',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${ticketPrice ?? ''}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 21,
                              ),
                            ),
                            const Text(
                              ' EGP',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 21,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '${numOfStations ?? ''}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 21,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Icon(
                              Icons.train_rounded,
                              size: 30,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calculatePrice() {
    if (startStation != null &&
        endStation != null &&
        startStation != endStation) {
      setState(() {
        bool startInLine1 = line1.containsKey(startStation!);
        bool endInLine1 = line1.containsKey(endStation!);
        bool startInLine2 = line2.containsKey(startStation!);
        bool endInLine2 = line2.containsKey(endStation!);

        if ((startInLine1 && endInLine1) || (startInLine2 && endInLine2)) {
          // Both stations are in the same line
          calculateSameLinePrice(startInLine1, endInLine1);
        } else {
          // Stations are in different lines
          calculateDifferentLinePrice(
              startInLine1, endInLine1, startInLine2, endInLine2);
        }
      });
    } else if (startStation == endStation) {
      showSameStationDialog();
    }
  }

  void calculateSameLinePrice(bool startInLine1, bool endInLine1) {
    int startStationIndex =
        startInLine1 ? line1[startStation!]! : line2[startStation!]!;
    int endStationIndex =
        endInLine1 ? line1[endStation!]! : line2[endStation!]!;

    numOfStations = (endStationIndex - startStationIndex).abs() + 1;
    setTicketPrice();
    showPriceDialog();
  }

  void calculateDifferentLinePrice(
      bool startInLine1, bool endInLine1, bool startInLine2, bool endInLine2) {
    bool isStartInFirstSection =
        (startInLine1 && line1[startStation!]! <= 19) ||
            (startInLine2 && line2[startStation!]! <= 19);
    bool isEndInFirstSection = (endInLine1 && line1[endStation!]! <= 19) ||
        (endInLine2 && line2[endStation!]! <= 19);

    bool isStartInMiddleSectionLine2 = (startInLine1 &&
        line1[startStation!]! > 19 &&
        line1[startStation!]! < 22);
    bool isEndInMiddleSectionLine1 =
        (endInLine1 && line1[endStation!]! > 19 && line1[endStation!]! < 22);
    bool isStartInMiddleSectionline2 = (startInLine2 &&
        line2[startStation!]! > 19 &&
        line2[startStation!]! < 22);
    bool isEndInMiddleSectionline2 =
        (endInLine2 && line2[endStation!]! > 19 && line2[endStation!]! < 22);

    bool isStartInLastSection = (startInLine1 && line1[startStation!]! >= 22) ||
        (startInLine2 && line2[startStation!]! >= 22);
    bool isEndInLastSection = (endInLine1 && line1[endStation!]! >= 22) ||
        (endInLine2 && line2[endStation!]! >= 22);

    if (isStartInFirstSection && isEndInFirstSection) {
      // Calculate the number of stations for stations less than or equal to 19
      calculateSectionPrice(19, 19, startInLine1, endInLine1);
    } else if (isStartInMiddleSectionline2 || isEndInMiddleSectionline2) {
      // Calculate the number of stations for stations between 19 and 22 in lin1 (ataba,nagib)
      calculateMiddleSectionPriceLine1(startInLine1, endInLine1);
    } else if (isStartInMiddleSectionLine2 || isEndInMiddleSectionLine1) {
      // Calculate the number of stations for stations between 19 and 22
      calculateMiddleSectionPriceLine2(startInLine1, endInLine1);
    } else if (isStartInLastSection && isEndInLastSection) {
      // Calculate the number of stations for stations greater than or equal to 22
      calculateSectionPrice(22, 22, startInLine1, endInLine1);
    } else {
      // Calculate the number of stations for mixed sections
      calculateMixedSectionPrice(startInLine1, endInLine1);
    }
  }

  void calculateSectionPrice(
      int startBase, int endBase, bool startInLine1, bool endInLine1) {
    int startStationIndex = startInLine1
        ? (startBase - line1[startStation]!).abs()
        : (startBase - line2[startStation]!).abs();
    int endStationIndex = endInLine1
        ? (endBase - line1[endStation]!).abs()
        : (endBase - line2[endStation]!).abs();

    numOfStations = startStationIndex + endStationIndex + 1;
    setTicketPrice();
    showPriceDialog();
  }

  void calculateMiddleSectionPriceLine2(bool startInLine1, bool endInLine1) {
    int startStationIndex = startInLine1
        ? (19 - line1[startStation]!).abs()
        : (19 - line2[startStation]!).abs();
    int endStationIndex = endInLine1
        ? (19 - line1[endStation]!).abs()
        : (19 - line2[endStation]!).abs();

    numOfStations = startStationIndex + endStationIndex + 1;
    setTicketPrice();
    showPriceDialog();
  }

  void calculateMiddleSectionPriceLine1(bool startInLine1, bool endInLine1) {
    int startStationIndex = startInLine1
        ? (22 - line1[startStation]!).abs()
        : (22 - line2[startStation]!).abs();
    int endStationIndex = endInLine1
        ? (22 - line1[endStation]!).abs()
        : (22 - line2[endStation]!).abs();

    numOfStations = startStationIndex + endStationIndex + 1;
    setTicketPrice();
    showPriceDialog();
  }

  void calculateMixedSectionPrice(bool startInLine1, bool endInLine1) {
    int startStationIndex = startInLine1
        ? (line1[startStation]! - 22).abs()
        : (line2[startStation]! - 22).abs();
    int endStationIndex = endInLine1
        ? (line1[endStation]! - 22).abs()
        : (line2[endStation]! - 22).abs();

    numOfStations = startStationIndex + endStationIndex + 1;
    setTicketPrice();
    showPriceDialog();
  }

  void setTicketPrice() {
    if (numOfStations! <= 9) {
      ticketPrice = 6;
    } else if (numOfStations! > 9 && numOfStations! <= 16) {
      ticketPrice = 8;
    } else {
      ticketPrice = 12;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          const backIcon(),
          const SizedBox(
            height: 70,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffF5F5F5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            height: 320,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Text(
                    'Ticket price?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 330,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      // Adjust the radius according to your preference
                      border: Border.all(
                          color: const Color(
                              0xffD6D6D6)), // Adjust the border color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text('From'),
                        value: startStation,
                        onChanged: (String? newValue) {
                          setState(() {
                            startStation = newValue;
                            // Save the value of the selected station
                          });
                        },
                        items: [...line1.keys, ...line2.keys]
                            .map((String station) {
                          return DropdownMenuItem<String>(
                            value: station,
                            child: Text(station),
                          );
                        }).toList(),
                        borderRadius: BorderRadius.circular(5),
                        dropdownColor: Colors.white,
                        underline: Container(),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 330,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      // Adjust the radius according to your preference
                      border: Border.all(
                          color: const Color(
                              0xffD6D6D6)), // Adjust the border color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text('To'),
                        value: endStation,
                        onChanged: (String? newValue) {
                          setState(() {
                            endStation = newValue;
                            // Save the value of the selected station
                          });
                        },
                        items: [...line1.keys, ...line2.keys]
                            .map((String station) {
                          return DropdownMenuItem<String>(
                            value: station,
                            child: Text(station),
                          );
                        }).toList(),
                        borderRadius: BorderRadius.circular(5),
                        dropdownColor: Colors.white,
                        underline: Container(),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors
                                .grey; // Button is disabled, return gray color
                          }
                          return const Color(
                              0xff4280EF); // Button is enabled, return the original color
                        },
                      ),
                    ),
                    onPressed: (startStation != null && endStation != null)
                        ? calculatePrice
                        : null,
                    child: const Text(
                      'Show price',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
