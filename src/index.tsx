import {
  requireNativeComponent,
  UIManager,
  Platform,
  type ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package '@duell10111/rn-search-bar' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type RnSearchBarProps = {
  color: string;
  style: ViewStyle;
};

const ComponentName = 'RnSearchBarView';

export const RnSearchBarView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<RnSearchBarProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
