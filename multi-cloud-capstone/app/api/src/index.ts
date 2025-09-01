import express, { Request, Response } from 'express';
import cors from 'cors';
import helmet from 'helmet';
import pino from 'pino';
import productsRouter from './routes/products';


const logger = pino();
const app = express();
const port = process.env.PORT ? Number(process.env.PORT) : 3000;


app.use(helmet());
app.use(cors());
app.use(express.json());


app.use('/api', productsRouter);


app.get('/health', (_req: Request, res: Response) => {
res.json({ status: 'ok' });
});


app.listen(port, () => {
logger.info({ port }, `Product API listening on ${port}`);
});
