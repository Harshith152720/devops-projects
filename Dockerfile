# 1) build stage
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
RUN npm run lint || true

# 2) production image
FROM node:18-alpine
WORKDIR /app
ENV NODE_ENV=production
# create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=builder /app/package*.json ./
RUN npm ci --production
COPY --from=builder /app/server.js ./server.js
USER appuser
EXPOSE 3000
CMD ["node", "server.js"]
