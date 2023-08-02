import { Dimensions, StyleSheet, Text, TextInput, TouchableOpacity, View,ImageBackground, AsyncStorage } from 'react-native'
import React,{ useState,useContext} from 'react'
import AppContext from '../components/AppContext';

export default function SignInPage({ navigation }) {

    const {email, setEmail} =useContext(AppContext)
    const {password, setPassword} = useContext(AppContext);
    const signIn= async()=>{
        setEmail(email)
        if(
            email.length ===0 || password.length ===0
        ){
            alert('Please fill all Fields');
        }
        else{
            try{
                var userData={
                    email: email,
                    password: password,               
                };
                AsyncStorage.getItem('ActivityData').then(value =>{
                    let userData = JSON.parse(value);
                    console.log(userData)

                    if(userData.email === email && userData.password=== password)
                    {
                        AsyncStorage.getItem('ActivityData');
                        alert('You are Successfully Signed In')
                        console.log(email,password)

                        navigation.navigate('dashboard')                    
                    }
                    else{
                        alert('Try Again');
                    }
                })
            }
            catch(error){
                console.warn(error);
            }
        }
    }

    return (
<>
        <ImageBackground source={{uri: 'https://th.bing.com/th/id/OIP.UJcDKwxrGG_9_styjTAeoAHaDt?pid=ImgDet&rs=1'}} style={{
            flexGrow: 1, justifyContent: 'center',
            height: Dimensions.get('screen').height / 1, backgroundColor: '#FFC693',
        }}>
        <View >
            <Text style={{ fontSize: 35, fontWeight: '800', height: 100, color: '#A0A000', textAlign: 'center' }}>SIGN IN</Text>
            <View style={{ marginHorizontal: 20, }}>
                <View style={{ backgroundColor: 'gray', paddingVertical: 10, borderRadius: 20 }}>
                    <View style={styles.inputs}>
                        <TextInput placeholder='Email address' onChangeText={(email)=> setEmail(email)}/>
                    </View>
                    <View style={styles.inputs}>
                        <TextInput secureTextEntry placeholder='Password' onChangeText={(password)=>setPassword(password)}/>
                    </View>
                </View>
                <TouchableOpacity style={{ backgroundColor: '#A0A000', alignSelf: 'center', borderRadius: 20, marginVertical: 30, }} onPress={() => { signIn()}}>
                    <Text style={{
                        paddingVertical: 10,
                        paddingHorizontal: 100,
                        color: 'white',
                        fontWeight: '700'
                    }}>
                        Sign In
                    </Text>
                </TouchableOpacity>

                <TouchableOpacity style={{ alignItems: 'flex-end', marginRight: 10, alignSelf: 'center'}} onPress={() => navigation.navigate('registerpage')}>
                    <Text style={{color:'white'}}>
                        Not registered yet? <Text style={{ color: 'gray' }}>Register here</Text>
                    </Text>
                </TouchableOpacity>
            </View>
        </View>
        </ImageBackground>


</>
    )
}

const styles = StyleSheet.create({
    inputs: {
        borderWidth: 1,
        alignItems: 'center',
        borderRadius: 10,
        marginBottom: 10,
        backgroundColor: 'white',
        marginHorizontal: 10,
    }
})
