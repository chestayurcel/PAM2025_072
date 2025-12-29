package com.example.simvent.viewmodel

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.simvent.data.repository.AuthRepository
import com.example.simvent.data.repository.RoomRepository
import kotlinx.coroutines.launch

sealed interface AddRoomUiState {
    object Idle : AddRoomUiState
    object Loading : AddRoomUiState
    object Success : AddRoomUiState
    data class Error(val message: String) : AddRoomUiState
}

class AddRoomViewModel(
    private val roomRepository: RoomRepository,
    private val authRepository: AuthRepository
) : ViewModel() {

    var uiState: AddRoomUiState by mutableStateOf(AddRoomUiState.Idle)
        private set

    fun addRoom(name: String, desc: String) {
        viewModelScope.launch {
            uiState = AddRoomUiState.Loading
            val token = authRepository.getSessionToken()

            if (token != null) {
                val result = roomRepository.createRoom(token, name, desc)
                uiState = if (result.isSuccess) {
                    AddRoomUiState.Success
                } else {
                    AddRoomUiState.Error(result.exceptionOrNull()?.message ?: "Gagal menyimpan")
                }
            } else {
                uiState = AddRoomUiState.Error("Sesi habis")
            }
        }
    }

    // Reset status agar kalau masuk lagi formnya bersih
    fun resetState() {
        uiState = AddRoomUiState.Idle
    }
}