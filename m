Return-Path: <linux-mips+bounces-4404-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7830E93802A
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jul 2024 11:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB64AB2112B
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jul 2024 09:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E8422F14;
	Sat, 20 Jul 2024 09:18:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5650140847;
	Sat, 20 Jul 2024 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721467111; cv=none; b=qrRV1Q96B1n0DM7nVyb/jGcYIHLUdXLH/BULAS9K7ErTD/KZF2tg8ZFeyxIXA3C+EwfkigJeF4Pb99nx2ykDi26Qf0FE1rGUBf7NMMwH92wORroVbXVFONrERxVPtfKqK/Bw1etMX7D3qO/XxJbAZJwQStnHLoFe9iA5PP0gBC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721467111; c=relaxed/simple;
	bh=RPwyQbwqvRgBP+VveXrsTKNEFUjAr7zvvqPcMpNTUSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PmOZhyakC8IDOPgqnCVOjBo2/CQ+Zmbo/Aa891OzyzeseNpGfhPJeLigfqXY9/XzUa8Dv0gCXUuaE5p0WFhBG9Vr2mIwRzsiOtBWMJa3eTqafbZ+WiPR47C/OASt31hmmmv5ILm0Vakk8Jh0NMwMB6KOvBmLCg10w887Qc72Aec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sV6EJ-0005Xm-00; Sat, 20 Jul 2024 11:18:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7903CC0814; Sat, 20 Jul 2024 11:18:03 +0200 (CEST)
