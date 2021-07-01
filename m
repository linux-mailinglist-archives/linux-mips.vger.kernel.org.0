Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D17093B928D
	for <lists+linux-mips@lfdr.de>; Thu,  1 Jul 2021 15:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhGAN7V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Jul 2021 09:59:21 -0400
Received: from elvis.franken.de ([193.175.24.41]:33889 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232335AbhGAN7V (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Jul 2021 09:59:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lyxBR-0000bH-00; Thu, 01 Jul 2021 15:56:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DD147C0755; Thu,  1 Jul 2021 15:56:41 +0200 (CEST)
Date:   Thu, 1 Jul 2021 15:56:41 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v5.14
Message-ID: <20210701135641.GA6868@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.14

for you to fetch changes up to cf02ce742f09188272bcc8b0e62d789eb671fc4c:

  MIPS: Fix PKMAP with 32-bit MIPS huge page support (2021-06-30 14:41:32 +0200)

----------------------------------------------------------------
- added support for OpeneEmbed SOM9331 board
- Ingenic fixes/improvments
- other fixes and cleanups

----------------------------------------------------------------
Bibo Mao (1):
      hugetlb: clear huge pte during flush function on mips platform

Geert Uytterhoeven (1):
      MIPS: SEAD3: Correct Ethernet node name

Huacai Chen (1):
      MIPS: Loongson64: Remove a "set but not used" variable

Huang Pei (1):
      MIPS: add PMD table accounting into MIPS'pmd_alloc_one

Masahiro Yamada (2):
      mips: syscalls: define syscall offsets directly in <asm/unistd.h>
      mips: syscalls: use pattern rules to generate syscall headers

Mike Rapoport (1):
      MIPS: Octeon: drop dependency on CONFIG_HOLES_IN_ZONE

Nick Desaulniers (1):
      MIPS: set mips32r5 for virt extensions

Oleksij Rempel (3):
      dt-bindings: vendor-prefixes: Add an entry for OpenEmbed
      MIPS: ath79: ar9331: Add OpeneEmbed SOM9331 Board
      MIPS: ath79: ar9331: add pause property for the MAC <> switch link

Paul Cercueil (9):
      MIPS: mm: XBurst CPU requires sync after DMA
      MIPS: boot: Support specifying UART port on Ingenic SoCs
      MIPS: cpu-probe: Fix FPU detection on Ingenic JZ4760(B)
      MIPS: Kconfig: ingenic: Ensure MACH_INGENIC_GENERIC selects all SoCs
      MIPS: ingenic: Select CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER
      MIPS: ingenic: jz4780: Fix I2C nodes to match DT doc
      MIPS: ingenic: gcw0: Set codec to cap-less mode for FM radio
      MIPS: ingenic: rs90: Add dedicated VRAM memory region
      MIPS: MT extensions are not available on MIPS32r1

Tiezhu Yang (2):
      MIPS: Loongson64: Update loongson3_defconfig
      MIPS: Loongson64: Make some functions static in smp.c

Tom Rix (1):
      MIPS: Loongson64: fix spelling of SPDX tag

Wei Li (1):
      MIPS: Fix PKMAP with 32-bit MIPS huge page support

Xiaochuan Mao (1):
      MIPS:DTS:Correct device id of pcie for Loongnon-2K

Yang Yingliang (1):
      MIPS: OCTEON: octeon-usb: Use devm_platform_get_and_ioremap_resource()

Youling Tang (1):
      MIPS: Loongson64: Fix build error 'secondary_kexec_args' undeclared under !SMP

zhanglianjie (1):
      MIPS: loongsoon64: Reserve memory below starting pfn to prevent Oops

zhaoxiao (5):
      mips: dts: loongson: fix DTC unit name warnings
      mips: dts: loongson: fix DTC unit name warnings
      mips: dts: loongson: fix DTC unit name warnings
      mips: dts: loongson: fix DTC unit name warnings
      mips: dts: loongson: fix DTC unit name warnings

zhouchuangao (1):
      mips/kvm: Use BUG_ON instead of if condition followed by BUG

周琰杰 (Zhou Yanjie) (5):
      MIPS: X1830: Respect cell count of common properties.
      dt-bindings: clock: Add documentation for MAC PHY control bindings.
      MIPS: Ingenic: Add MAC syscon nodes for Ingenic SoCs.
      MIPS: CI20: Reduce clocksource to 750 kHz.
      MIPS: CI20: Add second percpu timer for SMP.

 .../devicetree/bindings/clock/ingenic,cgu.yaml     |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/mips/Kconfig                                  |   7 +-
 arch/mips/Kconfig.debug                            |   8 ++
 arch/mips/boot/compressed/uart-16550.c             |   4 +-
 arch/mips/boot/dts/ingenic/ci20.dts                |  24 +++--
 arch/mips/boot/dts/ingenic/gcw0.dts                |   5 +-
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  10 +-
 arch/mips/boot/dts/ingenic/rs90.dts                |  14 +++
 arch/mips/boot/dts/ingenic/x1000.dtsi              |   7 ++
 arch/mips/boot/dts/ingenic/x1830.dtsi              |  16 ++-
 arch/mips/boot/dts/loongson/Makefile               |   2 +-
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi |  18 ++--
 .../boot/dts/loongson/loongson64g-package.dtsi     |   4 +-
 .../boot/dts/loongson/loongson64v_4core_virtio.dts |   2 +-
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi          |   2 +-
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi        |   2 +-
 arch/mips/boot/dts/mti/sead3.dts                   |   2 +-
 arch/mips/boot/dts/qca/Makefile                    |   1 +
 arch/mips/boot/dts/qca/ar9331.dtsi                 |   2 +
 .../dts/qca/ar9331_openembed_som9331_board.dts     | 110 +++++++++++++++++++++
 arch/mips/cavium-octeon/octeon-usb.c               |   9 +-
 arch/mips/configs/loongson3_defconfig              |  12 +--
 arch/mips/include/asm/cpu-features.h               |   4 +-
 arch/mips/include/asm/highmem.h                    |   2 +-
 arch/mips/include/asm/hugetlb.h                    |   8 +-
 arch/mips/include/asm/mipsregs.h                   |   8 +-
 arch/mips/include/asm/pgalloc.h                    |  10 +-
 arch/mips/include/asm/unistd.h                     |   4 +
 arch/mips/ingenic/Kconfig                          |   2 +
 arch/mips/kernel/cpu-probe.c                       |   5 +
 arch/mips/kernel/syscalls/Makefile                 |  34 +------
 arch/mips/kernel/syscalls/syscallnr.sh             |   2 -
 arch/mips/kvm/tlb.c                                |   3 +-
 arch/mips/loongson64/env.c                         |   3 +-
 arch/mips/loongson64/numa.c                        |   3 +
 arch/mips/loongson64/reset.c                       |   5 +-
 arch/mips/loongson64/smp.c                         |  10 +-
 arch/mips/mm/dma-noncoherent.c                     |   1 +
 39 files changed, 254 insertions(+), 115 deletions(-)
 create mode 100644 arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dts

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
