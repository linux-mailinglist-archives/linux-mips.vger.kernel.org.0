Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 207EF23EE43
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 15:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgHGNd5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 09:33:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:37678 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgHGNd5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 7 Aug 2020 09:33:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k42VQ-0004mv-00
        for linux-mips@vger.kernel.org; Fri, 07 Aug 2020 15:33:56 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 055DFC0C84; Fri,  7 Aug 2020 15:33:47 +0200 (CEST)
Date:   Fri, 7 Aug 2020 15:33:47 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: FYI Pull request for v5.9-rc1
Message-ID: <20200807133347.GA12293@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

I forgot to CC this list, when sending my pull request yesterday
(which Linus already merged). So this is just FYI.

Thomas.


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.9

for you to fetch changes up to 6c86a3029ce3b44597526909f2e39a77a497f640:

  MIPS: SGI-IP27: always enable NUMA in Kconfig (2020-08-05 23:40:29 +0200)

----------------------------------------------------------------
MIPS upates for v5.9

- improvements for Loongson64
- extended ingenic support
- removal of not maintained paravirt system type
- cleanups and fixes

----------------------------------------------------------------
Alexander A. Klimov (1):
      mips: Replace HTTP links with HTTPS ones

Alexander Lobakin (3):
      MIPS: generic/ip32: io: fix __mem_ioswabq()
      MIPS: io: fix sparse flood on asm/io.h
      MIPS: checksum: fix sparse flooding on asm/checksum.h

Huacai Chen (12):
      MIPS: Unify naming style of vendor CP0.Config6 bits
      MIPS: Loongson64: Adjust IRQ layout
      MIPS: Loongson: Rename CPU device-tree binding
      dt-bindings: mips: Document two Loongson boards
      MIPS: Loongson: Update dts file for RS780E
      MIPS: Loongson64: Fix machine naming
      MIPS: CPU#0 is not hotpluggable
      MIPS: DTS: Fix number of msi vectors for Loongson64G
      dt-bindings: mips: Document Loongson kvm guest board
      MIPS: KVM: Add kvm guest support for Loongson-3
      MIPS: Update default config file for Loongson-3
      MAINTAINERS: Update KVM/MIPS maintainers

Jiaxun Yang (9):
      MIPS: Loongson64: DeviceTree for LS7A PCH
      MIPS: Loongson64: Load LS7A dtbs
      MIPS: Retire kvm paravirt
      of_address: Add bus type match for pci ranges parser
      MIPS: Loongson64: Process ISA Node in DeviceTree
      MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
      MIPS: Loongson64: DTS: Fix ISA and PCI I/O ranges for RS780E PCH
      MIPS: Loongson64: Add ISA node for LS7A PCH
      of_address: Guard of_bus_pci_get_flags with CONFIG_PCI

Jinyang He (1):
      MIPS: Fix unable to reserve memory for Crash kernel

Jiri Slaby (1):
      mips: traps, add __init to parity_protection_init

Krzysztof Kozlowski (2):
      MIPS: ingenic: Enable JZ4780_NEMC manually
      memory: jz4780-nemc: Do not build by default

Lichao Liu (1):
      MIPS: Loongson-2EF: disable fix-loongson3-llsc in compiler

Mike Rapoport (1):
      MIPS: SGI-IP27: always enable NUMA in Kconfig

Nicolas Saenz Julienne (1):
      of: address: Fix parser address/size cells initialization

Paul Cercueil (15):
      dt-bindings: vendor-prefixes: Add YLM
      dt-bindings: MIPS: Add entry for the YLM RetroMini
      dt-bindings: timer/ingenic,tcu: Add compatible strings for JZ4725B SoC
      MIPS: ingenic: Use enum instead of macros for Ingenic SoCs
      MIPS: ingenic: Add support for the JZ4725B SoC
      MIPS: ingenic: Add support for the RS90 board
      MIPS: ingenic: RS90: Added defconfig
      MIPS: ingenic: JZ4725B: Add IPU node
      MIPS: ath79: Remove unused include <asm/mips_machine.h>
      MIPS: Remove legacy MIPS_MACHINE option
      MIPS: qi_lb60: Fix routing to audio amplifier
      MIPS: head.S: Init fw_passed_dtb to builtin DTB
      MIPS: ingenic: Use fw_passed_dtb even if CONFIG_BUILTIN_DTB
      MIPS: DTS: ingenic/qi,lb60: Add model and memory node
      MIPS: ingenic: Hardcode mem size for qi,lb60 board

