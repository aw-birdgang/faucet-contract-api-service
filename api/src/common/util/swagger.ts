import { INestApplication } from '@nestjs/common';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { ConfigService } from '../../config';

/**
 * Swagger 세팅
 *
 * @param {INestApplication} app
 */
// export function setupSwagger(app: INestApplication): void {
//   const options = new DocumentBuilder()
//     .setTitle('DEV GPEX WALLET API Docs')
//     .setDescription('DEV GPEX WALLET API description')
//     .setVersion('1.0.0')
//     .addBearerAuth(
//       { type: 'http', scheme: 'bearer', bearerFormat: 'JWT' },
//       'JWT',
//     )
//     .build();
//
//   const document = SwaggerModule.createDocument(app, options);
//   SwaggerModule.setup('api-docs', app, document);
// }

export function setupSwagger(app: INestApplication): void {
  const configService = app.get<ConfigService>(ConfigService);
  const version = configService.get('APP_VERSION');
  const env = configService.get('APP_ENV');

  const options = new DocumentBuilder()
    .setTitle(env == 'production' ? 'PROD API Docs' : 'DEV API Docs')
    .setDescription(
      env == 'production' ? 'PROD API description' : 'DEV API description',
    )
    .setVersion(version)
    .addBearerAuth(
      { type: 'http', scheme: 'bearer', bearerFormat: 'JWT' },
      'JWT',
    )
    .build();

  const document = SwaggerModule.createDocument(app, options);
  SwaggerModule.setup('api-docs', app, document);
}
