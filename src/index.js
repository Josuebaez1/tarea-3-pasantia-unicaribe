const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({ status: 'ok', message: 'Servicio Node.js activo' });
});

app.get('/health', (req, res) => {
  res.status(200).send('healthy');
});

app.listen(PORT, () => {
  console.log(`Servidor activo en el puerto ${PORT}`);
});