import { NativeModules } from 'react-native';

type GrowingTrackerType = {
  multiply(a: number, b: number): Promise<number>;
  trackCustomEvent(
    eventName: string,
    attributes: Object | null | undefined,
    itemKey: string | null | undefined,
    itemId: string | null | undefined
  ): void;
  setLoginUserAttributes(attributes: Object): void;
  setLoginUserId(userId: string): void;
  cleanLoginUserId(): void;
  setLocation(latitude: number, longitude: number): void;
  cleanLocation(): void;
  setDataCollectionEnabled(enabled: boolean): void;
  getDeviceId(): Promise<string>;
};

const { GrowingTracker } = NativeModules;

export default GrowingTracker as GrowingTrackerType;
