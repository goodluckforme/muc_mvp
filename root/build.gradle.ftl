apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply plugin: 'kotlin-android-extensions'
apply plugin: 'kotlin-kapt'

def releaseTime() {
    return new Date().format("yyyyMMdd", TimeZone.getTimeZone("UTC"))
}

android {
    compileSdkVersion 27
    buildToolsVersion "26.0.3"
    defaultConfig {
        applicationId "${packageName}"
        minSdkVersion 15
        targetSdkVersion 26
        versionCode 101
        versionName "1.0.1"
        //multiDexEnabled true
    }
    signingConfigs {
        debug {
            storeFile file("$rootDir/${packageName}.jks")
            storePassword "${packageName}"
            keyAlias "${packageName}"
            keyPassword "${packageName}"
        }

        release {
            storeFile file("$rootDir/${packageName}.jks")
            storePassword "${packageName}"
            keyAlias "${packageName}"
            keyPassword "${packageName}"
        }
    }
    buildTypes {
        release {
            buildConfigField "boolean", "LOG_DEBUG", "false"
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            //签名
            signingConfig signingConfigs.release
            //apk命名
            android.applicationVariants.all { variant ->
                variant.outputs.all { output ->
                	outputFileName = "${packageName}-<#noparse>${variant.name}-${variant.versionName}-${releaseTime()</#noparse>}.apk"
                }
            }
        }
        debug {
            buildConfigField "boolean", "LOG_DEBUG", "true"
            signingConfig signingConfigs.debug
        }
    }
    lintOptions {
        checkReleaseBuilds false
        abortOnError false
    }
    sourceSets {
        main {
            jni.srcDirs = []
            jniLibs.srcDirs = ['libs']
        }
    }
    repositories {
        flatDir {
            dirs 'libs'
        }
    }

}
kapt {
    generateStubs = true
}

dependencies {
    implementation fileTree(include: ['*.jar'], dir: 'libs')
    // Kotlin
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jre7:$kotlin_version"
    def anko_version = "0.10.1"
    implementation "org.jetbrains.anko:anko:$anko_version"
    //kapt rootProject.ext.dependencies["dagger2-compiler"]
    kapt 'com.google.dagger:dagger-compiler:2.5'
    compile 'com.google.dagger:dagger:2.5'
    implementation 'com.android.support:appcompat-v7:27.0.2'
    // Rx
    implementation 'io.reactivex:rxandroid:1.1.0'
    implementation 'io.reactivex:rxjava:1.1.5'

    //网络框架
    implementation 'com.squareup.retrofit2:retrofit:2.1.0'
    implementation 'com.squareup.retrofit2:adapter-rxjava:2.0.1'
    implementation 'com.squareup.retrofit2:converter-gson:2.0.0-beta4'
    implementation 'com.squareup.retrofit2:converter-scalars:2.0.0-beta4'
    implementation 'com.squareup.okhttp3:okhttp:3.2.0'
    //gson
    implementation 'com.google.code.gson:gson:2.8.0'
//==================================以下部分非必须======================================
//    //类似EvenBus
//    implementation 'me.drakeet.mailotto:mailotto:1.1.0'
//    //蒲公英
//    implementation 'com.pgyersdk:sdk:2.8.1'
//    //RxView
//    //implementation 'com.jakewharton.rxbinding2:rxbinding:2.0.0'
//    //UI库
//    implementation 'com.qmuiteam:qmui:1.0.6'
//    //materialedittext
//    implementation 'com.rengwuxian.materialedittext:library:2.1.4'
//    //轮播图
//    implementation 'cn.bingoogolapple:bga-banner:2.1.8@aar'
//    implementation 'me.relex:circleindicator:1.2.2@aar'
//    // 图片加载
//    implementation 'com.github.bumptech.glide:glide:3.7.0'
//    //    implementation 'cn.bingoogolapple:bga-adapter:1.1.8@aar'
//    //    implementation 'cn.bingoogolapple:bga-photopicker:1.2.3@aar'
//    //高德定位
//    implementation 'com.amap.api:location:latest.integration'
//    //高德搜索
//    //    implementation 'com.amap.api:search:latest.integration'
//    //扫描二维码
//    implementation 'com.google.zxing:core:3.3.0'
//    implementation 'cn.bingoogolapple:bga-qrcodecore:1.1.9@aar'
//    implementation 'cn.bingoogolapple:bga-zxing:1.1.9@aar'
//    //分包
//    implementation 'com.android.support:multidex:1.0.0'
}