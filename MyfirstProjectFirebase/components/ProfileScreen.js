import { StyleSheet, Text, Image, View, TouchableOpacity, Dimensions } from 'react-native'
import React, {useContext, useState} from 'react'
import { ScrollView, TextInput } from 'react-native-gesture-handler'
import AppContext from './AppContext';

export default function Profile({navigation}) {
    const {name} = useContext(AppContext);
    // const [email, setEmail] = useState("r@gmail.com");
    const {email} = useContext(AppContext)
    const {mobileNum} = useContext(AppContext);
    const {password} = useContext(AppContext);
    // const {}
    return (
        <View style={{backgroundColor: '#FFC693',height: '100%' }}>
        <ScrollView contentContainerStyle={{flexGrow:1, justifyContent:'center'}}>
            
            <View style={{borderWidth:1,paddingVertical:30,backgroundColor:'#8894BD', marginHorizontal: 10,borderRadius:20}}>

            <Image style={{ height: 150, width: 150, borderRadius: 100, alignSelf: 'center',borderWidth:2,borderColor:'gray' }} source={{ uri: 'https://imgs.search.brave.com/M5ytj7a9K0w4JXlzrruFpLU1tUUgua2eyNm609y0E28/rs:fit:1080:1122:1/g:ce/aHR0cHM6Ly9iZXN0/cHJvZmlsZXBpY3R1/cmVzLmNvbS93cC1j/b250ZW50L3VwbG9h/ZHMvMjAyMS8wNC9D/b29sLVByb2ZpbGUt/UGljdHVyZS5qcGc' }} />

            <TouchableOpacity style={{ backgroundColor: 'gray', alignSelf: 'center', borderRadius: 20, elevation: 10, marginVertical: 20, }}>
                <Text style={{ color: 'white', marginHorizontal: 10, }}>
                    Edit
                </Text>
            </TouchableOpacity>
            <View style={styles.inputs}>
                <TextInput editable={true} style={{textAlign:'center'}} placeholder='Please enter full name' value={name}/>
            </View>
            <View style={styles.inputs}>
                <TextInput style={{textAlign:'center'}} placeholder='Email Address' value={email} />
            </View>
            <View style={styles.inputs}>
                <TextInput style={{textAlign:'center'}} placeholder='Mobile Number' value={mobileNum}/>
            </View>
            <View style={styles.inputs}>
                <TextInput secureTextEntry editable={false} selectTextOnFocus={false} style={{textAlign:'center'}} value={password}/>
            </View>

<TouchableOpacity style={{alignSelf: 'flex-end', marginRight:10, backgroundColor: '#DEF0ED',borderWidth:1,borderRadius:10}}>
    <Text style={{margin:5, fontWeight:'700'}}>SAVE</Text>
</TouchableOpacity>

            </View>
        </ScrollView>
        </View>
    )
}

const styles = StyleSheet.create({
    inputs:{
        borderWidth: 1,
        // alignItems: 'center',       
        borderRadius: 10,
        marginBottom: 10,
        marginHorizontal: 10,
        backgroundColor: '#E8E8E8'
    }
})