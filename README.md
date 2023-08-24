# SVXRepeater ([RF.Guru SVXRepeater](https://rf.guru/2023-k-041))

Prepare your sd-card with Raspberry PI OS Lite ! ([Youtube](https://www.youtube.com/watch?v=vxmO_a5WNI8))

Login to your system with ssh add run following commands:

### Install GIT  ###
```console
sudo apt -y install git
```

### Clone repostory ###
```console
git clone https://github.com/Guru-RF/SVXRepeater.git
```

### Audio and Radio module installation script ###
```console
cd SVXRepeater
sudo bash install-radiomodule.sh
```

### SVXLink installation script ###
```console
cd SVXRepeater
sudo bash install-svxlink.sh
```

### GPIO Pins
Description of the GPIO pins
```text
GPIO 7 -> output ... Drive High for disabling the audio bypass (audio is in bypass by default)
GPIO 8 -> output ... Optional PTT bypss (see breakout)
GPIO 16 -> output ... Drive PTT (for any type of PTT (relay)
GPIO 12 -> input ... COS ... depending on your tranceiver ... logic voltage can be between 3.3v and 24v
```
