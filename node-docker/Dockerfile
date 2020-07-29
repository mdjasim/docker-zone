FROM node
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app

COPY wait-for-it.sh /
RUN chmod +x /wait-for-it.sh
# RUN npm run build

CMD /wait-for-it.sh db:3306 -- npm run start

# CMD ["npm", "start"]

# ## THE LIFE SAVER
# ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
# RUN chmod +x /wait

# ## Launch the wait tool and then your application
# CMD /wait && npm start
# ENTRYPOINT ["sh", "./wait-for-it.sh"]