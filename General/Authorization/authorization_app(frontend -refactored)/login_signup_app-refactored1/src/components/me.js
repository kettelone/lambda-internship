import React from "react"
import { useEffect } from "react"
import {getMe} from "../actions/index"
import {useSelector, useDispatch} from 'react-redux'
import {ME} from "../reducers/types"

const Me = () =>{

const message = useSelector(state => state.Me.message)
const dispatch = useDispatch()

    useEffect(()=>{
     getMe(
         localStorage.getItem("accessToken"),
         localStorage.getItem("refreshToken")
         ).then((response) => dispatch({ type: ME, payload: response }))

    },[])
    return(
        <div className="form">
           <h2 style={{textAlign: "center"}}>{message}</h2>
        </div> 
    )
}

  export default Me;
  