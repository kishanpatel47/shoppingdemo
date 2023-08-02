import { View, Text, FlatList, Button, ScrollView } from 'react-native'
import React, { useEffect } from 'react'
import { useGetAllUseraQuery } from '../services/users'

export default function Component({ navigation }) {
    const { data } = useGetAllUseraQuery();


    // const rednerItem = ({ item,name,id }) => {
    //     return (
    //         <View>
    //             <Text>dsfgu</Text>

    //             <Text>{name}</Text>
    //             <Text>{item.id}</Text>
    //             <Button title='Get info' onPress={()=>navigation.avigate('Getdata')}/>

    //         </View>
    //     )
    // }

    return (
        <>
            {/* <FlatList data={data}

                renderItem={rednerItem}


            /> */}

            <ScrollView>
                {
                    data.map(({ name, email, id }) => {

                        return (

                            <View>
                                <View style={{ backgroundColor: 'red', margin: 8, padding: 10 }}>
                                    <Text style={{ color: 'white' }}>{name}</Text>
                                    <Text style={{ color: 'white' }}>{email}</Text>
                                    <Button title='Get Title' onPress={() => alert('data' + id)} />
                                </View>

                            </View>
                        )
                    })
                }
            </ScrollView>

        </>
    )
}