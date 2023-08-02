import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import {
  NavigationContainer,
} from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack'
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs'
import SignInPage from './pages/signInPage'
import RegisterPage from './pages/RegisterPage';

import { AppProvider } from './components/AppContext';
import HomeScreen from './components/HomeScreen';
import Profile from './components/ProfileScreen';
import Activity from './pages/Activity';

import RegisterShopPage from './ShoppingApp/pages/RegisterShopPage';
import SignInShopPage from './ShoppingApp/pages/SignInShopPage';

const Stack = createStackNavigator();

const Tab = createBottomTabNavigator();

const BottomNavigation = () => {
  return (
    <Tab.Navigator initialRouteName="homeScreen" screenOptions={{ headerShown: false }}
      tabBarOptions={{
        activeTintColor: 'blue',
        inactiveTintColor: 'gray',
        style: {
          backgroundColor: '#e0e0e0',
        },
        labelStyle: {
          textAlign: 'center',
          fontSize: 16
        },
      }}>
      <Tab.Screen name='homeScreen' component={HomeScreen}></Tab.Screen>
      <Tab.Screen name='profileScreen' component={Profile}></Tab.Screen>
      {/* <Tab.Screen name='activity' component={Activity}></Tab.Screen> */}

    </Tab.Navigator>
  )
}
export default function App() {
  return (
    <>
    <AppProvider>
      <NavigationContainer>
        <Stack.Navigator initialRouteName='register' screenOptions={{ headerShown: false }}>
          {/* <Stack.Screen name='signinpage' component={SignInPage}  ></Stack.Screen>
          <Stack.Screen name='registerpage' component={RegisterPage}></Stack.Screen>
          <Stack.Screen name='dashboard' component={BottomNavigation}></Stack.Screen>
          <Stack.Screen name='activity' component={Activity}></Stack.Screen> */}

{/* For Shopping App */}
        <Stack.Screen name='register' component={RegisterShopPage}></Stack.Screen>
        <Stack.Screen name='signIn' component={SignInShopPage}></Stack.Screen>
        </Stack.Navigator>
      </NavigationContainer>
      </AppProvider>
    </>
  )
}

const styles = StyleSheet.create({})