# Vue Jobs Project

Youtube tutorial -> [YouTube crash course](https://www.youtube.com/watch?v=VeNfHj6MhgA).

<img src="public/screen.png" />

## Usage

This project uses JSON-Server for a mock backend.

### Create .env
```env
VITE_APP_API_URL=http://localhost:8000
```

### Run with Docker Compose (Optional)
```bash
docker compose up --build
```

### Install Dependencies

```bash
npm install
```

### Run JSON Server

The server will run on http://localhost:8000

```bash
npm run server
```

### Run Vite Frontend

Vue will run on http://localhost:3000

```bash
npm run dev
```

### Build for Production

```bash
npm run build
```

### Preview Production Build

```bash
npm run preview
```

