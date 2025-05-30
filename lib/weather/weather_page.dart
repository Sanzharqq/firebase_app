import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../theme_provider.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String city = "Almaty";
  double temperature = 0;
  double feelsLike = 0;
  int humidity = 0;
  double windSpeed = 0;
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();

  final String apiKey = "d291c3a81346237c097379a3b571acd0";

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    if (city.isEmpty) return;

    setState(() => isLoading = true);

    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric",
    );

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          temperature = data['main']['temp'].toDouble();
          feelsLike = data['main']['feels_like'].toDouble();
          humidity = data['main']['humidity'].toInt();
          windSpeed = data['wind']['speed'].toDouble();
          isLoading = false;
        });
      } else {
        final errorMessage = data['message'] ?? "City not found";
        setState(() => isLoading = false);
        showError(errorMessage);
      }
    } catch (e) {
      setState(() => isLoading = false);
      showError("Failed to fetch weather data");
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isSelected;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Weather"),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:
                MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
          ),
          child: IntrinsicHeight(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      isDarkMode
                          ? [Colors.grey.shade900, Colors.black]
                          : [Colors.lightBlue.shade200, Colors.blue.shade600],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter city name",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          final input = _controller.text.trim();
                          if (input.isEmpty) {
                            showError("Please enter a city name");
                            return;
                          }
                          setState(() {
                            city = input;
                          });
                          _controller.clear();
                          fetchWeather();
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (isLoading)
                    const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  else
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Icon(
                            isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                            size: 100,
                            color:
                                isDarkMode ? Colors.white : Colors.yellow[700],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "${temperature.toStringAsFixed(1)}° C",
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            city,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Divider(color: Colors.white, thickness: 1),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              WeatherTile(
                                icon: Icons.air,
                                label: "Wind",
                                value: "$windSpeed m/s",
                              ),
                              WeatherTile(
                                icon: Icons.water_drop,
                                label: "Humidity",
                                value: "$humidity%",
                              ),
                              WeatherTile(
                                icon: Icons.thermostat,
                                label: "Feels Like",
                                value: "${feelsLike.toStringAsFixed(1)}°",
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Text(
                            "Updated just now",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white)),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
