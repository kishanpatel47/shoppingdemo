import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import React from "react";
 import Component from "../Component/Component";
const Stack = createNativeStackNavigator();

const Route =()=>{
    return(
        <NavigationContainer>
            <Stack.Navigator initialRouteName="Component">
                <Stack.Screen  name ={Component}  component={Component}></Stack.Screen>
            </Stack.Navigator>
        </NavigationContainer>
    )
}
export default Route;