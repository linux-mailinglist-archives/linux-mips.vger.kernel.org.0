Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE6B1EBC1E
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jun 2020 14:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgFBMy5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Jun 2020 08:54:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:48600 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbgFBMy5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Jun 2020 08:54:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jg6RQ-00040q-00; Tue, 02 Jun 2020 14:54:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 41978C065D; Tue,  2 Jun 2020 14:54:45 +0200 (CEST)
Date:   Tue, 2 Jun 2020 14:54:45 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v5.8-rc1
Message-ID: <20200602125445.GA12527@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus,

this is the pull-requests for MIPS. A test merged between your current
master (f359287765c0) and mips-next showed a conflict in

  arch/mips/include/asm/module.h

between commit:

  62d0fd591db1 ("arch: split MODULE_ARCH_VERMAGIC definitions out to
<asm/vermagic.h>")

from Linus' tree and commits:

  ab7c01fdc3cf ("mips: Add MIPS Release 5 support")
  281e3aea35e5 ("mips: Add MIPS Warrior P5600 support")

from the mips tree.

Conflict resolution from Stephen Rottwell is:

From: Stephen Rothwell <s...@canb.auug.org.au>
Date: Mon, 25 May 2020 10:03:07 +1000
Subject: [PATCH] mips: vermagic updates

Signed-off-by: Stephen Rothwell <s...@canb.auug.org.au>
---
 arch/mips/include/asm/vermagic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/vermagic.h b/arch/mips/include/asm/vermagic.h
index 24dc3d35161c..4d2dae0c7c57 100644
--- a/arch/mips/include/asm/vermagic.h
+++ b/arch/mips/include/asm/vermagic.h
@@ -8,12 +8,16 @@
 #define MODULE_PROC_FAMILY "MIPS32_R1 "
 #elif defined CONFIG_CPU_MIPS32_R2
 #define MODULE_PROC_FAMILY "MIPS32_R2 "
+#elif defined CONFIG_CPU_MIPS32_R5
+#define MODULE_PROC_FAMILY "MIPS32_R5 "
 #elif defined CONFIG_CPU_MIPS32_R6
 #define MODULE_PROC_FAMILY "MIPS32_R6 "
 #elif defined CONFIG_CPU_MIPS64_R1
 #define MODULE_PROC_FAMILY "MIPS64_R1 "
 #elif defined CONFIG_CPU_MIPS64_R2
 #define MODULE_PROC_FAMILY "MIPS64_R2 "
+#elif defined CONFIG_CPU_MIPS64_R5
+#define MODULE_PROC_FAMILY "MIPS64_R5 "
 #elif defined CONFIG_CPU_MIPS64_R6
 #define MODULE_PROC_FAMILY "MIPS64_R6 "
 #elif defined CONFIG_CPU_R3000
@@ -46,6 +50,8 @@
 #define MODULE_PROC_FAMILY "LOONGSON64 "
 #elif defined CONFIG_CPU_CAVIUM_OCTEON
 #define MODULE_PROC_FAMILY "OCTEON "
+#elif defined CONFIG_CPU_P5600
+#define MODULE_PROC_FAMILY "P5600 "
 #elif defined CONFIG_CPU_XLR
 #define MODULE_PROC_FAMILY "XLR "
 #elif defined CONFIG_CPU_XLP



There were two more conflicts in linux-next:

Conflict in

  arch/mips/lasat/sysctl.c

between commit:

  10760dde9be3 ("MIPS: Remove support for LASAT")

from the mips tree and commit:

  32927393dc1c ("sysctl: pass kernel pointers to ->proc_handler")

from the vfs tree.

Here the resolution is to keep arch/mips/lasat/sysctl.c deleted.


Conflict in 

  mm/memory.c

between commit:

  7df676974359 ("mm/memory.c: Update local TLB if PTE entry exists")

from the mips tree and commit:

  e325f89fdd69 ("mm: memcontrol: convert anon and file-thp to new mem_cgroup_charge() API")

from the akpm-current tree.

Agreed resolution is:

"We decided that the update_mmu_tlb() call is no longer needed here, so
there is no need to re-add it when resolving this."

Thomas.



The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux tags/mips_5.8

for you to fetch changes up to 9bd0bd264578fe191bf5d2ff23f9887b91862536:

  MIPS: ralink: drop ralink_clk_init for mt7621 (2020-05-31 14:17:00 +0200)

----------------------------------------------------------------
MIPS updates for v5.8:

- added support for MIPSr5 and P5600 cores
- converted Loongson PCI driver into a PCI host driver using the generic
  PCI framework
- added emulation of CPUCFG command for Loogonson64 cpus
- removed of LASAT, PMC MSP71xx and NEC MARKEINS/EMMA
- ioremap cleanup
- fix for a race between two threads faulting the same page
- various cleanups and fixes

----------------------------------------------------------------
Arnd Bergmann (1):
      mips: loongsoon2ef: remove private clk api

Ben Hutchings (1):
      MIPS: Fix exception handler memcpy()

Bibo Mao (4):
      MIPS: Do not flush tlb page when updating PTE entry
      mm/memory.c: Update local TLB if PTE entry exists
      mm/memory.c: Add memory read privilege on page fault handling
      MIPS: mm: add page valid judgement in function pte_modify

Bin Meng (1):
      mips: Drop CONFIG_MTD_M25P80 in various defconfig files

Christoph Hellwig (9):
      ASoC: txx9: don't work around too small resource_size_t
      MIPS: remove cpu_has_64bit_addresses
      MIPS: cleanup fixup_bigphys_addr handling
      MIPS: merge __ioremap_mode into ioremap_prot
      MIPS: split out the 64-bit ioremap implementation
      MIPS: move ioremap_prot und iounmap out of line
      MIPS: use ioremap_page_range
      ASoC: txx9: add back the hack for a too small resource_size_t
      MIPS: unexport __flush_icache_user_range

Christophe JAILLET (1):
      MIPS: ralink: bootrom: mark a function as __init to save some memory

Chuanhong Guo (1):
      MIPS: ralink: drop ralink_clk_init for mt7621

Daniel González Cabanelas (1):
      MIPS: BCM63XX: fix BCM6358 GPIO count

Geert Uytterhoeven (1):
      MIPS: ingenic: Replace <linux/clk-provider.h> by <linux/of_clk.h>

Guoyun Sun (1):
      mips/mm: Add page soft dirty tracking

Gustavo A. R. Silva (1):
      MIPS: Replace zero-length array with flexible-array

H. Nikolaus Schaller (1):
      MIPS: DTS: CI20: make DM9000 Ethernet controller use NVMEM to find the default MAC address

Huacai Chen (11):
      MIPS: Fix the declaration conflict of mm_isBranchInstr()
      MIPS: Move unaligned load/store helpers to inst.h
      MIPS: Loongson-3: Add some unaligned instructions emulation
      MIPS: Rename the "Fill" cache ops to avoid build failure
      MIPS: perf: Add hardware perf events support for new Loongson-3
      MIPS: perf: Remove unnecessary "fallthrough" pseudo keywords
      MIPS: asm: Rename some macros to avoid build errors
      MIPS: inst.h: Stop including asm.h to avoid various build failures
      MIPS: Fix typos in arch/mips/Kbuild.platforms
      MIPS: Fix "make clean" error due to recent changes
      MIPS: Tidy up CP0.Config6 bits definition

Jason Yan (7):
      MIPS: Netlogic: remove unneeded semicolon in fmn_message_handler()
      MIPS: oprofile: remove unneeded semicolon in common.c
      MIPS: Octeon: Remove dead code in __cvmx_helper_npi_probe()
      MIPS: CFE: Remove dead code in cfe_getfwinfo()
      MIPS: Remove dead code in pci.h
      KVM: MIPS: use true,false for bool variable
      KVM: MIPS/TLB: Remove Unneeded semicolon in tlb.c

Jiaxun Yang (18):
      MIPS: Kill MIPS_GIC_IRQ_BASE
      MIPS: Loongson64: Remove dead RTC code
      MIPS: Loongson64: Make RS780E ACPI as a platform driver
      dt-bindings: Document Loongson RS780E PCH ACPI Controller
      MIPS: DTS: Loongson64: Add ACPI Controller Node
      MIPS: Loongson64: Mark RS780 HPET as broken
      MIPS: Clear XContext at boot time
      MIPS: Kernel: Identify Loongson-2K processors
      MIPS: Loongson64: Probe CPU features via CPUCFG
      MIPS: Loongson64: Correct TLB type for Loongson-3 Classic
      MIPS: Truncate link address into 32bit for 32bit kernel
      PCI: Don't disable decoding when mmio_always_on is set
      PCI: Add Loongson PCI Controller support
      dt-bindings: Document Loongson PCI Host Controller
      MIPS: DTS: Loongson64: Add PCI Controller Node
      MIPS: Loongson64: Switch to generic PCI driver
      MIPS: Loongson64: select NO_EXCEPT_FILL
      MIPS: Loongson64: Define PCI_IOBASE

Joshua Kinard (3):
      MIPS: SGI-IP27: Use the _AC() macro in spaces.h
      MIPS: SGI-IP30: Remove R5432_CP0_INTERRUPT_WAR from war.h
      MIPS: SGI-IP30: Reorder the macros in war.h

Kaige Li (1):
      MIPS: tools: Fix resource leak in elf-entry.c

Lars Povlsen (1):
      MIPS: dts: mscc: Updated changed name for miim pinctrl function

Liangliang Huang (3):
      MIPS: arch_send_call_function_single_ipi() calling conventions change
      MIPS: Loongson64: Switch the order of RS780E and LS7A
      MIPS: Use fallthrough for arch/mips

Lichao Liu (1):
      MIPS: CPU_LOONGSON2EF need software to maintain cache consistency

Mike Rapoport (1):
      mips: define pud_index() regardless of page table folding

Nathan Chancellor (4):
      MIPS: VDSO: Move disabling the VDSO logic to Kconfig
      MIPS: Unconditionally specify '-EB' or '-EL'
      MIPS: VDSO: Use $(LD) instead of $(CC) to link VDSO
      MIPS: VDSO: Allow ld.lld to link the VDSO

Oleksij Rempel (2):
      MIPS: ath79: ar9331_dpt_module: update led nodes
      MIPS: ath79: ar9331: rename uart to serial node

Paul Cercueil (12):
      MIPS: ingenic: DTS: Fix invalid value in #dma-cells
      MIPS: ingenic: DTS: Respect cell count of common properties
      MIPS: ingenic: DTS: Add nodes for the watchdog/PWM/OST
      MIPS: ingenic: DTS: Update JZ4770 support
      MIPS: ingenic: DTS: Update GCW0 support
      MIPS: ingenic: CI20: enable OST, PWM drivers in defconfig
      MIPS: ingenic: GCW0: Update defconfig
      MIPS: ingenic: Drop obsolete code, merge the rest in setup.c
      MIPS: ingenic: Add missing include
      MIPS: ingenic: DTS: Add memory info of GCW Zero
      MIPS: ingenic: Add support for GCW Zero prototype
      MIPS: ingenic: Default to a generic board

PrasannaKumar Muralidharan (1):
      MIPS: DTS: JZ4780: define node for JZ4780 efuse

Sami Tolvanen (1):
      kbuild: add CONFIG_LD_IS_LLD

Serge Semin (13):
      mips: cm: Fix an invalid error code of INTVN_*_ERR
      mips: cm: Add L2 ECC/parity errors reporting
      mips: MAAR: Add XPA mode support
      mips: MAAR: Use more precise address mask
      mips: Add MIPS Release 5 support
      mips: Add MIPS Warrior P5600 support
      mips: Fix cpu_has_mips64r1/2 activation for MIPS32 CPUs
      mips: Add CP0 Write Merge config support
      mips: Add CONFIG/CONFIG6/Cause reg fields macro
      mips: Add CPS_NS16550_WIDTH config
      mips: Add udelay lpj numbers adjustment
      mips: csrc-r4k: Mark R4K timer as unstable if CPU freq changes
      mips: cevt-r4k: Update the r4k-clockevent frequency in sync with CPU

Thomas Bogendoerfer (8):
      MIPS: alchemy: Fix build error after ioremap cleanup
      MIPS: Remove support for LASAT
      MIPS: Remove PMC MSP71xx platform
      MIPS: Remove NEC MARKEINS/EMMA
      MIPS: Only include the platform file needed
      MIPS: Fix builds for VR41xx platforms
      MIPS: ralink: Don't include objects twice
      MIPS: Fix build warning about "PTR_STR" redefinition

Tiezhu Yang (18):
      MIPS: Loongson: Use CONFIG_NR_CPUS_DEFAULT_64 to support more CPUs
      MIPS: Do not initialise globals to 0
      MIPS: Cleanup code about plat_mem_setup()
      MIPS: Make sparse_init() using top-down allocation
      MIPS: Loongson: Add support for perf tool
      MIPS: Loongson: Get host bridge information
      MIPS: tools: Show result for loongson3-llsc-check
      MIPS: tools: Move "returns" after "loongson3-llsc-check"
      MIPS: Loongson: Add DMA support for LS7A
      MIPS: Loongson: Build ATI Radeon GPU driver as module
      MIPS: Remove not used 8250-platform.c
      MIPS: Loongson: Enable devicetree based probing for 8250 ports in defconfig
      MIPS: SGI-IP27: Remove duplicated include in ip27-timer.c
      MIPS: SGI-IP27: Remove not used includes and comment in ip27-timer.c
      MIPS: SGI-IP27: Remove not used definition TICK_SIZE in ip27-timer.c
      MIPS: DTS: Only build subdir of current platform
      MIPS: DTS: Fix build errors used with various configs
      MIPS: Loongson64: Remove not used pci.c

WANG Xuerui (7):
      MIPS: Loongson64: fix typos in loongson_regs.h
      MIPS: Loongson64: define offsets and known revisions for some CPUCFG features
      MIPS: define more Loongson CP0.Config6 and CP0.Diag feature bits
      MIPS: emulate CPUCFG instruction on older Loongson64 cores
      MIPS: Loongson64: Guard against future cores without CPUCFG
      MIPS: Expose Loongson CPUCFG availability via HWCAP
      MIPS: Loongson64: Reorder CPUCFG model match arms

YuanJunQing (1):
      MIPS: Fix IRQ tracing when call handle_fpe() and handle_msa_fpe()

YueHaibing (1):
      MIPS: TXx9: Fix Kconfig warnings

Zhi Li (1):
      MIPS: Remove useless parameter of bootcmdline_init()

Zou Wei (2):
      KVM: MIPS/VZ: Remove unneeded semicolon
      KVM: MIPS/Emulate: Remove unneeded semicolon

bibo mao (2):
      MIPS: xilfpga: Removed unused header files
      MIPS: Fix typo for user_ld macro definition

Álvaro Fernández Rojas (1):
      MIPS: BCM63xx: fix 6328 boot selection bit

 .../bindings/mips/loongson/rs780e-acpi.yaml        |  40 +
 .../devicetree/bindings/pci/loongson.yaml          |  62 ++
 arch/mips/Kbuild                                   |   2 +-
 arch/mips/Kbuild.platforms                         |  76 +-
 arch/mips/Kconfig                                  | 174 ++--
 arch/mips/Kconfig.debug                            |  10 +
 arch/mips/Makefile                                 |  48 +-
 arch/mips/alchemy/Platform                         |   3 -
 arch/mips/alchemy/common/setup.c                   |  17 +-
 arch/mips/alchemy/devboards/db1550.c               |   2 +-
 arch/mips/ar7/Platform                             |   1 -
 arch/mips/ar7/setup.c                              |   2 +-
 arch/mips/ath25/Platform                           |   1 -
 arch/mips/ath79/Platform                           |   1 -
 arch/mips/ath79/setup.c                            |   3 +-
 arch/mips/bcm47xx/Platform                         |   1 -
 arch/mips/bcm63xx/Platform                         |   1 -
 arch/mips/bcm63xx/cpu.c                            |   2 +-
 arch/mips/bcm63xx/dev-flash.c                      |   2 +-
 arch/mips/bmips/Platform                           |   1 -
 arch/mips/boot/compressed/Makefile                 |   2 +-
 arch/mips/boot/dts/Makefile                        |  30 +-
 arch/mips/boot/dts/ingenic/ci20.dts                |   3 +
 arch/mips/boot/dts/ingenic/gcw0.dts                | 505 ++++++++++-
 arch/mips/boot/dts/ingenic/gcw0_proto.dts          |  13 +
 arch/mips/boot/dts/ingenic/jz4740.dtsi             |  33 +-
 arch/mips/boot/dts/ingenic/jz4770.dtsi             | 227 ++++-
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  65 +-
 arch/mips/boot/dts/ingenic/x1000.dtsi              |   9 +-
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi        |  17 +
 arch/mips/boot/dts/mscc/ocelot.dtsi                |   2 +-
 arch/mips/boot/dts/qca/ar9331.dtsi                 |   2 +-
 arch/mips/boot/dts/qca/ar9331_dpt_module.dts       |   6 +-
 arch/mips/cavium-octeon/Platform                   |   1 -
 .../mips/cavium-octeon/executive/cvmx-helper-npi.c |  12 -
 arch/mips/cavium-octeon/executive/cvmx-pko.c       |   2 +-
 arch/mips/cavium-octeon/octeon-platform.c          |   4 +-
 arch/mips/cavium-octeon/octeon-usb.c               |   2 +-
 arch/mips/cobalt/Platform                          |   1 -
 arch/mips/configs/ath79_defconfig                  |   1 -
 arch/mips/configs/ci20_defconfig                   |  62 +-
 arch/mips/configs/db1xxx_defconfig                 |   1 -
 arch/mips/configs/gcw0_defconfig                   | 131 ++-
 arch/mips/configs/generic/board-ocelot.config      |   1 -
 arch/mips/configs/lasat_defconfig                  |  55 --
 arch/mips/configs/loongson3_defconfig              |   4 +-
 arch/mips/configs/markeins_defconfig               | 185 ----
 arch/mips/configs/msp71xx_defconfig                |  77 --
 arch/mips/configs/pistachio_defconfig              |   1 -
 arch/mips/configs/rt305x_defconfig                 |   1 -
 arch/mips/dec/Platform                             |   1 -
 arch/mips/dec/int-handler.S                        |   4 +-
 arch/mips/dec/tc.c                                 |   2 +-
 arch/mips/emma/Makefile                            |   7 -
 arch/mips/emma/Platform                            |   4 -
 arch/mips/emma/common/Makefile                     |   6 -
 arch/mips/emma/common/prom.c                       |  56 --
 arch/mips/emma/markeins/Makefile                   |   6 -
 arch/mips/emma/markeins/irq.c                      | 293 -------
 arch/mips/emma/markeins/led.c                      |  44 -
 arch/mips/emma/markeins/platform.c                 | 199 -----
 arch/mips/emma/markeins/setup.c                    | 115 ---
 arch/mips/fw/cfe/cfe_api.c                         |   5 -
 arch/mips/generic/Platform                         |   1 -
 arch/mips/include/asm/asm-eva.h                    |   2 +-
 arch/mips/include/asm/asm.h                        |  24 +-
 arch/mips/include/asm/asmmacro.h                   |  18 +-
 arch/mips/include/asm/bootinfo.h                   |  13 +-
 arch/mips/include/asm/branch.h                     |   3 +
 arch/mips/include/asm/cacheops.h                   |   2 +-
 arch/mips/include/asm/clock.h                      |  49 --
 arch/mips/include/asm/compiler.h                   |   5 +
 arch/mips/include/asm/cpu-features.h               |  47 +-
 arch/mips/include/asm/cpu-info.h                   |  11 +-
 arch/mips/include/asm/cpu-type.h                   |   7 +-
 arch/mips/include/asm/cpu.h                        |  18 +-
 arch/mips/include/asm/emma/emma2rh.h               | 248 ------
 arch/mips/include/asm/emma/markeins.h              |  28 -
 arch/mips/include/asm/fpu.h                        |   6 +-
 arch/mips/include/asm/fpu_emulator.h               |   4 -
 arch/mips/include/asm/hazards.h                    |   8 +-
 arch/mips/include/asm/io.h                         |  87 +-
 arch/mips/include/asm/lasat/ds1603.h               |  19 -
 arch/mips/include/asm/lasat/eeprom.h               |  18 -
 arch/mips/include/asm/lasat/head.h                 |  23 -
 arch/mips/include/asm/lasat/lasat.h                | 245 ------
 arch/mips/include/asm/lasat/lasatint.h             |  15 -
 arch/mips/include/asm/lasat/picvue.h               |  16 -
 arch/mips/include/asm/lasat/serial.h               |  14 -
 arch/mips/include/asm/maar.h                       |  17 +-
 .../include/asm/mach-ath25/cpu-feature-overrides.h |   1 -
 .../include/asm/mach-ath79/cpu-feature-overrides.h |   1 -
 arch/mips/include/asm/mach-au1x00/ioremap.h        |  38 -
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h  |   6 +-
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h  |   4 +-
 arch/mips/include/asm/mach-bcm63xx/ioremap.h       |   5 -
 arch/mips/include/asm/mach-bmips/ioremap.h         |   5 -
 arch/mips/include/asm/mach-emma2rh/irq.h           |  15 -
 arch/mips/include/asm/mach-generic/ioremap.h       |   9 -
 arch/mips/include/asm/mach-generic/irq.h           |   6 -
 arch/mips/include/asm/mach-ip27/spaces.h           |  12 +-
 arch/mips/include/asm/mach-ip30/war.h              |   6 +-
 arch/mips/include/asm/mach-jz4740/base.h           |  27 -
 arch/mips/include/asm/mach-jz4740/dma.h            |  23 -
 arch/mips/include/asm/mach-jz4740/irq.h            |  45 +-
 arch/mips/include/asm/mach-jz4740/timer.h          | 126 ---
 .../asm/mach-lantiq/falcon/cpu-feature-overrides.h |   1 -
 arch/mips/include/asm/mach-lasat/irq.h             |  14 -
 arch/mips/include/asm/mach-lasat/mach-gt64120.h    |  28 -
 arch/mips/include/asm/mach-loongson2ef/loongson.h  |   1 +
 arch/mips/include/asm/mach-loongson64/boot_param.h |  11 +
 .../asm/mach-loongson64/cpu-feature-overrides.h    |   1 +
 .../mips/include/asm/mach-loongson64/cpucfg-emul.h |  74 ++
 .../include/asm/mach-loongson64/loongson_regs.h    |  29 +-
 .../mips/include/asm/mach-loongson64/mc146818rtc.h |  36 -
 arch/mips/include/asm/mach-loongson64/spaces.h     |   8 +
 .../asm/mach-pmcs-msp71xx/cpu-feature-overrides.h  |  22 -
 .../include/asm/mach-pmcs-msp71xx/msp_cic_int.h    | 139 ---
 .../asm/mach-pmcs-msp71xx/msp_gpio_macros.h        | 343 --------
 arch/mips/include/asm/mach-pmcs-msp71xx/msp_int.h  |  31 -
 arch/mips/include/asm/mach-pmcs-msp71xx/msp_pci.h  | 189 -----
 arch/mips/include/asm/mach-pmcs-msp71xx/msp_prom.h | 159 ----
 .../include/asm/mach-pmcs-msp71xx/msp_regops.h     | 237 ------
 arch/mips/include/asm/mach-pmcs-msp71xx/msp_regs.h | 652 --------------
 .../include/asm/mach-pmcs-msp71xx/msp_slp_int.h    | 129 ---
 arch/mips/include/asm/mach-pmcs-msp71xx/msp_usb.h  | 124 ---
 arch/mips/include/asm/mach-pmcs-msp71xx/war.h      |  28 -
 .../asm/mach-ralink/mt7620/cpu-feature-overrides.h |   1 -
 arch/mips/include/asm/mach-ralink/mt7621.h         |   2 -
 .../asm/mach-ralink/mt7621/cpu-feature-overrides.h |   1 -
 .../asm/mach-ralink/rt288x/cpu-feature-overrides.h |   1 -
 .../asm/mach-ralink/rt305x/cpu-feature-overrides.h |   1 -
 .../asm/mach-ralink/rt3883/cpu-feature-overrides.h |   1 -
 .../asm/mach-rc32434/cpu-feature-overrides.h       |   1 -
 arch/mips/include/asm/mach-rc32434/pci.h           |   3 -
 arch/mips/include/asm/mach-tx39xx/ioremap.h        |   9 -
 arch/mips/include/asm/mach-tx49xx/ioremap.h        |   9 -
 arch/mips/include/asm/mach-xilfpga/irq.h           |  14 -
 arch/mips/include/asm/mipsregs.h                   |  61 +-
 arch/mips/include/asm/module.h                     |   6 +
 arch/mips/include/asm/nile4.h                      | 310 -------
 arch/mips/include/asm/octeon/cvmx-sli-defs.h       |   2 +-
 arch/mips/include/asm/page.h                       |   2 +-
 arch/mips/include/asm/pgtable-64.h                 |   4 +-
 arch/mips/include/asm/pgtable-bits.h               |  20 +-
 arch/mips/include/asm/pgtable.h                    | 108 ++-
 arch/mips/include/asm/smp.h                        |   2 +-
 arch/mips/include/asm/stackframe.h                 |   2 +-
 arch/mips/include/asm/switch_to.h                  |   8 +-
 arch/mips/include/asm/unaligned-emul.h             | 779 +++++++++++++++++
 arch/mips/include/uapi/asm/hwcap.h                 |   1 +
 arch/mips/include/uapi/asm/inst.h                  |  26 +
 arch/mips/jazz/Platform                            |   1 -
 arch/mips/jz4740/Kconfig                           |   9 +-
 arch/mips/jz4740/Makefile                          |   7 +-
 arch/mips/jz4740/Platform                          |   1 -
 arch/mips/jz4740/pm.c                              |  34 -
 arch/mips/jz4740/prom.c                            |  19 -
 arch/mips/jz4740/reset.c                           |  24 -
 arch/mips/jz4740/reset.h                           |   7 -
 arch/mips/jz4740/setup.c                           |  64 +-
 arch/mips/jz4740/time.c                            |  17 -
 arch/mips/jz4740/timer.c                           |  42 -
 arch/mips/kernel/8250-platform.c                   |  46 -
 arch/mips/kernel/Makefile                          |   2 -
 arch/mips/kernel/branch.c                          |  26 +-
 arch/mips/kernel/cevt-r4k.c                        |  44 +
 arch/mips/kernel/cps-vec-ns16550.S                 |  18 +-
 arch/mips/kernel/cpu-probe.c                       | 171 +++-
 arch/mips/kernel/csrc-r4k.c                        |  40 +
 arch/mips/kernel/entry.S                           |   6 +-
 arch/mips/kernel/genex.S                           |  12 +-
 arch/mips/kernel/head.S                            |   3 +
 arch/mips/kernel/idle.c                            |   5 +-
 arch/mips/kernel/mips-cm.c                         |  66 +-
 arch/mips/kernel/mips-r2-to-r6-emul.c              |   2 +-
 arch/mips/kernel/perf_event_mipsxx.c               | 373 +++++++-
 arch/mips/kernel/proc.c                            |   4 +
 arch/mips/kernel/r4k_fpu.S                         |  14 +-
 arch/mips/kernel/scall64-o32.S                     |   2 +-
 arch/mips/kernel/setup.c                           |  18 +-
 arch/mips/kernel/signal.c                          |   4 +-
 arch/mips/kernel/spram.c                           |   4 +-
 arch/mips/kernel/time.c                            |  70 ++
 arch/mips/kernel/traps.c                           |  52 +-
 arch/mips/kernel/unaligned.c                       | 776 +----------------
 arch/mips/kernel/vmlinux.lds.S                     |   2 +-
 arch/mips/kernel/watch.c                           |  26 +-
 arch/mips/kvm/emulate.c                            |  12 +-
 arch/mips/kvm/mips.c                               |   4 +-
 arch/mips/kvm/tlb.c                                |   4 +-
 arch/mips/kvm/vz.c                                 |  16 +-
 arch/mips/lantiq/Platform                          |   1 -
 arch/mips/lasat/Kconfig                            |  16 -
 arch/mips/lasat/Makefile                           |  15 -
 arch/mips/lasat/Platform                           |   7 -
 arch/mips/lasat/at93c.c                            | 148 ----
 arch/mips/lasat/at93c.h                            |  19 -
 arch/mips/lasat/ds1603.c                           | 190 -----
 arch/mips/lasat/ds1603.h                           |  32 -
 arch/mips/lasat/image/Makefile                     |  53 --
 arch/mips/lasat/image/head.S                       |  32 -
 arch/mips/lasat/image/romscript.normal             |  23 -
 arch/mips/lasat/interrupt.c                        | 119 ---
 arch/mips/lasat/lasat_board.c                      | 268 ------
 arch/mips/lasat/lasat_models.h                     |  68 --
 arch/mips/lasat/picvue.c                           | 242 ------
 arch/mips/lasat/picvue.h                           |  45 -
 arch/mips/lasat/picvue_proc.c                      | 208 -----
 arch/mips/lasat/prom.c                             | 126 ---
 arch/mips/lasat/prom.h                             |   8 -
 arch/mips/lasat/reset.c                            |  48 --
 arch/mips/lasat/serial.c                           |  80 --
 arch/mips/lasat/setup.c                            | 141 ---
 arch/mips/lasat/sysctl.c                           | 268 ------
 arch/mips/lib/csum_partial.S                       |   6 +-
 arch/mips/loongson2ef/Kconfig                      |   1 -
 arch/mips/loongson2ef/Platform                     |   1 -
 arch/mips/loongson2ef/common/init.c                |   4 +-
 arch/mips/loongson2ef/lemote-2f/clock.c            |  98 +--
 arch/mips/loongson32/Platform                      |   1 -
 arch/mips/loongson64/Kconfig                       |  12 +-
 arch/mips/loongson64/Makefile                      |   6 +-
 arch/mips/loongson64/Platform                      |   1 -
 arch/mips/loongson64/cop2-ex.c                     | 290 ++++++-
 arch/mips/loongson64/cpucfg-emul.c                 | 227 +++++
 arch/mips/loongson64/dma.c                         |   9 +-
 arch/mips/loongson64/env.c                         |  20 +
 arch/mips/loongson64/init.c                        |  63 +-
 arch/mips/loongson64/pci.c                         |  51 --
 arch/mips/loongson64/rtc.c                         |  39 -
 arch/mips/loongson64/smp.c                         |   1 -
 arch/mips/loongson64/time.c                        |   8 +-
 arch/mips/loongson64/vbios_quirk.c                 |  29 +
 arch/mips/math-emu/cp1emu.c                        |  28 +-
 arch/mips/math-emu/dp_add.c                        |   3 +-
 arch/mips/math-emu/dp_div.c                        |   3 +-
 arch/mips/math-emu/dp_fmax.c                       |   6 +-
 arch/mips/math-emu/dp_fmin.c                       |   6 +-
 arch/mips/math-emu/dp_maddf.c                      |   3 +-
 arch/mips/math-emu/dp_mul.c                        |   3 +-
 arch/mips/math-emu/dp_sqrt.c                       |   5 +-
 arch/mips/math-emu/dp_sub.c                        |   3 +-
 arch/mips/math-emu/sp_add.c                        |   3 +-
 arch/mips/math-emu/sp_div.c                        |   3 +-
 arch/mips/math-emu/sp_fdp.c                        |   3 +-
 arch/mips/math-emu/sp_fmax.c                       |   6 +-
 arch/mips/math-emu/sp_fmin.c                       |   6 +-
 arch/mips/math-emu/sp_maddf.c                      |   3 +-
 arch/mips/math-emu/sp_mul.c                        |   3 +-
 arch/mips/math-emu/sp_sub.c                        |   3 +-
 arch/mips/mm/Makefile                              |   2 +-
 arch/mips/mm/c-r4k.c                               |  31 +-
 arch/mips/mm/cache.c                               |   1 -
 arch/mips/mm/dma-noncoherent.c                     |   1 +
 arch/mips/mm/init.c                                |   8 +-
 arch/mips/mm/ioremap.c                             | 151 +---
 arch/mips/mm/ioremap64.c                           |  23 +
 arch/mips/mm/sc-mips.c                             |   7 +-
 arch/mips/mm/tlbex.c                               |   2 +-
 arch/mips/mti-malta/Platform                       |   1 -
 arch/mips/mti-malta/malta-init.c                   |   8 +-
 arch/mips/netlogic/Platform                        |   1 -
 arch/mips/netlogic/xlr/fmn.c                       |   2 +-
 arch/mips/oprofile/common.c                        |   2 +-
 arch/mips/oprofile/op_model_mipsxx.c               |  26 +-
 arch/mips/paravirt/Platform                        |   1 -
 arch/mips/pci/Makefile                             |   7 -
 arch/mips/pci/fixup-emma2rh.c                      |  84 --
 arch/mips/pci/fixup-loongson3.c                    |  71 --
 arch/mips/pci/fixup-pmcmsp.c                       | 216 -----
 arch/mips/pci/fixup-sni.c                          |   3 +-
 arch/mips/pci/ops-bcm63xx.c                        |   2 +-
 arch/mips/pci/ops-emma2rh.c                        | 167 ----
 arch/mips/pci/ops-loongson3.c                      | 116 ---
 arch/mips/pci/ops-nile4.c                          | 136 ---
 arch/mips/pci/ops-pmcmsp.c                         | 944 ---------------------
 arch/mips/pci/pci-alchemy.c                        |   2 +-
 arch/mips/pci/pci-emma2rh.c                        |  72 --
 arch/mips/pci/pci-lasat.c                          |  88 --
 arch/mips/pic32/Platform                           |   1 -
 arch/mips/pistachio/Platform                       |   1 -
 arch/mips/pistachio/init.c                         |   8 +-
 arch/mips/pmcs-msp71xx/Kconfig                     |  50 --
 arch/mips/pmcs-msp71xx/Makefile                    |  13 -
 arch/mips/pmcs-msp71xx/Platform                    |   7 -
 arch/mips/pmcs-msp71xx/msp_elb.c                   |  46 -
 arch/mips/pmcs-msp71xx/msp_eth.c                   | 111 ---
 arch/mips/pmcs-msp71xx/msp_hwbutton.c              | 165 ----
 arch/mips/pmcs-msp71xx/msp_irq.c                   | 155 ----
 arch/mips/pmcs-msp71xx/msp_irq_cic.c               | 208 -----
 arch/mips/pmcs-msp71xx/msp_irq_per.c               | 127 ---
 arch/mips/pmcs-msp71xx/msp_irq_slp.c               | 102 ---
 arch/mips/pmcs-msp71xx/msp_pci.c                   |  50 --
 arch/mips/pmcs-msp71xx/msp_prom.c                  | 513 -----------
 arch/mips/pmcs-msp71xx/msp_serial.c                | 154 ----
 arch/mips/pmcs-msp71xx/msp_setup.c                 | 228 -----
 arch/mips/pmcs-msp71xx/msp_smp.c                   |  56 --
 arch/mips/pmcs-msp71xx/msp_time.c                  |  90 --
 arch/mips/pmcs-msp71xx/msp_usb.c                   | 173 ----
 arch/mips/pnx833x/Platform                         |   1 -
 arch/mips/ralink/Platform                          |   1 -
 arch/mips/ralink/bootrom.c                         |   2 +-
 arch/mips/ralink/mt7621.c                          |  43 -
 arch/mips/rb532/Platform                           |   1 -
 arch/mips/sgi-ip22/Platform                        |   2 -
 arch/mips/sgi-ip27/Platform                        |   3 -
 arch/mips/sgi-ip27/ip27-timer.c                    |   9 -
 arch/mips/sgi-ip30/Platform                        |   3 -
 arch/mips/sgi-ip32/Platform                        |   1 -
 arch/mips/sibyte/Platform                          |   4 -
 arch/mips/sni/Platform                             |   1 -
 arch/mips/tools/elf-entry.c                        |   9 +-
 arch/mips/tools/loongson3-llsc-check.c             |   2 +
 arch/mips/txx9/Kconfig                             |  14 +-
 arch/mips/txx9/Platform                            |   3 -
 arch/mips/vdso/Kconfig                             |  18 +
 arch/mips/vdso/Makefile                            |  43 +-
 arch/mips/vdso/vdso.lds.S                          |   2 +-
 arch/mips/vr41xx/Makefile                          |   5 +
 arch/mips/vr41xx/Platform                          |   3 -
 drivers/cpufreq/loongson2_cpufreq.c                |  22 +-
 drivers/pci/controller/Kconfig                     |  10 +
 drivers/pci/controller/Makefile                    |   1 +
 drivers/pci/controller/pci-loongson.c              | 247 ++++++
 drivers/pci/probe.c                                |   2 +-
 drivers/platform/mips/Kconfig                      |   6 +
 drivers/platform/mips/Makefile                     |   1 +
 .../platform/mips/rs780e-acpi.c                    |  58 +-
 include/asm-generic/pgtable.h                      |  33 +
 init/Kconfig                                       |   3 +
 mm/memory.c                                        |  30 +-
 sound/soc/txx9/txx9aclc-ac97.c                     |   1 +
 333 files changed, 4674 insertions(+), 13057 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/rs780e-acpi.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/loongson.yaml
 create mode 100644 arch/mips/boot/dts/ingenic/gcw0_proto.dts
 delete mode 100644 arch/mips/configs/lasat_defconfig
 delete mode 100644 arch/mips/configs/markeins_defconfig
 delete mode 100644 arch/mips/configs/msp71xx_defconfig
 delete mode 100644 arch/mips/emma/Makefile
 delete mode 100644 arch/mips/emma/Platform
 delete mode 100644 arch/mips/emma/common/Makefile
 delete mode 100644 arch/mips/emma/common/prom.c
 delete mode 100644 arch/mips/emma/markeins/Makefile
 delete mode 100644 arch/mips/emma/markeins/irq.c
 delete mode 100644 arch/mips/emma/markeins/led.c
 delete mode 100644 arch/mips/emma/markeins/platform.c
 delete mode 100644 arch/mips/emma/markeins/setup.c
 delete mode 100644 arch/mips/include/asm/clock.h
 delete mode 100644 arch/mips/include/asm/emma/emma2rh.h
 delete mode 100644 arch/mips/include/asm/emma/markeins.h
 delete mode 100644 arch/mips/include/asm/lasat/ds1603.h
 delete mode 100644 arch/mips/include/asm/lasat/eeprom.h
 delete mode 100644 arch/mips/include/asm/lasat/head.h
 delete mode 100644 arch/mips/include/asm/lasat/lasat.h
 delete mode 100644 arch/mips/include/asm/lasat/lasatint.h
 delete mode 100644 arch/mips/include/asm/lasat/picvue.h
 delete mode 100644 arch/mips/include/asm/lasat/serial.h
 delete mode 100644 arch/mips/include/asm/mach-au1x00/ioremap.h
 delete mode 100644 arch/mips/include/asm/mach-emma2rh/irq.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/base.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/dma.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/timer.h
 delete mode 100644 arch/mips/include/asm/mach-lasat/irq.h
 delete mode 100644 arch/mips/include/asm/mach-lasat/mach-gt64120.h
 create mode 100644 arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
 delete mode 100644 arch/mips/include/asm/mach-loongson64/mc146818rtc.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/cpu-feature-overrides.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/msp_cic_int.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/msp_gpio_macros.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/msp_int.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/msp_pci.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/msp_prom.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/msp_regops.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/msp_regs.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/msp_slp_int.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/msp_usb.h
 delete mode 100644 arch/mips/include/asm/mach-pmcs-msp71xx/war.h
 delete mode 100644 arch/mips/include/asm/mach-xilfpga/irq.h
 delete mode 100644 arch/mips/include/asm/nile4.h
 create mode 100644 arch/mips/include/asm/unaligned-emul.h
 delete mode 100644 arch/mips/jz4740/pm.c
 delete mode 100644 arch/mips/jz4740/prom.c
 delete mode 100644 arch/mips/jz4740/reset.c
 delete mode 100644 arch/mips/jz4740/reset.h
 delete mode 100644 arch/mips/jz4740/time.c
 delete mode 100644 arch/mips/jz4740/timer.c
 delete mode 100644 arch/mips/kernel/8250-platform.c
 delete mode 100644 arch/mips/lasat/Kconfig
 delete mode 100644 arch/mips/lasat/Makefile
 delete mode 100644 arch/mips/lasat/Platform
 delete mode 100644 arch/mips/lasat/at93c.c
 delete mode 100644 arch/mips/lasat/at93c.h
 delete mode 100644 arch/mips/lasat/ds1603.c
 delete mode 100644 arch/mips/lasat/ds1603.h
 delete mode 100644 arch/mips/lasat/image/Makefile
 delete mode 100644 arch/mips/lasat/image/head.S
 delete mode 100644 arch/mips/lasat/image/romscript.normal
 delete mode 100644 arch/mips/lasat/interrupt.c
 delete mode 100644 arch/mips/lasat/lasat_board.c
 delete mode 100644 arch/mips/lasat/lasat_models.h
 delete mode 100644 arch/mips/lasat/picvue.c
 delete mode 100644 arch/mips/lasat/picvue.h
 delete mode 100644 arch/mips/lasat/picvue_proc.c
 delete mode 100644 arch/mips/lasat/prom.c
 delete mode 100644 arch/mips/lasat/prom.h
 delete mode 100644 arch/mips/lasat/reset.c
 delete mode 100644 arch/mips/lasat/serial.c
 delete mode 100644 arch/mips/lasat/setup.c
 delete mode 100644 arch/mips/lasat/sysctl.c
 create mode 100644 arch/mips/loongson64/cpucfg-emul.c
 delete mode 100644 arch/mips/loongson64/pci.c
 delete mode 100644 arch/mips/loongson64/rtc.c
 create mode 100644 arch/mips/loongson64/vbios_quirk.c
 create mode 100644 arch/mips/mm/ioremap64.c
 delete mode 100644 arch/mips/pci/fixup-emma2rh.c
 delete mode 100644 arch/mips/pci/fixup-loongson3.c
 delete mode 100644 arch/mips/pci/fixup-pmcmsp.c
 delete mode 100644 arch/mips/pci/ops-emma2rh.c
 delete mode 100644 arch/mips/pci/ops-loongson3.c
 delete mode 100644 arch/mips/pci/ops-nile4.c
 delete mode 100644 arch/mips/pci/ops-pmcmsp.c
 delete mode 100644 arch/mips/pci/pci-emma2rh.c
 delete mode 100644 arch/mips/pci/pci-lasat.c
 delete mode 100644 arch/mips/pmcs-msp71xx/Kconfig
 delete mode 100644 arch/mips/pmcs-msp71xx/Makefile
 delete mode 100644 arch/mips/pmcs-msp71xx/Platform
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_elb.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_eth.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_hwbutton.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_irq.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_irq_cic.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_irq_per.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_irq_slp.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_pci.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_prom.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_serial.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_setup.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_smp.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_time.c
 delete mode 100644 arch/mips/pmcs-msp71xx/msp_usb.c
 create mode 100644 arch/mips/vdso/Kconfig
 create mode 100644 arch/mips/vr41xx/Makefile
 create mode 100644 drivers/pci/controller/pci-loongson.c
 rename arch/mips/loongson64/acpi_init.c => drivers/platform/mips/rs780e-acpi.c (70%)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
