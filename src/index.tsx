import { NativeModules } from 'react-native';

type GrowingTrackerType = {
  multiply(a: number, b: number): Promise<number>;
};

const { GrowingTracker } = NativeModules;

export default GrowingTracker as GrowingTrackerType;
