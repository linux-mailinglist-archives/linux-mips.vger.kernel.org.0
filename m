Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCE8CB9FEF
	for <lists+linux-mips@lfdr.de>; Sun, 22 Sep 2019 01:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfIUXKl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Sep 2019 19:10:41 -0400
Received: from mail-eopbgr720097.outbound.protection.outlook.com ([40.107.72.97]:11536
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726760AbfIUXKk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 21 Sep 2019 19:10:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ts3mAW1G+E+H54XP/FkXKgYdynxfAzraLf/VJg4XG9xuE5Aq/FwuLOL4nLQqOtLZ1OOARjzECRmvyaqVbFTMV5Ld5cn8MVXosg+wfYngMxbtGQvOHxbCwnhiHYWCU9jJgYiCAZPIME/t8EL1vivCjVxrdC6Bxb5m0COKQjiixtaJORCdxakktirA/ItvPj6sQ9iZBw/ERqD8tN/m6T4dOCvyFQxY77B9tQf00ieMxKOhAUVMD1jhWP8oYNZ1ci2/zNcFhi9uYgye6PHwYS+6x2kWXTeyqYWh2jwn1ild9xggKYloacBR2kLLLJaqJFA4KiHRKL5UTIUr2uOURQkZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma2PkF50iLTt5a4/lAB0dMvuymxflH71RoPOn4E4Wuc=;
 b=h9DQEQ5ZlbVod0n0dfVL+G7q657m7hRXQmwuHjLEnJeIgFdyICbvAuBCxP+AT0fjKvsZbsbIYtyKZrsYjQBkfWAw8771DLYAWic/7K92KXSywB7F/U08Q4CfRGin4jD3/JdrkbOLP2TSS9xcvvZXui3dztArXSFwHHFqHQRYZzH8Ss9C38GWCPtkn2kOIZdFnOy7UPraywNWZXrybjBma636MrtLsM6/ClA+fRAzDf7QdzkulvLu+VrtC3FD+BrVCiHraUAQbE9QBSSa34ixOHkMyDTYDVf4tF7DCpGmdRZnes6PT9CWcuTVhDATGpoxe9qjiW4+lRG45wUjUcpFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma2PkF50iLTt5a4/lAB0dMvuymxflH71RoPOn4E4Wuc=;
 b=sa1goZNyefLdeHDNWS2rwwvzMnPpiVcj5bqpxIwleyhO/sdzXsGzy8bOkQRHnZBsaQCZ1fyAhoFa0BoBcq9RfDtvpj3B56t9YRzfkyr9KhV/uMHrxCqq9uwWigIH8mXUdcuh2IHPj97oA1fmTeEEnSUdvSsj9d0wSFOupmWeOvY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1200.namprd22.prod.outlook.com (10.174.169.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Sat, 21 Sep 2019 23:10:30 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2284.009; Sat, 21 Sep
 2019 23:10:24 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: [GIT PULL] MIPS changes
Thread-Topic: [GIT PULL] MIPS changes
Thread-Index: AQHVcNG/aPrQthixek+Bc74k1+lS1A==
Date:   Sat, 21 Sep 2019 23:10:24 +0000
Message-ID: <20190921231022.kawfomtmka737arq@pburton-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fd6e11e-3401-4f15-07b8-08d73ee8e207
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);SRVR:MWHPR2201MB1200;
x-ms-traffictypediagnostic: MWHPR2201MB1200:
x-microsoft-antispam-prvs: <MWHPR2201MB120082BE638878EA05A94F7CC18B0@MWHPR2201MB1200.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0167DB5752
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(366004)(376002)(346002)(136003)(189003)(199004)(6486002)(6436002)(186003)(42882007)(81166006)(476003)(71200400001)(386003)(256004)(25786009)(14444005)(8936002)(5660300002)(2906002)(7736002)(66556008)(66476007)(99936001)(54906003)(64756008)(66616009)(8676002)(81156014)(71190400001)(305945005)(44832011)(6916009)(30864003)(52116002)(14454004)(66946007)(66446008)(99286004)(486006)(33716001)(58126008)(9686003)(6116002)(102836004)(4326008)(508600001)(46003)(6506007)(1076003)(6512007);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1200;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +XQSyOVYmLIuSHoPa1XHvtWzsk5Jq81MI57UTI3DtzwtBthmWWcSjAEEgNOrB+pJztipG9AE9ZmPZr1jjf1O7J0d3Ohc3I6gLuDzfdIfinvP5SRHUmy5FOFCDy20wJy3ZE7C/iTPfRFiwc6k58Xnoj3CM3o30j0Co6EKNPXa1jHD8iXDiFzQbHiMZjF7WwLMpz6dZVrK0wbUFvkLT/onMQsAiFFIQy0DUw3IH2lXXgDuS5O7c1AB8pDqptsSEfw8NiH7w5MeA/7rvYYflQNlmtCblwi5JWwT9CenuUm3WvnJR0DDYXs/BXe1kEZ1UupQF32y5Nipvj7HJl5w1SRIOJg9wskkrY3DBAZgK0du5yXf/2/YkTw7PKhmnfr6XpxBgojXFQIpCQM+FFftULtz6c7BX6LurJWvUWiqAlBm/PM=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eqg4wsr35upu7sev"
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd6e11e-3401-4f15-07b8-08d73ee8e207
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2019 23:10:24.4529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: srQIqMgGE2Wx1C8qAa8Rzovs32fa3neCzVY5xZ+v4LPMAVkGMMorRD/myOMa9TBi/Q5+XVzb535kiMIkiL22fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1200
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--eqg4wsr35upu7sev
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Here are the main MIPS changes for v5.4; please pull.

My apologies that this is arriving at the end of the week; a combination
of travel & discovering a MIPS32 page table handling issue later than
would have been ideal delayed things.

There are a number of minor merge conflicts with current master, my
suggested resolutions are as follows:

diff --cc Documentation/mips/index.rst
index fd9023c8a89f,321b4794f3b8..3616fb872af3
--- a/Documentation/mips/index.rst
+++ b/Documentation/mips/index.rst
@@@ -1,17 -1,11 +1,18 @@@
  .. SPDX-License-Identifier: GPL-2.0
 =20
 -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
 -MIPS-specific Documentation
 -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 +MIPS architecture
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
  .. toctree::
 -   :maxdepth: 1
 -   :numbered:
 +   :maxdepth: 2
 =20
 +   au1xxx_ide
+    ingenic-tcu
 +
 +.. only::  subproject and html
 +
 +   Indices
 +   =3D=3D=3D=3D=3D=3D=3D
 +
 +   * :ref:`genindex`
diff --cc arch/mips/Kconfig
index 904c096fa4da,2f7c050e8cde..cc8e2b1032a5
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@@ -43,8 -44,7 +44,8 @@@ config MIP
        select HAVE_ARCH_MMAP_RND_COMPAT_BITS if MMU && COMPAT
        select HAVE_ARCH_SECCOMP_FILTER
        select HAVE_ARCH_TRACEHOOK
-       select HAVE_ARCH_TRANSPARENT_HUGEPAGE if CPU_SUPPORTS_HUGEPAGES && =
64BIT
+       select HAVE_ARCH_TRANSPARENT_HUGEPAGE if CPU_SUPPORTS_HUGEPAGES
 +      select HAVE_ASM_MODVERSIONS
        select HAVE_EBPF_JIT if (!CPU_MICROMIPS)
        select HAVE_CONTEXT_TRACKING
        select HAVE_COPY_THREAD_TLS
diff --cc drivers/video/fbdev/Makefile
index aab7155884ea,49502d6256cb..aa6352798cf4
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@@ -116,7 -116,7 +116,6 @@@ obj-y                             +=3D om
  obj-$(CONFIG_XEN_FBDEV_FRONTEND)  +=3D xen-fbfront.o
  obj-$(CONFIG_FB_CARMINE)          +=3D carminefb.o
  obj-$(CONFIG_FB_MB862XX)        +=3D mb862xx/
- obj-$(CONFIG_FB_JZ4740)                 +=3D jz4740_fb.o
 -obj-$(CONFIG_FB_NUC900)           +=3D nuc900fb.o
  obj-$(CONFIG_FB_PUV3_UNIGFX)      +=3D fb-puv3.o
  obj-$(CONFIG_FB_HYPERV)                 +=3D hyperv_fb.o
  obj-$(CONFIG_FB_OPENCORES)      +=3D ocfb.o

Thanks,
    Paul


The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.4

for you to fetch changes up to 05d013a0366d50f4f0dbebf8c1b22b42020bf49a:

  MIPS: Detect bad _PFN_SHIFT values (2019-09-20 14:55:07 -0700)

----------------------------------------------------------------
Main MIPS changes for v5.4:

- boot_mem_map is removed, providing a nice cleanup made possible by the
  recent removal of bootmem.

- Some fixes to atomics, in general providing compiler barriers for
  smp_mb__{before,after}_atomic plus fixes specific to Loongson CPUs or
  MIPS32 systems using cmpxchg64().

- Conversion to the new generic VDSO infrastructure courtesy of Vincenzo
  Frascino.

- Removal of undefined behavior in set_io_port_base(), fixing the
  behavior of some MIPS kernel configurations when built with recent
  clang versions.

- Initial MIPS32 huge page support, functional on at least Ingenic SoCs.

- pte_special() is now supported for some configurations, allowing among
  other things generic fast GUP to be used.

- Miscellaneous fixes & cleanups.

And platform specific changes:

- Major improvements to Ingenic SoC support from Paul Cercueil, mostly
  enabled by the inclusion of the new TCU (timer-counter unit) drivers
  he's spent a very patient year or so working on. Plus some fixes for
  X1000 SoCs from Zhou Yanjie.

- Netgear R6200 v1 systems are now supported by the bcm47xx platform.

- DT updates for BMIPS, Lantiq & Microsemi Ocelot systems.

----------------------------------------------------------------
Antoine Tenart (2):
      MIPS: dts: mscc: describe the PTP register range
      MIPS: dts: mscc: describe the PTP ready interrupt

Arnd Bergmann (1):
      mips: fix vdso32 build, again

Christoph Hellwig (1):
      mips: remove ioremap_cachable

Christophe JAILLET (1):
      MIPS: Octeon: Fix a typo in #define OCTOEN_SERIAL_LEN

Daniel Silsby (5):
      MIPS: Disallow CPU_SUPPORTS_HUGEPAGES for XPA,EVA
      MIPS: Add partial 32-bit huge page support
      MIPS: Decouple CPU_SUPPORTS_HUGEPAGES from 64BIT
      MIPS: ingenic: Add support for huge pages
      MIPS: Undefine PMD_ORDER for 32-bit builds

Dmitry Korotin (1):
      MIPS: pte_special()/pte_mkspecial() support

Edward Matijevi=C4=87 (1):
      MIPS: BCM47XX: Add support for Netgear R6200 V1

Fabian Mewes (1):
      MIPS: Kconfig: remove HAVE_LATENCYTOP_SUPPORT

Firoz Khan (1):
      mips: remove nargs from __SYSCALL

Florian Fainelli (2):
      firmware: bcm47xx_nvram: Correct size_t printf format
      firmware: bcm47xx_nvram: Allow COMPILE_TEST

Hauke Mehrtens (1):
      MIPS: ralink: deactivate PCI support for SOC_MT7621

Jiaxun Yang (9):
      MIPS: OCTEON: Drop boot_mem_map
      MIPS: fw: Record prom memory
      MIPS: malta: Drop prom_free_prom_memory
      MIPS: msp: Record prom memory
      MIPS: ip22: Drop addr_is_ram
      MIPS: xlp: Drop boot_mem_map
      MIPS: mm: Drop boot_mem_map
      MIPS: init: Drop boot_mem_map
      MIPS: Treat Loongson Extensions as ASEs

Jonas Gorski (1):
      MIPS: BMIPS: add clock controller nodes

Martin Blumenstingl (1):
      MIPS: lantiq: update the clock alias' for the mainline PCIe PHY driver

Nathan Chancellor (3):
      MIPS: Don't use bc_false uninitialized in __mm_isBranchInstr
      MIPS/ptrace: Update mips_get_syscall_arg's return type
      MIPS: tlbex: Explicitly cast _PAGE_NO_EXEC to a boolean

Nick Desaulniers (1):
      mips: avoid explicit UB in assignment of mips_io_port_base

Paul Burton (15):
      MIPS: Remove unused R4300 CPU support
      MIPS: Remove unused R5432 CPU support
      MIPS: Remove unused R5432_CP0_INTERRUPT_WAR
      MIPS: Remove unused R8000 CPU support
      MIPS: octeon: Remove cpu_has_saa
      MIPS: octeon: Remove ARCH_HAS_IRQ_PER_CPU
      Merge branch 'ingenic-tcu-v5.4' into mips-next
      MIPS: mm: Fix highmem compile
      MIPS: Fix build with CONFIG_PROC_VMCORE=3Dy
      MIPS: Select R3k-style TLB in Kconfig
      MIPS: tlbex: Simplify r3k check
      MIPS: tlbex: Remove cpu_has_local_ebase
      MIPS: Drop Loongson _CACHE_* definitions
      MIPS: Disable pte_special() for MIPS32 with RiXi
      MIPS: Detect bad _PFN_SHIFT values

Paul Cercueil (27):
      MIPS: Rename JZRISC to XBURST
      MIPS: Decode config3 register on Ingenic SoCs
      MIPS: DTS: jz4740: Add node for the MMC driver
      MIPS: qi_lb60: Move MMC configuration to devicetree
      MIPS: DTS: jz4740: Add missing nodes
      MIPS: qi_lb60: Migrate to devicetree
      MIPS: configs: LB60: update defconfig
      ASoC: jz4740: Drop lb60 board code
      video/fbdev: Drop JZ4740 driver
      dma: Drop JZ4740 driver
      mtd: rawnand: Drop obsolete JZ4740 NAND driver
      power/supply: Drop obsolete JZ4740 driver
      hwmon: Drop obsolete JZ4740 driver
      MIPS: jz4740: Drop dead code
      dt-bindings: ingenic: Add DT bindings for TCU clocks
      doc: Add doc for the Ingenic TCU hardware
      dt-bindings: Add doc for the Ingenic TCU drivers
      mfd/syscon: Add device_node_to_regmap()
      clk: ingenic: Add driver for the TCU clocks
      irqchip: Add irq-ingenic-tcu driver
      clocksource: Add a new timer-ingenic driver
      clk: jz4740: Add TCU clock
      MIPS: jz4740: Add DTS nodes for the TCU drivers
      MIPS: qi_lb60: Reduce system timer and clocksource to 750 kHz
      MIPS: CI20: Reduce system timer and clocksource to 3 MHz
      MIPS: GCW0: Reduce system timer and clocksource to 750 kHz
      MIPS: jz4740: Drop obsolete code

Peter Zijlstra (3):
      mips/atomic: Fix cmpxchg64 barriers
      mips/atomic: Fix loongson_llsc_mb() wreckage
      mips/atomic: Fix smp_mb__{before,after}_atomic()

Stephen Boyd (1):
      MIPS: Remove dev_err() usage after platform_get_irq()

Thomas Bogendoerfer (1):
      MIPS: PCI: refactor ioc3 special handling

Vincenzo Frascino (6):
      mips: Add support for generic vDSO
      mips: Add clock_getres entry point
      mips: Add clock_gettime64 entry point
      mips: vdso: Fix source path
      mips: vdso: Fix flip/flop vdso building bug
      mips: compat: vdso: Use legacy syscalls as fallback

YueHaibing (2):
      irqchip/irq-ingenic-tcu: Fix COMPILE_TEST building
      MIPS: Octeon: remove duplicated include from dma-octeon.c

Zhou Yanjie (3):
      MIPS: X1000: Add X1000 system type.
      MIPS: Ingenic: Fix bugs when detecting X1000's L2 cache.
      MIPS: Ingenic: Disable broken BTB lookup optimization.

 .../devicetree/bindings/pwm/ingenic,jz47xx-pwm.txt |  22 -
 .../devicetree/bindings/timer/ingenic,tcu.txt      | 137 ++++
 .../bindings/watchdog/ingenic,jz4740-wdt.txt       |  17 -
 Documentation/index.rst                            |   1 +
 Documentation/mips/index.rst                       |  11 +
 Documentation/mips/ingenic-tcu.rst                 |  71 +++
 arch/mips/Kconfig                                  |  65 +-
 arch/mips/Makefile                                 |   4 -
 arch/mips/bcm47xx/board.c                          |   1 +
 arch/mips/bcm47xx/buttons.c                        |  10 +
 arch/mips/boot/dts/brcm/bcm3368.dtsi               |  12 +-
 arch/mips/boot/dts/brcm/bcm63268.dtsi              |  12 +-
 arch/mips/boot/dts/brcm/bcm6328.dtsi               |   6 +
 arch/mips/boot/dts/brcm/bcm6358.dtsi               |  12 +-
 arch/mips/boot/dts/brcm/bcm6362.dtsi               |  12 +-
 arch/mips/boot/dts/brcm/bcm6368.dtsi               |  12 +-
 arch/mips/boot/dts/ingenic/ci20.dts                |   7 +
 arch/mips/boot/dts/ingenic/gcw0.dts                |  10 +
 arch/mips/boot/dts/ingenic/jz4740.dtsi             | 127 +++-
 arch/mips/boot/dts/ingenic/jz4770.dtsi             |  21 +
 arch/mips/boot/dts/ingenic/jz4780.dtsi             |  23 +
 arch/mips/boot/dts/ingenic/qi_lb60.dts             | 325 ++++++++++
 arch/mips/boot/dts/mscc/ocelot.dtsi                |   7 +-
 arch/mips/cavium-octeon/dma-octeon.c               |  16 +-
 arch/mips/cavium-octeon/setup.c                    |   3 +-
 arch/mips/configs/qi_lb60_defconfig                |  44 +-
 arch/mips/fw/arc/memory.c                          |  24 +-
 arch/mips/include/asm/addrspace.h                  |   9 -
 arch/mips/include/asm/atomic.h                     |  19 +-
 arch/mips/include/asm/barrier.h                    |  44 +-
 arch/mips/include/asm/bitops.h                     |  47 +-
 arch/mips/include/asm/bootinfo.h                   |  17 +-
 arch/mips/include/asm/cmpxchg.h                    |  18 +-
 arch/mips/include/asm/cpu-features.h               |  19 +-
 arch/mips/include/asm/cpu-type.h                   |  15 +-
 arch/mips/include/asm/cpu.h                        |  19 +-
 arch/mips/include/asm/io.h                         |  21 +-
 arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h |   1 +
 .../asm/mach-cavium-octeon/cpu-feature-overrides.h |   9 -
 arch/mips/include/asm/mach-cavium-octeon/war.h     |   1 -
 .../include/asm/mach-dec/cpu-feature-overrides.h   |   1 -
 arch/mips/include/asm/mach-generic/war.h           |   1 -
 arch/mips/include/asm/mach-ip22/war.h              |   1 -
 arch/mips/include/asm/mach-ip27/war.h              |   1 -
 arch/mips/include/asm/mach-ip28/war.h              |   1 -
 arch/mips/include/asm/mach-ip32/war.h              |   1 -
 arch/mips/include/asm/mach-jz4740/gpio.h           |  15 -
 arch/mips/include/asm/mach-jz4740/jz4740_fb.h      |  58 --
 arch/mips/include/asm/mach-jz4740/jz4740_mmc.h     |  12 -
 arch/mips/include/asm/mach-jz4740/platform.h       |  26 -
 .../asm/mach-loongson64/cpu-feature-overrides.h    |   1 -
 arch/mips/include/asm/mach-malta/war.h             |   1 -
 arch/mips/include/asm/mach-pmcs-msp71xx/war.h      |   1 -
 arch/mips/include/asm/mach-rc32434/war.h           |   1 -
 arch/mips/include/asm/mach-rm/war.h                |   1 -
 arch/mips/include/asm/mach-sibyte/war.h            |   1 -
 arch/mips/include/asm/mach-tx49xx/war.h            |   1 -
 arch/mips/include/asm/mipsregs.h                   |   4 +
 arch/mips/include/asm/module.h                     |   6 -
 arch/mips/include/asm/octeon/octeon.h              |   4 +-
 arch/mips/include/asm/pgtable-32.h                 |  62 +-
 arch/mips/include/asm/pgtable-bits.h               |  34 +-
 arch/mips/include/asm/pgtable.h                    |  20 +-
 arch/mips/include/asm/syscall.h                    |  21 +-
 arch/mips/include/asm/vdso.h                       |  78 +--
 arch/mips/include/asm/vdso/gettimeofday.h          | 222 +++++++
 arch/mips/{ =3D> include/asm}/vdso/vdso.h            |  16 +-
 arch/mips/include/asm/vdso/vsyscall.h              |  43 ++
 arch/mips/include/asm/war.h                        |  13 -
 arch/mips/jz4740/Makefile                          |   7 +-
 arch/mips/jz4740/board-qi_lb60.c                   | 523 ----------------
 arch/mips/jz4740/platform.c                        | 250 --------
 arch/mips/jz4740/prom.c                            |   5 -
 arch/mips/jz4740/setup.c                           |   7 +-
 arch/mips/jz4740/time.c                            | 151 +----
 arch/mips/kernel/branch.c                          |   2 +-
 arch/mips/kernel/cpu-probe.c                       |  53 +-
 arch/mips/kernel/genex.S                           |   3 -
 arch/mips/kernel/idle.c                            |   3 +-
 arch/mips/kernel/proc.c                            |   4 +
 arch/mips/kernel/scall32-o32.S                     |   2 +-
 arch/mips/kernel/scall64-n32.S                     |   2 +-
 arch/mips/kernel/scall64-n64.S                     |   2 +-
 arch/mips/kernel/scall64-o32.S                     |   2 +-
 arch/mips/kernel/setup.c                           | 357 +++--------
 arch/mips/kernel/syscall.c                         |   1 +
 arch/mips/kernel/syscalls/syscalltbl.sh            |   4 +-
 arch/mips/kernel/vdso.c                            |  37 +-
 arch/mips/lantiq/xway/sysctrl.c                    |  16 +-
 arch/mips/mm/Makefile                              |   6 +-
 arch/mips/mm/c-r4k.c                               |   2 -
 arch/mips/mm/init.c                                |  98 ++-
 arch/mips/mm/pgtable-32.c                          |  20 +
 arch/mips/mm/sc-mips.c                             |  27 +-
 arch/mips/mm/tlb-r8k.c                             | 239 -------
 arch/mips/mm/tlbex.c                               |  63 +-
 arch/mips/mti-malta/malta-memory.c                 |  11 -
 arch/mips/netlogic/xlp/setup.c                     |  12 +-
 arch/mips/pci/pci-xtalk-bridge.c                   | 167 ++---
 arch/mips/pmcs-msp71xx/msp_prom.c                  |  22 +-
 arch/mips/ralink/Kconfig                           |   1 -
 arch/mips/ralink/timer.c                           |   4 +-
 arch/mips/sgi-ip22/ip28-berr.c                     |  20 +-
 arch/mips/vdso/Makefile                            |  41 +-
 arch/mips/vdso/config-n32-o32-env.c                |  19 +
 arch/mips/vdso/elf.S                               |   2 +-
 arch/mips/vdso/sigreturn.S                         |   2 +-
 arch/mips/vdso/vdso.lds.S                          |   4 +
 arch/mips/vdso/vgettimeofday.c                     |  58 ++
 drivers/clk/ingenic/Kconfig                        |  10 +-
 drivers/clk/ingenic/Makefile                       |   1 +
 drivers/clk/ingenic/jz4740-cgu.c                   |   6 +
 drivers/clk/ingenic/tcu.c                          | 474 ++++++++++++++
 drivers/clocksource/Kconfig                        |  11 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/ingenic-timer.c                | 356 +++++++++++
 drivers/dma/Kconfig                                |   6 -
 drivers/dma/Makefile                               |   1 -
 drivers/dma/dma-jz4740.c                           | 623 -----------------=
--
 drivers/firmware/broadcom/Kconfig                  |   2 +-
 drivers/firmware/broadcom/bcm47xx_nvram.c          |   4 +-
 drivers/hwmon/Kconfig                              |  10 -
 drivers/hwmon/Makefile                             |   1 -
 drivers/hwmon/jz4740-hwmon.c                       | 135 ----
 drivers/irqchip/Kconfig                            |  12 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-ingenic-tcu.c                  | 182 ++++++
 drivers/mfd/syscon.c                               |  46 +-
 drivers/mtd/nand/raw/ingenic/Kconfig               |   7 -
 drivers/mtd/nand/raw/ingenic/Makefile              |   1 -
 drivers/mtd/nand/raw/ingenic/jz4740_nand.c         | 536 ----------------
 drivers/power/supply/Kconfig                       |  11 -
 drivers/power/supply/Makefile                      |   1 -
 drivers/power/supply/jz4740-battery.c              | 421 -------------
 drivers/video/fbdev/Kconfig                        |   9 -
 drivers/video/fbdev/Makefile                       |   1 -
 drivers/video/fbdev/jz4740_fb.c                    | 690 -----------------=
----
 include/dt-bindings/clock/ingenic,tcu.h            |  20 +
 include/dt-bindings/clock/jz4740-cgu.h             |   1 +
 include/linux/mfd/syscon.h                         |   6 +
 sound/soc/jz4740/Kconfig                           |  25 +-
 sound/soc/jz4740/Makefile                          |   5 -
 sound/soc/jz4740/qi_lb60.c                         | 106 ----
 143 files changed, 2921 insertions(+), 4948 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/ingenic,jz47xx-pw=
m.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ingenic,tcu.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ingenic,jz47=
40-wdt.txt
 create mode 100644 Documentation/mips/index.rst
 create mode 100644 Documentation/mips/ingenic-tcu.rst
 delete mode 100644 arch/mips/include/asm/mach-jz4740/gpio.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/jz4740_fb.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/jz4740_mmc.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/platform.h
 create mode 100644 arch/mips/include/asm/vdso/gettimeofday.h
 rename arch/mips/{ =3D> include/asm}/vdso/vdso.h (77%)
 create mode 100644 arch/mips/include/asm/vdso/vsyscall.h
 delete mode 100644 arch/mips/jz4740/board-qi_lb60.c
 delete mode 100644 arch/mips/jz4740/platform.c
 delete mode 100644 arch/mips/mm/tlb-r8k.c
 create mode 100644 arch/mips/vdso/config-n32-o32-env.c
 create mode 100644 arch/mips/vdso/vgettimeofday.c
 create mode 100644 drivers/clk/ingenic/tcu.c
 create mode 100644 drivers/clocksource/ingenic-timer.c
 delete mode 100644 drivers/dma/dma-jz4740.c
 delete mode 100644 drivers/hwmon/jz4740-hwmon.c
 create mode 100644 drivers/irqchip/irq-ingenic-tcu.c
 delete mode 100644 drivers/mtd/nand/raw/ingenic/jz4740_nand.c
 delete mode 100644 drivers/power/supply/jz4740-battery.c
 delete mode 100644 drivers/video/fbdev/jz4740_fb.c
 create mode 100644 include/dt-bindings/clock/ingenic,tcu.h
 delete mode 100644 sound/soc/jz4740/qi_lb60.c

--eqg4wsr35upu7sev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXYat3gAKCRA+p5+stXUA
3RttAP9bEqLbMl3jx1kSHl1cLPwzFbr2y8TCT0VLWTv15sfo5AD/YqoQnQizVtfL
6O6Rjw6dIEsTWqZVLbFgxZ7wzUV2hQs=
=sz/v
-----END PGP SIGNATURE-----

--eqg4wsr35upu7sev--
