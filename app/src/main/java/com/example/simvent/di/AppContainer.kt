package com.example.simvent.di

import android.content.Context
import com.example.simvent.data.local.UserPreferences
import com.example.simvent.data.network.ApiConfig
import com.example.simvent.data.repository.AssetRepository
import com.example.simvent.data.repository.AuthRepository
import com.example.simvent.data.repository.RoomRepository

interface AppContainer {
    val authRepository: AuthRepository
    val assetRepository: AssetRepository
    val roomRepository: RoomRepository
}

class DefaultAppContainer(private val context: Context) : AppContainer {

    // 1. Inisialisasi API Service (Network)
    private val apiService by lazy {
        ApiConfig.getApiService()
    }

    // 2. Inisialisasi UserPreferences (Lokal)
    private val userPreferences by lazy {
        UserPreferences(context)
    }

    // 3. Inisialisasi Repositories (Menggabungkan Network & Lokal)
    override val authRepository: AuthRepository by lazy {
        AuthRepository(apiService, userPreferences)
    }

    override val assetRepository: AssetRepository by lazy {
        AssetRepository(apiService)
    }

    override val roomRepository: RoomRepository by lazy {
        RoomRepository(apiService)
    }
}