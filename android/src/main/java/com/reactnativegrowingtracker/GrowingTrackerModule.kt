package com.reactnativegrowingtracker

import com.facebook.react.bridge.*
import com.growingio.android.sdk.track.GrowingTracker

class GrowingTrackerModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "GrowingTracker"
    }

    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    @ReactMethod
    fun multiply(a: Int, b: Int, promise: Promise) {
    
      promise.resolve(a * b)
    
    }

  @ReactMethod
  fun trackCustomEvent(eventName: String, attributes: ReadableMap?) {
    attributes?.let {
      GrowingTracker.get().trackCustomEvent(eventName, readableMap2ArgMap(attributes))
    } ?: run {
      GrowingTracker.get().trackCustomEvent(eventName)
    }
  }

  @ReactMethod
  fun setConversionVariables(variables: ReadableMap) {
    GrowingTracker.get().setConversionVariables(readableMap2ArgMap(variables))
  }

  @ReactMethod
  fun setLoginUserAttributes(attributes: ReadableMap) {
    GrowingTracker.get().setLoginUserAttributes(readableMap2ArgMap(attributes))
  }

  @ReactMethod
  fun setVisitorAttributes(attributes: ReadableMap) {
    GrowingTracker.get().setVisitorAttributes(readableMap2ArgMap(attributes))
  }

  @ReactMethod
  fun setDataCollectionEnabled(enabled: Boolean) {
    GrowingTracker.get().setDataCollectionEnabled(enabled)
  }

  @ReactMethod
  fun getDeviceId(promise: Promise) {
    promise.resolve(GrowingTracker.get().deviceId)
  }

  @ReactMethod
  fun setLoginUserId(userId: String?) {
    GrowingTracker.get().setLoginUserId(userId)
  }

  @ReactMethod
  fun cleanLoginUserId() {
    GrowingTracker.get().cleanLoginUserId()
  }

  @ReactMethod
  fun setLocation(latitude: Double, longitude: Double) {
    GrowingTracker.get().setLocation(latitude, longitude)
  }

  @ReactMethod
  fun cleanLocation() {
    GrowingTracker.get().cleanLocation()
  }

  private fun readableMap2ArgMap(readableMap: ReadableMap?): Map<String, String>? {
    return readableMap?.toHashMap()?.mapValues { it.value.toString() }
  }
}
