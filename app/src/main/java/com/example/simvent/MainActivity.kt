package com.example.simvent

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.navigation.compose.rememberNavController
import com.example.simvent.ui.theme.SIMVENTTheme
import com.example.simvent.uicontroller.NavigationMap
import com.example.simvent.uicontroller.route.Screen
import com.example.simvent.viewmodel.ViewModelFactory

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val appContainer = (application as SimventApplication).container
        val authRepository = appContainer.authRepository

        val token = authRepository.getSessionToken()

        val startDest = if (token != null) {
            Screen.Dashboard.route
        } else {
            Screen.Login.route
        }

        setContent {
            SIMVENTTheme {
                val navController = rememberNavController()
                NavigationMap(
                    navController = navController,
                    startDestination = startDest
                )
            }
        }
    }
}