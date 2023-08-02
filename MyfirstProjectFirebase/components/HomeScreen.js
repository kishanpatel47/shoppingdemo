import { StyleSheet, Text, View, Image, FlatList, TouchableOpacity, ScrollView,TextInput, Dimensions } from 'react-native'
import React, { useState } from 'react'

const Content = [
    {
        id: '1',
        title: 'Walking',
        img: 'https://imgs.search.brave.com/L9V9bEK4-ZeSob_8yc6rKGSQf-4gNA6JYgXb1R6S0R8/rs:fit:416:416:1/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vcGhvdG9z/L3lvdW5nLWJveS13/aXRoLXNjaG9vbC1i/YWctd2Fsa2luZy1z/dHlsaXplZC1jYXJ0/b29uLWNoYXJhY3Rl/ci1zY2hvb2wtcGlj/dHVyZS1pZDEyNTA0/OTE1Mzk_az02Jm09/MTI1MDQ5MTUzOSZz/PTE3MDY2N2Emdz0w/Jmg9MTFRd2lKNVl2/RWRVQVdoR2p1MWdj/OHRMNkhlSnpGU3NW/NVJLdm0xQ0NvTT0',
        about: ''
    },
    {
        id: '2',
        title: 'Traveling by Cycling',
        img: 'https://imgs.search.brave.com/LHBpr9zo4e25c1psBAcTqAosU3ydlBQnhxXmlxxNBns/rs:fit:940:1024:1/g:ce/aHR0cDovL2NsaXBh/cnRtYWcuY29tL2lt/YWdlcy9jYXJ0b29u/LXBpY3R1cmVzLW9m/LWJpY3ljbGUtNi5q/cGc',
        about: ''
    },
    {
        id: '3',
        title: 'Driving',
        img: 'https://imgs.search.brave.com/KJzqxYmFrdH2Bdep9VuXMd11GcauBo_DuPtCT109HR8/rs:fit:393:160:1/g:ce/aHR0cDovL2NsaXBh/cnRzdGF0aW9uLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAx/Ny8xMS9mYWhyZW5k/ZXMtYXV0by1jbGlw/YXJ0LTEuanBn',
    },
    {
        id: '4',
        title: 'Traveling by Train',
        img: 'https://imgs.search.brave.com/WOwSqx9zOXAaCC7YAkBxRiReSrnNAG_JgGlQTJw3D-g/rs:fit:1200:861:1/g:ce/aHR0cDovL2NsaXBh/cnRtYWcuY29tL2lt/YWdlcy90cmFpbi1j/bGlwYXJ0LWltYWdl/cy0zMy5qcGc',
        about: ''
    },
    {
        id: '5',
        title: 'Hiking',
        img: 'https://imgs.search.brave.com/k9IaLN9QKhijQ4TM19Sb1vcmQLVsV5X17Ytq2L0iG_o/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93ZWJz/dG9ja3Jldmlldy5u/ZXQvaW1hZ2VzL2hp/a2VyLWNsaXBhcnQt/bW91bnRhaW4tY2xp/bWJlci0xNi5wbmc',
        about: ''
    },
    {
        id: '6',
        title: 'Traveling by Flight',
        img: 'https://imgs.search.brave.com/w1aY5lIyq6nfwbf32Eh5KWFMZWFJobIXE52GmCuoxZI/rs:fit:1200:1000:1/g:ce/aHR0cDovL2kuaHVm/ZnBvc3QuY29tL2dl/bi8zNDUyMjEwL2lt/YWdlcy9vLVBMQU5F/LUNBUlRPT04tZmFj/ZWJvb2suanBn',
        about: ''
    },
    {
        id: '7',
        title: 'Dancing',
        img: 'https://imgs.search.brave.com/NP6HaXdJFIu-E9YFakqSPjMKU3oXdevomCSFcwXFKVQ/rs:fit:800:533:1/g:ce/aHR0cHM6Ly9tZWRp/YTEudGhlaHVuZ3J5/anBlZy5jb20vdGh1/bWJzLzgwMF8zNDkw/NTUwX2Q4MmMyMjk5/YzA2YzQzN2E1NzU0/ZGI4MjYyZGEyMjM4/NGJhOWFhOWEuanBn',
        about: "Dance is a form of art that is made by purposefully recreating selected sequences of human motion, which can be imbued with the values of aesthetic and symbolism that are acknowledged by both performers and observers from within the particular culture. The dance itself can be freeform or can have a predefined choreography that may or may not align with traditions of origin or historical period."
    },
    {
        id: '8',
        title: 'Singing',
        img: 'https://imgs.search.brave.com/GKWuAK5pbNRJM8WAGgEE-q-2RVUkqe75U7Z_kvQMqTg/rs:fit:650:953:1/g:ce/aHR0cDovL2NsaXBh/cnRtYWcuY29tL2lt/YWdlcy9raWQtc2lu/Z2luZy1jbGlwYXJ0/LTQ0LmpwZw',
        about: ''
    },
    {
        id: '9',
        title: 'Listening',
        img: 'https://imgs.search.brave.com/KkznXayJGiVe7_QA3oU5tOuSQhoCwQ_LQFJ-8sUs2ng/rs:fit:416:416:1/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vdmVjdG9y/cy9yZWxheGVkLXNt/aWxpbmctYm95LWtp/ZC1saXN0ZW5pbmct/dG8tbXVzaWMtd2l0/aC13aXJlbGVzcy1o/ZWFkcGhvbmVzLXZl/Y3Rvci1pZDEwMjYx/MzI5MzA_az02Jm09/MTAyNjEzMjkzMCZz/PTE3MDY2N2Emdz0w/Jmg9QjlvdTFsVHFf/VlVwTUlrMGtZVy0y/S1VHeUJ2YXVOYkpv/NnZaRlRMUkFXYz0',
    },
    {
        id: '10',
        title: 'Reading',
        img: 'https://imgs.search.brave.com/5zj71WG4xM-4BXhDQzqGaHet2wTB5uqEzB6PSl-POaA/rs:fit:520:378:1/g:ce/aHR0cDovL2NsaXBh/cnQtbGlicmFyeS5j/b20vaW1hZ2VzL3Bj/N0s5eXA5aS5wbmc',
        about: ''
    },
    {
        id: '11',
        title: 'Writing',
        img: 'https://imgs.search.brave.com/FXPKZF3M4s5PhCJUNhskFXF1tlff_rU71iG-K6OVsN4/rs:fit:800:800:1/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9jYXJ0/b29uLWdpcmwtd3Jp/dGluZy1saXR0bGUt/ZGVzay1zdHlsZS12/ZWN0b3ItaWxsdXN0/cmF0aW9uLTcwMzA0/MzQ0LmpwZw',
        about: ''
    },
    {
        id: '12',
        title: 'Working',
        img: 'https://imgs.search.brave.com/nt56OkU7ADLK0skK61WncpPDNcpe_An8zyvt1YfvbOw/rs:fit:709:800:1/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vNzM2/eC8xYS9kNS80YS8x/YWQ1NGE5NWZiNmY1/MTkyYmM0NjNhYTI2/MjZjODhjYS0tY29t/cHV0ZXItZGVza3Mt/ZGVza3RvcC1jb21w/dXRlcnMuanBn',
        about: ''
    },
];

