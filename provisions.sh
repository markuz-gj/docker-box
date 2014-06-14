BASE_PATH=$PWD

# apt-get update &&
apt-get install -y curl wget libssl-dev git-core  build-essential || exit 10

# installing n, nodejs stable and latest
# [ -d "/usr/local/lib/node_modules" ] || {
  cd /root
  git clone --depth=1 "https://github.com/visionmedia/n.git" /root/n &&
  cd n && make install && n stable && n latest && cd /root &&
  rm -rf /root/n || echo 'nodejs install failed'
  # using stable nodejs, and installing basic global pkgs.
  n stable &&
  npm config set prefix="/usr/local" &&
  npm install -g pm2 yo bower gulp grunt-cli &&
  cd $BASE_PATH || echo 'npm install failed'
# }

# installing docker
# [ -f "/etc/apt/sources.list.d/docker.list" ] || {
  echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list &&
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 &&
  apt-get update &&
  apt-get install -y lxc-docker &&
  docker run ubuntu:14.04 echo 'docker installed and working' &&
  usermod -aG docker vagrant || echo 'docker install failed'
# }

# installing packer
# if ! which packer >/dev/null; then
  PACKER_VERSION=0.6.0
  PACKER_URL="https://dl.bintray.com/mitchellh/packer/${PACKER_VERSION}_linux_amd64.zip"

  apt-get -y install unzip &&
  wget "$PACKER_URL" -O /tmp/packer-${PACKER_VERSION}.zip &&
  cd /tmp && unzip -o -qq packer-$PACKER_VERSION.zip -d /usr/local/bin/ &&
  rm -rf /tmp/packer-${PACKER_VERSION}.zip || echo 'packer install failed'
# fi

# clean up
# TODO:
# clean npm and apt cache
