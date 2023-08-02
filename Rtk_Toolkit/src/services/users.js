import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
export const userApi = createApi({
    reducerPath: 'usersapi',
    baseQuery: fetchBaseQuery({
        baseUrl: 'https://jsonplaceholder.typicode.com/'
    }),
    endpoints: (builder) => ({
        getAllUsera: builder.query({
            query: () => "users"
        }),
        getUserById: builder.query({
        query: (userid) => `user/${userid}`
        })
    })

});
export const { useGetAllUseraQuery,useGetUserByIdQuery } = userApi;