export default function HomeScreen({navigation, route}) {
// const [value, setValue] = useState(value);

const onSearch =(input)=>{

setValue(input);
// console.log
}

    return (
        <View style={{ backgroundColor: '#6AA288' }}>
            <Text style={{ alignSelf: 'center', fontSize: 30, fontWeight: '800', color: 'green' }}>
                ACTIVITY TO DO
            </Text>

            <View style={{flexDirection: 'row',marginHorizontal:25, borderWidth:1,borderColor:'green',borderRadius:5,height:38,backgroundColor:'white'}}>
            <TextInput placeholder='Search here...' onChange={(input)=>{setValue(input) ,onSearch(input)}}/>
            {/* <Image style={{height:15, width:15, alignSelf: 'center'}} source={{uri:'https://cdn1.iconfinder.com/data/icons/jumpicon-basic-ui-glyph-1/32/-_Magnifier-Search-Zoom--512.png'}} /> */}
            </View>

            <ScrollView style={{marginVertical:60, borderWidth:1, marginHorizontal:25, backgroundColor: '#FFD2D2'}}>
                <View style={{flexDirection: "row", flexWrap: 'wrap',justifyContent: "center",}}>
                    {
                        Content.map((item)=>{
                            console.log('data' + JSON.stringify(item, null, 2))
                            return(
                                <TouchableOpacity style={{ flexGrow: 1, justifyContent: 'center', borderRadius: 20, marginHorizontal: 10, backgroundColor: 'white', marginVertical: 15, elevation: 15 }} onPress={() => navigation.navigate('activity')}>
                                    <Image style={{ height: 150, width: 150, resizeMode: 'stretch', borderRadius:20}} source={{ uri: item.img }} />
                                    <Text style={{ textAlign: 'center' }}>{item.title}</Text>
                                </TouchableOpacity>
                            )
                        })
                    }
                </View>
            </ScrollView>
            <View>

            </View>
        </View>
    )
}

const styles = StyleSheet.create({})
