# 📸 **Flutter Camera App**

Esta es una aplicación de Flutter que permite al usuario capturar fotos utilizando la cámara de un dispositivo móvil. Incluye funcionalidades como cambiar entre la cámara delantera y trasera y mostrar la foto capturada sin necesidad de guardarla en la galería.

---

## ✨ **Características**

- 📷 **Captura de fotos**:
  - Permite tomar fotos desde la cámara del dispositivo.
- 🔄 **Cambio entre cámaras**:
  - Alterna entre la cámara trasera y la cámara frontal.
- 🔍 **Corrección de la cámara frontal**:
  - La vista previa de la cámara frontal está reflejada correctamente.
- 🖼️ **Vista previa de la foto capturada**:
  - La imagen tomada se muestra en una pantalla adicional.

---

## ✅ **Requisitos previos**

### 🛠️ **1. Herramientas necesarias**
- [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado y configurado.
- Un editor de código, como [Visual Studio Code](https://code.visualstudio.com/) o [Android Studio](https://developer.android.com/studio).
- Un dispositivo físico o emulador configurado para probar la aplicación.

### 📦 **2. Dependencias**
La aplicación utiliza los siguientes paquetes:
- **camera**: Controla la cámara del dispositivo.
- **path_provider**: Permite acceder al sistema de archivos.
- **image**: Proporciona manipulación de imágenes.

---

## 🛠️ **Configuración del proyecto**

### 🚀 **1. Clonar el repositorio**
Clona este proyecto en tu máquina local:
```bash
git clone https://github.com/Jaider-Manosalva/flutter-camara.git
cd flutter-camara
```

### 📦 **2. Instalar dependencias**
Ejecuta el siguiente comando para instalar las dependencias del proyecto:
```bash
flutter pub get
```

### 🔑 **3. Configurar permisos**

#### 📱 **Android**
1. Abre el archivo `android/app/src/main/AndroidManifest.xml`.
2. Agrega los permisos necesarios dentro de la etiqueta `<manifest>`:
   ```xml
   <uses-permission android:name="android.permission.CAMERA"/>
   <uses-permission android:name="android.permission.RECORD_AUDIO"/>
   ```

3. Verifica que el bloque `<application>` contenga el atributo:
   ```xml
   <uses-feature android:name="android.hardware.camera" android:required="true"/>
   ```

#### 🍎 **iOS**
1. Abre el archivo `ios/Runner/Info.plist`.
2. Agrega las siguientes líneas para configurar los permisos:
   ```xml
   <key>NSCameraUsageDescription</key>
   <string>Esta aplicación necesita acceder a la cámara para capturar fotos.</string>
   ```

---

## 📂 **Estructura del Proyecto**

```plaintext
.
├── lib/
│   ├── main.dart               # Entrada principal de la aplicación
│   ├── camera_screen.dart      # Pantalla principal para capturar fotos
├── android/                    # Archivos específicos para Android
├── ios/                        # Archivos específicos para iOS
├── pubspec.yaml                # Configuración del proyecto y dependencias
```

---

## ▶️ **Cómo ejecutar la aplicación**

1. Asegúrate de que un dispositivo o emulador está conectado.
2. Limpia cualquier caché anterior:
   ```bash
   flutter clean
   ```
3. Compila y ejecuta el proyecto:
   ```bash
   flutter run
   ```

---

## 📝 **Uso de la aplicación**

1. **Captura de fotos**:
   - Al abrir la aplicación, se muestra la vista previa de la cámara.
   - Presiona el botón de la cámara para capturar una foto.
   - La foto se mostrará en una nueva pantalla.

2. **Cambio entre cámaras**:
   - Utiliza el botón de cambio de cámara para alternar entre la cámara trasera y la delantera.

---

## 🔧 **Personalización**

Si deseas añadir más funcionalidades, como guardar la foto en la galería o grabar videos, consulta la [documentación oficial de Flutter Camera](https://pub.dev/packages/camera).

---

## ❓ **Errores comunes y soluciones**

### ❌ **1. Cámara no se inicializa**
- Asegúrate de que los permisos de cámara están configurados correctamente.
- Verifica que la aplicación tenga acceso a la cámara en la configuración del dispositivo.

### 🔄 **2. Error al cambiar de cámara**
- Este problema puede deberse a una inicialización incorrecta del controlador. Asegúrate de liberar correctamente los recursos de la cámara antes de cambiar.

### ⚙️ **3. Build failed**
- Limpia el proyecto con `flutter clean` y asegúrate de que las dependencias están instaladas con `flutter pub get`.

---

## 🤝 **Contribuciones**

¡Las contribuciones son bienvenidas! Si tienes mejoras o encuentras errores, no dudes en abrir un `issue` o enviar un `pull request`.

---

## 📝 **Licencia**

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.

