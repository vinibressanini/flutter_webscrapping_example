# Flutter Webscrapping Example

## Description 

For that example I used Globo's website (https://g1.globo.com). All I need to do was specify the url that I want to scrap then load it with Chaleno. Once I had access to the website I just need to specify what data Chaleno need to find, in that case I was searching for the news cards on the main page.


![image](https://github.com/vinibressanini/flutter_webscrapping_example/assets/91560062/ee5dd96d-cbc4-42eb-bd3d-1298dc43b0b7)


To retrieve that data I opened the page HTML and find the element that I need, then, I get the class name and passed it to Cheleno so it will return a list of all the elements with that class name.

![image](https://github.com/vinibressanini/flutter_webscrapping_example/assets/91560062/f3618c0c-4d99-4f9a-9e62-6d85eaef7ce1)


Once I had all the data that I need, I just used a ListView.builder to build all that cards in my app.

## How to Run

- Clone the repository
- run flutter pub get on terminal
- run the app

## Technologies

- Flutter 3.3.4
- Dart 2.18.2
- Url Launcher 6.1.6 (Used to access all news content)
   - To use that version of Url Launcher you'll need kotlin gradle plugin > 1.8.0 and for that you'll also need an SDK version 33
- Chaleno 0.0.6 (Used for webscrapping)

https://github.com/vinibressanini/flutter_webscrapping_example/assets/91560062/ef299a54-bd2d-4dee-b32e-2bc9b36b89cf

