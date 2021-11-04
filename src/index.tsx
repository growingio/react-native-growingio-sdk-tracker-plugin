import { NativeModules } from 'react-native';

export default class GrowingTracker {
  static trackCustomEvent(
    eventName: string,
    attributes: Object | null | undefined = null
  ): void {
    return NativeModules.GrowingTracker.trackCustomEvent(eventName, attributes);
  }

  static setConversionVariables(attributes: Object): void {
    return NativeModules.GrowingTracker.setConversionVariables(attributes);
  }

  static setLoginUserAttributes(attributes: Object): void {
    return NativeModules.GrowingTracker.setLoginUserAttributes(attributes);
  }

  static setVisitorAttributes(attributes: Object): void {
    return NativeModules.GrowingTracker.setVisitorAttributes(attributes);
  }

  static setLoginUserId(userId: string): void {
    return NativeModules.GrowingTracker.setLoginUserId(userId);
  }

  static cleanLoginUserId(): void {
    return NativeModules.GrowingTracker.cleanLoginUserId();
  }

  static setLocation(latitude: number, longitude: number): void {
    return NativeModules.GrowingTracker.setLocation(latitude, longitude);
  }

  static cleanLocation(): void {
    return NativeModules.GrowingTracker.cleanLocation();
  }

  static setDataCollectionEnabled(enabled: boolean): void {
    return NativeModules.GrowingTracker.setDataCollectionEnabled(enabled);
  }

  static async getDeviceId(): Promise<string> {
    return await NativeModules.GrowingTracker.getDeviceId();
  }
}
