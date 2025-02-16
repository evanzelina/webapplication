# Use an outdated and potentially insecure base image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json . 
RUN npm install  

# Copy all application files (potentially exposing sensitive files)
COPY . .  

# Expose the application port
EXPOSE 3000

# Running as root (Security Issue - No USER directive)
# This allows the container to have unrestricted access
# which Dockle will flag as a high-risk issue.

# Start the application (No health checks, No security configurations)
CMD ["sh", "-c", "node app.js || tail -f /dev/null"]
