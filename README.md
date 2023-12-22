# Tectone23 Test App

The app has basic login and signup screens, a balance card at the top of the wallet screen, transactions list, make a new transaction screen, and receive money pop.

- The project is configured with mock data.
- Used firebase auth for Email and password signIn/signUp ( i havent saved the userID in the shared preferences or locale cache, so each time you need to make a login before being able to go to home page ).
- Used Cubit for State management [Docs here](https://bloclibrary.dev/#/).
- Implemented Validators for text fields.
- Dependency Injection.
- Firebase auth errors handling.
- App routing using [go_router](https://pub.dev/packages/go_router).
- Logging using [Loggy](https://pub.dev/packages/loggy).
  
## 🛠️ Installation Steps

1. Open Terminal and Clone the Repo

```
git clone https://github.com/Djihanegh/tectone23_test.git
```

2. Then install the package dependencies with 

```
flutter pub get
```

3. Open an android emulator ( for the moment i have added only android app in firebase ) 

```
  Happy Coding !!
```



##  Screenshots :camera:

![Screenshot 2023-12-22 at 7 32 16?PM](https://github.com/Djihanegh/tectone23_test/assets/40029149/9bdbb946-c2d0-4c5a-aff7-dd6a77a942e9)
![Screenshot 2023-12-22 at 7 32 06?PM](https://github.com/Djihanegh/tectone23_test/assets/40029149/b0ffcd9e-043c-4d76-b6e8-6179b6aca7f3)
![Screenshot 2023-12-22 at 7 31 53?PM](https://github.com/Djihanegh/tectone23_test/assets/40029149/5b7bf21a-aa82-4e0f-b5e7-678604a4c8c9)



## How to Contribute

1. Fork the the project
2. Create your feature branch (git checkout -b my-new-feature)
3. Make required changes and commit (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
