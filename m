Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A6D2DBF33
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 12:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgLPLH1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Dec 2020 06:07:27 -0500
Received: from elvis.franken.de ([193.175.24.41]:43850 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgLPLH0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Dec 2020 06:07:26 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kpUdo-0003xo-00; Wed, 16 Dec 2020 12:06:44 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 91AF1C03D4; Wed, 16 Dec 2020 12:06:34 +0100 (CET)
Date:   Wed, 16 Dec 2020 12:06:34 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v5.11
Message-ID: <20201216110634.GA7546@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit ac3b57adf87ad9bac7e33ca26bbbb13fae1ed62b:

  MIPS: Alchemy: Fix memleak in alchemy_clk_setup_cpu (2020-11-17 12:53:57 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.11

for you to fetch changes up to ad4fddef5f2345aa9214e979febe2f47639c10d9:

  mips: fix Section mismatch in reference (2020-12-14 16:39:42 +0100)

----------------------------------------------------------------
MIPS updates for v5.11:

- enabled GCOV
- reworked setup of protection map
- added support for more MSCC platforms
- added sysfs boardinfo for Loongson64
- enabled KASLR for Loogson64
- added reset controller for BCM63xx
- cleanups and fixes

----------------------------------------------------------------
Alexander Dahl (1):
      MIPS: DTS: img: Fix schema warnings for pwm-leds

Alexander Lobakin (2):
      mips: boot: clean up self-extracting targets scenarios
      mips: boot: add support for self-extracting FIT images (vmlinuz.itb)

Alexander Sverdlin (3):
      MIPS: Don't round up kernel sections size for memblock_add()
      MIPS: OCTEON: Don't add kernel sections into memblock allocator
      MIPS: Octeon: irq: Alloc desc before configuring IRQ

Anders Roxell (2):
      mips: lib: uncached: fix non-standard usage of variable 'sp'
      mips: fix Section mismatch in reference

Andrey Zhizhikin (1):
      MIPS: configs: drop unused BACKLIGHT_GENERIC option

Chuanhong Guo (1):
      MIPS: zboot: put appended dtb into a section

Colin Ian King (1):
      MIPS: Kconfig: fix a few trivial spelling mistakes

Geert Uytterhoeven (1):
      mips: Remove #include <uapi/asm/types.h> from <asm/types.h>

Gregory CLEMENT (9):
      dt-bindings: mips: Add Luton
      dt-bindings: mips: Add Serval and Jaguar2
      MIPS: mscc: Prepare configuration to handle more SoCs
      MIPS: mscc: Fix configuration name for ocelot legacy boards
      MIPS: mscc: Add luton dtsi
      MIPS: mscc: Add luton PC0B91 device tree
      MIPS: mscc: build FIT image for Luton
      MIPS: mscc: Add jaguar2 support
      MIPS: mscc: Add serval support

Huacai Chen (1):
      MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org

Jinyang He (4):
      MIPS: KASLR: Correct valid bits in apply_r_mips_26_rel()
      MIPS: Loongson64: Add KASLR support
      MIPS: Loongson64: Fix up reserving kernel memory range
      MIPS: KASLR: Avoid endless loop in sync_icache if synci_step is zero

Krzysztof Kozlowski (2):
      MAINTAINERS: Remove JZ4780 DMA driver entry
      MAINTAINERS: Add linux-mips mailing list to JZ47xx entries

Necip Fazil Yildiran (2):
      MIPS: BMC47xx: fix kconfig dependency bug for BCM47XX_SSB
      MIPS: BCM47XX: fix kconfig dependency bug for BCM47XX_BCMA

Nick Desaulniers (1):
      MIPS: remove GCC < 4.9 support

Qinglang Miao (4):
      mips: ar7: add missing iounmap() on error in ar7_gpio_init
      mips: cm: add missing iounmap() on error in mips_cm_probe()
      mips: Vr41xx: add missing iounmap() on error in vr41xx_pciu_init()
      mips: cdmm: fix use-after-free in mips_cdmm_bus_discover

Sam Ravnborg (1):
      MIPS: ingenic: remove unused platform_data header file

Serge Semin (3):
      mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes name
      mips: dts: sead3: Harmonize EHCI/OHCI DT nodes name
      mips: dts: ralink: mt7628a: Harmonize EHCI/OHCI DT nodes name

Thomas Bogendoerfer (7):
      Merge tag 'mips_fixes_5.10_1' into mips-next
      MIPS: vdso: Use vma page protection for remapping
      MIPS: kvm: Use vm_get_page_prot to get protection bits
      MIPS: mm: shorten lines by using macro
      MIPS: mm: Clean up setup of protection map
      MIPS: mm: Remove unused is_aligned_hugepage_range
      MIPS: mm: Add back define for PAGE_SHARED

Tiezhu Yang (12):
      MIPS: Loongson64: Add /sys/firmware/lefi/boardinfo
      Documentation: ABI: Add /sys/firmware/lefi/boardinfo description for Loongson64
      MIPS: Loongson64: Do not write the read only field LPA of CP0_CONFIG3
      MIPS: Loongson64: Set the field ELPA of CP0_PAGEGRAIN only once
      MIPS: Loongson64: Set IPI_Enable register per core by itself
      MIPS: Loongson64: Add Mail_Send support for 3A4000+ CPU
      MIPS: Loongson64: SMP: Fix up play_dead jump indicator
      MIPS: Remove cpu_has_6k_cache and cpu_has_8k_cache in cpu_cache_init()
      MIPS: Loongson64: Fix wrong scache size when execute lscpu
      MIPS: No need to check CPU 0 in {loongson3,bmips,octeon}_cpu_disable()
      MIPS: Move memblock_dump_all() to the end of setup_arch()
      MIPS: Select ARCH_KEEP_MEMBLOCK if DEBUG_KERNEL to enable sysfs memblock debug

Wei Li (1):
      MIPS: SMP-CPS: Add support for irq migration when CPU offline

Xingxing Su (1):
      MIPS: Enable GCOV

Álvaro Fernández Rojas (9):
      mips: bmips: select ARCH_HAS_RESET_CONTROLLER
      dt-bindings: reset: add BCM6345 reset controller bindings
      reset: add BCM6345 reset controller driver
      mips: bmips: dts: add BCM6328 reset controller support
      mips: bmips: dts: add BCM6358 reset controller support
      mips: bmips: dts: add BCM6362 reset controller support
      mips: bmips: dts: add BCM6368 reset controller support
      mips: bmips: dts: add BCM63268 reset controller support
      mips: bmips: add BCM6318 reset controller definitions

周琰杰 (Zhou Yanjie) (2):
      MIPS: Ingenic: Add missing nodes for Ingenic SoCs and boards.
      MIPS: Ingenic: Refresh defconfig for Ingenic SoCs based boards.

 .mailmap                                           |   2 +
 .../ABI/testing/sysfs-firmware-lefi-boardinfo      |  35 +++
 Documentation/devicetree/bindings/mips/mscc.txt    |   2 +-
 .../bindings/reset/brcm,bcm6345-reset.yaml         |  37 +++
 MAINTAINERS                                        |  11 +-
 arch/mips/Kconfig                                  |  15 +-
 arch/mips/Makefile                                 |   3 +-
 arch/mips/ar7/gpio.c                               |   1 +
 arch/mips/bcm47xx/Kconfig                          |   2 +
 arch/mips/boot/.gitignore                          |   1 +
 arch/mips/boot/compressed/Makefile                 |  97 ++++++--
 arch/mips/boot/compressed/ld.script                |   9 +-
 arch/mips/boot/dts/Makefile                        |   2 +-
 arch/mips/boot/dts/brcm/bcm63268.dtsi              |   6 +
 arch/mips/boot/dts/brcm/bcm6328.dtsi               |   6 +
 arch/mips/boot/dts/brcm/bcm6358.dtsi               |   6 +
 arch/mips/boot/dts/brcm/bcm6362.dtsi               |   6 +
 arch/mips/boot/dts/brcm/bcm6368.dtsi               |   6 +
 arch/mips/boot/dts/img/pistachio_marduk.dts        |   5 +-
 arch/mips/boot/dts/ingenic/ci20.dts                |  45 +++-
 arch/mips/boot/dts/ingenic/cu1000-neo.dts          |  62 ++++-
 arch/mips/boot/dts/ingenic/cu1830-neo.dts          |  66 ++++-
 arch/mips/boot/dts/ingenic/jz4740.dtsi             |   2 +-
 arch/mips/boot/dts/ingenic/jz4770.dtsi             |   2 +-
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  45 +++-
 arch/mips/boot/dts/ingenic/x1000.dtsi              |  56 ++++-
 arch/mips/boot/dts/ingenic/x1830.dtsi              |  58 ++++-
 arch/mips/boot/dts/mscc/Makefile                   |  11 +-
 arch/mips/boot/dts/mscc/jaguar2.dtsi               | 167 +++++++++++++
 arch/mips/boot/dts/mscc/jaguar2_common.dtsi        |  25 ++
 arch/mips/boot/dts/mscc/jaguar2_pcb110.dts         | 267 +++++++++++++++++++++
 arch/mips/boot/dts/mscc/jaguar2_pcb111.dts         | 107 +++++++++
 arch/mips/boot/dts/mscc/jaguar2_pcb118.dts         |  57 +++++
 arch/mips/boot/dts/mscc/luton.dtsi                 | 116 +++++++++
 arch/mips/boot/dts/mscc/luton_pcb091.dts           |  30 +++
 arch/mips/boot/dts/mscc/serval.dtsi                | 153 ++++++++++++
 arch/mips/boot/dts/mscc/serval_common.dtsi         | 127 ++++++++++
 arch/mips/boot/dts/mscc/serval_pcb105.dts          |  17 ++
 arch/mips/boot/dts/mscc/serval_pcb106.dts          |  17 ++
 arch/mips/boot/dts/mti/sead3.dts                   |   2 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi             |   2 +-
 arch/mips/cavium-octeon/octeon-irq.c               |  15 ++
 arch/mips/cavium-octeon/setup.c                    |   9 -
 arch/mips/cavium-octeon/smp.c                      |   3 -
 arch/mips/configs/ci20_defconfig                   |  15 +-
 arch/mips/configs/cu1000-neo_defconfig             |  28 ++-
 arch/mips/configs/cu1830-neo_defconfig             |  32 ++-
 arch/mips/configs/gcw0_defconfig                   |   1 -
 arch/mips/configs/gpr_defconfig                    |   1 -
 arch/mips/configs/lemote2f_defconfig               |   1 -
 arch/mips/configs/loongson3_defconfig              |   1 -
 arch/mips/configs/mtx1_defconfig                   |   1 -
 arch/mips/configs/rs90_defconfig                   |   1 -
 arch/mips/generic/Kconfig                          |  37 ++-
 arch/mips/generic/Platform                         |   3 +
 arch/mips/generic/board-jaguar2.its.S              |  40 +++
 arch/mips/generic/board-luton.its.S                |  23 ++
 arch/mips/generic/board-serval.its.S               |  24 ++
 arch/mips/include/asm/compiler.h                   |   9 +-
 arch/mips/include/asm/cpu-features.h               |   2 -
 arch/mips/include/asm/mach-loongson64/boot_param.h |   4 +
 .../asm/mach-loongson64/kernel-entry-init.h        |   8 -
 .../include/asm/mach-loongson64/loongson_regs.h    |  10 +
 arch/mips/include/asm/pgtable.h                    |  10 +-
 arch/mips/include/asm/types.h                      |   1 -
 arch/mips/kernel/mips-cm.c                         |   1 +
 arch/mips/kernel/relocate.c                        |  13 +-
 arch/mips/kernel/setup.c                           |   8 +-
 arch/mips/kernel/smp-bmips.c                       |   3 -
 arch/mips/kernel/smp-cps.c                         |   2 +
 arch/mips/kernel/vdso.c                            |   4 +-
 arch/mips/kvm/mmu.c                                |   4 +-
 arch/mips/lib/uncached.c                           |   4 +-
 arch/mips/loongson64/Makefile                      |   1 +
 arch/mips/loongson64/boardinfo.c                   |  48 ++++
 arch/mips/loongson64/env.c                         |  10 +
 arch/mips/loongson64/numa.c                        |  27 +--
 arch/mips/loongson64/smp.c                         | 126 +++++++---
 arch/mips/mm/c-r4k.c                               |  12 +-
 arch/mips/mm/cache.c                               |  69 ++----
 arch/mips/mm/hugetlbpage.c                         |  12 -
 arch/mips/mm/sc-mips.c                             |   4 +-
 arch/mips/pci/pci-vr41xx.c                         |   4 +-
 drivers/bus/mips_cdmm.c                            |   4 +-
 drivers/reset/Kconfig                              |   7 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-bcm6345.c                      | 135 +++++++++++
 include/dt-bindings/reset/bcm6318-reset.h          |  20 ++
 include/dt-bindings/reset/bcm63268-reset.h         |  26 ++
 include/dt-bindings/reset/bcm6328-reset.h          |  18 ++
 include/dt-bindings/reset/bcm6358-reset.h          |  15 ++
 include/dt-bindings/reset/bcm6362-reset.h          |  22 ++
 include/dt-bindings/reset/bcm6368-reset.h          |  16 ++
 include/linux/platform_data/jz4740/jz4740_nand.h   |  25 --
 94 files changed, 2328 insertions(+), 278 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
 create mode 100644 arch/mips/boot/dts/mscc/jaguar2.dtsi
 create mode 100644 arch/mips/boot/dts/mscc/jaguar2_common.dtsi
 create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb110.dts
 create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb111.dts
 create mode 100644 arch/mips/boot/dts/mscc/jaguar2_pcb118.dts
 create mode 100644 arch/mips/boot/dts/mscc/luton.dtsi
 create mode 100644 arch/mips/boot/dts/mscc/luton_pcb091.dts
 create mode 100644 arch/mips/boot/dts/mscc/serval.dtsi
 create mode 100644 arch/mips/boot/dts/mscc/serval_common.dtsi
 create mode 100644 arch/mips/boot/dts/mscc/serval_pcb105.dts
 create mode 100644 arch/mips/boot/dts/mscc/serval_pcb106.dts
 create mode 100644 arch/mips/generic/board-jaguar2.its.S
 create mode 100644 arch/mips/generic/board-luton.its.S
 create mode 100644 arch/mips/generic/board-serval.its.S
 create mode 100644 arch/mips/loongson64/boardinfo.c
 create mode 100644 drivers/reset/reset-bcm6345.c
 create mode 100644 include/dt-bindings/reset/bcm6318-reset.h
 create mode 100644 include/dt-bindings/reset/bcm63268-reset.h
 create mode 100644 include/dt-bindings/reset/bcm6328-reset.h
 create mode 100644 include/dt-bindings/reset/bcm6358-reset.h
 create mode 100644 include/dt-bindings/reset/bcm6362-reset.h
 create mode 100644 include/dt-bindings/reset/bcm6368-reset.h
 delete mode 100644 include/linux/platform_data/jz4740/jz4740_nand.h

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
