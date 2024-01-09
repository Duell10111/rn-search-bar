import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { RnSearchBarView } from '@duell10111/rn-search-bar';

export default function App() {
    return (
        // @ts-ignore
        <View style={styles.container}>
          {/*// @ts-ignore*/}
            <RnSearchBarView color="#32a852" style={styles.box} />
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
        width: 1920,
        height: 1000,
        marginVertical: 20,
    },
});
