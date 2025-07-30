Return-Path: <linux-mips+bounces-9951-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3BB16238
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 16:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B81A7B4CA2
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 14:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772022D978C;
	Wed, 30 Jul 2025 14:04:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791FD2D9EC4;
	Wed, 30 Jul 2025 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753884274; cv=none; b=PEa/pPJfdxA2d14wR88sL46rkAfID/6h+ozqWmEKGQ92B9Va/Bq88kJZ0Il9PPbH65mR9j9cXiWNZBAtiwhWjrJV29+eqziN//queOZ3FCuIU8b0G8ESzVG+jWdVATjhXhDPKLJo+gE59+3RgqsIdzP4UzNWEo1eJOqsKxKHHjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753884274; c=relaxed/simple;
	bh=gZRPD95/soQMhSkwWf1uGpIQQ9RTp0+6YEXUTxv9pp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BCYkz9dNiKhIqCSZzHkKlbyiE++vruDiV1L+fB94+YCmiLEJ684n7eF6CmzqEG/gY7/HsSiLkSB4koZO2nP9tF4JYqHgFq44Zw9P5PqwgN8aRQep0opv6aKySl6zfoLxPQEjZP7OdSFjUfobIHsH40ZfI2Z7jKsSe83TeMkCrIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uh7Po-0005uy-00; Wed, 30 Jul 2025 16:04:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F3FDCC035D; Wed, 30 Jul 2025 16:04:09 +0200 (CEST)
Date: Wed, 30 Jul 2025 16:04:09 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v6.17
Message-ID: <aIomWdeNOQwaKPu1@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.17

for you to fetch changes up to 3ebcbf079c26ab6e82faa7f896b66def55547eee:

  MIPS: Don't use %pK through printk (2025-07-28 09:58:49 +0200)

----------------------------------------------------------------
DT updates for ralink, mobileye and ralink
Clean up of mc146818 usage
Speed up delay calibration for CPS
Other cleanups and fixes

----------------------------------------------------------------
Andy Shevchenko (1):
      firmware/nvram: bcm47xx: Don't use "proxy" headers

Benoît Monin (5):
      MIPS: mobileye: dts: eyeq6h: add the emmc controller
      MIPS: eyeq6_defconfig: add cadence MMC/SDHCI driver
      MIPS: mobileye: dts: eyeq5: add the emmc controller
      MIPS: eyeq5_defconfig: add cadence MMC/SDHCI driver
      MIPS: mobileye: dts: eyeq5,eyeq6h: rename the emmc controller

Chris Packham (4):
      mips: dts: cameo-rtl9302c: Add switch block
      mips: dts: realtek: Add switch interrupts
      mips: dts: realtek: Add watchdog
      mips: dts: realtek: Add gpio block

Ezra Buehler (4):
      dt-bindings: clock: mediatek,mtmips-sysc: Adapt compatible for MT7688 boards
      MIPS: dts: ralink: mt7628a: Fix sysc's compatible property for MT7688
      MIPS: dts: ralink: mt7628a: Update watchdog node according to bindings
      MIPS: dts: ralink: gardena_smart_gateway_mt7688: Fix power LED

Geert Uytterhoeven (1):
      MIPS: txx9: Constify bin_attribute arguments of txx9_sram_{read,write}()

Gregory CLEMENT (3):
      MIPS: disable MMID when not supported by the hardware
      MIPS: CPS: Improve mips_cps_first_online_in_cluster()
      MIPS: CPS: Optimise delay CPU calibration for SMP

Huacai Chen (1):
      MIPS/Loongson: Fix build warnings about export.h

Jiaxun Yang (1):
      MIPS: mm: tlb-r4k: Uniquify TLB entries on init

Joshua Kinard (1):
      MIPS: Update Joshua Kinard's e-mail address

Markus Elfring (1):
      MIPS: SGI-IP27: Delete an unnecessary check before kfree() in hub_domain_free()

Masahiro Yamada (1):
      mips: boot: use 'targets' instead of extra-y in Makefile

Mateusz Jończyk (4):
      mips: remove unused function mc146818_set_rtc_mmss
      mips/mach-rm: remove custom mc146818rtc.h file
      mips: remove redundant macro mc146818_decode_year
      mips/malta,loongson2ef: use generic mc146818_get_time function

Mieczyslaw Nalewaj (2):
      MIPS: ralink: add missing header include
      MIPS: pci-rt2880: make pcibios_init() static

Rosen Penev (1):
      mips: dts: qca: add wmac support

Shiji Yang (12):
      MIPS: lantiq: xway: mark dma_init() as static
      MIPS: pci: lantiq: marks pcibios_init() as static
      MIPS: lantiq: xway: mark dcdc_init() as static
      MIPS: lantiq: irq: fix misc missing-prototypes warnings
      MIPS: lantiq: xway: mark ltq_ar9_sys_hz() as static
      MIPS: lantiq: xway: gptu: mark gptu_init() as static
      MIPS: lantiq: xway: add prototype for ltq_get_cp1_base()
      MIPS: lantiq: falcon: fix misc missing-prototypes warnings
      MIPS: lantiq: falcon: sysctrl: remove unused falcon_trigger_hrst()
      MIPS: lantiq: falcon: sysctrl: add missing header prom.h
      MIPS: lantiq: falcon: sysctrl: fix request memory check logic
      MIPS: vpe-mt: add missing prototypes for vpe_{alloc,start,stop,free}

