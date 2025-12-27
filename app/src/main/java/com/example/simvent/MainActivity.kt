package com.example.simvent

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.navigation.compose.rememberNavController
import com.example.simvent.ui.theme.SIMVENTTheme
import com.example.simvent.uicontroller.NavigationMap

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            SIMVENTTheme {
                val navController = rememberNavController()
                NavigationMap(navController = navController)
            }
        }
    }
}