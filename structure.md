homepage in homepage.dart
define clock in clock_view.dart file

```dart
    class ClockPainter extends CustomPainter
        override paint() and shouldRepaint() methods
        drawCircle(center, radius, brush)
        // second: 60 sec = deg360 -> 1 sec = deg6
        // minute: 60 min = deg360 -> 1 min = deg6
        // hour: 12hr = deg360 -> 1 hr = deg30 :: deg0.5 in 1 min
```