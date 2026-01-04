package com.example.simvent.viewmodel

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.simvent.data.repository.AuthRepository
import com.example.simvent.data.repository.RoomRepository
import kotlinx.coroutines.launch

sealed interface EditRoomUiState {
    object Idle : EditRoomUiState
    object Loading : EditRoomUiState
    object Success : EditRoomUiState
    data class Error(val message: String) : EditRoomUiState
}

class EditRoomViewModel(
    private val roomRepository: RoomRepository,
    private val authRepository: AuthRepository
) : ViewModel() {

    var uiState: EditRoomUiState by mutableStateOf(EditRoomUiState.Idle)
        private set

    // Form State
    var name by mutableStateOf("")
    var desc by mutableStateOf("")

    // 1. Load Data Lama
    fun loadRoom(id: Int) {
        viewModelScope.launch {
            uiState = EditRoomUiState.Loading
            val token = authRepository.getSessionToken()
            if (token != null) {
                val result = roomRepository.getRoomById(token, id)
                if (result.isSuccess) {
                    val room = result.getOrNull()
                    name = room?.roomName ?: ""
                    desc = room?.roomDesc ?: ""
                    uiState = EditRoomUiState.Idle
                } else {
                    uiState = EditRoomUiState.Error("Gagal memuat data")
                }
            }
        }
    }

    // 2. Update Data
    fun updateRoom(id: Int) {
        viewModelScope.launch {
            uiState = EditRoomUiState.Loading
            val token = authRepository.getSessionToken()
            if (token != null) {
                val result = roomRepository.updateRoom(token, id, name, desc)
                if (result.isSuccess) {
                    uiState = EditRoomUiState.Success
                } else {
                    uiState = EditRoomUiState.Error(result.exceptionOrNull()?.message ?: "Gagal update")
                }
            }
        }
    }

    fun resetState() { uiState = EditRoomUiState.Idle }
}