Peng Fan (1):
      mips/vdso: Fix resource leaks in genvdso.c

Randy Dunlap (6):
      mips: io.h: delete duplicated word
      mips: octeon: cvmx-l2c.h: delete duplicated word
      mips: octeon: cvmx-pip.h: delete duplicated word
      mips: octeon: cvmx-pkoh: fix duplicated words
      mips: octeon: cvmx-pow.h: fix duplicated words
      mips: octeon: octeon.h: delete duplicated word

Serge Semin (6):
      dt-bindings: power: Convert mti,mips-cpc to DT schema
      dt-bindings: interrupt-controller: Convert mti,gic to DT schema
      dt-bindings: bus: Add MIPS CDMM controller
      mips: cdmm: Add mti,mips-cdmm dtb node support
      bus: cdmm: Add MIPS R5 arch support
      MAINTAINERS: Add maintainers for MIPS core drivers

Sunguoyun (1):
      MIPS: fix vdso different address spaces

Thomas Bogendoerfer (2):
      dt-bindings: MIPS: Fix tabs in Ingenic SoCs binding.
      MIPS: cpu-feature-overrides: Remove not needed overrides

Tiezhu Yang (3):
      MIPS: Loongson: Cleanup cpu_hwmon.c
      MIPS: Loongson: Reduce possible loop times and add log in do_thermal_timer()
      MIPS: Prevent READ_IMPLIES_EXEC propagation

WANG Xuerui (3):
      MIPS: only register FTLBPar exception handler for supported models
      MIPS: add definitions for Loongson-specific CP0.Diag1 register
      MIPS: handle Loongson-specific GSExc exception

Wei Yongjun (1):
      MIPS: Loongson64: Make acpi_registers_setup() static

Yu Kuai (1):
      MIPS: OCTEON: add missing put_device() call in dwc3_octeon_device_init()

Zhi Li (1):
      MIPS: Loongson: Fix boot warning about hwmon_device_register()

Álvaro Fernández Rojas (2):
      MIPS: BCM63xx: add endif comments
      MIPS: BCM63xx: improve CFE version detection

