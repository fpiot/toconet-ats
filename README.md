# ATS programing on ToCoNet [![Build Status](https://api.travis-ci.org/fpiot/toconet-ats.svg)](https://travis-ci.org/fpiot/toconet-ats)

## Demo code

T.B.D.

## Hardware: [TWE-Lite](http://mono-wireless.com/jp/products/index.html)

![](img/TWE-Lite.jpg)

* CPU: [OpenRISC 1200](https://en.wikipedia.org/wiki/OpenRISC_1200)
* Flash ROM: 160 kB
* SRAM: 32 kB
* EEPROM: 4 kB
* Network: [IEEE 802.15.4](https://en.wikipedia.org/wiki/IEEE_802.15.4)

You can get it from following (only for Japan).

* [TWE-Lite](http://mono-wireless.com/jp/products/TWE-001Lite.html)
* [TWE-Lite DIP](http://mono-wireless.com/jp/products/TWE-Lite-DIP/index.html)

And also you need following firemware writer.

* [TWE-Lite R](http://mono-wireless.com/jp/products/TWE-Lite-R/index.html)

## Setup environment
### [Debian GNU/Linux](https://www.debian.org/)

You need [ToCoNet SDK](http://mono-wireless.com/jp/products/ToCoNet/TWESDK.html) to build this product.

```
$ wget ftp://tocos-wireless.com/TWESDK_201408-31-2/TWESDK_201408-31_Linux.tar.bz2
$ tar xf TWESDK_201408-31_Linux.tar.bz2
$ export TWESDK=`pwd`/TWESDK
```

And also need some packages.

```
$ sudo apt-get install python-serial
```

### Mac OS X

T.B.D.

### Windows

T.B.D.

## How to build

Simply type "make" on demo directory.

```
$ git clone https://github.com/fpiot/toconet-ats.git
$ cd toconet-ats/demo/Samp_PingPong/PingPong/Build
$ make
$ ls -l *.bin
-rwxr-xr-x 1 kiwamu kiwamu 51444 Dec 10 21:32 Samp_PingPong_PingPong_JN5164_0_1_4.bin*
```

## Write to the flash

Connect TWE-Lite to your PC using USB cable, and push PRG button and RST button, and release RST, and release PRG.
And run following commands.

```
$ ls -l /dev/ttyUSB0
crw-rw---- 1 root dialout 188, 0 Dec 11 19:58 /dev/ttyUSB0
$ cd toconet-ats/demo/Samp_PingPong/PingPong/Build
$ make write
/home/kiwamu/src/TWESDK/Tools/jenprog/jenprog_1_3/jenprog.py -t /dev/ttyUSB0 -s
*** jenprog ver 1.3 ***
  flash   : JN516x Internal Flash
  chip id : 0x10008686
  mac addr: 0x001bc50121000dc8
/home/kiwamu/src/TWESDK/Tools/jenprog/jenprog_1_3/jenprog.py -t /dev/ttyUSB0 -v Samp_PingPong_PingPong_JN5164_0_1_4.bin
*** jenprog ver 1.3 ***
 file info: 04 03 0008
writing...
  0%..10%..20%..30%..40%..50%..60%..70%..80%..90%..done - 30.05 kb/s
done
verifying...
  0%..10%..20%..30%..40%..50%..60%..70%..80%..90%..: 57.91 kb/s

OK: firmware is successfully programmed.
```

## How to debug using gdb

T.B.D.
