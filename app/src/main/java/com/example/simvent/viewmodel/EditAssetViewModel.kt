package com.example.simvent.viewmodel

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.simvent.data.model.AssetItem
import com.example.simvent.data.model.RoomItem
import com.example.simvent.data.repository.AssetRepository
import com.example.simvent.data.repository.AuthRepository
import com.example.simvent.data.repository.RoomRepository
import kotlinx.coroutines.launch
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

sealed interface EditAssetUiState {
    object Idle : EditAssetUiState
    object Loading : EditAssetUiState
    object Success : EditAssetUiState
    data class Error(val message: String) : EditAssetUiState
}

class EditAssetViewModel(
    private val assetRepository: AssetRepository,
    private val roomRepository: RoomRepository,
    private val authRepository: AuthRepository
) : ViewModel() {

    var uiState: EditAssetUiState by mutableStateOf(EditAssetUiState.Idle)
        private set

    // State untuk Form
    var name by mutableStateOf("")
    var qty by mutableStateOf("")
    var unit by mutableStateOf("")
    var condition by mutableStateOf("Baik")
    var desc by mutableStateOf("")
    var selectedRoom: RoomItem? by mutableStateOf(null)

    // Data Dropdown
    var roomList: List<RoomItem> by mutableStateOf(emptyList())
        private set

    // Load data awal (Ruangan & Detail Aset)
    fun loadInitialData(assetId: Int) {
        viewModelScope.launch {
            uiState = EditAssetUiState.Loading
            val token = authRepository.getSessionToken()

            if (token != null) {
                // 1. Ambil Daftar Ruangan dulu
                val roomResult = roomRepository.getRooms(token)
                if (roomResult.isSuccess) {
                    roomList = roomResult.getOrNull()?.data ?: emptyList()

                    // 2. Ambil Detail Aset
                    val assetResult = assetRepository.getAssetById(token, assetId)
                    if (assetResult.isSuccess) {
                        val asset = assetResult.getOrNull()
                        if (asset != null) {
                            // Isi Form dengan data lama
                            name = asset.assetName
                            qty = asset.qty.toString()
                            unit = asset.unit
                            condition = asset.condition
                            desc = asset.itemDesc ?: ""
                            selectedRoom = roomList.find { it.roomId == asset.roomId }

                            uiState = EditAssetUiState.Idle
                        }
                    } else {
                        uiState = EditAssetUiState.Error("Gagal memuat data aset")
                    }
                } else {
                    uiState = EditAssetUiState.Error("Gagal memuat ruangan")
                }
            }
        }
    }

    fun updateAsset(assetId: Int) {
        viewModelScope.launch {
            uiState = EditAssetUiState.Loading
            val token = authRepository.getSessionToken()

            if (token != null && selectedRoom != null) {
                try {
                    val qtyInt = qty.toIntOrNull() ?: 0
                    // Tanggal hari ini untuk update history
                    val currentDate = SimpleDateFormat("yyyy-MM-dd", Locale.getDefault()).format(Date())

                    val asset = AssetItem(
                        assetId = assetId,
                        assetName = name,
                        qty = qtyInt,
                        unit = unit,
                        condition = condition,
                        entryDate = currentDate,
                        itemDesc = desc,
                        roomId = selectedRoom!!.roomId,
                        roomName = null
                    )

                    val result = assetRepository.updateAsset(token, asset)

                    uiState = if (result.isSuccess) {
                        EditAssetUiState.Success
                    } else {
                        EditAssetUiState.Error(result.exceptionOrNull()?.message ?: "Gagal update")
                    }
                } catch (e: Exception) {
                    uiState = EditAssetUiState.Error(e.message ?: "Error input")
                }
            }
        }
    }

    fun resetState() { uiState = EditAssetUiState.Idle }
}