Date: Sat, 20 Jul 2024 11:18:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v6.11
Message-ID: <ZpuAyzljTBjd6a7g@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 0d5679a0aae2d8cda72169452c32e5cb88a7ab33:

  mips: fix compat_sys_lseek syscall (2024-06-21 10:16:34 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.11

for you to fetch changes up to bb2d63500b5c8fd1ea425caffe2d44c931fefc6b:

  MIPS: config: Add ip30_defconfig (2024-07-15 18:17:34 +0200)

----------------------------------------------------------------
- added support for Realtek RTL9302C
- added support for Mobileye EyeQ6H
- added support for Mobileye EyeQ OLB system controller
- improved r4k clocksource
- added mode for emulating ieee754 NAN2008
- rework for BMIPS CBR address handling
- fixes for Loongson 2K1000
- defconfig updates
- cleanups and fixes

----------------------------------------------------------------
Andy Shevchenko (1):
      MIPS: Alchemy: Switch to use kmemdup_array()

Celeste Liu (1):
      mips: defconfig: drop RT_GROUP_SCHED=y from generic/db1xxx/eyeq5

Chris Packham (8):
      mips: dts: realtek: use "serial" instead of "uart" in node name
      mips: dts: realtek: add device_type property to cpu node
      dt-bindings: vendor-prefixes: Add Cameo Communications
      dt-bindings: mips: realtek: Add rtl930x-soc compatible
      dt-bindings: interrupt-controller: realtek,rtl-intc: Add rtl9300-intc
      mips: select REALTEK_OTTO_TIMER for Realtek platforms
      mips: generic: add fdt fixup for Realtek reference board
      mips: dts: realtek: Add RTL9302C board

Christian Marangi (3):
      mips: bmips: rework and cache CBR addr handling
      dt-bindings: mips: brcm: Document brcm,bmips-cbr-reg property
      mips: bmips: setup: make CBR address configurable

Daniel González Cabanelas (1):
      mips: bmips: enable RAC on BMIPS4350

Dmitry Torokhov (1):
      MIPS: Alchemy: switch to use software nodes for GPIOs

Dominique Martinet (1):
      MIPS: Octeron: remove source file executable bit

Genjian Zhang (2):
      MIPS: sgi-ip22: Add prototypes for several functions to header
      MIPS: ip22-gio: Make ip22_gio_set_64bit() and ip22_gio_init() static

Gregory CLEMENT (3):
      dt-bindings: mips: Add bindings for a new Mobileye SoC EyeQ6H
      MIPS: mobileye: Add EyeQ6H device tree
      MIPS: mobileye: Add EyeQ6H support

Hauke Mehrtens (1):
      MIPS: lantiq: improve USB initialization

Jeff Johnson (1):
      crypto: mips/poly1305 - add missing MODULE_DESCRIPTION() macro

Jiaxun Yang (29):
      MIPS: asm/pm.h: Use platform agnostic macros
      MIPS: select CPU_PM with SUSPEND
      MIPS: Loongson64: Implement PM suspend for LEFI firmware
      MIPS: kvm: Declare prototype for kvm_init_loongson_ipi
      MIPS: Loongson64: Include bootinfo.h in dma.c
      MIPS: Loongson64: DTS: Fix msi node for ls7a
      MIPS: Loongson64: DTS: Fix PCIe port nodes for ls7a
      MIPS: ip30: ip30-console: Add missing include
      MIPS: Loongson64: Remove memory node for builtin-dtb
      MIPS: dts: loongson: Fix liointc IRQ polarity
      MIPS: dts: loongson: Fix ls2k1000-rtc interrupt
      MIPS: dts: loongson: Fix GMAC phy node
      MIPS: dts: loongson: Add ISA node
      MIPS: Loongson64: Test register availability before use
      platform: mips: cpu_hwmon: Disable driver on unsupported hardware
      MIPS: Loongson64: reset: Prioritise firmware service
      MIPS: Loongson64: sleeper: Pass ra and sp as arguments
      MIPS: Loongson64: env: Hook up Loongsson-2K
      MIPS: csrc-r4k: Refine rating computation
      MIPS: csrc-r4k: Apply verification clocksource flags
      MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
      MIPS: csrc-r4k: Don't register as sched_clock if unfit
      MIPS: sync-r4k: Rework based on x86 tsc_sync
      MIPS: Implement ieee754 NAN2008 emulation mode
      MIPS: Fix fallback march for SB1
      MIPS: config: Enable MSA and virtualization for MIPS64R6
      MIPS: config: generic: Add board-litex
      MIPS: config: lemote2f: Regenerate defconfig
      MIPS: config: Add ip30_defconfig

Maxime Ripard (1):
      mips: configs: ci20: Enable DRM_DW_HDMI

Paul Burton (2):
      MIPS: CPS: Add a couple of multi-cluster utility functions
      MIPS: GIC: Generate redirect block accessors

Thomas Bogendoerfer (1):
      Merge branch 'mips-fixes' into mips-next

Théo Lebrun (3):
      dt-bindings: soc: mobileye: add EyeQ OLB system controller
      MIPS: mobileye: eyeq5: add OLB system-controller node
      MAINTAINERS: Mobileye: add OLB drivers and dt-bindings

 Documentation/admin-guide/kernel-parameters.txt    |   4 +-
 .../interrupt-controller/realtek,rtl-intc.yaml     |  20 +-
 .../devicetree/bindings/mips/brcm/soc.yaml         |  24 ++
 .../devicetree/bindings/mips/mobileye.yaml         |   5 +
 .../devicetree/bindings/mips/realtek-rtl.yaml      |   4 +
 .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 374 +++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   5 +
 arch/mips/Kbuild.platforms                         |   2 +-
 arch/mips/Kconfig                                  |  11 +-
 arch/mips/Makefile                                 |   2 +-
 arch/mips/alchemy/common/platform.c                |   8 +-
 arch/mips/alchemy/devboards/db1000.c               |  80 ++---
 arch/mips/bcm47xx/prom.c                           |   3 +
 arch/mips/bcm47xx/setup.c                          |   8 +
 arch/mips/bcm63xx/prom.c                           |   3 +
 arch/mips/bcm63xx/setup.c                          |   8 +
 arch/mips/bmips/dma.c                              |   2 +-
 arch/mips/bmips/setup.c                            |  35 +-
 arch/mips/boot/dts/Makefile                        |   2 +-
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 102 +++---
 .../boot/dts/loongson/loongson64g_4core_ls7a.dts   |   1 +
 arch/mips/boot/dts/mobileye/Makefile               |   1 +
 .../{eyeq5-fixed-clocks.dtsi => eyeq5-clocks.dtsi} |  54 +--
 arch/mips/boot/dts/mobileye/eyeq5-pins.dtsi        | 125 +++++++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  22 +-
 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts        |  22 ++
 .../boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi     |  52 +++
 arch/mips/boot/dts/mobileye/eyeq6h-pins.dtsi       |  88 +++++
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  98 ++++++
 arch/mips/boot/dts/realtek/Makefile                |   1 +
 .../dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts |  73 ++++
 arch/mips/boot/dts/realtek/rtl838x.dtsi            |   1 +
 arch/mips/boot/dts/realtek/rtl83xx.dtsi            |   4 +-
 arch/mips/boot/dts/realtek/rtl930x.dtsi            |  79 +++++
 arch/mips/configs/ci20_defconfig                   |   1 +
 arch/mips/configs/db1xxx_defconfig                 |   1 -
 arch/mips/configs/eyeq5_defconfig                  |   2 +-
 arch/mips/configs/eyeq6_defconfig                  | 111 ++++++
 arch/mips/configs/generic/64r6.config              |   2 +
 arch/mips/configs/generic/board-litex.config       |   8 +
 arch/mips/configs/generic_defconfig                |   1 -
 arch/mips/configs/ip30_defconfig                   | 183 ++++++++++
 arch/mips/configs/lemote2f_defconfig               |  54 ++-
 arch/mips/crypto/poly1305-glue.c                   |   1 +
 arch/mips/generic/Makefile                         |   1 +
 arch/mips/generic/board-realtek.c                  |  79 +++++
 arch/mips/include/asm/bmips.h                      |   1 +
 arch/mips/include/asm/fpu.h                        |  15 +
 arch/mips/include/asm/mach-loongson64/boot_param.h |   2 +
 arch/mips/include/asm/mips-cps.h                   |  39 +++
 arch/mips/include/asm/mips-gic.h                   |  50 ++-
 arch/mips/include/asm/pm.h                         |  22 +-
 arch/mips/include/asm/r4k-timer.h                  |   5 -
 arch/mips/include/asm/sgi/ip22.h                   |   3 +
 arch/mips/kernel/csrc-r4k.c                        |  24 +-
 arch/mips/kernel/elf.c                             |   4 +
 arch/mips/kernel/fpu-probe.c                       |   9 +-
 arch/mips/kernel/mips-cm.c                         |  37 ++
 arch/mips/kernel/smp-bmips.c                       |  22 +-
 arch/mips/kernel/smp.c                             |   2 -
 arch/mips/kernel/sync-r4k.c                        | 281 +++++++++++-----
 arch/mips/kvm/interrupt.h                          |   4 +
 arch/mips/kvm/loongson_ipi.c                       |   2 +
 arch/mips/kvm/mips.c                               |   2 -
 arch/mips/lantiq/xway/sysctrl.c                    |  20 ++
 arch/mips/loongson64/Makefile                      |   2 +-
 arch/mips/loongson64/dma.c                         |   1 +
 arch/mips/loongson64/env.c                         |   8 +
 arch/mips/loongson64/pm.c                          |  88 +----
 arch/mips/loongson64/reset.c                       |  38 +--
 arch/mips/loongson64/sleeper.S                     |  21 ++
 arch/mips/loongson64/smp.c                         |  23 +-
 arch/mips/mobileye/Kconfig                         |  26 ++
 arch/mips/mobileye/Platform                        |   1 +
 arch/mips/pci/pcie-octeon.c                        |   0
 arch/mips/sgi-ip22/ip22-gio.c                      |   4 +-
 arch/mips/sgi-ip22/ip22-int.c                      |   2 -
 arch/mips/sgi-ip22/ip22-setup.c                    |   2 -
 arch/mips/sgi-ip30/ip30-console.c                  |   1 +
 drivers/platform/mips/cpu_hwmon.c                  |   3 +
 81 files changed, 2141 insertions(+), 392 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
 rename arch/mips/boot/dts/mobileye/{eyeq5-fixed-clocks.dtsi => eyeq5-clocks.dtsi} (88%)
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq5-pins.dtsi
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq6h-fixed-clocks.dtsi
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq6h-pins.dtsi
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq6h.dtsi
 create mode 100644 arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
 create mode 100644 arch/mips/boot/dts/realtek/rtl930x.dtsi
 create mode 100644 arch/mips/configs/eyeq6_defconfig
 create mode 100644 arch/mips/configs/generic/board-litex.config
 create mode 100644 arch/mips/configs/ip30_defconfig
 create mode 100644 arch/mips/generic/board-realtek.c
 create mode 100644 arch/mips/loongson64/sleeper.S
 create mode 100644 arch/mips/mobileye/Kconfig
 mode change 100755 => 100644 arch/mips/pci/pcie-octeon.c

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

