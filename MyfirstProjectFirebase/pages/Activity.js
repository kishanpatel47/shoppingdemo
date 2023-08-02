import { StyleSheet, Text, Image, View, Dimensions } from 'react-native'
import React from 'react'

import { TextInput } from 'react-native-gesture-handler'



export default function Activity(parent) {
    return (
        <View style={{ alignItems: 'center' }}>
            <Image style={{ height: 250, width: 250, resizeMode: 'stretch', }} source={{ uri: 'https://imgs.search.brave.com/NP6HaXdJFIu-E9YFakqSPjMKU3oXdevomCSFcwXFKVQ/rs:fit:800:533:1/g:ce/aHR0cHM6Ly9tZWRp/YTEudGhlaHVuZ3J5/anBlZy5jb20vdGh1/bWJzLzgwMF8zNDkw/NTUwX2Q4MmMyMjk5/YzA2YzQzN2E1NzU0/ZGI4MjYyZGEyMjM4/NGJhOWFhOWEuanBn' }} ></Image>
            <Text style={{ fontSize: 20, fontWeight: '700' }}>Dancing</Text>
            <View style={{ backgroundColor: '#F0FFF8', marginVertical: 30, elevation: 20 }}>
                <Text style={{ fontSize: 20, paddingHorizontal: 35 }}>
                    Dance is a form of art that is made by purposefully recreating selected sequences of human motion, which can be imbued with the values of aesthetic and symbolism that are acknowledged by both performers and observers from within the particular culture. The dance itself can be freeform or can have a predefined choreography that may or may not align with traditions of origin or historical period.
                </Text>
            </View>
        </View>
    )
}

const styles = StyleSheet.create({})