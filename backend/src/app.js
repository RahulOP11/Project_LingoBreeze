const express = require('express');
const cors = require('cors');
const wordRoutes = require('./routes/wordRoutes');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Health Check Route
app.get('/', (req, res) => {
  res.status(200).json({
    success: true,
    message: 'LingoBreeze API is running',
  });
});

// API Routes
app.use('/api', wordRoutes);

// Handle Unknown Routes
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: 'Route not found',
  });
});

// Start Server
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`🚀 LingoBreeze Backend running on port ${PORT}`);
  console.log(`📖 API Endpoint: http://localhost:${PORT}/api/words`);
});