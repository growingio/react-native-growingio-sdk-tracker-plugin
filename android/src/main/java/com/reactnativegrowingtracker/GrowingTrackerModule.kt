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
  fun trackCustomEvent(eventName: String, attributes: ReadableMap?, itemKey: String?, itemId: String?) {
    notNull(attributes, itemId, itemKey) {
      GrowingTracker.get().trackCustomEvent(eventName, readableMap2ArgMap(attributes), itemKey, itemId)
      return
    }

    notNull(attributes) {
      GrowingTracker.get().trackCustomEvent(eventName, readableMap2ArgMap(attributes))
      return
    }

    notNull(itemKey, itemId) {
      GrowingTracker.get().trackCustomEvent(eventName, itemKey, itemId)
      return
    }

    GrowingTracker.get().trackCustomEvent(eventName)
  }

  @ReactMethod
  fun setLoginUserAttributes(attributes: ReadableMap) {
    GrowingTracker.get().setLoginUserAttributes(readableMap2ArgMap(attributes))
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

  @ReactMethod
  fun setDataCollectionEnabled(enabled: Boolean) {
    GrowingTracker.get().setDataCollectionEnabled(enabled)
  }

  @ReactMethod
  fun getDeviceId(promise: Promise) {
    promise.resolve(GrowingTracker.get().deviceId)
  }

  inline fun <R> notNull(vararg args: Any?, block: () -> R) =
    when (args.filterNotNull().size) {
        args.size -> block()
        else -> null
    }

  private fun readableMap2ArgMap(readableMap: ReadableMap?): Map<String, String>? {
    return readableMap?.toHashMap()?.mapValues { it.value.toString() }
  }
}
