Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0CF44608B
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 09:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhKEIZn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 04:25:43 -0400
Received: from elvis.franken.de ([193.175.24.41]:33304 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229884AbhKEIZk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Nov 2021 04:25:40 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1miuV1-0006UO-00; Fri, 05 Nov 2021 09:22:59 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F4238C2972; Fri,  5 Nov 2021 09:22:52 +0100 (CET)
Date:   Fri, 5 Nov 2021 09:22:52 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v5.16
Message-ID: <20211105082252.GA6698@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.16

for you to fetch changes up to 36de23a4c5f0b61ceb4812b535422fa6c6e97447:

  MIPS: Cobalt: Explain GT64111 early PCI fixup (2021-11-03 17:34:11 +0100)

----------------------------------------------------------------
- added printing of CPU options for /proc/cpuinfo
- removed support for Netlogic SOCs
- fixes and cleanup

----------------------------------------------------------------
Andy Shevchenko (2):
      bcm47xx: Get rid of redundant 'else'
      bcm47xx: Replace printk(KERN_ALERT ... pci_devname(dev)) with pci_alert()

Bart Van Assche (1):
      MIPS: sni: Fix the build

Geert Uytterhoeven (1):
      mips: cm: Convert to bitfield API to fix out-of-bounds access

Hauke Mehrtens (1):
      MIPS: kernel: proc: add CPU option reporting

Ilya Lipnitskiy (2):
      MIPS: kernel: proc: fix trivial style errors
      MIPS: kernel: proc: use seq_puts instead of seq_printf

Jackie Liu (1):
      MIPS: loongson64: make CPU_LOONGSON64 depends on MIPS_FP_SUPPORT

Maciej W. Rozycki (1):
      MIPS: Fix assembly error from MIPSr2 code used within MIPS_ISA_ARCH_LEVEL

Pali Rohár (1):
      MIPS: Cobalt: Explain GT64111 early PCI fixup

Paul Cercueil (1):
      MIPS: Avoid macro redefinitions

Thomas Bogendoerfer (2):
      MIPS: octeon: Remove unused functions
      MIPS: Remove NETLOGIC support

Wan Jiabing (1):
      MIPS: Loongson64: Add of_node_put() before break

Wang Haojun (1):
      MIPS: loongson64: Fix no screen display during boot-up

Zhaolong Zhang (1):
      mips: fix HUGETLB function without THP enabled

 arch/mips/Kbuild.platforms                         |   1 -
 arch/mips/Kconfig                                  |  92 +---
 arch/mips/boot/compressed/uart-16550.c             |  12 -
 arch/mips/boot/dts/Makefile                        |   1 -
 arch/mips/boot/dts/netlogic/Makefile               |   8 -
 arch/mips/boot/dts/netlogic/xlp_evp.dts            | 131 -----
 arch/mips/boot/dts/netlogic/xlp_fvp.dts            | 131 -----
 arch/mips/boot/dts/netlogic/xlp_gvp.dts            |  89 ----
 arch/mips/boot/dts/netlogic/xlp_rvp.dts            |  89 ----
 arch/mips/boot/dts/netlogic/xlp_svp.dts            | 131 -----
 arch/mips/cavium-octeon/executive/cvmx-helper.c    |  10 -
 arch/mips/cavium-octeon/executive/cvmx-pko.c       |  14 -
 arch/mips/configs/loongson3_defconfig              |   1 +
 arch/mips/configs/nlm_xlp_defconfig                | 557 --------------------
 arch/mips/configs/nlm_xlr_defconfig                | 508 ------------------
 arch/mips/include/asm/cmpxchg.h                    |   5 +-
 arch/mips/include/asm/cop2.h                       |  11 -
 arch/mips/include/asm/cpu-type.h                   |   8 -
 arch/mips/include/asm/cpu.h                        |   2 +-
 arch/mips/include/asm/ginvt.h                      |  11 +-
 arch/mips/include/asm/hazards.h                    |   2 +-
 .../include/asm/mach-loongson64/loongson_regs.h    |  12 +
 .../asm/mach-netlogic/cpu-feature-overrides.h      |  57 --
 arch/mips/include/asm/mach-netlogic/irq.h          |  17 -
 arch/mips/include/asm/mach-netlogic/multi-node.h   |  74 ---
 arch/mips/include/asm/mips-cm.h                    |  12 +-
 arch/mips/include/asm/mipsregs.h                   | 190 ++++---
 arch/mips/include/asm/msa.h                        |  34 +-
 arch/mips/include/asm/netlogic/common.h            | 132 -----
 arch/mips/include/asm/netlogic/haldefs.h           | 171 ------
 arch/mips/include/asm/netlogic/interrupt.h         |  45 --
 arch/mips/include/asm/netlogic/mips-extns.h        | 301 -----------
 arch/mips/include/asm/netlogic/psb-bootinfo.h      |  95 ----
 arch/mips/include/asm/netlogic/xlp-hal/bridge.h    | 186 -------
 .../mips/include/asm/netlogic/xlp-hal/cpucontrol.h |  89 ----
 arch/mips/include/asm/netlogic/xlp-hal/iomap.h     | 214 --------
 arch/mips/include/asm/netlogic/xlp-hal/pcibus.h    | 113 ----
 arch/mips/include/asm/netlogic/xlp-hal/pic.h       | 366 -------------
 arch/mips/include/asm/netlogic/xlp-hal/sys.h       | 213 --------
 arch/mips/include/asm/netlogic/xlp-hal/uart.h      | 192 -------
 arch/mips/include/asm/netlogic/xlp-hal/xlp.h       | 119 -----
 arch/mips/include/asm/netlogic/xlr/bridge.h        | 104 ----
 arch/mips/include/asm/netlogic/xlr/flash.h         |  55 --
 arch/mips/include/asm/netlogic/xlr/fmn.h           | 365 -------------
 arch/mips/include/asm/netlogic/xlr/gpio.h          |  74 ---
 arch/mips/include/asm/netlogic/xlr/iomap.h         | 109 ----
 arch/mips/include/asm/netlogic/xlr/msidef.h        |  84 ---
 arch/mips/include/asm/netlogic/xlr/pic.h           | 306 -----------
 arch/mips/include/asm/netlogic/xlr/xlr.h           |  59 ---
 arch/mips/include/asm/octeon/cvmx-helper.h         |   7 -
 arch/mips/include/asm/octeon/cvmx-pko.h            |   1 -
 arch/mips/include/asm/pgtable.h                    |  45 +-
 arch/mips/include/asm/processor.h                  |  13 -
 arch/mips/include/asm/vermagic.h                   |   4 -
 arch/mips/kernel/cpu-probe.c                       |  84 ---
 arch/mips/kernel/idle.c                            |   2 -
 arch/mips/kernel/mips-cm.c                         |  21 +-
 arch/mips/kernel/perf_event_mipsxx.c               |  86 ----
 arch/mips/kernel/proc.c                            | 227 ++++++--
 arch/mips/kvm/entry.c                              |   8 +-
 arch/mips/loongson64/init.c                        |   1 +
 arch/mips/mm/c-r4k.c                               |   2 -
 arch/mips/mm/tlbex.c                               |   9 +-
 arch/mips/netlogic/Kconfig                         |  86 ----
 arch/mips/netlogic/Makefile                        |   4 -
 arch/mips/netlogic/Platform                        |  16 -
 arch/mips/netlogic/common/Makefile                 |   5 -
 arch/mips/netlogic/common/earlycons.c              |  63 ---
 arch/mips/netlogic/common/irq.c                    | 350 -------------
 arch/mips/netlogic/common/reset.S                  | 299 -----------
 arch/mips/netlogic/common/smp.c                    | 285 ----------
 arch/mips/netlogic/common/smpboot.S                | 141 -----
 arch/mips/netlogic/common/time.c                   | 110 ----
 arch/mips/netlogic/xlp/Makefile                    |  11 -
 arch/mips/netlogic/xlp/ahci-init-xlp2.c            | 390 --------------
 arch/mips/netlogic/xlp/ahci-init.c                 | 209 --------
 arch/mips/netlogic/xlp/cop2-ex.c                   | 121 -----
 arch/mips/netlogic/xlp/dt.c                        |  95 ----
 arch/mips/netlogic/xlp/nlm_hal.c                   | 508 ------------------
 arch/mips/netlogic/xlp/setup.c                     | 174 -------
 arch/mips/netlogic/xlp/usb-init-xlp2.c             | 288 -----------
 arch/mips/netlogic/xlp/usb-init.c                  | 149 ------
 arch/mips/netlogic/xlp/wakeup.c                    | 212 --------
 arch/mips/netlogic/xlr/Makefile                    |   3 -
 arch/mips/netlogic/xlr/fmn-config.c                | 296 -----------
 arch/mips/netlogic/xlr/fmn.c                       | 199 -------
 arch/mips/netlogic/xlr/platform-flash.c            | 216 --------
 arch/mips/netlogic/xlr/platform.c                  | 250 ---------
 arch/mips/netlogic/xlr/setup.c                     | 206 --------
 arch/mips/netlogic/xlr/wakeup.c                    |  85 ---
 arch/mips/pci/Makefile                             |   3 -
 arch/mips/pci/fixup-cobalt.c                       |  15 +
 arch/mips/pci/msi-xlp.c                            | 571 ---------------------
 arch/mips/pci/pci-bcm47xx.c                        |  16 +-
 arch/mips/pci/pci-xlp.c                            | 332 ------------
 arch/mips/pci/pci-xlr.c                            | 368 -------------
 arch/mips/sni/time.c                               |   4 +-
 97 files changed, 412 insertions(+), 11780 deletions(-)
 delete mode 100644 arch/mips/boot/dts/netlogic/Makefile
 delete mode 100644 arch/mips/boot/dts/netlogic/xlp_evp.dts
 delete mode 100644 arch/mips/boot/dts/netlogic/xlp_fvp.dts
 delete mode 100644 arch/mips/boot/dts/netlogic/xlp_gvp.dts
 delete mode 100644 arch/mips/boot/dts/netlogic/xlp_rvp.dts
 delete mode 100644 arch/mips/boot/dts/netlogic/xlp_svp.dts
 delete mode 100644 arch/mips/configs/nlm_xlp_defconfig
 delete mode 100644 arch/mips/configs/nlm_xlr_defconfig
 delete mode 100644 arch/mips/include/asm/mach-netlogic/cpu-feature-overrides.h
 delete mode 100644 arch/mips/include/asm/mach-netlogic/irq.h
 delete mode 100644 arch/mips/include/asm/mach-netlogic/multi-node.h
 delete mode 100644 arch/mips/include/asm/netlogic/common.h
 delete mode 100644 arch/mips/include/asm/netlogic/haldefs.h
 delete mode 100644 arch/mips/include/asm/netlogic/interrupt.h
 delete mode 100644 arch/mips/include/asm/netlogic/mips-extns.h
 delete mode 100644 arch/mips/include/asm/netlogic/psb-bootinfo.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlp-hal/bridge.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlp-hal/cpucontrol.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlp-hal/iomap.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlp-hal/pcibus.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlp-hal/pic.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlp-hal/sys.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlp-hal/uart.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlp-hal/xlp.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlr/bridge.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlr/flash.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlr/fmn.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlr/gpio.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlr/iomap.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlr/msidef.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlr/pic.h
 delete mode 100644 arch/mips/include/asm/netlogic/xlr/xlr.h
 delete mode 100644 arch/mips/netlogic/Kconfig
 delete mode 100644 arch/mips/netlogic/Makefile
 delete mode 100644 arch/mips/netlogic/Platform
 delete mode 100644 arch/mips/netlogic/common/Makefile
 delete mode 100644 arch/mips/netlogic/common/earlycons.c
 delete mode 100644 arch/mips/netlogic/common/irq.c
 delete mode 100644 arch/mips/netlogic/common/reset.S
 delete mode 100644 arch/mips/netlogic/common/smp.c
 delete mode 100644 arch/mips/netlogic/common/smpboot.S
 delete mode 100644 arch/mips/netlogic/common/time.c
 delete mode 100644 arch/mips/netlogic/xlp/Makefile
 delete mode 100644 arch/mips/netlogic/xlp/ahci-init-xlp2.c
 delete mode 100644 arch/mips/netlogic/xlp/ahci-init.c
 delete mode 100644 arch/mips/netlogic/xlp/cop2-ex.c
 delete mode 100644 arch/mips/netlogic/xlp/dt.c
 delete mode 100644 arch/mips/netlogic/xlp/nlm_hal.c
 delete mode 100644 arch/mips/netlogic/xlp/setup.c
 delete mode 100644 arch/mips/netlogic/xlp/usb-init-xlp2.c
 delete mode 100644 arch/mips/netlogic/xlp/usb-init.c
 delete mode 100644 arch/mips/netlogic/xlp/wakeup.c
 delete mode 100644 arch/mips/netlogic/xlr/Makefile
 delete mode 100644 arch/mips/netlogic/xlr/fmn-config.c
 delete mode 100644 arch/mips/netlogic/xlr/fmn.c
 delete mode 100644 arch/mips/netlogic/xlr/platform-flash.c
 delete mode 100644 arch/mips/netlogic/xlr/platform.c
 delete mode 100644 arch/mips/netlogic/xlr/setup.c
 delete mode 100644 arch/mips/netlogic/xlr/wakeup.c
 delete mode 100644 arch/mips/pci/msi-xlp.c
 delete mode 100644 arch/mips/pci/pci-xlp.c
 delete mode 100644 arch/mips/pci/pci-xlr.c
-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
