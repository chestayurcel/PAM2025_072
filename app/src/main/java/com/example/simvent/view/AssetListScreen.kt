package com.example.simvent.view

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Refresh
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.simvent.data.model.AssetItem
import com.example.simvent.viewmodel.AssetUiState
import com.example.simvent.viewmodel.AssetViewModel
import com.example.simvent.viewmodel.ViewModelFactory
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material.icons.filled.Edit
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AssetListScreen(
    onBack: () -> Unit,
    onAddAsset: () -> Unit,
    modifier: Modifier = Modifier,
    assetViewModel: AssetViewModel = viewModel(factory = ViewModelFactory.Factory)
) {
    val uiState = assetViewModel.assetUiState

    LaunchedEffect(Unit) {
        assetViewModel.getAssets()
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Daftar Aset") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(
                            imageVector = Icons.AutoMirrored.Filled.ArrowBack,
                            contentDescription = "Kembali"
                        )
                    }
                },
                actions = {
                    // Tombol Refresh
                    IconButton(onClick = { assetViewModel.getAssets() }) {
                        Icon(Icons.Default.Refresh, contentDescription = "Refresh")
                    }
                }
            )
        },
        floatingActionButton = {
            FloatingActionButton(onClick = onAddAsset) {
                Icon(Icons.Default.Add, contentDescription = "Tambah Aset")
            }
        }
    ) { innerPadding ->

        Box(modifier = modifier.padding(innerPadding).fillMaxSize()) {

            when (uiState) {
                is AssetUiState.Loading -> {
                    CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
                }
                is AssetUiState.Success -> {
                    AssetList(assets = uiState.assets, viewModel = assetViewModel)
                }
                is AssetUiState.Error -> {
                    Column(
                        modifier = Modifier.align(Alignment.Center),
                        horizontalAlignment = Alignment.CenterHorizontally
                    ) {
                        Text(text = uiState.message, color = Color.Red)
                        Button(onClick = { assetViewModel.getAssets() }) {
                            Text("Coba Lagi")
                        }
                    }
                }
            }
        }
    }
}

// Komponen Item List (Card)
@Composable
fun AssetList(
    assets: List<AssetItem>,
    viewModel: AssetViewModel
) {
    if (assets.isEmpty()) {
        Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
            Text("Belum ada data aset.")
        }
    } else {
        LazyColumn(
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(assets) { asset ->
                AssetCard(asset, viewModel)
            }
        }
    }
}

@Composable
fun AssetCard(asset: AssetItem, viewModel: AssetViewModel) {
    var showDialog by remember { mutableStateOf(false) }

    // DIALOG KONFIRMASI HAPUS
    if (showDialog) {
        AlertDialog(
            onDismissRequest = { showDialog = false },
            title = { Text("Hapus Aset?") },
            text = { Text("Apakah Anda yakin ingin menghapus '${asset.assetName}'?") },
            confirmButton = {
                TextButton(onClick = {
                    viewModel.deleteAsset(asset.assetId) // Panggil Fungsi Hapus
                    showDialog = false
                }) { Text("Hapus", color = Color.Red) }
            },
            dismissButton = {
                TextButton(onClick = { showDialog = false }) { Text("Batal") }
            }
        )
    }

    Card(
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp),
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = asset.assetName,
                    fontSize = 18.sp,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.weight(1f)
                )

                Row {
                    // Tombol Hapus
                    IconButton(onClick = { showDialog = true }) {
                        Icon(Icons.Default.Delete, contentDescription = "Hapus", tint = Color.Red)
                    }
                    // Tombol Edit
                    IconButton(onClick = {  }) {
                        Icon(Icons.Default.Edit, contentDescription = "Edit", tint = Color.Gray)
                    }
                }
            }

            Spacer(modifier = Modifier.height(4.dp))

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(text = "Qty: ${asset.qty} ${asset.unit}")
                Text(
                    text = asset.condition,
                    color = if (asset.condition == "Baik") Color.Green else Color.Red
                )
            }
            Text(text = "Ruang: ${asset.roomName ?: "-"}", fontSize = 12.sp, color = Color.Gray)
        }
    }
}