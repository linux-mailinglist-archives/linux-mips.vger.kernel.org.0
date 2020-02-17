Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF2DD16184B
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 17:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbgBQQzk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 11:55:40 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:30938 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgBQQzk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Feb 2020 11:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581958537;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=OAZAolKAGyX+tb3pGU7ZqNFaQJAmOSHIsCTsfQMA8xQ=;
        b=fykpIFA+PcYdulqn4q7V17/B95Q24h4LB7ekl1WyI0IJkt9jeCFJ6rKMBo1dRlbP5E
        YIoQKFD+MjRCWftSsNDccfBOUWUnA99MSF9LyF0L3dp7TcZI63v1PoVTnr7s/Grv6/lL
        hvc07tYz9ezWOFwFakjNL0X4wjG8e3IPf7xxiRc4JNb8qa3drEkj6L7bVzv6hMpDTDjQ
        aIQwPirmpcI1CsQuW55XH+yqNWI41E6lFq7ViEy4ZH/ZXsg3ukLsTWVvIgldjJhUU84s
        UFPt1IUKXEcAJU5coLihFjUASl6GSWZYuy+0vsPyO+ClkRVPhB4SzAXWs/YbtsybMq7B
        2yYw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXL8GTnsvhg="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HGtUOqm
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 17:55:30 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
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
Subject: [RFC v4 0/6] MIPS: CI20: Add efuse driver for Ingenic JZ4780 and attach to DM9000 for stable MAC addresses
Date:   Mon, 17 Feb 2020 17:55:24 +0100
Message-Id: <cover.1581958529.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

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
 .../bindings/nvmem/ingenic,jz4780-efuse.txt   |  17 ++
 MAINTAINERS                                   |   5 +
 arch/mips/boot/dts/ingenic/ci20.dts           |   3 +
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  17 +-
 drivers/nvmem/Kconfig                         |  10 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/jz4780-efuse.c                  | 229 ++++++++++++++++++
 8 files changed, 298 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse
 create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
 create mode 100644 drivers/nvmem/jz4780-efuse.c

-- 
2.23.0

