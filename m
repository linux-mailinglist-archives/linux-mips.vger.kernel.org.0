Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF3D191F1D
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 03:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727286AbgCYCdf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 22:33:35 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17895 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727259AbgCYCde (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 22:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585103391;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=RoTb4kC5GgUMShP6k070ckUx+pQjKkreZ+DIkNKvl5E=;
        b=W/jVXBb3rU1ZixAei7Ey/PGfP3D3ZbRAMq0Kzen1ORcgwH16AkbkgMf9YShmMIt+
        8k712+8guc5+r6nQ5v6VZ5gikbL5izqhsmrdtQKH3jGDpVTxcKyQsZgykrnieTexuLl
        r9/0C/bSWCtLhZkcmR1DGdV0AQ35RmgTIvqejpCI=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585103387861247.16580834429317; Wed, 25 Mar 2020 10:29:47 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Cercueil <paul@crapouillou.net>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Paul Burton <paulburton@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andi Kleen <ak@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        Allison Randal <allison@lohutok.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-ide@vger.kernel.org
Message-ID: <20200325022916.106641-1-jiaxun.yang@flygoat.com>
Subject: [PATCH v7 00/12] Modernize Loongson64 Machine v6
Date:   Wed, 25 Mar 2020 10:28:16 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson have a long history of contributing their code to mainline kernel.
However, it seems like recent years, they are focusing on maintain a kernel=
 by themselves
rather than contribute there code to the community.

Kernel is progress rapidly too. Their code slept in mainline for a long per=
oid without proper
maintainance and became outdated.

This patchset brings modern DeviceTree and irqchip support to the Loongson6=
4 machine, and leaves
Loongson 2e/f alone since they are too legacy to touch.

PCI and some legacy I/O device will be converted later, together with LS7A =
PCH support.

v1:
- dt-bindings fixup according to Rob's comments
- irqchip fixup according to Marc's comments
- ls3-iointc: Make Core&IP map per-IRQ
- Regenerate kconfigs
- Typo & style improvements

v2:
- dt-bindings: Fix IOINTC, collect Rob's review tag
- dtbs: Drop CPU Node, merge different ways according to Huacai and Paul's =
comments

v3:
- Split code have been merged
- Fix IOINTC binding to allow map any child IRQ to and parent
- Convert "HTINTC" into "HTPIC", which mixed HT vectors processing and i825=
9
- Naming style fix according to Huacai's suggestions

v4:
- More naming related fixes

v5:
- irqchip fixes thanks to maz (see per file changelog)
- Remove unnecessary details in dt-bindings
- Credit Huacai with Co-developed-by

v6:
- HTPIC minor fix
- device binding naming fix=20

v7:
- Add Huacai's sign-off
- Fix all reasonable checkpatch warnings

Jiaxun Yang (12):
  irqchip: Add driver for Loongson I/O Local Interrupt Controller
  irqchip: loongson-liointc: Workaround LPC IRQ Errata
  dt-bindings: interrupt-controller: Add Loongson LIOINTC
  irqchip: Add driver for Loongson-3 HyperTransport PIC controller
  dt-bindings: interrupt-controller: Add Loongson-3 HTPIC
  irqchip: mips-cpu: Convert to simple domain
  MIPS: Loongson64: Drop legacy IRQ code
  dt-bindings: mips: Add loongson boards
  MIPS: Loongson64: Add generic dts
  MIPS: Loongson64: Load built-in dtbs
  MIPS: Loongson64: Move MIPS_CPU_IRQ_BASE
  MAINTAINERS: Update Loongson64 entry

 .../interrupt-controller/loongson,htpic.yaml  |  59 ++++
 .../loongson,liointc.yaml                     |  93 ++++++
 .../bindings/mips/loongson/devices.yaml       |  27 ++
 MAINTAINERS                                   |   1 +
 arch/mips/Kconfig                             |   6 +-
 arch/mips/boot/dts/Makefile                   |   1 +
 arch/mips/boot/dts/loongson/Makefile          |   4 +
 .../boot/dts/loongson/loongson3-package.dtsi  |  64 +++++
 .../dts/loongson/loongson3_4core_rs780e.dts   |  25 ++
 .../dts/loongson/loongson3_8core_rs780e.dts   |  25 ++
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi   |  26 ++
 arch/mips/include/asm/i8259.h                 |   1 +
 .../include/asm/mach-loongson64/boot_param.h  |   2 +
 .../asm/mach-loongson64/builtin_dtbs.h        |  13 +
 arch/mips/include/asm/mach-loongson64/irq.h   |  32 +--
 .../include/asm/mach-loongson64/loongson.h    |   1 +
 arch/mips/loongson64/Makefile                 |   2 +-
 arch/mips/loongson64/env.c                    |  23 ++
 arch/mips/loongson64/init.c                   |   6 +
 arch/mips/loongson64/irq.c                    | 162 -----------
 arch/mips/loongson64/setup.c                  |  16 ++
 arch/mips/loongson64/smp.c                    |  28 +-
 drivers/irqchip/Kconfig                       |  19 ++
 drivers/irqchip/Makefile                      |   2 +
 drivers/irqchip/irq-loongson-htpic.c          | 149 ++++++++++
 drivers/irqchip/irq-loongson-liointc.c        | 270 ++++++++++++++++++
 drivers/irqchip/irq-mips-cpu.c                |   2 +-
 27 files changed, 846 insertions(+), 213 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/=
loongson,htpic.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/=
loongson,liointc.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices=
.yaml
 create mode 100644 arch/mips/boot/dts/loongson/Makefile
 create mode 100644 arch/mips/boot/dts/loongson/loongson3-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch.dtsi
 create mode 100644 arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
 delete mode 100644 arch/mips/loongson64/irq.c
 create mode 100644 drivers/irqchip/irq-loongson-htpic.c
 create mode 100644 drivers/irqchip/irq-loongson-liointc.c

--=20
2.26.0.rc2


