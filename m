Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C606B168E38
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 11:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbgBVK0Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 05:26:16 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:26628 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbgBVK0B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Feb 2020 05:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582367158;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=SiwwAkpMQ5R9PFzitEkUcxAMsUE5YVrpE889lO+ukdA=;
        b=bXX9h/iLzi9QefgnTJAtvhUvND95se8JweonUIslVPTVx78OLgkLJO/ycGyxq9ywYx
        B/fuqOy6dtMDvyO1hgBLFjwyUFZZC5wCU0lnnXwCw+pQZZ9vnsq/9/K55z0AcS7qg17y
        354eM0iL860+E4icTqWwvRYyxTUvs4JK8bbIyHUkkRE4ozK50E2zwGXyB3XM2tUGT4JQ
        UbtFJrmuzDX7ND9eeItmva5bJBOFqNgVuIhZrNk6+NCK29r+IMM0zlR4WuWqaH17IcJ7
        xlm8VrZQ4NxsPXLmwrBl+N7gKSn43ag5VH/3JbwXawXJJVdA7EcVwTG4lBgoz4v2aFXU
        bZSA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAz7pC6Q5M"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1MAPgjMZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 22 Feb 2020 11:25:42 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH v5 0/6] MIPS: CI20: Add efuse driver for Ingenic JZ4780 and attach to DM9000 for stable MAC addresses
Date:   Sat, 22 Feb 2020 11:25:35 +0100
Message-Id: <cover.1582367141.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* no longer RFC but PATCH
* add yaml bindings (by Andreas Kemnade <andreas@kemnade.info>)
* fixes to yaml (suggested by Rob Herring <robh@kernel.org>)

RFC V4 2020-02-17 17:55:35:
* removed read_only for nvmem config because there is no write method
* Kconfig: replaced depends MACH_JZ4780 with MACH_INGENIC
* run through checkpatch and fixed issues
* made use of devm_nvram_register() and get rid of jz4780_efuse_remove()
  (suggested by Srinivas Kandagatla <srinivas.kandagatla@linaro.org>)
* squashed previous patch 1/9 and 2/9 into single (regmap based) driver

RFC V3 2020-02-16 20:20:59:

This series is based on and a follow up for

https://lore.kernel.org/patchwork/cover/868157/

("[v2,0/2] Add efuse driver for Ingenic JZ4780 SoC")

Original authors were
PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Mathieu Malaterre <malat@debian.org>

and there are additions / code improvements by
H. Nikolaus Schaller <hns@goldelico.com>
Paul Cercueil <paul@crapouillou.net>

This setup works, if the dm9000 driver is compiled
as a module.

Therefore it is all RFC level. It is also not completely
checkpatched.


H. Nikolaus Schaller (1):
  MIPS: DTS: CI20: make DM9000 Ethernet controller use NVMEM to find the
    default MAC address

PrasannaKumar Muralidharan (5):
  nvmem: add driver for JZ4780 efuse
  Bindings: nvmem: add bindings for JZ4780 efuse
  Documentation: ABI: nvmem: add documentation for JZ4780 efuse ABI
  nvmem: MAINTAINERS: add maintainer for JZ4780 efuse driver
  MIPS: DTS: JZ4780: define node for JZ4780 efuse

 .../ABI/testing/sysfs-driver-jz4780-efuse     |  16 ++
 .../bindings/nvmem/ingenic,jz4780-efuse.yaml  |  50 ++++
 MAINTAINERS                                   |   5 +
 arch/mips/boot/dts/ingenic/ci20.dts           |   3 +
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  17 +-
 drivers/nvmem/Kconfig                         |  10 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/jz4780-efuse.c                  | 229 ++++++++++++++++++
 8 files changed, 331 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse
 create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
 create mode 100644 drivers/nvmem/jz4780-efuse.c

-- 
2.23.0

