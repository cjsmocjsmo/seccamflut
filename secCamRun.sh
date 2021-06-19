flutter clean && \
flutter build web && \
docker-compose down && \
docker build -t seccamhttpdimg . && \
docker-compose up -d --build && \
snapcraft --use-lxd && \
sudo snap install --dangerous sec*snap

