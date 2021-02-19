Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2540F31F90A
	for <lists+linux-mips@lfdr.de>; Fri, 19 Feb 2021 13:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhBSMH4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Feb 2021 07:07:56 -0500
Received: from elvis.franken.de ([193.175.24.41]:37666 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229998AbhBSMHv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Feb 2021 07:07:51 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lD4Yq-000233-00; Fri, 19 Feb 2021 13:07:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F1D34C059F; Fri, 19 Feb 2021 13:06:38 +0100 (CET)
Date:   Fri, 19 Feb 2021 13:06:38 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v5.12-rc1
Message-ID: <20210219120638.GA5950@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus,

a test merge with v5.11 shows a conflict in .mailmap, which I resolved with

diff --cc .mailmap
index 7fdf87b24fe8,d942f9493a47..ade90fc9140a
--- a/.mailmap
+++ b/.mailmap
@@@ -202,8 -200,7 +202,9 @@@ Li Yang <leoyang.li@nxp.com> <leoli@fre
  Li Yang <leoyang.li@nxp.com> <leo@zh-kernel.org>
  Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
  Maciej W. Rozycki <macro@mips.com> <macro@imgtec.com>
+ Maciej W. Rozycki <macro@orcam.me.uk> <macro@linux-mips.org>
 +Manivannan Sadhasivam <mani@kernel.org> <manivannanece23@gmail.com>
 +Manivannan Sadhasivam <mani@kernel.org> <manivannan.sadhasivam@linaro.org>
  Marcin Nowakowski <marcin.nowakowski@mips.com> <marcin.nowakowski@imgtec.com>
  Marc Zyngier <maz@kernel.org> <marc.zyngier@arm.com>
  Mark Brown <broonie@sirena.org.uk>


Another conflict showed up in linux-next between mips-next tree and
kspp tree. Stephan resolved the conflict with

diff --cc include/asm-generic/vmlinux.lds.h
index 0a5c9305c3c4,8988a2e445d8..fbc0ca8d903b
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@@ -93,9 -96,9 +96,9 @@@
   * RODATA_MAIN is not used because existing code already defines .rodata.x
   * sections to be brought in with rodata.
   */
- #ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
+ #if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG)
  #define TEXT_MAIN .text .text.[0-9a-zA-Z_]*
 -#define DATA_MAIN .data .data.[0-9a-zA-Z_]* .data..L* .data..compoundliteral*
 +#define DATA_MAIN .data .data.[0-9a-zA-Z_]* .data..L* .data..compoundliteral* .data.$__unnamed_* .data.$Lubsan_*
  #define SDATA_MAIN .sdata .sdata.[0-9a-zA-Z_]*
  #define RODATA_MAIN .rodata .rodata.[0-9a-zA-Z_]* .rodata..L*
  #define BSS_MAIN .bss .bss.[0-9a-zA-Z_]* .bss..compoundliteral*


Thomas.

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.12

for you to fetch changes up to b0c2793bad0b5f10be2fc5f56df827e0c1bbf4af:

  Revert "MIPS: Add basic support for ptrace single step" (2021-02-18 11:57:44 +0100)

----------------------------------------------------------------
- added support for Nintendo N64
- added support for Realtek RTL83XX SoCs
- kaslr support for Loongson64
- first steps to get rid of set_fs()
- DMA runtime coherent/non-coherent selection cleanup
- cleanups and fixes

----------------------------------------------------------------
Aleksander Jan Bajkowski (4):
      dt-bindings: mips: lantiq: Document Lantiq Xway PMU bindings
      dt-bindings: mips: lantiq: Document Lantiq Xway CGU bindings
      dt-bindings: mips: lantiq: Document Lantiq Xway EBU bindings
      dt-bindings: mips: lantiq: Document Lantiq Xway DMA bindings

Alexander Lobakin (17):
      MIPS: UAPI: unexport unistd_nr_{n32,n64,o32}.h
      MIPS: vmlinux.lds.S: add missing PAGE_ALIGNED_DATA() section
      MIPS: CPS: don't create redundant .text.cps-vec section
      MIPS: vmlinux.lds.S: add ".gnu.attributes" to DISCARDS
      MIPS: properly stop .eh_frame generation
      MIPS: vmlinux.lds.S: explicitly catch .rel.dyn symbols
      MIPS: vmlinux.lds.S: explicitly declare .got table
      vmlinux.lds.h: catch compound literals into data and BSS
      vmlinux.lds.h: catch UBSAN's "unnamed data" into data
      MIPS: select ARCH_WANT_LD_ORPHAN_WARN
      MIPS: bitops: fix -Wshadow in asm/bitops.h
      MIPS: pgtable: fix -Wshadow in asm/pgtable.h
      MIPS: module: optimize module relocations processing
      MIPS: relocatable: optimize the relocation process
      MIPS: pistachio: remove obsolete include/asm/mach-pistachio
      MIPS: compressed: fix build with enabled UBSAN
      vmlinux.lds.h: catch more UBSAN symbols into .data

Arnd Bergmann (2):
      MIPS: jazz: always allow little-endian builds
      MIPS: make kgdb depend on FPU support

Aurelien Jarno (1):
      MIPS: Support binutils configured with --enable-mips-fix-loongson3-llsc=yes

Bert Vermeulen (5):
      dt-bindings: mips: Add support for RTL83xx SoC series
      Add support for Realtek RTL838x/RTL839x switch SoCs
      MIPS: Add Realtek RTL838x/RTL839x support as generic MIPS system
      dt-bindings: Add Cisco prefix to vendor list
      mips: dts: Add support for Cisco SG220-26 switch

Bhaskar Chowdhury (1):
      arch: mips: kernel: Fix two spelling in smp.c

Chengyang Fan (1):
      MIPS: asm: spram: remove unneeded semicolon

Christoph Hellwig (6):
      MIPS/malta: simplify plat_setup_iocoherency
      MIPS/alchemy: factor out the DMA coherent setup
      MIPS: refactor the runtime coherent vs noncoherent DMA indicators
      driver core: lift dma_default_coherent into common code
      MIPS: remove CONFIG_DMA_MAYBE_COHERENT
      MIPS: remove CONFIG_DMA_PERDEV_COHERENT

Geert Uytterhoeven (1):
      MIPS: bitops: Fix reference to ffz location

Huang Pei (1):
      MIPS: fix kernel_stack_pointer()

Jia Qingtong (1):
      MIPS: perf: Add support for OCTEON III perf events.

Jiaxun Yang (4):
      MIPS: zboot: head.S clean up
      MIPS: cacheinfo: Add missing VCache
      MIPS: Loongson64: Set cluster for cores
      MIPS: Kill RM7K & RM9K IRQ Code

Jinyang He (9):
      MIPS: zboot: Avoid endless loop in clear BSS.
      MIPS: process: Remove unnecessary headers inclusion
      MIPS: microMIPS: Fix the judgment of mm_jr16_op and mm_jalr_op
      MIPS: Fix get_frame_info() handing of function size
      MIPS: Add is_jr_ra_ins() to end the loop early
      MIPS: relocatable: Provide kaslr_offset() to get the kernel offset
      MIPS: relocatable: Use __kaslr_offset in show_kernel_relocation
      MIPS: process: Fix no previous prototype warning
      MIPS: Use common way to parse elfcorehdr

Kees Cook (1):
      mips: Replace lkml.org links with lore

Kevin Hao (1):
      Revert "MIPS: Octeon: Remove special handling of CONFIG_MIPS_ELF_APPENDED_DTB=y"

Lauri Kasanen (3):
      Revert "MIPS: Remove unused R4300 CPU support"
      mips: Add N64 machine type
      sound: Add n64 driver

Lukas Bulwahn (1):
      MAINTAINERS: replace non-matching patterns for loongson{2,3}

Maciej W. Rozycki (1):
      MAINTAINERS: Update my e-mail address throughout

Martin Blumenstingl (1):
      MIPS: lantiq: irq: register the interrupt controllers with irqchip_init

Nathan Chancellor (5):
      MIPS: Use address-of operator on section symbols
      MIPS: c-r4k: Fix section mismatch for loongson2_sc_init
      MIPS: lantiq: Explicitly compare LTQ_EBU_PCC_ISTAT against 0
      MIPS: Compare __SYNC_loongson3_war against 0
      MIPS: VDSO: Use CLANG_FLAGS instead of filtering out '--target='

Paul Cercueil (1):
      MIPS: Ingenic: Disable HPTLB for D0 XBurst CPUs too

Sander Vanheule (1):
      MIPS: ralink: manage low reset lines

Serge Semin (1):
      Revert "mips: Manually call fdt_init_reserved_mem() method"

Souptick Joarder (1):
      mips: cacheinfo: Remove unnecessary increment of level

Thomas Bogendoerfer (9):
      MIPS: Remove empty prom_free_prom_memory functions
      MIPS: mm: abort uaccess retries upon fatal signal
      MIPS: vpe: Remove vpe_getcwd
      MIPS: of: Introduce helper function to get DTB
      Revert "MIPS: microMIPS: Fix the judgment of mm_jr16_op and mm_jalr_op"
      Revert "MIPS: kernel: {ftrace,kgdb}: Set correct address limit for cache flushes"
      MIPS: Simplify EVA cache handling
      MIPS: kernel: Drop kgdb_call_nmi_hook
      Revert "MIPS: Add basic support for ptrace single step"

Tiezhu Yang (8):
      MIPS: No need to check CPU 0 in cps_cpu_disable()
      MIPS: Loongson64: Give chance to build under !CONFIG_NUMA and !CONFIG_SMP
      MIPS: Make definitions of MIPSInst_FMA_{FUNC,FMTM} consistent with MIPS64 manual
      MIPS: Fix inline asm input/output type mismatch in checksum.h used with Clang
      MIPS: kernel: Support extracting off-line stack traces from user-space with perf
      MIPS: Make check condition for SDBBP consistent with EJTAG spec
      MIPS: Add basic support for ptrace single step
      MAINTAINERS: Add git tree for KVM/mips

Yang Li (2):
      KVM: MIPS: remove unneeded semicolon
      MIPS: malta-time: remove unneeded semicolon

Yanteng Si (5):
      MIPS: init: move externs to header file
      MIPS: IRQ: Add prototype for function init_IRQ
      MIPS: mm: Add prototype for function __update_cache
      MIPS: loongson2ef: remove function __uncached_access()
      MIPS: mm:remove function __uncached_access()

Youling Tang (1):
      MIPS: crash_dump.c: Simplify copy_oldmem_page()

Zheng Yongjun (2):
      mips: kernel: convert comma to semicolon
      mips: pci: convert comma to semicolon

siyanteng (1):
      MIPS: loongson64: smp.c: Fix block comment coding style

 .mailmap                                           |   1 +
 .../bindings/mips/lantiq/lantiq,cgu.yaml           |  32 ++
 .../bindings/mips/lantiq/lantiq,dma-xway.yaml      |  32 ++
 .../bindings/mips/lantiq/lantiq,ebu.yaml           |  32 ++
 .../bindings/mips/lantiq/lantiq,pmu.yaml           |  32 ++
 .../devicetree/bindings/mips/realtek-rtl.yaml      |  24 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  19 +-
 arch/mips/Kbuild.platforms                         |   1 +
 arch/mips/Kconfig                                  |  69 +++-
 arch/mips/Makefile                                 |  20 ++
 arch/mips/alchemy/common/prom.c                    |   4 -
 arch/mips/alchemy/common/setup.c                   |  34 +-
 arch/mips/ar7/memory.c                             |   5 -
 arch/mips/ath25/prom.c                             |   4 -
 arch/mips/ath79/prom.c                             |   5 -
 arch/mips/ath79/setup.c                            |  13 +-
 arch/mips/bcm47xx/prom.c                           |   4 -
 arch/mips/bcm63xx/prom.c                           |   4 -
 arch/mips/bmips/setup.c                            |  11 +-
 arch/mips/boot/compressed/Makefile                 |   1 +
 arch/mips/boot/compressed/head.S                   |  20 +-
 arch/mips/boot/dts/Makefile                        |   1 +
 arch/mips/boot/dts/realtek/Makefile                |   2 +
 arch/mips/boot/dts/realtek/cisco_sg220-26.dts      |  25 ++
 arch/mips/boot/dts/realtek/rtl838x.dtsi            |  21 ++
 arch/mips/boot/dts/realtek/rtl83xx.dtsi            |  59 ++++
 arch/mips/cavium-octeon/setup.c                    |   9 +-
 arch/mips/cobalt/setup.c                           |   5 -
 arch/mips/configs/loongson3_defconfig              |   2 +
 arch/mips/fw/arc/memory.c                          |   2 +-
 arch/mips/fw/sni/sniprom.c                         |   4 -
 arch/mips/generic/init.c                           |   9 +-
 arch/mips/include/asm/Kbuild                       |   4 +
 arch/mips/include/asm/asm.h                        |  18 +
 arch/mips/include/asm/atomic.h                     |   2 +-
 arch/mips/include/asm/bitops.h                     |  12 +-
 arch/mips/include/asm/bootinfo.h                   |  22 +-
 arch/mips/include/asm/checksum.h                   |   6 +-
 arch/mips/include/asm/cmpxchg.h                    |   6 +-
 arch/mips/include/asm/cpu-type.h                   |   5 +
 arch/mips/include/asm/cpu.h                        |   2 +-
 arch/mips/include/asm/dma-coherence.h              |  38 ---
 arch/mips/include/asm/inst.h                       |   6 +-
 arch/mips/include/asm/irq.h                        |   1 +
 arch/mips/include/asm/irq_cpu.h                    |   2 -
 arch/mips/include/asm/mach-generic/irq.h           |   6 -
 arch/mips/include/asm/mach-loongson64/loongson.h   |   2 +-
 arch/mips/include/asm/mach-n64/irq.h               |   9 +
 arch/mips/include/asm/mach-n64/kmalloc.h           |   8 +
 arch/mips/include/asm/mach-pistachio/irq.h         |  15 -
 arch/mips/include/asm/mipsregs.h                   |   4 +
 arch/mips/include/asm/octeon/octeon.h              |   1 -
 arch/mips/include/asm/page.h                       |  17 +-
 arch/mips/include/asm/pgtable.h                    |  14 +-
 arch/mips/include/asm/ptrace.h                     |   2 +-
 arch/mips/include/asm/r4kcache.h                   |  67 +---
 arch/mips/include/asm/spram.h                      |   2 +-
 arch/mips/include/asm/traps.h                      |   1 +
 arch/mips/include/asm/vermagic.h                   |   2 +
 arch/mips/include/asm/vpe.h                        |   3 -
 arch/mips/include/uapi/asm/Kbuild                  |   3 -
 arch/mips/include/uapi/asm/perf_regs.h             |  40 +++
 arch/mips/jazz/Kconfig                             |   3 -
 arch/mips/kernel/Makefile                          |   3 +-
 arch/mips/kernel/cacheinfo.c                       |  30 +-
 arch/mips/kernel/cevt-txx9.c                       |   2 +-
 arch/mips/kernel/cps-vec.S                         |   1 -
 arch/mips/kernel/cpu-probe.c                       |  24 +-
 arch/mips/kernel/crash_dump.c                      |  41 +--
 arch/mips/kernel/ftrace.c                          |   4 -
 arch/mips/kernel/genex.S                           |   4 +-
 arch/mips/kernel/head.S                            |  31 --
 arch/mips/kernel/idle.c                            |   1 +
 arch/mips/kernel/irq-rm7000.c                      |  45 ---
 arch/mips/kernel/kgdb.c                            |  23 +-
 arch/mips/kernel/module.c                          | 109 +++---
 arch/mips/kernel/perf_event_mipsxx.c               |  22 +-
 arch/mips/kernel/perf_regs.c                       |  68 ++++
 arch/mips/kernel/process.c                         |  83 +++--
 arch/mips/kernel/relocate.c                        |  72 ++--
 arch/mips/kernel/setup.c                           |  71 ++--
 arch/mips/kernel/smp-cps.c                         |   3 -
 arch/mips/kernel/smp.c                             |   6 +-
 arch/mips/kernel/syscalls/Makefile                 |  16 +-
 arch/mips/kernel/vmlinux.lds.S                     |  11 +-
 arch/mips/kernel/vpe-cmp.c                         |   4 +-
 arch/mips/kernel/vpe-mt.c                          |   4 +-
 arch/mips/kernel/vpe.c                             |  33 --
 arch/mips/kvm/mips.c                               |   2 +-
 arch/mips/lantiq/irq.c                             |  10 +-
 arch/mips/lantiq/prom.c                            |  11 +-
 arch/mips/loongson2ef/common/init.c                |   5 -
 arch/mips/loongson2ef/common/mem.c                 |  11 -
 arch/mips/loongson32/common/prom.c                 |   4 -
 arch/mips/loongson64/Platform                      |  22 --
 arch/mips/loongson64/init.c                        |  54 ++-
 arch/mips/loongson64/numa.c                        |  52 +--
 arch/mips/loongson64/smp.c                         |   8 +-
 arch/mips/mm/c-r4k.c                               |  13 +-
 arch/mips/mm/cache.c                               |   9 +-
 arch/mips/mm/dma-noncoherent.c                     |   3 +-
 arch/mips/mm/fault.c                               |   5 +-
 arch/mips/mm/init.c                                |   5 +
 arch/mips/mm/tlbex.c                               |   1 +
 arch/mips/mti-malta/malta-init.c                   |   1 -
 arch/mips/mti-malta/malta-memory.c                 |   4 -
 arch/mips/mti-malta/malta-setup.c                  |  34 +-
 arch/mips/mti-malta/malta-time.c                   |   2 +-
 arch/mips/n64/Makefile                             |   6 +
 arch/mips/n64/Platform                             |   7 +
 arch/mips/n64/init.c                               | 164 +++++++++
 arch/mips/n64/irq.c                                |  16 +
 arch/mips/netlogic/xlp/setup.c                     |   5 -
 arch/mips/netlogic/xlr/setup.c                     |   5 -
 arch/mips/pci/pci-alchemy.c                        |   7 +-
 arch/mips/pci/pci-ar2315.c                         |   6 +-
 arch/mips/pic32/pic32mzda/init.c                   |  19 +-
 arch/mips/pistachio/Platform                       |   2 -
 arch/mips/pistachio/init.c                         |   6 -
 arch/mips/ralink/of.c                              |  11 +-
 arch/mips/ralink/prom.c                            |   4 -
 arch/mips/ralink/reset.c                           |   4 +-
 arch/mips/rb532/prom.c                             |   5 -
 arch/mips/sgi-ip27/ip27-memory.c                   |   5 -
 arch/mips/sgi-ip32/ip32-memory.c                   |   5 -
 arch/mips/sibyte/common/cfe.c                      |   5 -
 arch/mips/txx9/generic/setup.c                     |   4 -
 arch/mips/vdso/Makefile                            |   5 +-
 arch/mips/vr41xx/common/init.c                     |   4 -
 drivers/base/core.c                                |   6 +
 drivers/char/mem.c                                 |   7 -
 include/asm-generic/vmlinux.lds.h                  |   6 +-
 include/linux/dma-map-ops.h                        |   5 +-
 kernel/dma/Kconfig                                 |   3 -
 kernel/dma/mapping.c                               |   2 +
 sound/mips/Kconfig                                 |   7 +
 sound/mips/Makefile                                |   1 +
 sound/mips/snd-n64.c                               | 372 +++++++++++++++++++++
 139 files changed, 1577 insertions(+), 925 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,cgu.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,dma-xway.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,pmu.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/realtek-rtl.yaml
 create mode 100644 arch/mips/boot/dts/realtek/Makefile
 create mode 100644 arch/mips/boot/dts/realtek/cisco_sg220-26.dts
 create mode 100644 arch/mips/boot/dts/realtek/rtl838x.dtsi
 create mode 100644 arch/mips/boot/dts/realtek/rtl83xx.dtsi
 delete mode 100644 arch/mips/include/asm/dma-coherence.h
 create mode 100644 arch/mips/include/asm/mach-n64/irq.h
 create mode 100644 arch/mips/include/asm/mach-n64/kmalloc.h
 delete mode 100644 arch/mips/include/asm/mach-pistachio/irq.h
 create mode 100644 arch/mips/include/uapi/asm/perf_regs.h
 delete mode 100644 arch/mips/kernel/irq-rm7000.c
 create mode 100644 arch/mips/kernel/perf_regs.c
 create mode 100644 arch/mips/n64/Makefile
 create mode 100644 arch/mips/n64/Platform
 create mode 100644 arch/mips/n64/init.c
 create mode 100644 arch/mips/n64/irq.c
 create mode 100644 sound/mips/snd-n64.c

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
