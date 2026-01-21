npx prisma migrate dev --name init
npx prisma generate
npx prisma reset

copy .env.example to .env = cp .env.example .env