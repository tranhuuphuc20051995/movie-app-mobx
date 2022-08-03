## Getting Started - Movie App
The movie app - Flutter, Dart, MobX, Clean Architecture

1. How to contribute in this project?

- You need use flutter 2.10.4 (stable) to run this project.
- You can folk & create pull request to improve this project. I'm happy when you read & work
  together with me.

2. How to generate some class?

- In this project, I use the build_runner pub of flutter to generate some class.
- For example: movie_service(retrofit - dio), model response(JsonSerializable), controller(mobx
  store)
- You can use this command to generate code: ***flutter packages pub run build_runner build
  --delete-conflicting-outputs***

3. Libraries:

- GetIt - DI
- Mobx - State Management
- Dio - HTTP Request
- Dio Logger - HTTP Request Log
- Retrofit - Easy to create HTTP Request
- Json Annotation & Json Serializable - JSON serialization and deserialization
- Cached Network Image - Load & cached image from network
- Youtube Player - Play youtube video in app

4. Architecture: Clean Architecture (App - Presentation - Domain - Data)

***Current Version***

- App: Constant, DI, Route,
- Presentation: Page, Widget, Controller(MobX Store)
- Domain: Business Model(Entity), Request Parameter Model, UseCase, Abstract Repository.
- Data: Implementation Repository, API Response Model, Data Source(Local/Remote), API Service(
  Retrofit - Dio - Easy to create HTTP request).

***Next Version***

- App: Constant, DI, Route.
- Presentation: Page, Widget, Controller(MobX Store), UI Model, Converter(Convert Business Model to
  UI Model to decrease depend & effect when Business model change to UI Model)
- Domain: Business Model(Entity), Request Parameter Model, UseCase, Abstract Repository.
- Data: Implementation Repository, API Response Model, Data Source(Local/Remote), API Service(
  Retrofit - Dio - Easy to create HTTP request), Mapper(Map API Response Model to Business Model).

***Note***

- This is first time I use Mobx. 
- When I work in this project, I face with some issue when mix Mobx, GetIt, Clean Architecture. If
  you feel interesting with it, you can book the meeting with me. I will share more detail about my
  issue.
- Screen shot in images folder.
- Build apk debug for android in build_apk folder.

***Need to improve***

- Use api response model for all layer -> Need improve it to decrease dependency & effect when business change requirement.
- Use many build runner to generate code -> Make more time to wait for build runner work. May be it affect to coding & build time.
- Work without Pagination(Lazy loading on home page), Filter min/max year on home page, Handle for all device size,...
- Has issue when registerLazySingleton/registerFactory in GetIt. -> Need improve to use the Store same ViewModel in MVVM
- JsonSerializable very hard to custom. -> Some time, I miss when create model use JsonSerializable annotation: Miss JsonKey, null safety for properties...
- Work without Unit Test -> Need improve code quality by apply Unit Test.

