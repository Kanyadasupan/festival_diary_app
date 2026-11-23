# 🎉 Festival Diary App (แอปพลิเคชันบันทึกไดอารี่เทศกาล)

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Dio](https://img.shields.io/badge/Dio-HTTP%20Client-blue?style=for-the-badge)](https://pub.dev/packages/dio)

**Festival Diary App** เป็นแอปพลิเคชันมือถือพัฒนาด้วย **Flutter** สำหรับบันทึกความทรงจำและข้อมูลการท่องเที่ยวตามเทศกาลต่าง ๆ ไม่ว่าจะเป็นชื่อเทศกาล รายละเอียด วันที่เดินทาง ค่าใช้จ่าย และรูปภาพความประทับใจ พร้อมระบบจัดการบัญชีผู้ใช้งานและการเชื่อมต่อกับ Backend REST API

---

## ✨ ฟีเจอร์หลัก (Key Features)

- 🚀 **Splash Screen**: หน้าจอเริ่มต้นแอปพลิเคชันแสดงโลโก้พร้อมแอนิเมชันโหลด
- 🔐 **Authentication System**:
  - **เข้าสู่ระบบ (Login)**: ตรวจสอบสิทธิ์ผู้ใช้งานผ่าน REST API พร้อมฟังก์ชันซ่อน/แสดงรหัสผ่าน
  - **ลงทะเบียน (Register)**: สมัครสมาชิกใหม่ พร้อมถ่ายภาพโปรไฟล์ด้วยกล้อง (`image_picker`) และอัปโหลดด้วย Multipart Request
- 👤 **User Profile**: แสดงข้อมูลส่วนตัวของผู้ใช้งานและรูปโปรไฟล์ที่ดึงมาจากเซิร์ฟเวอร์
- 📅 **Festival Management (ระบบบันทึกเทศกาล)**:
  - บันทึกเทศกาลใหม่ พร้อมรายละเอียด วันที่เดินทาง ค่าใช้จ่าย และรูปภาพเทศกาล
  - ดูรายการเทศกาลที่เคยบันทึกไว้
  - แก้ไขและลบข้อมูลเทศกาล

---

## 🛠️ เทคโนโลยีและเครื่องมือที่ใช้ (Tech Stack)

| หมวดหมู่ | เทคโนโลยี / แพ็กเกจ | คำอธิบาย |
| :--- | :--- | :--- |
| **Framework** | [Flutter](https://flutter.dev) (Dart SDK `^3.7.0`) | Cross-platform Mobile Application |
| **Networking** | [dio](https://pub.dev/packages/dio) (`^5.8.0+1`) | จัดการ HTTP Request (GET, POST, Multipart FormData) |
| **Typography** | [google_fonts](https://pub.dev/packages/google_fonts) (`^6.2.1`) | ฟอนต์ Poppins |
| **Icons** | [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) & `cupertino_icons` | ชุดไอคอนสวยงามทันสมัย |
| **Media** | [image_picker](https://pub.dev/packages/image_picker) (`^1.1.2`) | ถ่ายภาพหรือเลือกรูปจากอุปกรณ์ |
| **App Icon** | [icons_launcher](https://pub.dev/packages/icons_launcher) (`^3.0.1`) | สร้าง App Launcher Icon สำหรับ Android & iOS |

---

## 📁 โครงสร้างโปรเจกต์ (Project Structure)

```text
festival_diary_app/
├── assets/
│   ├── icon/              # ไอคอนแอปพลิเคชัน
│   └── images/            # รูปภาพประกอบ เช่น โลโก้แอป (festlogo.png)
├── lib/
│   ├── constants/         # ค่าคงที่ต่างๆ
│   │   ├── baseurl_constant.dart   # URL สำหรับเชื่อมต่อ Backend API
│   │   └── color_constant.dart     # สีหลักของธีมแอปพลิเคชัน
│   ├── models/            # Data Models สำหรับแปลง JSON
│   │   ├── fest_tb.dart            # โมเดลข้อมูลเทศกาล (Festival)
│   │   └── user_tb.dart            # โมเดลข้อมูลผู้ใช้งาน (User)
│   ├── services/          # เชื่อมต่อ REST API
│   │   └── user_api.dart           # API สำหรับจัดการข้อมูลผู้ใช้และ Login/Register
│   ├── views/             # หน้าจอ UI ต่างๆ ของแอปพลิเคชัน
│   │   ├── splash_screen_ui.dart   # หน้า Splash Screen
│   │   ├── login_ui.dart           # หน้าเข้าสู่ระบบ
│   │   ├── register_ui.dart        # หน้าลงทะเบียนผู้ใช้ใหม่
│   │   ├── home_ui.dart            # หน้าหลักแสดงข้อมูลผู้ใช้
│   │   ├── add_fest_ui.dart        # หน้าเพิ่มข้อมูลเทศกาล
│   │   ├── edit_del_fest_ui.dart   # หน้าแก้ไข/ลบข้อมูลเทศกาล
│   │   └── user_ui.dart            # หน้าตั้งค่าโปรไฟล์ผู้ใช้
│   └── main.dart          # Entry point หลักของแอปพลิเคชัน
├── pubspec.yaml           # รายการ Dependencies และการตั้งค่าโปรเจกต์
└── README.md
```

---

## 🗄️ โครงสร้างข้อมูล (Data Models)

### 1. User (`user_tb`)
| ฟิลด์ | ชนิดข้อมูล | คำอธิบาย |
| :--- | :--- | :--- |
| `userId` | `int` | รหัสผู้ใช้งาน (Primary Key) |
| `userFullname` | `String` | ชื่อ-นามสกุล |
| `userName` | `String` | ชื่อบัญชีผู้ใช้สำหรับเข้าสู่ระบบ |
| `userPassword` | `String` | รหัสผ่าน |
| `userImage` | `String` | ชื่อไฟล์รูปโปรไฟล์ |

### 2. Festival (`fest_tb`)
| ฟิลด์ | ชนิดข้อมูล | คำอธิบาย |
| :--- | :--- | :--- |
| `festId` | `int` | รหัสเทศกาล (Primary Key) |
| `festName` | `String` | ชื่อเทศกาล |
| `festDetial` | `String` | รายละเอียดเทศกาล |
| `festState` | `String` | จังหวัด/สถานที่จัดงาน |
| `festNumdate` | `int` | จำนวนวันที่เดินทาง |
| `festCost` | `int` | ค่าใช้จ่ายโดยประมาณ |
| `userId` | `int` | รหัสผู้ใช้ที่เป็นเจ้าของบันทึก (Foreign Key) |
| `festImage` | `String` | ชื่อไฟล์รูปภาพประกอบเทศกาล |

---

## 🚀 เริ่มต้นใช้งาน (Getting Started)

### ความต้องการของระบบ (Prerequisites)
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (เวอร์ชัน 3.7.0 ขึ้นไป)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio หรือ VS Code ที่ติดตั้ง Flutter Extension
- อุปกรณ์จริง (Android/iOS) หรือ Emulator/Simulator
- เซิร์ฟเวอร์ Backend API สำหรับรับคำขอและจัดเก็บรูปภาพ

### ขั้นตอนการติดตั้งและรัน

1. **โคลนคลังโค้ด (Clone Repository):**
   ```bash
   git clone https://github.com/Kanyadasupan/festival_diary_app.git
   cd festival_diary_app
   ```

2. **ติดตั้ง Dependencies:**
   ```bash
   flutter pub get
   ```

3. **กำหนดค่าการเชื่อมต่อ API:**
   แก้ไข IP Address ของเซิร์ฟเวอร์ Backend ในไฟล์ `lib/constants/baseurl_constant.dart`:
   ```dart
   const baseUrl = 'http://<YOUR_SERVER_IP>:<PORT>';
   ```

4. **รันแอปพลิเคชัน:**
   ```bash
   flutter run
   ```

---

## 👩‍💻 ผู้พัฒนา (Developer)

- **ผู้พัฒนา**: กัญญดา สุพรรณ์ (Kanyada Supan)
- **มหาวิทยาลัย**: มหาวิทยาลัยเอเชียอาคเนย์ (Southeast Asia University - SAU)
- **GitHub**: [@Kanyadasupan](https://github.com/Kanyadasupan)

---

## 📄 ลิขสิทธิ์ (License)

Copyright © 2025 Kanyada. All rights reserved.
