package com.example.simvent.data.model

import kotlinx.serialization.Serializable

@Serializable
data class GeneralResponse(
    val status: String,
    val message: String
)