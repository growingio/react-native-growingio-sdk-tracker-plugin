import * as React from 'react';

import { StyleSheet, View, Text, Button } from 'react-native';
import GrowingTracker from 'react-native-growing-tracker';

export default function App() {
  const [deviceId, setDeviceId] = React.useState<string | undefined>();

  return (
    <View style={styles.container}>
      <Button
        title={'trackCustomEvent(string)'}
        onPress={() => {
          GrowingTracker.trackCustomEvent('trackCustomEvent(string)');
        }}
      />
      <Button
        title={'trackCustomEvent(string, attributes)'}
        onPress={() => {
          GrowingTracker.trackCustomEvent('trackCustomEvent(string)', {
            key1: 'value1',
            key2: 'value2',
          });
        }}
      />
      <Button
        title={'trackCustomEvent(string, itemKey, itemId)'}
        onPress={() => {
          GrowingTracker.trackCustomEvent(
            'trackCustomEvent(string)',
            null,
            'itemKey',
            'itemId'
          );
        }}
      />
      <Button
        title={'trackCustomEvent(string, attributes, itemKey, itemId)'}
        onPress={() => {
          GrowingTracker.trackCustomEvent(
            'trackCustomEvent(string)',
            {
              key1: 'value1',
              key2: 'value2',
            },
            'itemKey',
            'itemId'
          );
        }}
      />
      <Button
        title={'setLoginUserAttributes(variables)'}
        onPress={() => {
          GrowingTracker.setLoginUserAttributes({
            key1: 'value1',
            key2: 'value2',
          });
        }}
      />
      <Button
        title={'setDataCollectionEnabled(variables)'}
        onPress={() => {
          GrowingTracker.setDataCollectionEnabled(true);
        }}
      />
      <Button
        title={'getDeviceId()'}
        onPress={() => {
          GrowingTracker.getDeviceId().then(setDeviceId);
        }}
      />
      <Text>DeviceId: {deviceId}</Text>
      <Button
        title={'setLoginUserId()'}
        onPress={() => {
          GrowingTracker.setLoginUserId('loginUserId');
        }}
      />
      <Button
        title={'cleanLoginUserId()'}
        onPress={() => {
          GrowingTracker.cleanLoginUserId();
        }}
      />
      <Button
        title={'setLocation()'}
        onPress={() => {
          GrowingTracker.setLocation(100.0, 100.0);
        }}
      />
      <Button
        title={'cleanLocation()'}
        onPress={() => {
          GrowingTracker.cleanLocation();
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
