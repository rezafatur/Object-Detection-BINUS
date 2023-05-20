class SensorDataDummy {
  final String sensor;
  final String time;

  SensorDataDummy({
    required this.sensor,
    required this.time,
  });
}

List<SensorDataDummy> SensorContents = [
  SensorDataDummy(
    sensor: "Sensor #123",
    time: "01:23",
  ),
  SensorDataDummy(
    sensor: "Sensor #234",
    time: "02:34",
  ),
  SensorDataDummy(
    sensor: "Sensor #345",
    time: "03:45",
  ),
  SensorDataDummy(
    sensor: "Sensor #567",
    time: "05:06",
  ),
  SensorDataDummy(
    sensor: "Sensor #678",
    time: "06:07",
  ),
];
