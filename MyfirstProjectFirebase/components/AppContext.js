import { StyleSheet, Text, View } from 'react-native'
import React, { createContext,useState } from 'react'

const AppContext =createContext();

export function AppProvider({children}) {
    
    const [email, setEmail] = useState('')
    const [name, setName] = useState('')
    const [mobileNum, setmobileNum] =useState('')
const [password, setPassword]= useState('')

    const context ={
        setEmail,email,setmobileNum,mobileNum,
        setName,name, setPassword,password
    };
return (
    <AppContext.Provider value={context}>
        {children}
    </AppContext.Provider>
)
}

const styles = StyleSheet.create({})

export default AppContext