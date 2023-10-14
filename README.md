<h1 align="center">
  Splacher
</h1>

<h2 align="center"> This is a sample flutter onboarding plugin you use to attract first-time users when they land on your page, hence the name Splacher. You can implement this widget anywhere you want in your app, by managing its top-level state to show the widget to users at the appropriate time. There are also many parameters that enable you to design this widget to your liking.</h2>

<p align="center">Show some ❤️ and <a href="https://github.com/abdalla3yash/splacher">star the repo</a> to support the project!</p>

<img src="https://github.com/abdalla3yash/splacher/blob/main/data/demo.gif?raw=true" width=250>

<!-- ![Image](https://github.com/abdalla3yash/splacher/blob/main/data/demo.gif?raw=true) -->

<p align="center">
  <a href="https://pub.dev/packages/splacher"><img src="https://img.shields.io/pub/v/splacher.svg" alt="Pub"></a>
  <a href="https://github.com/abdalla3yash/splacher"><img src="https://img.shields.io/github/stars/abdalla3yash/drag_widgets.svg?style=flat&logo=github&label=stars" alt="Star on Github"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/abdalla3yash/splacher"><img src="https://hits.dwyl.com/abdalla3yash/splacher.svg?style=flat" alt="Repository views"></a>
</p>



## Getting started
Follow these steps to use this package


### Add dependency

```yaml
dependencies:
  splacher:
```

### Add import package


```dart
import 'package:splacher/splacher.dart';
```

## Easy to use
The package is designed with maximum adaptation to All screens.<br>
Therefore, adding a widget to your screen will be very simple.
```dart
    Scaffold(
        body: Splacher(
            pages: <Widget>[
                Container(
                    color: const Color(0xff7fc8c0),
                    child: Center(child: Image.asset("assets/img3.png", fit: BoxFit.fitWidth))),
                Container(
                    color: const Color(0xfff0846a),
                    child: Center(child: Image.asset("assets/img2.jpg", fit: BoxFit.fitWidth))),
            ],
            activeColor: Colors.white, // optional
            inActiveColor: Colors.white70, // optional
            backgroundColor: , // optional
            buttonDirection: , // optional
            doneTitle: , // optional
            nextTitle: , // optional
            skipTitle: , // optional
            onIntroCompleted: () {
                Navigator.of(context).pushReplacementNamed('/to_go');
            },
        ),
    );
```


## Additional information
The project is under development and ready for your pull-requests and issues 👍<br>
Thank you for support ❤️
