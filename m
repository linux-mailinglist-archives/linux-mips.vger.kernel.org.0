Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494BA36D718
	for <lists+linux-mips@lfdr.de>; Wed, 28 Apr 2021 14:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhD1MRf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Apr 2021 08:17:35 -0400
Received: from elvis.franken.de ([193.175.24.41]:48564 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229645AbhD1MRe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 28 Apr 2021 08:17:34 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lbj7X-000553-00; Wed, 28 Apr 2021 14:16:47 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B8067C0CC1; Wed, 28 Apr 2021 14:16:38 +0200 (CEST)
Date:   Wed, 28 Apr 2021 14:16:38 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v5.13
Message-ID: <20210428121638.GA8188@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus,

this is the pull request for MIPS changes. A test merge showed no conflicts,
but there was one reported in linux-next:

Today's linux-next merge of the kvm tree got a conflict in:

  arch/mips/kvm/trap_emul.c

between commit:

  45c7e8af4a5e ("MIPS: Remove KVM_TE support")

from the mips tree and commit:

  5194552fb1ff ("KVM: MIPS: rework flush_shadow_* callbacks into one that
+prepares the flush")

from the kvm tree.

Removing this arch/mips/kvm/trap_emul.c  is the correct action.


The following changes since commit bd67b711bfaa02cf19e88aa2d9edae5c1c1d2739:

  MIPS: kernel: Reserve exception base early to prevent corruption (2021-03-09 11:22:59 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.13

for you to fetch changes up to 7e9be673cb1b0be0f4279a960c2ecb28a147c327:

  MIPS: BCM63XX: Use BUG_ON instead of condition followed by BUG. (2021-04-26 10:23:52 +0200)

----------------------------------------------------------------
- removed get_fs/set_fs
- removed broken/unmaintained MIPS KVM trap and emulate support
- added support for Loongson-2K1000
- fixes and cleanups

----------------------------------------------------------------
Adrian Schmutzler (1):
      mips: octeon: Add Ubiquiti E300 board

Alexander Lobakin (1):
      MIPS: enable GENERIC_FIND_FIRST_BIT

Bhaskar Chowdhury (3):
      MIPS: BCM63xx: Spello fix in the file clk.c
      mips: asm: octeon: A typo fix in the file cvmx-address.h
      MIPS: PCI: Fix a typo

Christoph Hellwig (8):
      MIPS: pci-ar2315: include <linux/dma-direct.h> for phys_to_dma
      MIPS: bmips: include <linux/dma-direct.h> for phys_to_dma
      MIPS: force CONFIG_PCI to on for IP27 and IP30
      MIPS: disable CONFIG_IDE in sb1250_swarm_defconfig
      MIPS: switch workpad_defconfig from legacy IDE to libata
      MIPS: disable CONFIG_IDE in rbtx49xx_defconfig
      MIPS: disable CONFIG_IDE in bigsur_defconfig
      MIPS: disable CONFIG_IDE in malta*_defconfig

Chuanhong Guo (1):
      MIPS: ralink: mt7621: add memory detection support

Florian Fainelli (1):
      MIPS: Add support for CONFIG_DEBUG_VIRTUAL

Huacai Chen (1):
      MIPS: Loongson64: Add kexec/kdump support

Huang Pei (4):
      MIPS: loongson64: alloc pglist_data at run time
      MIPS: clean up CONFIG_MIPS_PGD_C0_CONTEXT handling
      MIPS: fix local_irq_{disable,enable} in asmmacro.h
      MIPS: loongson64: fix bug when PAGE_SIZE > 16KB

Ilya Lipnitskiy (14):
      MIPS: pci-mt7620: fix PLL lock check
      MIPS: ralink: annotate prom_soc_init() with __init
      crypto: mips: add poly1305-core.S to .gitignore
      MIPS: ralink: rt288x: select MIPS_AUTO_PFN_OFFSET
      MIPS: add support for buggy MT7621S core detection
      MIPS: pci-rt2880: fix slot 0 configuration
      MIPS: pci-rt2880: remove unneeded locks
      MIPS: pci-rt3883: trivial: remove unused variable
      MIPS: pci-rt3883: more accurate DT error messages
      MIPS: pci-legacy: stop using of_pci_range_to_resource
      MIPS: pci-legacy: remove redundant info messages
      MIPS: pci-legacy: remove busn_resource field
      MIPS: pci-legacy: use generic pci_enable_resources
      MIPS: pci-legacy: revert "use generic pci_enable_resources"

Jason A. Donenfeld (1):
      MIPS: select CPU_MIPS64 for remaining MIPS64 CPUs

Julian Braha (2):
      arch: mips: fix unmet dependency for DEBUG_INFO
      arch: mips: fix unmet dependency for MTD_COMPLEX_MAPPINGS

Krzysztof Kozlowski (1):
      MIPS: ralink: define stubs for clk_set_parent to fix compile testing

Lifu Chen (1):
      MIPS: Alchemy: Use DEFINE_SPINLOCK() for spinlock

Lukas Bulwahn (1):
      MIPS: SGI-IP27: fix spelling in Copyright

Maciej W. Rozycki (9):
      MIPS: SiByte: Regenerate stale SWARM defconfig
      MIPS: SiByte: Enable pata_platform with SWARM defconfig
      lib/math: Add a `do_div' test module
      div64: Correct inline documentation for `do_div'
      MIPS: Reinstate platform `__div64_32' handler
      MIPS: Avoid DIVU in `__div64_32' is result would be zero
      lib/math/test_div64: Fix error message formatting
      lib/math/test_div64: Correct the spelling of "dividend"
      MIPS: Avoid handcoded DIVU in `__div64_32' altogether

Masahiro Yamada (2):
      mips: syscalls: switch to generic syscalltbl.sh
      mips: syscalls: switch to generic syscallhdr.sh

Nathan Chancellor (1):
      MIPS: generic: Update node names to avoid unit addresses

Nick Desaulniers (1):
      MIPS: select ARCH_KEEP_MEMBLOCK unconditionally

Paul Burton (1):
      MIPS: Fix access_ok() for the last byte of user space

Paul Cercueil (2):
      dt-bindings: panel/kingdisplay,kd035g6-54nt: Remove spi-cs-high
      MIPS: ingenic: gcw0: SPI panel does not require active-high CS

Qing Zhang (10):
      MIPS: Loongson64: Remove unused sysconf members
      MIPS: Loongson64: Move loongson_system_configuration to loongson.h
      MIPS: Loongson64: DeviceTree for Loongson-2K1000
      MIPS: Loongson64: Distinguish firmware dependencies DTB/LEFI
      MIPS: Loongson64: Add support for the Loongson-2K1000 to get cpu_clock_freq
      MIPS: Loongson64: Add Loongson-2K1000 early_printk_port
      irqchip/loongson-liointc: irqchip add 2.0 version
      dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC
      MIPS: Loongson64: Add a Loongson-2K1000 default config file
      MIPS: Loongson64: enable CONFIG_USB_SERIAL_PL2303

Rafał Miłecki (5):
      firmware: bcm47xx_nvram: rename finding function and its variables
      firmware: bcm47xx_nvram: add helper checking for NVRAM
      firmware: bcm47xx_nvram: extract code copying NVRAM
      firmware: bcm47xx_nvram: look for NVRAM with for instead of while
      firmware: bcm47xx_nvram: inline code checking NVRAM size

Romain Naour (1):
      mips: Do not include hi and lo in clobber list for R6

Thomas Bogendoerfer (11):
      Merge tag 'mips-fixes_5.12_1' into mips-next
      MIPS: Remove KVM_GUEST support
      MIPS: Remove KVM_TE support
      MIPS: kernel: Remove not needed set_fs calls
      MIPS: uaccess: Added __get/__put_kernel_nofault
      MIPS: uaccess: Remove get_fs/set_fs call sites
      MIPS: Remove get_fs/set_fs
      MIPS: Fix new sparse warnings
      MIPS: octeon: Add __raw_copy_[from|to|in]_user symbols
      MIPS: uaccess: Reduce number of nested macros
      MIPS: Fix strnlen_user access check

Tiezhu Yang (3):
      MIPS: Enable some missed configs in loongson3_defconfig to support bpftrace
      MIPS/bpf: Enable bpf_probe_read{, str}() on MIPS again
      MIPS: Loongson64: Use _CACHE_UNCACHED instead of _CACHE_UNCACHED_ACCELERATED

Wang Qing (2):
      mips: kernel: use DEFINE_DEBUGFS_ATTRIBUTE with debugfs_create_file_unsafe()
      mips/sgi-ip27: Delete obsolete TODO file

Yang Li (1):
      mips: cavium: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE

xiaochuan mao (3):
      mips/bootinfo:correct some comments of fw_arg
      MIPS:DTS:Fix label name and interrupt number of ohci for Loongson-2K
      MIPS:DTS:Correct the license for Loongson-2K

zhaoxiao (1):
      MIPS: Makefile: Replace -pg with CC_FLAGS_FTRACE

zhouchuangao (1):
      MIPS: BCM63XX: Use BUG_ON instead of condition followed by BUG.

Álvaro Fernández Rojas (14):
      mips: smp-bmips: fix CPU mappings
      mips: dts: brcm: allow including header files
      mips: bmips: bcm3368: include dt-bindings
      mips: bmips: bcm6328: include dt-bindings
      mips: bmips: bcm6358: include dt-bindings
      mips: bmips: bcm6362: include dt-bindings
      mips: bmips: bcm6368: include dt-bindings
      mips: bmips: bcm63268: include dt-bindings
      mips: bmips: fix syscon-reboot nodes
      mips: bmips: bcm6328: populate device tree nodes
      mips: bmips: bcm6358: populate device tree nodes
      mips: bmips: bcm6362: populate device tree nodes
      mips: bmips: bcm6368: populate device tree nodes
      mips: bmips: bcm63268: populate device tree nodes

 .../display/panel/kingdisplay,kd035g6-54nt.yaml    |    1 -
 .../interrupt-controller/loongson,liointc.yaml     |   36 +-
 arch/mips/Kconfig                                  |   31 +-
 arch/mips/Kconfig.debug                            |    1 +
 arch/mips/alchemy/common/clock.c                   |    3 +-
 arch/mips/bcm63xx/clk.c                            |    2 +-
 arch/mips/bcm63xx/gpio.c                           |    9 +-
 arch/mips/bmips/dma.c                              |    2 +-
 arch/mips/boot/compressed/Makefile                 |    2 +-
 .../mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts |    2 +-
 arch/mips/boot/dts/brcm/bcm3368.dtsi               |    5 +-
 .../boot/dts/brcm/bcm63268-comtrend-vr-3032u.dts   |    2 +-
 arch/mips/boot/dts/brcm/bcm63268.dtsi              |  137 +-
 arch/mips/boot/dts/brcm/bcm6328.dtsi               |  124 +-
 .../boot/dts/brcm/bcm6358-neufbox4-sercomm.dts     |    2 +-
 arch/mips/boot/dts/brcm/bcm6358.dtsi               |   89 +-
 .../boot/dts/brcm/bcm6362-neufbox6-sercomm.dts     |    2 +-
 arch/mips/boot/dts/brcm/bcm6362.dtsi               |  134 +-
 arch/mips/boot/dts/brcm/bcm6368.dtsi               |  133 +-
 arch/mips/boot/dts/brcm/bcm93384wvg.dts            |    2 +-
 arch/mips/boot/dts/brcm/bcm93384wvg_viper.dts      |    2 +-
 arch/mips/boot/dts/brcm/bcm96368mvwg.dts           |    2 +-
 arch/mips/boot/dts/brcm/bcm97125cbmb.dts           |    2 +-
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts          |    4 +-
 arch/mips/boot/dts/brcm/bcm97358svmb.dts           |    4 +-
 arch/mips/boot/dts/brcm/bcm97360svmb.dts           |    2 +-
 arch/mips/boot/dts/brcm/bcm97362svmb.dts           |    4 +-
 arch/mips/boot/dts/brcm/bcm97420c.dts              |    2 +-
 arch/mips/boot/dts/brcm/bcm97425svmb.dts           |    4 +-
 arch/mips/boot/dts/brcm/bcm97435svmb.dts           |    4 +-
 arch/mips/boot/dts/brcm/bcm9ejtagprb.dts           |    2 +-
 arch/mips/boot/dts/ingenic/gcw0.dts                |    1 -
 arch/mips/boot/dts/loongson/Makefile               |    1 +
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi |  243 +++
 .../boot/dts/loongson/loongson64_2core_2k1000.dts  |   10 +
 arch/mips/cavium-octeon/oct_ilm.c                  |    2 +-
 arch/mips/cavium-octeon/octeon-memcpy.S            |    8 +-
 arch/mips/configs/bigsur_defconfig                 |    4 -
 arch/mips/configs/loongson2k_defconfig             |  353 ++++
 arch/mips/configs/loongson3_defconfig              |    9 +-
 arch/mips/configs/malta_kvm_defconfig              |    3 -
 arch/mips/configs/malta_kvm_guest_defconfig        |  436 -----
 arch/mips/configs/maltaup_xpa_defconfig            |    3 -
 arch/mips/configs/rbtx49xx_defconfig               |    3 -
 arch/mips/configs/sb1250_swarm_defconfig           |   20 +-
 arch/mips/configs/workpad_defconfig                |    9 +-
 arch/mips/crypto/.gitignore                        |    2 +
 arch/mips/generic/board-boston.its.S               |   10 +-
 arch/mips/generic/board-jaguar2.its.S              |   16 +-
 arch/mips/generic/board-luton.its.S                |    8 +-
 arch/mips/generic/board-ni169445.its.S             |   10 +-
 arch/mips/generic/board-ocelot.its.S               |   20 +-
 arch/mips/generic/board-serval.its.S               |    8 +-
 arch/mips/generic/board-xilfpga.its.S              |   10 +-
 arch/mips/generic/vmlinux.its.S                    |   10 +-
 arch/mips/include/asm/Kbuild                       |    7 +-
 arch/mips/include/asm/asmmacro.h                   |    3 +-
 arch/mips/include/asm/bootinfo.h                   |    2 +-
 arch/mips/include/asm/div64.h                      |   55 +-
 arch/mips/include/asm/io.h                         |   14 +-
 arch/mips/include/asm/kvm_host.h                   |  238 ---
 .../asm/mach-cavium-octeon/kernel-entry-init.h     |    8 +
 arch/mips/include/asm/mach-generic/spaces.h        |   12 -
 arch/mips/include/asm/mach-loongson64/boot_param.h |   27 -
 .../include/asm/mach-loongson64/builtin_dtbs.h     |    1 +
 .../asm/mach-loongson64/kernel-entry-init.h        |   27 +
 arch/mips/include/asm/mach-loongson64/loongson.h   |   27 +-
 arch/mips/include/asm/mach-ralink/mt7621.h         |    7 +-
 arch/mips/include/asm/mips-cps.h                   |   23 +-
 arch/mips/include/asm/octeon/cvmx-address.h        |    2 +-
 arch/mips/include/asm/octeon/cvmx-bootinfo.h       |    2 +
 arch/mips/include/asm/page.h                       |    9 +-
 arch/mips/include/asm/pci.h                        |    1 -
 arch/mips/include/asm/processor.h                  |    9 -
 arch/mips/include/asm/thread_info.h                |    6 -
 arch/mips/include/asm/uaccess.h                    |  598 +++----
 arch/mips/include/asm/vdso/gettimeofday.h          |   26 +-
 arch/mips/kernel/Makefile                          |    8 +-
 arch/mips/kernel/access-helper.h                   |   19 +
 arch/mips/kernel/asm-offsets.c                     |    1 -
 arch/mips/kernel/cevt-r4k.c                        |    4 -
 arch/mips/kernel/cpu-probe.c                       |    3 -
 arch/mips/kernel/ftrace.c                          |    8 -
 arch/mips/kernel/process.c                         |    2 -
 arch/mips/kernel/relocate_kernel.S                 |    9 +-
 arch/mips/kernel/scall32-o32.S                     |    8 +-
 arch/mips/kernel/scall64-n32.S                     |    3 +-
 arch/mips/kernel/scall64-n64.S                     |    3 +-
 arch/mips/kernel/scall64-o32.S                     |    4 +-
 arch/mips/kernel/smp-bmips.c                       |   27 +-
 arch/mips/kernel/spinlock_test.c                   |    8 +-
 arch/mips/kernel/syscalls/Makefile                 |   41 +-
 arch/mips/kernel/syscalls/syscallhdr.sh            |   36 -
 arch/mips/kernel/syscalls/syscalltbl.sh            |   36 -
 arch/mips/kernel/traps.c                           |  105 +-
 arch/mips/kernel/unaligned.c                       |  205 +--
 arch/mips/kernel/vdso.c                            |    5 +-
 arch/mips/kvm/Kconfig                              |   34 -
 arch/mips/kvm/Makefile                             |    7 +-
 arch/mips/kvm/commpage.c                           |   32 -
 arch/mips/kvm/commpage.h                           |   24 -
 arch/mips/kvm/dyntrans.c                           |  143 --
 arch/mips/kvm/emulate.c                            | 1688 +-------------------
 arch/mips/kvm/entry.c                              |   33 -
 arch/mips/kvm/interrupt.c                          |  123 +-
 arch/mips/kvm/interrupt.h                          |   20 -
 arch/mips/kvm/mips.c                               |   68 +-
 arch/mips/kvm/mmu.c                                |  405 -----
 arch/mips/kvm/tlb.c                                |  174 --
 arch/mips/kvm/trap_emul.c                          | 1306 ---------------
 arch/mips/kvm/vz.c                                 |    5 +-
 arch/mips/lib/memcpy.S                             |   28 +-
 arch/mips/lib/memset.S                             |    3 -
 arch/mips/lib/strncpy_user.S                       |   48 +-
 arch/mips/lib/strnlen_user.S                       |   44 +-
 arch/mips/loongson64/Makefile                      |    2 +-
 arch/mips/loongson64/env.c                         |   33 +-
 arch/mips/loongson64/init.c                        |   23 +-
 arch/mips/loongson64/numa.c                        |   17 +-
 arch/mips/loongson64/platform.c                    |   42 -
 arch/mips/loongson64/reset.c                       |  113 ++
 arch/mips/loongson64/time.c                        |   24 +
 arch/mips/mm/Makefile                              |    6 +
 arch/mips/mm/maccess.c                             |   10 +
 arch/mips/mm/physaddr.c                            |   56 +
 arch/mips/mm/tlbex.c                               |    9 +-
 arch/mips/mti-malta/Platform                       |    6 +-
 arch/mips/mti-malta/malta-time.c                   |    5 -
 arch/mips/pci/pci-ar2315.c                         |    1 +
 arch/mips/pci/pci-legacy.c                         |   23 +-
 arch/mips/pci/pci-mt7620.c                         |    5 +-
 arch/mips/pci/pci-rt2880.c                         |   50 +-
 arch/mips/pci/pci-rt3883.c                         |   10 +-
 arch/mips/pci/pci-xtalk-bridge.c                   |    2 +-
 arch/mips/ralink/Kconfig                           |    1 +
 arch/mips/ralink/clk.c                             |   14 +
 arch/mips/ralink/common.h                          |    3 +-
 arch/mips/ralink/mt7620.c                          |    2 +-
 arch/mips/ralink/mt7621.c                          |   31 +-
 arch/mips/ralink/of.c                              |    2 +
 arch/mips/ralink/rt288x.c                          |    2 +-
 arch/mips/ralink/rt305x.c                          |    2 +-
 arch/mips/ralink/rt3883.c                          |    2 +-
 arch/mips/sgi-ip27/TODO                            |   19 -
 arch/mips/sgi-ip27/ip27-timer.c                    |    4 +-
 arch/mips/vdso/Makefile                            |    4 +-
 drivers/firmware/broadcom/bcm47xx_nvram.c          |   92 +-
 drivers/irqchip/irq-loongson-liointc.c             |   60 +-
 include/asm-generic/div64.h                        |   10 +-
 lib/Kconfig.debug                                  |   10 +
 lib/math/Makefile                                  |    2 +
 lib/math/test_div64.c                              |  249 +++
 152 files changed, 2690 insertions(+), 6030 deletions(-)
 create mode 100644 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts
 create mode 100644 arch/mips/configs/loongson2k_defconfig
 delete mode 100644 arch/mips/configs/malta_kvm_guest_defconfig
 create mode 100644 arch/mips/crypto/.gitignore
 create mode 100644 arch/mips/kernel/access-helper.h
 delete mode 100644 arch/mips/kernel/syscalls/syscallhdr.sh
 delete mode 100644 arch/mips/kernel/syscalls/syscalltbl.sh
 delete mode 100644 arch/mips/kvm/commpage.c
 delete mode 100644 arch/mips/kvm/commpage.h
 delete mode 100644 arch/mips/kvm/dyntrans.c
 delete mode 100644 arch/mips/kvm/trap_emul.c
 delete mode 100644 arch/mips/loongson64/platform.c
 create mode 100644 arch/mips/mm/maccess.c
 create mode 100644 arch/mips/mm/physaddr.c
 delete mode 100644 arch/mips/sgi-ip27/TODO
 create mode 100644 lib/math/test_div64.c
-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
