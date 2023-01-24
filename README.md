# Kankban

A new Flutter project called kanban

## Documentaion
Used Arch 
    - MVVM
    - Repository Pattern
    - DI
Folder Arch
    -base
    -core
        -di
        -extension
        -network
        -ui_kit
    -helper
    -model
    -repository
    -service
        -base
        -service
    -view
        -tasks
        -onboarding
    -view_model
        -tasks
        -onboarding
    main.dart
    main_dev.dart
    main_prod.dart

## CI/CD

What is fastlane? 

Fastlane is the easiest way to automate beta deployments and releases for your iOS and Android apps. 🚀 It handles all tedious tasks, like generating screenshots, dealing with code signing, and releasing your application.

Getting Started

Installing fastlane

fastlane can be installed in multiple ways. The preferred method is with Bundler. fastlane can also be installed directly through with Homebrew (if on macOS). It is possible to use macOS's system Ruby, but it's not recommended, as it can be hard to manage dependencies, and causes conflicts.

Managed Ruby environment + Bundler (macOS/Linux/Windows)

Ruby

If you use macOS, system Ruby is not recommended. There is a variety of ways to install Ruby without having to modify your system environment. For macOS and Linux, rbenv is one of the most popular ways to manage your Ruby environment.

fastlane supports Ruby versions 2.5 or newer. Verify which Ruby version you're using:

$ ruby --version 

ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin19]

Bundler

It is recommended that you use Bundler and Gemfile to define your dependency on fastlane. This will clearly define the fastlane version to be used and its dependencies, and will also speed up fastlane execution.

Install Bundler by running gem install bundler

Create a ./Gemfile in the root directory of your project with the content

source "https://rubygems.org"

gem "fastlane"


Run bundle update and add both the ./Gemfile and the ./Gemfile.lock to version control

Every time you run fastlane, use bundle exec fastlane [lane]

On your CI, add bundle install as your first build step

To update fastlane, just run bundle update fastlane

Homebrew (macOS)

This way, you don't have to install Ruby separately, and instead homebrew installs the adequate Ruby version for fastlane. See this pagefor details.

brew install fastlane


System Ruby + RubyGems (macOS/Linux/Windows)

This is not recommended for your local environment, but you can still install fastlane to system Ruby's environment. Using sudo often occurs unwanted results later due to file permission and makes managing your environment harder.

sudo gem install fastlane


Setting up fastlane

Navigate to your iOS or Android app and run

fastlane init


fastlane will automatically detect your project, and ask for any missing information.



Using fastlane

Build Dev Firebase -> Android and Ios Store

sh script/publish.sh "dev publish android ios"

Build Prod Firebase -> Android and Ios Store

sh script/publish.sh "prod publish android ios"

Build Dev Firebase -> Android Store

sh script/publish.sh "dev publish android"

Build Dev Firebase -> IOS Store 

sh script/publish.sh "dev publish ios"

Build Prod Firebase -> Android Store

sh script/publish.sh "prod publish android"

Build Prod Firebase -> IOS Store

sh script/publish.sh "prod publish android"



Do not forget change!

iOS/fastlane/Appfile

change → apple_id



iOS/fastlane/Appfile

change → key_filepath

