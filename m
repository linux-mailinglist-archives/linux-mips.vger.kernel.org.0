Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B442816FD3B
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 12:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgBZLQN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 06:16:13 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:12391 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728252AbgBZLQN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 06:16:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582715769;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=6en+8D+Os1k3MMDTIZGpH+G1werye7fUM88nASmsZpA=;
        b=P2XeAw31XknJY13M4cjllM5Y7M3dwvLMmaZWlZr5SzW7XVlH6AGsrrYJRdMoarG2cX
        wpGiVlq/ns1Y+hCGCmCdBPgvJ5Y//pChX/TY7ODidRbMCWYebCJjs+7fw3EA3hEumbgY
        mp4YjjOqAY1uZGAzyjCWu3Yj0xos5LN47r2BMD31kcsphMs28McSUmPQUab+kleTeOyU
        wXXqqK9Ot8LpOeEd/pfb6Q7/SoN9biIUv6RKrZVy9s2I0w8OYffxrZqd/8z5rSmTQxf2
        2RnRm75A5B+2d831usycu9lyTG3Ls4uA7Yya3awsIGPwENr8pz3dhmQe7qAN14BZNACq
        qH0g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1QBG14Cb
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 12:16:01 +0100 (CET)
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
Subject: [PATCH v6 0/6] MIPS: CI20: Add efuse driver for Ingenic JZ4780 and attach to DM9000 for stable MAC addresses
Date:   Wed, 26 Feb 2020 12:15:55 +0100
Message-Id: <cover.1582715761.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* add dependency on CONFIG_OF and select REGMAP_MMIO (suggested by Paul Cercueil <paul@crapouillou.net>)
* add clk_prepare_enable() (suggested by Paul Cercueil <paul@crapouillou.net>)
* inline jz4780_efuse_read_32bytes() since it is only used once
* remove read optimization for full block (suggested by Paul Cercueil <paul@crapouillou.net>)
* simplify calculations for rd_adj and rd_strobe (suggested by Paul Cercueil <paul@crapouillou.net>)
* do calculations for rd_adj and rd_strobe in local variables
* fix overflow check (did allow for 5 bit values although register is 4 bit wide)
* fixes for yaml (sugested by Andreas Kemnade <andreas@kemnade.info>)

PATCH V5 2020-02-22 11:25:35:
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
 drivers/nvmem/Kconfig                         |  12 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/jz4780-efuse.c                  | 239 ++++++++++++++++++
 8 files changed, 343 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse
 create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
 create mode 100644 drivers/nvmem/jz4780-efuse.c

-- 
2.23.0

