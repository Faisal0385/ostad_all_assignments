import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool inProgress = false;
  bool dataError = false;
  List data = [];
  var _iconUrl = "";
  var temperature;
  var temp_max;
  var temp_min;

  @override
  void initState() {
    super.initState();

    /// call the api
    getWeatherData();
  }

  void getWeatherData() async {
    inProgress = true;
    setState(() {});

    /// sending req to the api
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=22.356852&lon=91.783180&appid=214762de3ae903c8d94aec011a7e994f'));
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (decodedResponse["cod"] == 200) {
      data.add(decodedResponse);
    } else {
      dataError = true;
      inProgress = false;
      setState(() {});
    }
    _iconUrl = data[0]["weather"][0]["icon"];
    temperature = (data[0]["main"]["temp"] - 273).toInt();
    temp_max = (data[0]["main"]["temp_max"] - 273).toInt();
    temp_min = (data[0]["main"]["temp_min"] - 273).toInt();
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: const Text("Flutter Weather App"),
        centerTitle: true,
      ),
      body: inProgress
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            )
          : Center(
              /// The app should display an error message if there is a problem fetching the weather data.
              child: dataError
                  ? const Text(
                      "Something Went Wrong!!,\n Pls Put Valid API Link.",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data[0]["name"],
                          style: const TextStyle(
                              fontSize: 32, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          //
                          "Updated At: ${DateFormat.jm().format(DateTime.now())} ",
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Long: ${data[0]['coord']['lon']}",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Lat:  ${data[0]['coord']['lat']}",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                "https://openweathermap.org/img/w/$_iconUrl.png",
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) {
                                  return const Icon(
                                    Icons.image,
                                    size: 32,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 30),
                            Text(
                              "$temperature°",
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 30),
                            Column(
                              children: [
                                Text(
                                  "Max: $temp_max°",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Min: $temp_min°",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          data[0]["weather"][0]["description"].toUpperCase(),
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
            ),
    );
  }
}
