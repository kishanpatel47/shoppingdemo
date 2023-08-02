import { configureStore } from "@reduxjs/toolkit";
import { userApi } from "./users";

export const store = configureStore({
    reducer: {
        [userApi.reducerPath]: userApi.reducer
    },
    middleware: (gDM) => gDM().concat(userApi.middleware)
})