import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import {ConfigService} from "./config";
import {setupSwagger} from "./common/util/swagger";

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const configService = app.get<ConfigService>(ConfigService);

  setupSwagger(app);

  const port = configService.get('APP_PORT');
  await app.listen(port);

  console.info(`Server listening on port ${port}`);
}
bootstrap();
