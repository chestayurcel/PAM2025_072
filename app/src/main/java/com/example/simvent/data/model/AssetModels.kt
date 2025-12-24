package com.example.simvent.data.model

import kotlinx.serialization.Serializable
import kotlinx.serialization.SerialName

// 1. Model untuk Respon Daftar Aset (Pagination)
@Serializable
data class AssetResponse(
    val status: String,
    val page: Int? = null,
    val message: String? = null,
    val data: List<AssetItem>? = null
)

// 2. Model Single Object (Satu Aset)
@Serializable
data class AssetItem(
    @SerialName("asset_id") val assetId: Int,
    @SerialName("asset_name") val assetName: String,
    val qty: Int,
    val unit: String,
    val condition: String,     // "Baik" atau "Rusak"
    @SerialName("entry_date") val entryDate: String,
    @SerialName("item_desc") val itemDesc: String?,
    @SerialName("room_id") val roomId: Int,
    @SerialName("room_name") val roomName: String? = null // Tambahan dari JOIN tabel
)