Thomas Weißschuh (2):
      MIPS: Don't crash in stack_top() for tasks without ABI or vDSO
      MIPS: Don't use %pK through printk

Théo Lebrun (6):
      MIPS: eyeq5_defconfig: Update for v6.16-rc1
      MIPS: mobileye: eyeq5: add 5 I2C controller nodes
      MIPS: mobileye: eyeq5: add evaluation board I2C temp sensor
      MIPS: mobileye: eyeq5: add two GPIO bank nodes
      MIPS: eyeq5_defconfig: add GPIO subsystem & driver
      MIPS: eyeq5_defconfig: add I2C subsystem, driver and temp sensor driver

 .../bindings/clock/mediatek,mtmips-sysc.yaml       |  28 +++--
 arch/mips/Kconfig                                  |   2 +
 arch/mips/boot/Makefile                            |   8 +-
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         |   8 ++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             | 127 +++++++++++++++++++++
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi            |  22 ++++
 arch/mips/boot/dts/qca/ar9132.dtsi                 |   9 ++
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts   |   4 +
 arch/mips/boot/dts/qca/ar9331.dtsi                 |   9 ++
 arch/mips/boot/dts/qca/ar9331_dpt_module.dts       |   4 +
 arch/mips/boot/dts/qca/ar9331_dragino_ms14.dts     |   4 +
 arch/mips/boot/dts/qca/ar9331_omega.dts            |   4 +
 .../dts/qca/ar9331_openembed_som9331_board.dts     |   4 +
 arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts        |   4 +
 .../dts/ralink/gardena_smart_gateway_mt7688.dts    |   2 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi             |  11 +-
 .../dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts |  96 ++++++++++++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi            |  31 +++++
 arch/mips/configs/eyeq5_defconfig                  |  12 +-
 arch/mips/configs/eyeq6_defconfig                  |   2 +
 arch/mips/include/asm/cpu-info.h                   |   1 +
 arch/mips/include/asm/mach-generic/mc146818rtc.h   |   4 -
 .../include/asm/mach-ip30/cpu-feature-overrides.h  |   2 +-
 arch/mips/include/asm/mach-ip30/spaces.h           |   2 +-
 arch/mips/include/asm/mach-jazz/mc146818rtc.h      |   2 -
 .../mips/include/asm/mach-lantiq/xway/lantiq_soc.h |   3 +
 arch/mips/include/asm/mach-malta/mc146818rtc.h     |   2 -
 arch/mips/include/asm/mach-rm/mc146818rtc.h        |  21 ----
 arch/mips/include/asm/mc146818-time.h              | 105 ++---------------
 arch/mips/include/asm/mips-cps.h                   |   4 +-
 arch/mips/include/asm/sgi/heart.h                  |   2 +-
 arch/mips/include/asm/smp-cps.h                    |   1 +
 arch/mips/include/asm/vpe.h                        |   8 ++
 arch/mips/kernel/cpu-probe.c                       |  42 ++++++-
 arch/mips/kernel/mips-cm.c                         |  52 ++++-----
 arch/mips/kernel/process.c                         |  16 +--
 arch/mips/kernel/relocate.c                        |  10 +-
 arch/mips/kernel/smp-cps.c                         |  16 ++-
 arch/mips/kvm/mips.c                               |   2 +-
 arch/mips/lantiq/falcon/prom.c                     |   4 +-
 arch/mips/lantiq/falcon/sysctrl.c                  |  29 ++---
 arch/mips/lantiq/irq.c                             |   4 +-
 arch/mips/lantiq/xway/clk.c                        |   2 +-
 arch/mips/lantiq/xway/dcdc.c                       |   2 +-
 arch/mips/lantiq/xway/dma.c                        |   2 +-
 arch/mips/lantiq/xway/gptu.c                       |   2 +-
 arch/mips/loongson64/setup.c                       |   1 -
 arch/mips/mm/physaddr.c                            |   2 +-
 arch/mips/mm/tlb-r4k.c                             |  56 ++++++++-
 arch/mips/pci/pci-lantiq.c                         |   2 +-
 arch/mips/pci/pci-rt2880.c                         |   2 +-
 arch/mips/ralink/irq.c                             |   1 +
 arch/mips/sgi-ip27/ip27-irq.c                      |   2 +-
 arch/mips/sgi-ip30/ip30-power.c                    |   2 +-
 arch/mips/sgi-ip30/ip30-setup.c                    |   2 +-
 arch/mips/sgi-ip30/ip30-smp.c                      |   2 +-
 arch/mips/sgi-ip30/ip30-timer.c                    |   2 +-
 arch/mips/sgi-ip30/ip30-xtalk.c                    |   2 +-
 arch/mips/txx9/generic/setup.c                     |   4 +-
 drivers/mfd/ioc3.c                                 |   2 +-
 drivers/tty/serial/8250/8250_ioc3.c                |   2 +-
 include/linux/bcm47xx_nvram.h                      |   1 -
 include/linux/bcm47xx_sprom.h                      |   2 +-
 63 files changed, 570 insertions(+), 248 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-rm/mc146818rtc.h

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

