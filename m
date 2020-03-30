Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E26D197B73
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 14:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730014AbgC3MDZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 08:03:25 -0400
Received: from elvis.franken.de ([193.175.24.41]:44979 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729669AbgC3MDZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 08:03:25 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jIt8V-0005y5-00; Mon, 30 Mar 2020 14:03:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A5C33C0D4E; Mon, 30 Mar 2020 14:03:15 +0200 (CEST)
Date:   Mon, 30 Mar 2020 14:03:15 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v5.7-rc1
Message-ID: <20200330120315.GA10196@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus,

I probably messed up my tree, when merging mips_fixes_5_6_1. My way
to solve this was to merge v5.6 into mips-next to get a pull request with
just the changes from mips-next. I hope this is still ok for you.

Thomas.


The following changes since commit 7111951b8d4973bda27ff663f2cf18b663d15b48:

  Linux 5.6 (2020-03-29 15:25:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux tags/mips_5.7

for you to fetch changes up to ba15533275dd70238b523417d222d43fb40dac9d:

  Merge tag 'v5.6' into mips-next (2020-03-30 13:31:37 +0200)

----------------------------------------------------------------
MIPS updates for v5.7:

- loongson64 irq rework
- dmi support for loongson
- replace setup_irq() by request_irq()
- jazz cleanups
- minor cleanups and fixes

----------------------------------------------------------------
Alex Smith (1):
      MIPS: DTS: CI20: add DT node for IR sensor

Bartlomiej Zolnierkiewicz (3):
      ide: remove no longer used au1xxx-ide driver
      MIPS: Alchemy: remove no longer used au1xxx_ide.h header
      docs: mips: remove no longer needed au1xxx_ide.rst documentation

Finn Thain (3):
      fbdev/g364fb: Fix build failure
      mips/jazz: Remove redundant settings and shrink jazz_defconfig
      mips/jazz: Update jazz_defconfig for MIPS Magnum

Geert Uytterhoeven (7):
      MIPS: ath79: Replace <linux/clk-provider.h> by <linux/of_clk.h>
      MIPS: BMIPS: Replace <linux/clk-provider.h> by <linux/of_clk.h>
      MIPS: generic: Replace <linux/clk-provider.h> by <linux/of_clk.h>
      MIPS: jz4740: Replace <linux/clk-provider.h> by <linux/of_clk.h>
      MIPS: pic32mzda: Replace <linux/clk-provider.h> by <linux/of_clk.h>
      MIPS: Pistachio: Replace <linux/clk-provider.h> by <linux/of_clk.h>
      MIPS: ralink: Replace <linux/clk-provider.h> by <linux/of_clk.h>

Gustavo A. R. Silva (1):
      MIPS: OCTEON: irq: Fix potential NULL pointer dereference

H. Nikolaus Schaller (2):
      MIPS: DTS: CI20: multiple DTS improvements
      MIPS: CI20: defconfig: multiple improvements

Huacai Chen (1):
      MIPS/tlbex: Fix LDDIR usage in setup_pw() for Loongson-3

Jiaxun Yang (10):
      irqchip: Add driver for Loongson I/O Local Interrupt Controller
      irqchip: loongson-liointc: Workaround LPC IRQ Errata
      dt-bindings: interrupt-controller: Add Loongson LIOINTC
      irqchip: Add driver for Loongson-3 HyperTransport PIC controller
      dt-bindings: interrupt-controller: Add Loongson-3 HTPIC
      MIPS: Loongson64: Drop legacy IRQ code
      dt-bindings: mips: Add loongson boards
      MIPS: Loongson64: Add generic dts
      MIPS: Loongson64: Load built-in dtbs
      MAINTAINERS: Update Loongson64 entry

Kamal Dasu (1):
      MIPS: c-r4k: Invalidate BMIPS5000 ZSCM prefetch lines

Krzysztof Kozlowski (1):
      MIPS: configs: Cleanup old Kconfig options

Masahiro Yamada (1):
      MIPS: do not compile generic functions for CONFIG_CAVIUM_OCTEON_SOC

Oleksij Rempel (1):
      MIPS: reduce print level for cache information

Randy Dunlap (1):
      arch/mips: change duplicated word in NUMA help text

Sergio Paracuellos (1):
      MIPS: ralink: mt7621: introduce 'soc_device' initialization

Thomas Bogendoerfer (3):
      Merge tag 'mips_fixes_5.6.1' into mips-next
      MIPS: ralink: mt7621: Fix soc_device introduction
      Merge tag 'v5.6' into mips-next

Tiezhu Yang (3):
      MIPS: Loongson: Do not initialise statics to 0
      firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
      MIPS: Add support for Desktop Management Interface (DMI)

Yousong Zhou (1):
      MIPS: Exclude more dsemul code when CONFIG_MIPS_FP_SUPPORT=n

YueHaibing (1):
      MIPS: pic32mzda: Drop pointless static qualifier

YunQiang Su (1):
      Use ELF_BASE_PLATFORM to pass ISA level

afzal mohammed (2):
      MIPS: Replace setup_irq() by request_irq()
      MIPS: pass non-NULL dev_id on shared request_irq()

bibo mao (1):
      MIPS: Add header files reference with path prefix

 .../interrupt-controller/loongson,htpic.yaml       |  59 ++
 .../interrupt-controller/loongson,liointc.yaml     |  93 ++++
 .../devicetree/bindings/mips/loongson/devices.yaml |  27 +
 Documentation/mips/au1xxx_ide.rst                  | 130 -----
 Documentation/mips/index.rst                       |   2 -
 MAINTAINERS                                        |   1 +
 arch/mips/Kconfig                                  |  31 +-
 arch/mips/alchemy/common/time.c                    |  11 +-
 arch/mips/ar7/irq.c                                |  16 +-
 arch/mips/ath25/ar2315.c                           |   9 +-
 arch/mips/ath25/ar5312.c                           |   9 +-
 arch/mips/ath79/setup.c                            |   2 +-
 arch/mips/bcm63xx/irq.c                            |  41 +-
 arch/mips/bmips/setup.c                            |   2 +-
 arch/mips/boot/dts/Makefile                        |   1 +
 arch/mips/boot/dts/ingenic/ci20.dts                |  19 +
 arch/mips/boot/dts/loongson/Makefile               |   4 +
 arch/mips/boot/dts/loongson/loongson3-package.dtsi |  64 +++
 .../boot/dts/loongson/loongson3_4core_rs780e.dts   |  25 +
 .../boot/dts/loongson/loongson3_8core_rs780e.dts   |  25 +
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi        |  26 +
 arch/mips/cavium-octeon/octeon-irq.c               |   3 +
 arch/mips/cobalt/irq.c                             |  18 +-
 arch/mips/configs/ar7_defconfig                    |   1 -
 arch/mips/configs/ath25_defconfig                  |   1 -
 arch/mips/configs/ath79_defconfig                  |   1 -
 arch/mips/configs/bcm63xx_defconfig                |   2 -
 arch/mips/configs/bmips_be_defconfig               |   2 -
 arch/mips/configs/bmips_stb_defconfig              |   2 -
 arch/mips/configs/ci20_defconfig                   |  21 +
 arch/mips/configs/db1xxx_defconfig                 |   1 -
 arch/mips/configs/generic/board-ni169445.config    |   1 -
 arch/mips/configs/jazz_defconfig                   | 267 +--------
 arch/mips/configs/lasat_defconfig                  |   2 -
 arch/mips/configs/lemote2f_defconfig               |   2 +-
 arch/mips/configs/loongson3_defconfig              |   5 +-
 arch/mips/configs/msp71xx_defconfig                |   2 -
 arch/mips/configs/pnx8335_stb225_defconfig         |   2 -
 arch/mips/configs/rb532_defconfig                  |   1 -
 arch/mips/configs/rt305x_defconfig                 |   1 -
 arch/mips/configs/xway_defconfig                   |   1 -
 arch/mips/dec/setup.c                              |  59 +-
 arch/mips/emma/markeins/irq.c                      |  21 +-
 arch/mips/fw/lib/cmdline.c                         |   2 +
 arch/mips/generic/init.c                           |   2 +-
 arch/mips/include/asm/dmi.h                        |  20 +
 arch/mips/include/asm/elf.h                        |   3 +
 arch/mips/include/asm/i8259.h                      |   1 +
 arch/mips/include/asm/mach-ar7/irq.h               |   2 +-
 arch/mips/include/asm/mach-ath79/irq.h             |   2 +-
 arch/mips/include/asm/mach-au1x00/au1xxx_ide.h     | 178 ------
 arch/mips/include/asm/mach-emma2rh/irq.h           |   2 +-
 arch/mips/include/asm/mach-ip27/irq.h              |   2 +-
 arch/mips/include/asm/mach-ip30/irq.h              |   2 +-
 arch/mips/include/asm/mach-lantiq/falcon/irq.h     |   2 +-
 arch/mips/include/asm/mach-lantiq/xway/irq.h       |   2 +-
 arch/mips/include/asm/mach-lasat/irq.h             |   2 +-
 arch/mips/include/asm/mach-loongson64/boot_param.h |   2 +
 .../include/asm/mach-loongson64/builtin_dtbs.h     |  13 +
 arch/mips/include/asm/mach-loongson64/irq.h        |  30 +-
 arch/mips/include/asm/mach-loongson64/loongson.h   |   1 +
 arch/mips/include/asm/mach-malta/irq.h             |   2 +-
 arch/mips/include/asm/mach-pic32/irq.h             |   2 +-
 arch/mips/include/asm/mach-pistachio/irq.h         |   2 +-
 arch/mips/include/asm/mach-ralink/irq.h            |   2 +-
 arch/mips/include/asm/mach-rm/mc146818rtc.h        |   2 +-
 arch/mips/include/asm/mach-vr41xx/irq.h            |   2 +-
 arch/mips/include/asm/mach-xilfpga/irq.h           |   2 +-
 arch/mips/include/asm/processor.h                  |  12 +-
 arch/mips/include/asm/sni.h                        |   4 +-
 arch/mips/jazz/irq.c                               |  12 +-
 arch/mips/jz4740/time.c                            |   2 +-
 arch/mips/kernel/cevt-bcm1480.c                    |  11 +-
 arch/mips/kernel/cevt-ds1287.c                     |   9 +-
 arch/mips/kernel/cevt-gt641xx.c                    |   9 +-
 arch/mips/kernel/cevt-r4k.c                        |   5 +-
 arch/mips/kernel/cevt-sb1250.c                     |  11 +-
 arch/mips/kernel/cevt-txx9.c                       |  11 +-
 arch/mips/kernel/cpu-probe.c                       |  18 +
 arch/mips/kernel/i8253.c                           |  11 +-
 arch/mips/kernel/process.c                         |  10 +-
 arch/mips/kernel/rtlx-mt.c                         |   8 +-
 arch/mips/kernel/setup.c                           |   2 +
 arch/mips/kernel/smp.c                             |  33 +-
 arch/mips/kernel/vdso.c                            |  26 +-
 arch/mips/lasat/interrupt.c                        |  10 +-
 arch/mips/lib/delay.c                              |   4 +
 arch/mips/lib/memcpy.S                             |   3 +
 arch/mips/loongson2ef/common/bonito-irq.c          |   9 +-
 arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c |  10 +-
 arch/mips/loongson2ef/fuloong-2e/irq.c             |  16 +-
 arch/mips/loongson2ef/lemote-2f/irq.c              |  20 +-
 arch/mips/loongson32/common/irq.c                  |  21 +-
 arch/mips/loongson32/common/time.c                 |  12 +-
 arch/mips/loongson64/Makefile                      |   2 +-
 arch/mips/loongson64/env.c                         |  23 +
 arch/mips/loongson64/hpet.c                        |  10 +-
 arch/mips/loongson64/init.c                        |   6 +
 arch/mips/loongson64/irq.c                         | 162 ------
 arch/mips/loongson64/numa.c                        |   2 +-
 arch/mips/loongson64/setup.c                       |  16 +
 arch/mips/loongson64/smp.c                         |  28 +-
 arch/mips/mm/c-octeon.c                            |  18 +-
 arch/mips/mm/c-r3k.c                               |   4 +-
 arch/mips/mm/c-r4k.c                               |  47 +-
 arch/mips/mm/c-tx39.c                              |   4 +-
 arch/mips/mm/tlbex.c                               |   5 +-
 arch/mips/mti-malta/malta-int.c                    |  10 +-
 arch/mips/netlogic/xlr/fmn.c                       |  11 +-
 arch/mips/pic32/pic32mzda/time.c                   |   4 +-
 arch/mips/pistachio/time.c                         |   2 +-
 arch/mips/pmcs-msp71xx/msp_irq.c                   |  28 +-
 arch/mips/pmcs-msp71xx/msp_smp.c                   |  22 +-
 arch/mips/pmcs-msp71xx/msp_time.c                  |   8 +-
 arch/mips/ralink/Kconfig                           |   1 +
 arch/mips/ralink/cevt-rt3352.c                     |  18 +-
 arch/mips/ralink/mt7621.c                          |  30 ++
 arch/mips/ralink/timer-gic.c                       |   2 +-
 arch/mips/sgi-ip22/ip22-eisa.c                     |  10 +-
 arch/mips/sgi-ip22/ip22-int.c                      |  49 +-
 arch/mips/sgi-ip32/ip32-irq.c                      |  18 +-
 arch/mips/sni/a20r.c                               |   4 +-
 arch/mips/sni/irq.c                                |   8 +-
 arch/mips/sni/pcit.c                               |   8 +-
 arch/mips/sni/rm200.c                              |  23 +-
 arch/mips/sni/time.c                               |  12 +-
 arch/mips/vr41xx/common/irq.c                      |   9 +-
 drivers/firmware/dmi_scan.c                        |   6 +-
 drivers/ide/Kconfig                                |  20 +-
 drivers/ide/Makefile                               |   2 -
 drivers/ide/au1xxx-ide.c                           | 597 ---------------------
 drivers/irqchip/Kconfig                            |  19 +
 drivers/irqchip/Makefile                           |   2 +
 drivers/irqchip/irq-loongson-htpic.c               | 149 +++++
 drivers/irqchip/irq-loongson-liointc.c             | 271 ++++++++++
 drivers/video/fbdev/g364fb.c                       |  29 +-
 136 files changed, 1369 insertions(+), 1924 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
 delete mode 100644 Documentation/mips/au1xxx_ide.rst
 create mode 100644 arch/mips/boot/dts/loongson/Makefile
 create mode 100644 arch/mips/boot/dts/loongson/loongson3-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch.dtsi
 create mode 100644 arch/mips/include/asm/dmi.h
 delete mode 100644 arch/mips/include/asm/mach-au1x00/au1xxx_ide.h
 create mode 100644 arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
 delete mode 100644 arch/mips/loongson64/irq.c
 delete mode 100644 drivers/ide/au1xxx-ide.c
 create mode 100644 drivers/irqchip/irq-loongson-htpic.c
 create mode 100644 drivers/irqchip/irq-loongson-liointc.c
-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
