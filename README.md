# bfxqa-robotframework
## Robot Framework Installation - MACOS

- Python 3.9

```bash
brew install python@3.9
```

- Robot Framework

```bash
pip3 install robotframework==3.2.2
```

- Appium Library

```bash
pip3 install robotframework-appiumlibrary
```

- Request Library

```bash
pip3 install robotframework-requests==0.7.2
```

## Install Appium server

- Install Node

```bash
brew install node
```

- Appium Desktop

```bash
brew install --cask appium
```

- Appium Doctor (Check APPIUM INSTALLATION PROGRESS)

```bash
npm install appium-doctor -g
```

- Install JAVA

```bash
brew install --cask adoptopenjdk8
```

- [Set JAVA_HOME](https://www.baeldung.com/java-home-on-windows-7-8-10-mac-os-x-linux)


- Install ANDROID STUDIO (ANDROID EMULATOR)

```bash
brew install --cask android-studio
```

## Dependencies

- Install IMAGES comparasion

```bash
brew install imagemagick
```

- Google Authenticator

```bash
pip3 install google-auth
```

## Check APPIUM INSTALLATION status
- Open command line & check if there is no error

```bash
appium-doctor
```

## Steps to run MOBILE test

- Open APPIUM DESKTOP application

![Screen Shot 2021-06-04 at 16 34 48](https://user-images.githubusercontent.com/23648562/120782963-bfc1b580-c554-11eb-8669-c586762bc1c6.png)

- Start server

![Screen Shot 2021-06-04 at 16 49 55](https://user-images.githubusercontent.com/23648562/120783135-eaac0980-c554-11eb-9052-466546d79a9f.png)

- Open Android Simulator

<img width="889" alt="Screen Shot 2021-06-04 at 16 55 55" src="https://user-images.githubusercontent.com/23648562/120783956-c1d84400-c555-11eb-8859-b9c4f56db756.png">


<img width="376" alt="Screen Shot 2021-06-04 at 16 57 02" src="https://user-images.githubusercontent.com/23648562/120784120-f2b87900-c555-11eb-9363-054aaef033f9.png">

<img width="2032" alt="Screen Shot 2021-06-04 at 16 57 16" src="https://user-images.githubusercontent.com/23648562/120784175-02d05880-c556-11eb-9f4d-e23eaa9655be.png">

- Prepare APK or IPA or APP

```bash
1. The folder "app-path" needs to be created in the checkout directory
2. Copy APK or IPA or APP file into that folder, and change name to "Bitfinex." (Example: "Bitfinex.apk")

```

- For WINDOWS user

```bash
The environment variable ANDROID_SDK_ROOT needs to be set (e.g. C:\Users\{user}\AppData\Local\Android\Sdk)
```

- Open terminal

```bash
robot -v ENV:staging -v OS:ANDROID -v DEVICE:NEXUS_5_ANDROID_11 --loglevel TRACE --outputdir /Users/vuongvietvan/robotreport -t login_logout_test {PATH TO REPOSITORY}

-v: define variable
--loglevel: define log level
--outputdir: output directory for the report
-t: test case's name
{PATH TO REPORSITORY}: Absolute path to the repository
```

## Steps to run API test
```bash
robot -v ENV:staging --loglevel TRACE --outputdir /Users/vuongvietvan/robotreport -t authenticated_api_test {PATH TO REPOSITORY}
```