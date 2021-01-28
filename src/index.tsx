import { NativeModules } from 'react-native';

type GrowingTrackerType = {
  multiply(a: number, b: number): Promise<number>;
  trackCustomEvent(
    eventName: string,
    attributes?: Object | null | undefined
  ): void;
  setConversionVariables(variables: Object): void;
  setLoginUserAttributes(attributes: Object): void;
  setVisitorAttributes(attributes: Object): void;
  setDataCollectionEnabled(enabled: boolean): void;
  getDeviceId(): Promise<string>;
  setLoginUserId(userId: string): void;
  cleanLoginUserId(): void;
  setLocation(latitude: number, longitude: number): void;
  cleanLocation(): void;
};

const { GrowingTracker } = NativeModules;

export default GrowingTracker as GrowingTrackerType;
