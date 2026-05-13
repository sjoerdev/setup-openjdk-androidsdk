# Setup OpenJDK and Android SDK

## OpenJDK

1. Download [OpenJDK](https://openjdk.org/) for windows
2. Put the folder in ``C:\jdk``
3. Create the ``JAVA_HOME`` enviroment variable as ``C:\jdk``
4. Add ``C:\jdk\bin`` to the PATH

## Android SDK

1. Download the [android sdk command line tools](https://developer.android.com/studio#command-line-tools-only)
2. Put the folder in ``C:\Android\cmdline-tools``
3. Create a subfolder inside ``C:\Android\cmdline-tools`` called ``C:\Android\cmdline-tools\latest``
4. Move everything inside ``C:\Android\cmdline-tools`` into ``C:\Android\cmdline-tools\latest``
5. Create the ``ANDROID_HOME`` enviroment variable as ``C:\Android``
6. Add ``C:\Android\cmdline-tools\latest\bin`` to the PATH
7. Now init the SDK by running ``sdkmanager "platform-tools" "platforms;android-35" "build-tools;35.0.0"``

## Android Emulator

1. Install ``emulator`` by running ``sdkmanager "platform-tools" "emulator"``
2. Add ``C:\Android\emulator`` to the PATH
3. Install android image ``sdkmanager "platforms;android-35" "system-images;android-35;google_apis_playstore;x86_64"``
4. Create a virtual phone by running ``avdmanager create avd -n myphone_name -k "system-images;android-35;google_apis_playstore;x86_64"``
5. Run the virtual phone by running ``emulator -avd PixelPlay -gpu host -memory 4096 -cores 4``
7. To list virtual devices run ``emulator -list-avds``
8. To delete a virtual device run ``avdmanager delete avd -n myphone_name``