周琰杰 (Zhou Yanjie) (7):
      dt-bindings: MIPS: Document Ingenic SoCs binding.
      MIPS: Ingenic: Add Ingenic X1830 support.
      dt-bindings: MIPS: Add X1830 based CU1830-Neo and fix bug in CU1000-Neo.
      MIPS: Ingenic: Add YSH & ATIL CU Neo board support.
      MIPS: Ingenic: Fix bugs and add missing LED node for X1000.
      MIPS: CU1000-Neo: Refresh defconfig to support LED.
      MIPS: X2000: Add X2000 system type.

 .../devicetree/bindings/bus/mti,mips-cdmm.yaml     |  35 ++
 .../bindings/interrupt-controller/mips-gic.txt     |  67 ----
 .../bindings/interrupt-controller/mti,gic.yaml     | 148 ++++++++
 .../devicetree/bindings/mips/ingenic/devices.yaml  |  17 +-
 .../bindings/mips/ingenic/ingenic,cpu.yaml         |  67 ++++
 .../devicetree/bindings/mips/loongson/devices.yaml |  20 +-
 .../devicetree/bindings/power/mti,mips-cpc.txt     |   8 -
 .../devicetree/bindings/power/mti,mips-cpc.yaml    |  35 ++
 .../devicetree/bindings/timer/ingenic,tcu.yaml     |   5 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  15 +-
 arch/mips/Kbuild.platforms                         |   1 -
 arch/mips/Kconfig                                  |  26 +-
 arch/mips/ath79/setup.c                            |   1 -
 arch/mips/bcm63xx/boards/board_bcm963xx.c          |  55 +--
 arch/mips/boot/dts/ingenic/Makefile                |   2 +
 arch/mips/boot/dts/ingenic/cu1000-neo.dts          | 114 +++----
 arch/mips/boot/dts/ingenic/cu1830-neo.dts          | 168 +++++++++
 arch/mips/boot/dts/ingenic/jz4725b.dtsi            | 364 ++++++++++++++++++++
 arch/mips/boot/dts/ingenic/qi_lb60.dts             |   8 +-
 arch/mips/boot/dts/ingenic/rs90.dts                | 315 +++++++++++++++++
 arch/mips/boot/dts/ingenic/x1000.dtsi              | 126 ++++---
 arch/mips/boot/dts/ingenic/x1830.dtsi              | 300 ++++++++++++++++
 arch/mips/boot/dts/loongson/Makefile               |   6 +-
 ...gson3-package.dtsi => loongson64c-package.dtsi} |   0
 .../boot/dts/loongson/loongson64c_4core_ls7a.dts   |  37 ++
 ...ore_rs780e.dts => loongson64c_4core_rs780e.dts} |   4 +-
 ...ore_rs780e.dts => loongson64c_8core_rs780e.dts} |   4 +-
 .../boot/dts/loongson/loongson64g-package.dtsi     |  61 ++++
 .../boot/dts/loongson/loongson64g_4core_ls7a.dts   |  41 +++
 .../boot/dts/loongson/loongson64v_4core_virtio.dts | 102 ++++++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi          | 378 +++++++++++++++++++++
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi        |   4 +-
 arch/mips/cavium-octeon/octeon-usb.c               |   5 +-
 arch/mips/configs/ci20_defconfig                   |   1 +
 arch/mips/configs/cu1000-neo_defconfig             |   4 +
 arch/mips/configs/cu1830-neo_defconfig             | 123 +++++++
 arch/mips/configs/loongson3_defconfig              |  89 ++++-
 arch/mips/configs/mips_paravirt_defconfig          |  98 ------
 arch/mips/configs/qi_lb60_defconfig                |   1 +
 arch/mips/configs/rs90_defconfig                   | 183 ++++++++++
 arch/mips/include/asm/Kbuild                       |   1 +
 arch/mips/include/asm/bootinfo.h                   |  23 +-
 arch/mips/include/asm/checksum.h                   |   4 +-
 arch/mips/include/asm/cpu-features.h               |   8 +
 arch/mips/include/asm/cpu.h                        |   8 +-
 arch/mips/include/asm/elf.h                        |   1 +
 arch/mips/include/asm/io.h                         |   4 +-
 arch/mips/include/asm/kvm_para.h                   | 115 -------
 .../include/asm/mach-cavium-octeon/mangle-port.h   |  12 +-
 .../include/asm/mach-dec/cpu-feature-overrides.h   |   1 -
 arch/mips/include/asm/mach-generic/mangle-port.h   |  12 +-
 arch/mips/include/asm/mach-generic/spaces.h        |   4 +
 .../include/asm/mach-ip27/cpu-feature-overrides.h  |   3 -
 arch/mips/include/asm/mach-ip27/mangle-port.h      |   6 +-
 .../include/asm/mach-ip30/cpu-feature-overrides.h  |   3 -
 arch/mips/include/asm/mach-ip30/mangle-port.h      |   6 +-
 arch/mips/include/asm/mach-ip32/mangle-port.h      |   6 +-
 arch/mips/include/asm/mach-loongson64/boot_param.h |   4 +-
 .../include/asm/mach-loongson64/builtin_dtbs.h     |   7 +-
 arch/mips/include/asm/mach-loongson64/irq.h        |   6 +-
 arch/mips/include/asm/mach-loongson64/spaces.h     |   3 +-
 .../asm/mach-paravirt/cpu-feature-overrides.h      |   1 -
 arch/mips/include/asm/mach-tx39xx/mangle-port.h    |   6 +-
 arch/mips/include/asm/mach-tx49xx/mangle-port.h    |   6 +-
 arch/mips/include/asm/mips_machine.h               |  46 ---
 arch/mips/include/asm/mipsregs.h                   |  39 ++-
 arch/mips/include/asm/octeon/cvmx-l2c.h            |   2 +-
 arch/mips/include/asm/octeon/cvmx-pip.h            |   2 +-
 arch/mips/include/asm/octeon/cvmx-pko.h            |   7 +-
 arch/mips/include/asm/octeon/cvmx-pow.h            |   8 +-
 arch/mips/include/asm/octeon/octeon.h              |   2 +-
 arch/mips/include/asm/war.h                        |   2 +-
 arch/mips/include/uapi/asm/Kbuild                  |   2 +
 arch/mips/include/uapi/asm/kvm_para.h              |   5 -
 arch/mips/jz4740/Kconfig                           |  18 +
 arch/mips/jz4740/setup.c                           |  52 +--
 arch/mips/kernel/Makefile                          |   1 -
 arch/mips/kernel/cpu-probe.c                       |  39 ++-
 arch/mips/kernel/genex.S                           |  14 +
 arch/mips/kernel/head.S                            |   6 +
 arch/mips/kernel/mips_machine.c                    |  62 ----
 arch/mips/kernel/setup.c                           |   2 +-
 arch/mips/kernel/topology.c                        |   2 +-
 arch/mips/kernel/traps.c                           |  40 ++-
 arch/mips/kvm/vz.c                                 |   4 +-
 arch/mips/loongson2ef/Platform                     |  22 ++
 arch/mips/loongson64/cpucfg-emul.c                 |   6 +-
 arch/mips/loongson64/env.c                         |  70 ++--
 arch/mips/loongson64/init.c                        |  92 +++--
 arch/mips/mm/c-r4k.c                               |   4 +-
 arch/mips/paravirt/Kconfig                         |   7 -
 arch/mips/paravirt/Makefile                        |  14 -
 arch/mips/paravirt/Platform                        |   7 -
 arch/mips/paravirt/paravirt-irq.c                  | 368 --------------------
 arch/mips/paravirt/paravirt-smp.c                  | 145 --------
 arch/mips/paravirt/serial.c                        |  39 ---
 arch/mips/paravirt/setup.c                         |  67 ----
 arch/mips/pci/Makefile                             |   1 -
 arch/mips/pci/pci-virtio-guest.c                   | 131 -------
 arch/mips/vdso/genvdso.c                           |  12 +-
 drivers/bus/Kconfig                                |   2 +-
 drivers/bus/mips_cdmm.c                            |  15 +
 drivers/memory/Kconfig                             |   1 -
 drivers/of/address.c                               |  27 +-
 drivers/platform/mips/cpu_hwmon.c                  |  66 ++--
 drivers/platform/mips/rs780e-acpi.c                |   2 +-
 include/linux/of_address.h                         |   4 +
 108 files changed, 3139 insertions(+), 1608 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.txt
 create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.yaml
 create mode 100644 arch/mips/boot/dts/ingenic/cu1830-neo.dts
 create mode 100644 arch/mips/boot/dts/ingenic/jz4725b.dtsi
 create mode 100644 arch/mips/boot/dts/ingenic/rs90.dts
 create mode 100644 arch/mips/boot/dts/ingenic/x1830.dtsi
 rename arch/mips/boot/dts/loongson/{loongson3-package.dtsi => loongson64c-package.dtsi} (100%)
 create mode 100644 arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
 rename arch/mips/boot/dts/loongson/{loongson3_4core_rs780e.dts => loongson64c_4core_rs780e.dts} (83%)
 rename arch/mips/boot/dts/loongson/{loongson3_8core_rs780e.dts => loongson64c_8core_rs780e.dts} (83%)
 create mode 100644 arch/mips/boot/dts/loongson/loongson64g-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
 create mode 100644 arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls7a-pch.dtsi
 create mode 100644 arch/mips/configs/cu1830-neo_defconfig
 delete mode 100644 arch/mips/configs/mips_paravirt_defconfig
 create mode 100644 arch/mips/configs/rs90_defconfig
 delete mode 100644 arch/mips/include/asm/kvm_para.h
 delete mode 100644 arch/mips/include/asm/mips_machine.h
 delete mode 100644 arch/mips/include/uapi/asm/kvm_para.h
 delete mode 100644 arch/mips/kernel/mips_machine.c
 delete mode 100644 arch/mips/paravirt/Kconfig
 delete mode 100644 arch/mips/paravirt/Makefile
 delete mode 100644 arch/mips/paravirt/Platform
 delete mode 100644 arch/mips/paravirt/paravirt-irq.c
 delete mode 100644 arch/mips/paravirt/paravirt-smp.c
 delete mode 100644 arch/mips/paravirt/serial.c
 delete mode 100644 arch/mips/paravirt/setup.c
 delete mode 100644 arch/mips/pci/pci-virtio-guest.c

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
