FROM quay.io/lyfe00011/md:beta

# Clone the LyFE bot repo
RUN git clone https://github.com/lyfe00011/levanter.git /root/LyFE/
WORKDIR /root/LyFE/

# Install dependencies
RUN yarn install

# Install Express for keep-alive server
RUN yarn add express

# Copy the keep-alive script
COPY keepalive.js .

# Expose the keep-alive port
EXPOSE 3000

# Start the keep-alive server + bot
CMD ["sh", "-c", "node keepalive.js & npm start"]