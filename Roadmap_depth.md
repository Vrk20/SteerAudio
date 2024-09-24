# Media Control App Development Roadmap

This roadmap outlines the weekly development plan for the Media Control App. The app’s main feature is to allow users to control audio output across different media apps and devices.

---

## **Phase 1: Requirements Gathering and Design (Week 1)**

### Objective:
Define app features, functionality, and design.

### Tasks:
1. **Feature Definition**:
   - Write down all the core features of the app:
     - Display media currently playing.
     - Allow users to select audio output devices for different apps (Bluetooth, speaker, etc.).
     - Manage permissions (notification and Bluetooth).
   
2. **User Flow Mapping**:
   - Define user flow for actions like:
     - Seeing a list of media apps currently playing.
     - Selecting an app → Choosing an audio output device.
   
3. **Wireframes or UI Mockups**:
   - Design rough wireframes or use a tool (e.g., Figma) for UI design.
   - Focus on the following:
     - List of media playing.
     - Expandable media items for output selection.

4. **Technology Decisions**:
   - Confirm Flutter framework.
   - Identify additional libraries (`permission_handler`, `audio_manager`).

5. **Finalize Requirements Document**:
   - Document all features, user flows, and designs for future reference.

---

## **Phase 2: Setting Up Flutter Environment and Basic UI (Week 2)**

### Objective:
Set up the Flutter environment and build the initial UI.

### Tasks:
1. **Set Up Flutter Project**:
   - Install Flutter and set up the project using `flutter create project_name`.
   - Add dependencies in `pubspec.yaml`:
     - `permission_handler`, `flutter_bloc`, etc.

2. **Implement Basic UI**:
   - **Media List Screen**:
     - Create a list to display media currently playing.
     - Make the media items expandable to show more details (e.g., artist, app, output device).

3. **UI Components**:
   - Create reusable widgets for media items.
   - Add buttons or dropdowns for selecting audio output.

4. **Testing the UI**:
   - Run the app on both physical and virtual devices to ensure basic UI functionality.

---

## **Phase 3: Implementing Permissions and Basic Audio Management (Weeks 3-4)**

### Objective:
Implement user permissions and set up basic audio management.

#### Week 3 Tasks:
1. **Integrate `permission_handler`**:
   - Add permission requests for notifications and Bluetooth access.
   - Modify the `MediaInfo` class to handle permission requests.
   
2. **Permission Flow**:
   - On app start, request permissions for:
     - **Notification access** to get media info from notifications.
     - **Bluetooth access** for handling Bluetooth audio output.
   - Show a dialog to the user if permissions are denied.

3. **Error Handling for Permissions**:
   - Guide the user on how to enable permissions if denied.
   - Test permission flow on different devices.

#### Week 4 Tasks:
1. **Set Up Audio Management (Native Code)**:
   - Write basic Android native code using `AudioManager` to manage audio outputs.
   - Create method channels in Flutter to communicate with Android native functions.

2. **Fetch Available Audio Devices**:
   - Implement a method to get available audio output devices (Bluetooth, speaker).
   - Update the Flutter UI to show the list of devices when the user selects a media item.

3. **Test Basic Audio Management**:
   - Test basic functionality by selecting an output device and verifying the audio routing.

---

## **Phase 4: Advanced Audio Routing Logic (Weeks 5-7)**

### Objective:
Implement advanced features for audio routing between different apps and output devices.

#### Week 5 Tasks:
1. **Audio Routing Logic**:
   - Implement logic to route audio from different apps to selected output devices (e.g., Spotify to speaker, YouTube to Bluetooth).
   - Write Android native code for handling multiple audio streams.

2. **Expand UI for Audio Output Selection**:
   - When a user clicks on a media item, show available audio output devices (e.g., Bluetooth, speaker).
   - Allow the user to select the output device, and route the audio accordingly.

3. **Debugging and Edge Cases**:
   - Test with multiple apps (Spotify, YouTube, etc.) playing simultaneously.
   - Handle edge cases such as switching audio outputs and managing multiple media streams.

---

### **Overview of Weekly Tasks**

- **Week 1**: Finalize app features, create wireframes, and define user flows.
- **Week 2**: Set up the Flutter project, build the media list UI, and implement expandable media items.
- **Week 3**: Integrate `permission_handler`, handle notifications and Bluetooth permissions, and provide user guidance for denied permissions.
- **Week 4**: Implement basic audio management using `AudioManager`, create method channels, and fetch available audio output devices.
- **Week 5**: Implement advanced audio routing logic, expand the UI for audio output selection, and handle edge cases.

---

This roadmap will guide the development process for your Media Control App, helping you track progress and manage tasks each week.
