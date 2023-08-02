import { Dimensions, StyleSheet, Text, TextInput, View } from 'react-native'
import React from 'react'


export default function RegisterShopPage() {
return (
    <View style={{backgroundColor: 'rgba(251,215,208,255)',
    height: Dimensions.get('screen').height/1
    , flexDirection: 'column', justifyContent: 'center'}}>
    <Text style={{fontSize:50, fontWeight:'800',textAlign:'center'}}>Registration</Text>
    <View>
    <Text style={{marginLeft:20}}>Enter Your name:-</Text>
        <View style={styles.inputs}>
            <TextInput  />
        </View>

        <Text  style={{marginLeft:20}}>Enter Your Mobile Number:-</Text>
        <View style={styles.inputs}>
            <TextInput  />
        </View>

        <Text  style={{marginLeft:20}}>Enter Your Email:-</Text>
        <View style={styles.inputs}>
            <TextInput  />
        </View>

        <Text  style={{marginLeft:20}}>Enter Password:-</Text>
        <View style={styles.inputs}>
            <TextInput  />
        </View>
    </View>
    </View>
)
}

const styles = StyleSheet.create({
    inputs:{
        borderWidth:1,
        marginVertical:10,
        backgroundColor: 'rgba(248,238,238,255)',
        borderRadius:10,
        marginHorizontal:20
    }
})