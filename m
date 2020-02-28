Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E87B173C63
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 17:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgB1QBE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 11:01:04 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:36141 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbgB1QBD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 11:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582905660;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=3vVLyvNBvLoUPS7a958Mox8CACN92ClzYCsPXl4lY7g=;
        b=AteLBv85qK73Kw2VZvb8tNJyrbK1Erf2GjwPGFM5i2lRGxcjv83Uo91ing+JEScVtN
        3xw6iKP80FVDU6eU/zo04quhqdZ+PvFItVk1BOkRT39OVpf1zS9b+tUXB32b6grRTDvj
        Zvq0yorTz2SWtRA+cQ0KuyHHaB5NdtO5cCZwxsUM9t2Wy/AnSo1pSEk1fIP1g+JVbN/n
        TrapXRE/+04nVsZtEGKyQW0odEv+LBg127Kr8clTL1CW8UW6e/uiwBEfseKsBcdh08w3
        KA9UFigOu2oKyju5oFfKvPBq1+ifvuboXANLJ/eTr+ZbkQYLJq5yO4CnL8llxxrInl0D
        DTAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SG0s1l2
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 17:00:54 +0100 (CET)
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
Subject: [PATCH v8 0/7] MIPS: CI20: Add efuse driver for Ingenic JZ4780 and attach to DM9000 for stable MAC addresses
Date:   Fri, 28 Feb 2020 17:00:46 +0100
Message-Id: <cover.1582905653.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* fix a compiler warning/error (reported by Paul Cercueil <paul@crapouillou.net>)
* remove clock-names from properties (suggested by Paul Cercueil <paul@crapouillou.net>)

PATCH V7 2020-02-28 14:58:30:
* use devm_add_action_or_reset to unprepare clock in case of error (suggested by Paul Cercueil <paul@crapouillou.net>)
* use already existing constants to check for overflow of rd_adj and rd_strobe
* remove clock-names from bindings example and DTS (suggested by Paul Cercueil <paul@crapouillou.net>)
* addition for nemc driver to handle this correctly (contributed by Paul Cercueil <paul@crapouillou.net>)
* make efuse a child node of nemc to avoid problems with overlapping
  reg address ranges (suggested by Paul Cercueil <paul@crapouillou.net>)

PATCH V6 2020-02-26 12:16:07:
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

Paul Cercueil (1):
  memory: jz4780_nemc: Only request IO memory the driver will use

PrasannaKumar Muralidharan (5):
  nvmem: add driver for JZ4780 efuse
  Bindings: nvmem: add bindings for JZ4780 efuse
  Documentation: ABI: nvmem: add documentation for JZ4780 efuse ABI
  nvmem: MAINTAINERS: add maintainer for JZ4780 efuse driver
  MIPS: DTS: JZ4780: define node for JZ4780 efuse

 .../ABI/testing/sysfs-driver-jz4780-efuse     |  16 ++
 .../bindings/nvmem/ingenic,jz4780-efuse.yaml  |  45 ++++
 MAINTAINERS                                   |   5 +
 arch/mips/boot/dts/ingenic/ci20.dts           |   3 +
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  19 +-
 drivers/memory/jz4780-nemc.c                  |  15 +-
 drivers/nvmem/Kconfig                         |  12 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/jz4780-efuse.c                  | 239 ++++++++++++++++++
 9 files changed, 353 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse
 create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
 create mode 100644 drivers/nvmem/jz4780-efuse.c

-- 
2.23.0

