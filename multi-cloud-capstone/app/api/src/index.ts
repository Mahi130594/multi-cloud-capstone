import express from 'express';
const app = express();
const port = process.env.PORT || 3000;


app.get('/health', (_, res) => res.json({ ok: true }));
app.get('/api/products', (_, res) => res.json([
{ id: 1, name: 'Notebook', price: 4.99 },
{ id: 2, name: 'Pen', price: 1.49 }
]));


app.listen(port, () => console.log(`API on :${port}`));
