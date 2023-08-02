import { Dimensions, ImageBackground, ScrollView, StyleSheet, Text, TextInput, TouchableOpacity, View } from 'react-native'
import React, { useContext, useState } from 'react'
import auth from '@react-native-firebase/auth';
import { AsyncStorage } from 'react-native';
import AppContext from '../components/AppContext';


export default function RegisterPage({ navigation }) {

    const {name, setName} = useContext(AppContext);
    const {mobileNum, setmobileNum} = useContext(AppContext);
    const {email, setEmail} = useContext(AppContext);
    const {password, setPassword} = useContext(AppContext);
    const registerd = () => {
        auth()
            .createUserWithEmailAndPassword(email, password)
            .then(() => {
                console.log('User account created & signed in!');
            })
            .catch(error => {
                if (error.code === 'auth/email-already-in-use') {
                    console.log('That email address is already in use!');
                }

                if (error.code === 'auth/invalid-email') {
                    console.log('That email address is invalid!');
                }

                console.error(error);
            });
    }

    const submit_Data = async()=>{
console.log('User name:- ', name);
console.log('Mobile Number:- ', mobileNum);
console.log('Email Address:- ', email);
console.log('Password:- ', password);
        if(
            email.length ===0 || name.length===0|| mobileNum <10 ||password.length ===0
        ){
            alert ('Warning! Please Fill all fields.')
        }
        else{
            try{
                var userData={
                    name: name,
                    mobileNum: mobileNum,
                    email: email,
                    password: password
                }
            
            await AsyncStorage.setItem('ActivityData', JSON.stringify(userData));
            console.log(userData);//Data which is entered
                alert ('Account Created Succesfully');

                navigation.navigate('signinpage')

        }catch (error){
console.warn('Error of AsyncStorage:- ', error);// Error retrieving data
        }
    }
    }

    return (
        <ImageBackground source={{uri: 'https://th.bing.com/th/id/OIP.UJcDKwxrGG_9_styjTAeoAHaDt?pid=ImgDet&rs=1'}} style={{ justifyContent: 'center', flexGrow: 1,  height: Dimensions.get('screen').height / 1 }}>
        <View >
            <Text style={{ fontSize: 35, fontWeight: '800', height: 100, color: '#A0A000', textAlign: 'center', textShadowOffset: { width: 1, height: 2 }, }}>REGISTRATION</Text>
            <View style={{ marginHorizontal: 20, }}>
                <ScrollView style={{  borderRadius: 20,height:Dimensions.get('screen').height/5.5}}>
                    <View style={styles.inputs}>
                        <TextInput style={{marginVertical:-10}} placeholder='Full Name' onChangeText={(name) => setName( name )} />
                    </View>
                    <View style={styles.inputs}>
                        <TextInput style={{marginVertical:-10}} maxLength={10} placeholder='Contact Number' onChangeText={(userMobileNum) => setmobileNum( userMobileNum)} />
                    </View>
                    <View style={styles.inputs}>
                        <TextInput style={{marginVertical:-10}} placeholder='Email address' onChangeText={(userEmail) => setEmail( userEmail)} />
                    </View>
                    <View style={styles.inputs}>
                        <TextInput style={{marginVertical:-10}} secureTextEntry placeholder='Password' onChangeText={(userPassword) => setPassword( userPassword)} />
                    </View>
                </ScrollView>
                <TouchableOpacity style={{ backgroundColor: '#A0A000', alignSelf: 'center', borderRadius: 20, marginVertical: 30 }} onPress={() => {registerd(), submit_Data()}}>
                    <Text style={{
                        paddingVertical: 10,
                        paddingHorizontal: 100,
                        color: 'white',
                        fontWeight: '700'
                    }}>
                        Register
                    </Text>
                </TouchableOpacity>

                <TouchableOpacity style={{ alignItems: 'flex-end', marginRight: 10, alignSelf: 'center' }} onPress={() => {navigation.navigate('signinpage'), submit_Data()}}>
                    <Text style={{color:'white'}}>
                        Already registered ? <Text style={{ color: 'gray' }}>Sign In</Text>
                    </Text>
                </TouchableOpacity>
            </View>
</View>
        </ImageBackground>
    )
}

const styles = StyleSheet.create({
    inputs: {
        borderWidth: 1,
        alignItems: 'center',       
        borderRadius: 10,
        marginBottom: 5,
        marginHorizontal: 10,
        backgroundColor: 'white',
        
    }
})