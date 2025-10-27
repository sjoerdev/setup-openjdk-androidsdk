# Setup OpenJDK and Android SDK

## OpenJDK

1. Download [OpenJDK](https://openjdk.org/) for windows
2. Put the folder in ``C:\jdk``
3. Create the ``JAVA_HOME`` enviroment variable as ``C:\jdk``
4. Add ``C:\jdk\bin`` to the PATH

## Android SDK

1. Download the [android sdk command line tools](https://androidsdkmanager.azurewebsites.net/cmdline-tools.html)
2. Put the folder in ``C:\Android\cmdline-tools``
3. Create the ``ANDROID_HOME`` enviroment variable as ``C:\Android``
4. Add ``C:\Android\cmdline-tools\latest\bin`` to the PATH
5. Now init the SDK by running ``sdkmanager.bat "platform-tools" "platforms;android-35" "build-tools;35.0.0"``
