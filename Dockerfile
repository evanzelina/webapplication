# Use the official Node.js image
FROM node:16

# Create and set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application and keep the container alive
CMD ["sh", "-c", "node app.js || tail -f /dev/null"]
