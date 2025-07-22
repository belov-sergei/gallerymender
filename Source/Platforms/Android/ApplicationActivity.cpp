// Copyright ❤️ 2025, Wow Play

#include <jni.h>

extern "C" JNIEXPORT jstring JNICALL Java_com_wowplay_jigsawville_ApplicationActivity_GetText(JNIEnv* env, jobject) {
    return env->NewStringUTF("Hello, World!");
}