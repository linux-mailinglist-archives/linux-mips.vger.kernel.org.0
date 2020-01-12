Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C71413856D
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732400AbgALIUU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:20:20 -0500
Received: from forward105o.mail.yandex.net ([37.140.190.183]:53861 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732369AbgALIUU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:20:20 -0500
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id 672CC4200AEF;
        Sun, 12 Jan 2020 11:14:32 +0300 (MSK)
Received: from mxback5q.mail.yandex.net (mxback5q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:b716:ad89])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id 6210A7080009;
        Sun, 12 Jan 2020 11:14:32 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback5q.mail.yandex.net (mxback/Yandex) with ESMTP id 71YNqGkMvI-EWceIuS6;
        Sun, 12 Jan 2020 11:14:32 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816872;
        bh=fNaDNpwRY7N4xV6sOYtD55vQrPPleT6nQIEhffhyh0U=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=C96WOeLzB5A+lfadcrqN860wVMb+OHrYxu6sdITSHvzBp7kDfXW9qlxnj0RCo8Zrn
         SvmQS3Fly/j7T/VYzvvWEBOofAstWvFbQp/lkhiJTIxjnTgT+xz/JOekGuDvVozIrQ
         YJBchnoAvdYpk6BIRfQYdq8fHN2bYcFBVVelNrdQ=
Authentication-Results: mxback5q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-ENV4uA9u;
        Sun, 12 Jan 2020 11:14:28 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 00/10] Modernize Loongson64 Machine
Date:   Sun, 12 Jan 2020 16:14:06 +0800
Message-Id: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson have a long history of contributing their code to mainline kernel.
However, it seems like recent years, they are focusing on maintain a kernel by themselves
rather than contribute there code to the community.

Kernel is progress rapidly too. Their code slept in mainline for a long peroid without proper
maintainance and became outdated.

This patchset brings modern DeviceTree and irqchip support to the Loongson64 machine, and leaves
Loongson 2e/f alone since they are too legacy to touch.

PCI and some legacy I/O device will be converted later, together with LS7A PCH support.

v1:
- dt-bindings fixup according to Rob's comments
- irqchip fixup according to Marc's comments
- ls3-iointc: Make Core&IP map per-IRQ
- Regenerate kconfigs
- Typo & style improvements

v2:
- dt-bindings: Fix IOINTC, collect Rob's review tag
- dtbs: Drop CPU Node, merge different ways according to Huacai and Paul's comments

v3:
- Split code have been merged
- Fix IOINTC binding to allow map any child IRQ to and parent
- Convert "HTINTC" into "HTPIC", which mixed HT vectors processing and i8259
- Naming style fix according to Huacai's suggestions

Jiaxun Yang (10):
  dt-bindings: Document loongson vendor-prefix
  irqchip: Add driver for Loongson I/O interrupt controller
  dt-bindings: interrupt-controller: Add Loongson IOINTC
  irqchip: Add driver for Loongson-3 HyperTransport PIC controller
  dt-bindings: interrupt-controller: Add Loongson-3 HTPIC
  irqchip: mips-cpu: Convert to simple domain
  MIPS: Loongson64: Drop legacy IRQ code
  dt-bindings: mips: Add loongson boards
  MIPS: Loongson64: Add generic dts
  MIPS: Loongson64: Load built-in dtbs

 .../interrupt-controller/loongson,htpic.yaml  |  59 +++
 .../interrupt-controller/loongson,iointc.yaml |  92 +++++
 .../bindings/mips/loongson/devices.yaml       |  29 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/mips/Kconfig                             |   6 +-
 arch/mips/boot/dts/Makefile                   |   1 +
 arch/mips/boot/dts/loongson/Makefile          |   5 +
 .../boot/dts/loongson/loongson3-package.dtsi  |  62 ++++
 .../dts/loongson/loongson3_4core_rs780e.dts   |  25 ++
 .../dts/loongson/loongson3_8core_rs780e.dts   |  25 ++
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi   |  26 ++
 arch/mips/include/asm/i8259.h                 |   1 +
 .../include/asm/mach-loongson64/boot_param.h  |   2 +
 .../asm/mach-loongson64/builtin_dtbs.h        |  13 +
 arch/mips/include/asm/mach-loongson64/irq.h   |  32 +-
 .../include/asm/mach-loongson64/loongson.h    |   1 +
 arch/mips/loongson64/Makefile                 |   2 +-
 arch/mips/loongson64/env.c                    |  23 ++
 arch/mips/loongson64/init.c                   |   6 +
 arch/mips/loongson64/irq.c                    | 162 ---------
 arch/mips/loongson64/setup.c                  |  16 +
 arch/mips/loongson64/smp.c                    |  28 +-
 drivers/irqchip/Kconfig                       |  18 +
 drivers/irqchip/Makefile                      |   2 +
 drivers/irqchip/irq-i8259.c                   |   6 +-
 drivers/irqchip/irq-loongson-htpic.c          | 147 ++++++++
 drivers/irqchip/irq-loongson-iointc.c         | 338 ++++++++++++++++++
 drivers/irqchip/irq-mips-cpu.c                |   2 +-
 28 files changed, 915 insertions(+), 216 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,iointc.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
 create mode 100644 arch/mips/boot/dts/loongson/Makefile
 create mode 100644 arch/mips/boot/dts/loongson/loongson3-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch.dtsi
 create mode 100644 arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
 delete mode 100644 arch/mips/loongson64/irq.c
 create mode 100644 drivers/irqchip/irq-loongson-htpic.c
 create mode 100644 drivers/irqchip/irq-loongson-iointc.c

-- 
2.24.1

