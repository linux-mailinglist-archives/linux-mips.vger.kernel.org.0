Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3691605B9
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 20:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgBPTVI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 14:21:08 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:8080 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgBPTVI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 14:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581880864;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=qdsEU1tijR2EZWmrheyTEaZJuHGGV+71AB0rwGM8mBs=;
        b=Ybak2fu4h+vOZwp5Q2OUHizMeL9z6/pS6yhFGPLWwKkzIAQwQxiA83zaCe4+vCeBZn
        sRkGbeEa1cMszH5QjlfO/CF591Rk5QP2cduUBKT51S+IyV5haF/JR+liGzf2uXicREcU
        n9p5NccUFa6vYNO6OSUWNQTdW80EUND7ah+NQKCGa/vAiknKZoDyd7BcYtV253El5vRk
        /egu+SCmYUHzq1qTLXfv+YZUCEMkFB25NOCK1+9JJbjL831MYoDtbwz9JiMnJ72i5n19
        AkX6JHTOKoOQgdkDP8QlCFscKtD8QAoAZAMdBIUi8ZY8jXFopVOjW8kC3Yi3FrMngl2e
        Pq2Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0OoPPevMB"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1GJKqJlX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 16 Feb 2020 20:20:52 +0100 (CET)
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
Subject: [RFC v3 0/9] MIPS: CI20: Add efuse driver for Ingenic JZ4780 and attach to DM9000 for stable MAC addresses
Date:   Sun, 16 Feb 2020 20:20:42 +0100
Message-Id: <cover.1581880851.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

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


H. Nikolaus Schaller (2):
  MIPS: DTS: CI20: make DM9000 Ethernet controller use NVMEM to find the
    default MAC address
  MIPS: CI20 defconfig: DEMO HACK: make DM9000 a module

Mathieu Malaterre (1):
  MIPS: CI20 defconfig: Probe efuse for CI20

Paul Cercueil (1):
  rework to use regmap

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
 arch/mips/configs/ci20_defconfig              |   4 +-
 drivers/nvmem/Kconfig                         |  10 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/jz4780-efuse.c                  | 238 ++++++++++++++++++
 9 files changed, 310 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse
 create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
 create mode 100644 drivers/nvmem/jz4780-efuse.c

-- 
2.23.0

