## Spatial audio

Apple introduced [Spatial Audio](https://youtu.be/H0gZ4iQqGJg?t=51) at WWDC 2020 and in order to implement this feature, Apple uses the headphones motion data. These data are collected via the accelerometer and gyroscope integrated in the headphones. And since september 2020 the third party developers can also access this data using iOS 14 and the latest firmware version for AirPods Pro (or newer heaphones).

## HeadphoneMotion

HeadphoneMotion is a simple and straightforward iOS project, which demonstrates how to use head motion data. 
This app has two modes:
- the first visualizes the head rotatation using the data from headphones;
- the second shows how to use the head tracking data in context of positional audio. Concretely it shows how to fix the source of the sound in the user environment, directly in front of the user.

The 3D view & audio rendering is done using SceneKit.

## References

* Spatial Audio
  * https://support.apple.com/en-us/HT211775
  * https://youtu.be/H0gZ4iQqGJg?t=51
* Headphones Motion Data
  * https://developer.apple.com/documentation/coremotion/cmheadphonemotionmanager
  * https://developer.apple.com/documentation/coremotion/cmdevicemotion
* SceneKit
  * https://developer.apple.com/documentation/scenekit
* AirPods Pro Tech Specs
  * https://www.apple.com/airpods-pro/specs/
