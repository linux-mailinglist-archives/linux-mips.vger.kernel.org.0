Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0252329057B
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 14:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406167AbgJPMqw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 08:46:52 -0400
Received: from elvis.franken.de ([193.175.24.41]:36071 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405811AbgJPMqv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Oct 2020 08:46:51 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kTP8D-0001uD-00; Fri, 16 Oct 2020 14:46:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E6D82C054D; Fri, 16 Oct 2020 14:46:17 +0200 (CEST)
Date:   Fri, 16 Oct 2020 14:46:17 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v5.10
Message-ID: <20201016124617.GA5035@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.10

for you to fetch changes up to cf3af0a4d3b62ab48e0b90180ea161d0f5d4953f:

  MIPS: DEC: Restore bootmem reservation for firmware working memory area (2020-10-14 23:57:57 +0200)

----------------------------------------------------------------
MIPS updates for v5.10:

- removed support for PNX833x alias NXT_STB22x
- included Ingenic SoC support into generic MIPS kernels
- added support for new Ingenic SoCs
- converted workaround selection to use Kconfig
- replaced old boot mem functions by memblock_*
- enabled COP2 usage in kernel for Loongson64 to make usage
  of usage of 16byte load/stores possible
- cleanups and fixes

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
      MIPS: lantiq: add missing GPHY clock aliases for ar10 and grx390

Chuanhong Guo (1):
      mips: ralink: enable zboot support

Davidlohr Bueso (1):
      MIPS: Use rcu to lookup a task in mipsmt_sys_sched_setaffinity()

Florian Fainelli (2):
      firmware: bcm47xx_sprom: Fix -Wmissing-prototypes warnings
      MIPS: BCM47xx: Include bcm47xx_sprom.h

Huacai Chen (4):
      MIPS: Loongson64: Increase NR_IRQS to 320
      MIPS: context switch: Use save/restore instead of set/clear for Status.CU2
      MIPS: Loongson-3: Enable COP2 usage in kernel
      MIPS: Loongson-3: Calculate ra properly when unwinding the stack

Jason Yan (1):
      MIPS: Make setup_elfcorehdr and setup_elfcorehdr_size static

Jinyang He (2):
      MIPS: p5600: Discard UCA config selection
      MIPS: Loongson64: Remove unused loongson_reboot.

Maciej W. Rozycki (1):
      MIPS: DEC: Restore bootmem reservation for firmware working memory area

Mikhail Gusarov (1):
      mips: octeon: Add Ubiquiti E200 and E220 boards

Paul Cercueil (20):
      lib: decompress_unzstd: Limit output size
      MIPS: Add support for ZSTD-compressed kernels
      MIPS: dts/ingenic: Cleanup qi_lb60.dts
      MIPS: configs: lb60: Fix defconfig not selecting correct board
      MIPS: cpu-probe: Set Ingenic's writecombine to _CACHE_CACHABLE_WA
      MIPS: cpu-probe: Mark XBurst CPU as having vtagged caches
      MIPS: cpu-probe: ingenic: Fix broken BUG_ON
      MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
      MIPS: generic: Allow boards to set system type
      MIPS: generic: Init command line with fw_init_cmdline()
      MIPS: generic: Support booting with built-in or appended DTB
      MIPS: generic: Add support for zboot
      MIPS: generic: Increase NR_IRQS to 256
      MIPS: generic: Add support for Ingenic SoCs
      MIPS: jz4740: Drop all obsolete files
      MIPS: jz4740: Rename jz4740 folders to ingenic
      MIPS: configs: Regenerate configs of Ingenic boards
      MAINTAINERS: Update paths to Ingenic platform code
      MIPS: Increase range of CONFIG_FORCE_MAX_ZONEORDER
      MIPS: ingenic: Remove CPU_SUPPORTS_HUGEPAGES

Pujin Shi (4):
      MIPS: kernel: include probes-common.h header in branch.c
      MIPS: idle: Add prototype for function check_wait
      MIPS: process: Add prototype for function arch_dup_task_struct
      MIPS: process: include exec.h header in process.c

Qinglang Miao (1):
      MIPS: OCTEON: use devm_platform_ioremap_resource

Randy Dunlap (1):
      bcm963xx_tag.h: fix duplicated word

Thomas Bogendoerfer (34):
      MIPS: Paravirt: remove remaining pieces of paravirt
      MIPS: Remove PNX833x alias NXP_STB22x
      MIPS: SGI-IP27: No need for kmalloc.h
      MIPS: Loongson2ef: Remove specific mc146818rtc.h
      MIPS: Remove unused header file m48t37.h
      MIPS: SGI-IP32: No need to include mc14818*.h
      MIPS: Convert R4600_V1_INDEX_ICACHEOP into a config option
      MIPS: Convert R4600_V1_HIT_CACHEOP into a config option
      MIPS: Convert R4600_V2_HIT_CACHEOP into a config option
      MIPS: Remove MIPS4K_ICACHE_REFILL_WAR and MIPS_CACHE_SYNC_WAR
      MIPS: Convert TX49XX_ICACHE_INDEX_INV into a config option
      MIPS: Convert ICACHE_REFILLS_WORKAROUND_WAR into a config option
      MIPS: Convert R10000_LLSC_WAR info a config option
      MIPS: Convert MIPS34K_MISSED_ITLB_WAR into a config option
      MIPS: Replace SIBYTE_1956_WAR by CONFIG_SB1_PASS_2_WORKAROUNDS
      MIPS: Get rid of BCM1250_M3_WAR
      MIPS: Get rid of CAVIUM_OCTEON_DCACHE_PREFETCH_WAR
      MIPS: Remove mach-*/war.h
      MIPS: SGI-IP30: Move irq bits to better header files
      MIPS: alchemy: remove unused ALCHEMY_GPIOINT_AU1300
      MIPS: alchemy: remove unused ALCHEMY_GPIOINT_AU1000
      MIPS: malta: remove unused header file
      MIPS: malta: remove mach-malta/malta-dtshim.h header file
      Revert "MIPS: OCTEON: use devm_platform_ioremap_resource"
      MIPS: alchemy: Fix build breakage, if TOUCHSCREEN_WM97XX is disabled
      MIPS: alchemy: Share prom_init implementation
      MIPS: pgtable: Remove used PAGE_USERIO define
      MIPS: tx49xx: move tx4939_add_memory_regions into only user
      MIPS: SGI-IP28: disable use of ll/sc in kernel
      MIPS: replace add_memory_region with memblock
      MIPS: cpu-probe: move fpu probing/handling into its own file
      MIPS: cpu-probe: introduce exclusive R3k CPU probe
      MIPS: cpu-probe: remove MIPS_CPU_BP_GHIST option bit
      MIPS: dec: fix section mismatch

Tiezhu Yang (4):
      MIPS: Loongson: Use default CONFIG_FRAME_WARN as 2048 for Loongson64 to fix build warnings
      MIPS: Loongson64: Add UART node for LS7A PCH
      MIPS: Loongson64: Select SMP in Kconfig to avoid build error
      MIPS: Loongson64: Clean up numa.c

Wei Li (1):
      MIPS: Correct the header guard of r4k-timer.h

Youling Tang (2):
      MIPS: netlogic: Remove unused code
      MIPS: kexec: Add crashkernel=YM handling

Zejiang Tang (1):
      MIPS: ftrace: Remove redundant #ifdef CONFIG_DYNAMIC_FTRACE

Zhang Qilong (1):
      MIPS: pci: use devm_platform_ioremap_resource_byname

Álvaro Fernández Rojas (5):
      MIPS: BCM63xx: remove duplicated new lines
      MIPS: BCM63xx: remove EHCI from BCM6348 boards
      MIPS: BCM63xx: enable EHCI for DWV-S0 board
      MIPS: BCM63xx: refactor board declarations
      MIPS: BCM63xx: switch to SPDX license identifier

周琰杰 (Zhou Yanjie) (4):
      MIPS: Ingenic: Add CPU nodes for Ingenic SoCs.
      dt-bindings: MIPS: Add X2000E based CU2000-Neo.
      MIPS: Ingenic: Add system type for new Ingenic SoCs.
      MIPS: Ingenic: Fix bugs when detecting L2 cache of JZ4775 and X1000E.

 .../devicetree/bindings/mips/ingenic/devices.yaml  |   5 +
 MAINTAINERS                                        |   5 +-
 arch/mips/Kbuild.platforms                         |   2 -
 arch/mips/Kconfig                                  | 158 ++++--
 arch/mips/alchemy/Kconfig                          |  11 -
 arch/mips/alchemy/board-gpr.c                      |  17 -
 arch/mips/alchemy/board-mtx1.c                     |  17 -
 arch/mips/alchemy/board-xxs1500.c                  |  18 -
 arch/mips/alchemy/common/prom.c                    |  21 +
 arch/mips/alchemy/devboards/db1300.c               |   7 +
 arch/mips/alchemy/devboards/platform.c             |  17 -
 arch/mips/ar7/memory.c                             |   2 +-
 arch/mips/ath25/ar2315.c                           |   3 +-
 arch/mips/ath25/ar5312.c                           |   3 +-
 arch/mips/bcm47xx/prom.c                           |   3 +-
 arch/mips/bcm47xx/setup.c                          |   2 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c          | 625 ++++++++++-----------
 arch/mips/bcm63xx/setup.c                          |   2 +-
 arch/mips/boot/compressed/Makefile                 |   8 +-
 arch/mips/boot/compressed/decompress.c             |   4 +
 arch/mips/boot/compressed/string.c                 |  17 +
 arch/mips/boot/dts/ingenic/jz4725b.dtsi            |  14 +
 arch/mips/boot/dts/ingenic/jz4740.dtsi             |  14 +
 arch/mips/boot/dts/ingenic/jz4770.dtsi             |  15 +-
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  23 +
 arch/mips/boot/dts/ingenic/qi_lb60.dts             | 137 +++--
 arch/mips/boot/dts/ingenic/x1000.dtsi              |  14 +
 arch/mips/boot/dts/ingenic/x1830.dtsi              |  14 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi          |  39 ++
 arch/mips/cavium-octeon/setup.c                    |  26 +-
 arch/mips/cobalt/setup.c                           |   3 +-
 arch/mips/configs/ci20_defconfig                   |   4 +-
 arch/mips/configs/cu1000-neo_defconfig             |  15 +-
 arch/mips/configs/cu1830-neo_defconfig             |  15 +-
 arch/mips/configs/gcw0_defconfig                   |   2 +-
 arch/mips/configs/loongson3_defconfig              |   2 -
 arch/mips/configs/pnx8335_stb225_defconfig         |  77 ---
 arch/mips/configs/qi_lb60_defconfig                |   7 +-
 arch/mips/configs/rs90_defconfig                   |   4 +-
 arch/mips/dec/prom/memory.c                        |  12 +-
 arch/mips/dec/setup.c                              |   9 +-
 arch/mips/fw/arc/memory.c                          |  28 +-
 arch/mips/fw/sni/sniprom.c                         |   4 +-
 arch/mips/generic/Kconfig                          |   8 +-
 arch/mips/generic/Makefile                         |   1 +
 arch/mips/generic/Platform                         |   4 +
 arch/mips/generic/board-ingenic.c                  | 120 ++++
 arch/mips/generic/init.c                           |  11 +-
 arch/mips/generic/proc.c                           |   5 +
 arch/mips/include/asm/bootinfo.h                   |   9 +-
 arch/mips/include/asm/cpu-features.h               |   3 -
 arch/mips/include/asm/cpu.h                        |   1 -
 arch/mips/include/asm/futex.h                      |   4 +-
 arch/mips/include/asm/idle.h                       |   2 +
 arch/mips/include/asm/llsc.h                       |   2 +-
 arch/mips/include/asm/local.h                      |   4 +-
 arch/mips/include/asm/m48t37.h                     |  36 --
 .../asm/mach-au1x00/cpu-feature-overrides.h        |   1 -
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h    | 137 -----
 arch/mips/include/asm/mach-bcm47xx/bcm47xx.h       |   4 +-
 arch/mips/include/asm/mach-cavium-octeon/war.h     |  27 -
 arch/mips/include/asm/mach-generic/irq.h           |   2 +-
 arch/mips/include/asm/mach-generic/war.h           |  23 -
 .../cpu-feature-overrides.h                        |   0
 arch/mips/include/asm/mach-ip22/war.h              |  27 -
 arch/mips/include/asm/mach-ip27/kmalloc.h          |   8 -
 arch/mips/include/asm/mach-ip27/war.h              |  23 -
 .../include/asm/mach-ip28/cpu-feature-overrides.h  |   2 +-
 arch/mips/include/asm/mach-ip28/war.h              |  23 -
 arch/mips/include/asm/mach-ip30/irq.h              |  87 ---
 arch/mips/include/asm/mach-ip30/war.h              |  24 -
 arch/mips/include/asm/mach-ip32/war.h              |  23 -
 arch/mips/include/asm/mach-jz4740/irq.h            |  13 -
 .../include/asm/mach-loongson2ef/mc146818rtc.h     |  36 --
 arch/mips/include/asm/mach-loongson64/irq.h        |   3 +-
 arch/mips/include/asm/mach-loongson64/mmzone.h     |   6 +-
 arch/mips/include/asm/mach-malta/malta-dtshim.h    |  25 -
 arch/mips/include/asm/mach-malta/malta-pm.h        |  33 --
 arch/mips/include/asm/mach-malta/war.h             |  23 -
 .../asm/mach-paravirt/cpu-feature-overrides.h      |  35 --
 arch/mips/include/asm/mach-paravirt/irq.h          |  19 -
 .../include/asm/mach-paravirt/kernel-entry-init.h  |  52 --
 arch/mips/include/asm/mach-pnx833x/gpio.h          | 159 ------
 arch/mips/include/asm/mach-pnx833x/irq-mapping.h   | 112 ----
 arch/mips/include/asm/mach-pnx833x/irq.h           |  40 --
 arch/mips/include/asm/mach-pnx833x/pnx833x.h       | 189 -------
 arch/mips/include/asm/mach-rc32434/war.h           |  23 -
 arch/mips/include/asm/mach-rm/war.h                |  27 -
 arch/mips/include/asm/mach-sibyte/war.h            |  38 --
 arch/mips/include/asm/mach-tx49xx/war.h            |  23 -
 arch/mips/include/asm/mips-boards/malta.h          |   2 +
 arch/mips/include/asm/mipsregs.h                   |  23 +-
 arch/mips/include/asm/netlogic/psb-bootinfo.h      |  16 +-
 arch/mips/include/asm/octeon/cvmx-bootinfo.h       |   4 +
 arch/mips/include/asm/pgtable-bits.h               |   5 -
 arch/mips/include/asm/pgtable.h                    |   2 -
 arch/mips/include/asm/processor.h                  |   1 +
 arch/mips/include/asm/r4k-timer.h                  |   6 +-
 arch/mips/include/asm/sgi/heart.h                  |  51 ++
 arch/mips/include/asm/stackframe.h                 |   6 +-
 arch/mips/include/asm/switch_to.h                  |   4 +-
 arch/mips/include/asm/txx9/tx4939.h                |   1 -
 arch/mips/include/asm/war.h                        | 150 -----
 arch/mips/{jz4740 => ingenic}/Kconfig              |  16 +-
 arch/mips/jz4740/Makefile                          |   9 -
 arch/mips/jz4740/Platform                          |   3 -
 arch/mips/jz4740/setup.c                           | 145 -----
 arch/mips/kernel/Makefile                          |   9 +-
 arch/mips/kernel/branch.c                          |   2 +
 arch/mips/kernel/cpu-probe.c                       | 344 +-----------
 arch/mips/kernel/cpu-r3k-probe.c                   | 171 ++++++
 arch/mips/kernel/fpu-probe.c                       | 321 +++++++++++
 arch/mips/kernel/fpu-probe.h                       |  40 ++
 arch/mips/kernel/ftrace.c                          |   4 -
 arch/mips/kernel/head.S                            |   2 +-
 arch/mips/kernel/mips-mt-fpaff.c                   |   4 +-
 arch/mips/kernel/process.c                         |  21 +-
 arch/mips/kernel/prom.c                            |  25 -
 arch/mips/kernel/setup.c                           |  76 +--
 arch/mips/kernel/signal.c                          |   8 +-
 arch/mips/kernel/syscall.c                         |   2 +-
 arch/mips/kernel/traps.c                           |   2 +-
 arch/mips/lantiq/xway/sysctrl.c                    |  10 +-
 arch/mips/loongson2ef/common/mem.c                 |  12 +-
 arch/mips/loongson32/common/prom.c                 |   4 +-
 arch/mips/loongson64/numa.c                        |  29 +-
 arch/mips/loongson64/reset.c                       |   5 -
 arch/mips/mm/c-r4k.c                               |  17 +-
 arch/mips/mm/page.c                                |  16 +-
 arch/mips/mm/sc-mips.c                             |   2 +
 arch/mips/mm/tlbex.c                               |   8 +-
 arch/mips/mm/uasm.c                                |   2 +-
 arch/mips/mti-malta/malta-setup.c                  |   1 -
 arch/mips/netlogic/xlp/setup.c                     |   2 +-
 arch/mips/netlogic/xlr/setup.c                     |   5 +-
 arch/mips/pci/pci-ar2315.c                         |   5 +-
 arch/mips/pci/pci-ar71xx.c                         |   4 +-
 arch/mips/pci/pci-ar724x.c                         |   9 +-
 arch/mips/pnx833x/Makefile                         |   4 -
 arch/mips/pnx833x/Platform                         |   4 -
 arch/mips/pnx833x/common/Makefile                  |   2 -
 arch/mips/pnx833x/common/interrupts.c              | 303 ----------
 arch/mips/pnx833x/common/platform.c                | 224 --------
 arch/mips/pnx833x/common/prom.c                    |  51 --
 arch/mips/pnx833x/common/reset.c                   |  31 -
 arch/mips/pnx833x/common/setup.c                   |  48 --
 arch/mips/pnx833x/stb22x/Makefile                  |   2 -
 arch/mips/pnx833x/stb22x/board.c                   | 120 ----
 arch/mips/ralink/of.c                              |   3 +-
 arch/mips/rb532/prom.c                             |   2 +-
 arch/mips/sgi-ip30/ip30-common.h                   |  14 +
 arch/mips/sgi-ip30/ip30-irq.c                      |   2 +
 arch/mips/sgi-ip32/ip32-memory.c                   |   3 +-
 arch/mips/sgi-ip32/ip32-setup.c                    |   2 -
 arch/mips/sibyte/common/cfe.c                      |  16 +-
 arch/mips/txx9/generic/setup_tx4939.c              |  17 -
 arch/mips/txx9/jmr3927/prom.c                      |   4 +-
 arch/mips/txx9/rbtx4927/prom.c                     |   5 +-
 arch/mips/txx9/rbtx4938/prom.c                     |   3 +-
 arch/mips/txx9/rbtx4939/prom.c                     |  14 +-
 drivers/firmware/broadcom/bcm47xx_sprom.c          |   1 +
 drivers/tty/serial/sb1250-duart.c                  |   9 +-
 include/linux/bcm47xx_sprom.h                      |  10 +
 include/linux/bcm963xx_tag.h                       |   2 +-
 lib/decompress_unzstd.c                            |   7 +-
 165 files changed, 1730 insertions(+), 3681 deletions(-)
 delete mode 100644 arch/mips/configs/pnx8335_stb225_defconfig
 create mode 100644 arch/mips/generic/board-ingenic.c
 delete mode 100644 arch/mips/include/asm/m48t37.h
 delete mode 100644 arch/mips/include/asm/mach-cavium-octeon/war.h
 delete mode 100644 arch/mips/include/asm/mach-generic/war.h
 rename arch/mips/include/asm/{mach-jz4740 => mach-ingenic}/cpu-feature-overrides.h (100%)
 delete mode 100644 arch/mips/include/asm/mach-ip22/war.h
 delete mode 100644 arch/mips/include/asm/mach-ip27/kmalloc.h
 delete mode 100644 arch/mips/include/asm/mach-ip27/war.h
 delete mode 100644 arch/mips/include/asm/mach-ip28/war.h
 delete mode 100644 arch/mips/include/asm/mach-ip30/irq.h
 delete mode 100644 arch/mips/include/asm/mach-ip30/war.h
 delete mode 100644 arch/mips/include/asm/mach-ip32/war.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/irq.h
 delete mode 100644 arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
 delete mode 100644 arch/mips/include/asm/mach-malta/malta-dtshim.h
 delete mode 100644 arch/mips/include/asm/mach-malta/malta-pm.h
 delete mode 100644 arch/mips/include/asm/mach-malta/war.h
 delete mode 100644 arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h
 delete mode 100644 arch/mips/include/asm/mach-paravirt/irq.h
 delete mode 100644 arch/mips/include/asm/mach-paravirt/kernel-entry-init.h
 delete mode 100644 arch/mips/include/asm/mach-pnx833x/gpio.h
 delete mode 100644 arch/mips/include/asm/mach-pnx833x/irq-mapping.h
 delete mode 100644 arch/mips/include/asm/mach-pnx833x/irq.h
 delete mode 100644 arch/mips/include/asm/mach-pnx833x/pnx833x.h
 delete mode 100644 arch/mips/include/asm/mach-rc32434/war.h
 delete mode 100644 arch/mips/include/asm/mach-rm/war.h
 delete mode 100644 arch/mips/include/asm/mach-sibyte/war.h
 delete mode 100644 arch/mips/include/asm/mach-tx49xx/war.h
 rename arch/mips/{jz4740 => ingenic}/Kconfig (91%)
 delete mode 100644 arch/mips/jz4740/Makefile
 delete mode 100644 arch/mips/jz4740/Platform
 delete mode 100644 arch/mips/jz4740/setup.c
 create mode 100644 arch/mips/kernel/cpu-r3k-probe.c
 create mode 100644 arch/mips/kernel/fpu-probe.c
 create mode 100644 arch/mips/kernel/fpu-probe.h
 delete mode 100644 arch/mips/pnx833x/Makefile
 delete mode 100644 arch/mips/pnx833x/Platform
 delete mode 100644 arch/mips/pnx833x/common/Makefile
 delete mode 100644 arch/mips/pnx833x/common/interrupts.c
 delete mode 100644 arch/mips/pnx833x/common/platform.c
 delete mode 100644 arch/mips/pnx833x/common/prom.c
 delete mode 100644 arch/mips/pnx833x/common/reset.c
 delete mode 100644 arch/mips/pnx833x/common/setup.c
 delete mode 100644 arch/mips/pnx833x/stb22x/Makefile
 delete mode 100644 arch/mips/pnx833x/stb22x/board.c

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
