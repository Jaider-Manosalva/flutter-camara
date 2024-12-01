import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen({required this.cameras});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int _selectedCameraIndex = 0; // Índice de la cámara activa (0 = trasera, 1 = delantera)
  bool _isChangingCamera = false; // Estado para evitar cambios simultáneos

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() {
    _controller = CameraController(
      widget.cameras[_selectedCameraIndex],
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _switchCamera() async {
    if (_isChangingCamera) return; // Evitar múltiples cambios simultáneos
    setState(() {
      _isChangingCamera = true;
    });

    try {
      // Cambiar al siguiente índice de cámara
      setState(() {
        _selectedCameraIndex = (_selectedCameraIndex + 1) % widget.cameras.length;
      });

      // Libera la cámara actual
      await _controller.dispose();

      // Inicializa la nueva cámara
      _initializeCamera();
      await _initializeControllerFuture;
    } catch (e) {
      print("Error al cambiar de cámara: $e");
    } finally {
      setState(() {
        _isChangingCamera = false;
      });
    }
  }

  Future<void> _capturePhoto() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      // Muestra la foto en una nueva pantalla sin guardarla
      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(imagePath: image.path),
        ),
      );
    } catch (e) {
      print("Error al capturar la foto: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al capturar la foto')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cámara')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Verificar si la cámara activa es la cámara frontal
            bool isFrontCamera =
                widget.cameras[_selectedCameraIndex].lensDirection == CameraLensDirection.front;

            return Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: isFrontCamera
                      ? Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(3.14159), // Refleja horizontalmente
                          child: CameraPreview(_controller),
                        )
                      : CameraPreview(_controller),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'switchCamera',
            onPressed: _switchCamera,
            child: Icon(Icons.switch_camera),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'takePhoto',
            onPressed: _capturePhoto,
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  DisplayPictureScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Foto capturada')),
      body: Image.file(File(imagePath)),
    );
  }
}
