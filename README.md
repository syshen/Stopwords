## Swift Stopwords Module

Stopwords module is written in Swift for both iOS and Mac

- All the stop words are from http://alir3z4.github.io/stop-words/

## Install
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with Homebrew using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Stopwords into your Xcode project using Carthage, specify it in your Cartfile:

```ogdl
github "syshen/Stopwords"
```

Run `carthage update` to build the framework and drag the built `Stopwords.framework` (in `Carthage/Build/iOS` folder) into your Xcode project (Embedded Binaries and Libraries in `Targets`).

## Usage

Get the stopwords by language
```Swift
let stopwords = Stopwords.get("english")
```

Check if a word is a stop word in the specified language
```Swift
let enStop = Stopwords("english")
if enStop["the"] {
    print("'the' is a stop word in English")
}
```


