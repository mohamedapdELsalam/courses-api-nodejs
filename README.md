#  Full-Stack Courses Application (Flutter + Node.js/Express)

A modern full-stack courses application built with **Flutter** for the mobile app and **Node.js + Express** for the backend API.  
The project includes authentication, course management, media uploads, payments, reviews, and more.

---

## 🚀 Features
- **JWT Authentication**
- **Role-Based Access:** Student / Instructor
- **Course CRUD Operations**
- **Video & File Uploads** (Cloudinary / AWS S3)
- **Enrollments & Purchases**
- **Course Reviews & Ratings**
- **Search & Filters**
- **Push Notifications** (FCM)
- **Instructor Dashboard**

---

## 🛠️ Tech Stack

### 🔹 Frontend (Flutter)
- Flutter (Dart)
- GetX / Provider / Bloc
- dio / http
- Firebase (optional)

### 🔹 Backend (Node.js / Express)
- Express.js
- MongoDB (Mongoose) or PostgreSQL
- JWT Authentication
- Multer (file uploads)
- Cloudinary / AWS S3
- Stripe / PayPal (optional payments)

---

## 📂 Project Structure
```
root
 ├── client/              # Flutter App
 │    ├── lib/
 │    └── pubspec.yaml
 │
 ├── server/              # Backend API
 │    ├── src/
 │    │    ├── controllers/
 │    │    ├── models/
 │    │    ├── routes/
 │    │    ├── middlewares/
 │    │    └── app.js
 │    └── package.json
 │
 └── README.md
```

---

## ⚙️ Backend Setup

### 1. Install Dependencies
```bash
cd server
npm install
```

### 2. Environment Variables (`.env`)
```
PORT=5000
MONGO_URI=your_mongo_connection
JWT_SECRET=your_secret
CLOUDINARY_CLOUD_NAME=xxx
CLOUDINARY_API_KEY=xxx
CLOUDINARY_API_SECRET=xxx
STRIPE_SECRET_KEY=xxx
```

### 3. Run Server
```bash
npm run dev     # development
npm start       # production
```

---

## 🔗 API Endpoints (Examples)

### Auth
- `POST /api/auth/register`
- `POST /api/auth/login`

### Courses
- `GET /api/courses`
- `GET /api/courses/:id`
- `POST /api/courses`  (Instructor)
- `PUT /api/courses/:id`
- `DELETE /api/courses/:id`

### Enrollments
- `POST /api/courses/:id/enroll`

---

## 📱 Frontend Setup (Flutter)

```bash
cd client
flutter pub get
flutter run
```

### Configure API URL:
```dart
const String API_URL = "http://10.0.2.2:5000/api";
```

---

## 🚀 Deployment Notes
- Use HTTPS + secure environment variables
- Deploy backend on Render / Railway / DigitalOcean / AWS
- Deploy Flutter app on Play Store / App Store
- Or build Flutter Web → host on Firebase/Vercel

---

## 🧪 Testing

### Backend
```bash
npm test
```

### Flutter
```bash
flutter test
```

---

## 🤝 Contributing
1. Fork repo  
2. Create branch: `git checkout -b feat/new-feature`  
3. Commit & push  
4. Submit PR  

---


