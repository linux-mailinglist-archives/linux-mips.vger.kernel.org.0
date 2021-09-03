Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5E03FFE1B
	for <lists+linux-mips@lfdr.de>; Fri,  3 Sep 2021 12:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349002AbhICKV2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Sep 2021 06:21:28 -0400
Received: from elvis.franken.de ([193.175.24.41]:34409 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234262AbhICKV1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Sep 2021 06:21:27 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mM6J8-0003ly-00; Fri, 03 Sep 2021 12:20:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4657CC0A9C; Fri,  3 Sep 2021 12:20:19 +0200 (CEST)
Date:   Fri, 3 Sep 2021 12:20:19 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v5.15-rc1
Message-ID: <20210903102019.GA6597@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.15

for you to fetch changes up to bea6a94a279bcbe6b2cde348782b28baf12255a5:

  MIPS: Malta: fix alignment of the devicetree buffer (2021-09-02 10:18:26 +0200)

----------------------------------------------------------------
- converted Pistachio platform to use MIPS generic kernel
- fixes and cleanups

----------------------------------------------------------------
Colin Ian King (1):
      MIPS: Alchemy: Fix spelling contraction "cant" -> "can't"

Huilong Deng (2):
      MIPS: generic: Return true/false (not 1/0) from bool functions
      MIPS: Return true/false (not 1/0) from bool functions

Jiaxun Yang (9):
      MIPS: generic: Allow generating FIT image for Marduk board
      MIPS: DTS: Pistachio add missing cpc and cdmm
      clk: pistachio: Make it selectable for generic MIPS kernel
      clocksource/drivers/pistachio: Make it selectable for MIPS
      phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
      pinctrl: pistachio: Make it as an option
      MIPS: config: generic: Add config for Marduk board
      MIPS: Retire MACH_PISTACHIO
      MIPS: Make a alias for pistachio_defconfig

Joe Perches (1):
      MIPS: octeon: Remove vestiges of CONFIG_CAVIUM_RESERVE32

Lukas Bulwahn (1):
      MAINTAINERS: adjust PISTACHIO SOC SUPPORT after its retirement

Masahiro Yamada (2):
      mips: replace deprecated EXTRA_CFLAGS with ccflags-y
      mips: clean up kvm Makefile

Oleksij Rempel (1):
      MIPS: Malta: fix alignment of the devicetree buffer

Paul Cercueil (1):
      MIPS: ingenic: Unconditionally enable clock of CPU #0

Randy Dunlap (6):
      mips: cavium-octeon: clean up kernel-doc in cvmx-interrupt-decodes.c
      mips: netlogic: fix kernel-doc complaints in fmn-config.c
      mips: clean up (remove) kernel-doc in cavium-octeon/executive/
      mips: clean up kernel-doc in cavium-octeon/*.c
      mips: clean up kernel-doc in mm/c-octeon.c
      MIPS: loongson2ef: don't build serial.o unconditionally

Rui Wang (1):
      MIPS: locking/atomic: Fix atomic{_64,}_sub_if_positive

Sebastian Andrzej Siewior (1):
      MIPS: Replace deprecated CPU-hotplug functions.

Vladimir Oltean (2):
      MIPS: mscc: ocelot: disable all switch ports by default
      MIPS: mscc: ocelot: mark the phy-mode for internal PHY ports

周琰杰 (Zhou Yanjie) (1):
      MIPS: Ingenic: Add system type for new Ingenic SoCs.

 MAINTAINERS                                        |  10 +-
 arch/mips/Kbuild.platforms                         |   1 -
 arch/mips/Kconfig                                  |  30 --
 arch/mips/Makefile                                 |   3 +
 arch/mips/alchemy/devboards/db1200.c               |   2 +-
 arch/mips/boot/dts/Makefile                        |   2 +-
 arch/mips/boot/dts/img/Makefile                    |   3 +-
 arch/mips/boot/dts/img/pistachio.dtsi              |  10 +
 arch/mips/boot/dts/mscc/ocelot.dtsi                |  11 +
 arch/mips/boot/dts/mscc/ocelot_pcb120.dts          |  12 +
 arch/mips/boot/dts/mscc/ocelot_pcb123.dts          |   8 +
 arch/mips/cavium-octeon/executive/cvmx-bootmem.c   |  10 +-
 arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c |  33 +--
 .../cavium-octeon/executive/cvmx-helper-board.c    |   8 +-
 .../cavium-octeon/executive/cvmx-helper-rgmii.c    |  12 +-
 .../cavium-octeon/executive/cvmx-helper-xaui.c     |   8 +-
 .../executive/cvmx-interrupt-decodes.c             |  17 +-
 arch/mips/cavium-octeon/executive/cvmx-l2c.c       |   9 +-
 arch/mips/cavium-octeon/executive/cvmx-pko.c       |  22 +-
 arch/mips/cavium-octeon/executive/cvmx-spi.c       |  20 +-
 arch/mips/cavium-octeon/flash_setup.c              |   2 +-
 arch/mips/cavium-octeon/setup.c                    |  81 ++----
 arch/mips/cavium-octeon/smp.c                      |  14 +-
 arch/mips/configs/generic/board-marduk.config      |  53 ++++
 arch/mips/configs/pistachio_defconfig              | 316 ---------------------
 arch/mips/generic/Kconfig                          |   6 +
 arch/mips/generic/Platform                         |   1 +
 arch/mips/generic/board-ingenic.c                  |  49 ++++
 arch/mips/generic/board-marduk.its.S               |  22 ++
 arch/mips/generic/board-ocelot.c                   |   6 +-
 arch/mips/include/asm/atomic.h                     |   2 +-
 arch/mips/include/asm/bootinfo.h                   |   3 +
 arch/mips/include/asm/cpu.h                        |   4 +-
 arch/mips/kernel/mips-mt-fpaff.c                   |  10 +-
 arch/mips/kernel/process.c                         |   4 +-
 arch/mips/kernel/uprobes.c                         |  10 +-
 arch/mips/kvm/Makefile                             |  19 +-
 arch/mips/kvm/mmu.c                                |   4 +-
 arch/mips/loongson2ef/common/Makefile              |   4 +-
 arch/mips/mm/c-octeon.c                            |  29 +-
 arch/mips/mti-malta/malta-dtshim.c                 |   2 +-
 arch/mips/netlogic/xlr/fmn-config.c                |  15 +-
 arch/mips/pistachio/Kconfig                        |  14 -
 arch/mips/pistachio/Makefile                       |   2 -
 arch/mips/pistachio/Platform                       |   6 -
 arch/mips/pistachio/init.c                         | 125 --------
 arch/mips/pistachio/irq.c                          |  24 --
 arch/mips/pistachio/time.c                         |  55 ----
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/pistachio/Kconfig                      |   8 +
 drivers/clocksource/Kconfig                        |   3 +-
 drivers/phy/Kconfig                                |   2 +-
 drivers/pinctrl/Kconfig                            |   5 +-
 54 files changed, 350 insertions(+), 784 deletions(-)
 create mode 100644 arch/mips/configs/generic/board-marduk.config
 delete mode 100644 arch/mips/configs/pistachio_defconfig
 create mode 100644 arch/mips/generic/board-marduk.its.S
 delete mode 100644 arch/mips/pistachio/Kconfig
 delete mode 100644 arch/mips/pistachio/Makefile
 delete mode 100644 arch/mips/pistachio/Platform
 delete mode 100644 arch/mips/pistachio/init.c
 delete mode 100644 arch/mips/pistachio/irq.c
 delete mode 100644 arch/mips/pistachio/time.c
 create mode 100644 drivers/clk/pistachio/Kconfig


-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
