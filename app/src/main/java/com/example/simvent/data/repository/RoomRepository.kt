package com.example.simvent.data.repository

import com.example.simvent.data.model.GeneralResponse
import com.example.simvent.data.model.RoomItem
import com.example.simvent.data.model.RoomResponse
import com.example.simvent.data.network.ApiService

class RoomRepository(
    private val apiService: ApiService
) {
    private fun generateBearer(token: String) = "Bearer $token"

    // 1. Ambil Semua Ruangan
    suspend fun getRooms(token: String): Result<RoomResponse> {
        return try {
            val response = apiService.getRooms(generateBearer(token))
            if (response.status == "success") {
                Result.success(response)
            } else {
                Result.failure(Exception(response.message ?: "Gagal memuat ruangan"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    // 2. Buat Ruangan Baru
    suspend fun createRoom(token: String, name: String, desc: String): Result<GeneralResponse> {
        return try {
            val room = RoomItem(0, name, desc)
            val response = apiService.createRoom(generateBearer(token), room)

            if (response.status == "success") Result.success(response)
            else Result.failure(Exception(response.message))
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    // 3. Update Ruangan
    suspend fun updateRoom(token: String, id: Int, name: String, desc: String): Result<GeneralResponse> {
        return try {
            val room = RoomItem(id, name, desc)
            val response = apiService.updateRoom(generateBearer(token), room)

            if (response.status == "success") Result.success(response)
            else Result.failure(Exception(response.message))
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    // 4. Hapus Ruangan (Validasi aset ada di server)
    suspend fun deleteRoom(token: String, roomId: Int): Result<GeneralResponse> {
        return try {
            val idMap = mapOf("room_id" to roomId)
            val response = apiService.deleteRoom(generateBearer(token), idMap)

            if (response.status == "success") Result.success(response)
            else Result.failure(Exception(response.message))
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}