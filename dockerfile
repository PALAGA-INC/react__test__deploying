# Menggunakan base image Node.js
FROM node:14-alpine

# Mengatur direktori kerja di dalam container
WORKDIR /app

# Menyalin file package.json dan package-lock.json ke dalam container
COPY package*.json ./

# Menginstal dependensi
RUN npm install

# Menyalin seluruh file dari direktori proyek Anda ke dalam container
COPY . .

# Mengeksekusi perintah build React
RUN npm run build

# Mengatur environment variable untuk produksi
ENV NODE_ENV=production

# Mengatur port yang akan digunakan
ENV PORT=3000

# Mengexpose port yang telah ditentukan
EXPOSE $PORT

# Menjalankan perintah untuk menjalankan aplikasi React
CMD [ "npm", "start" ]
