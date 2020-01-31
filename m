Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF41414F1B0
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2020 18:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgAaRzc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jan 2020 12:55:32 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45053 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgAaRzc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jan 2020 12:55:32 -0500
Received: by mail-pf1-f196.google.com with SMTP id y5so3690766pfb.11;
        Fri, 31 Jan 2020 09:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=YXMF48QwxE7yPKrRoPO1EdfnrflIwtNUuaOPFM5QyVE=;
        b=tX17mlzF3QwuLjf4/I0bw4TdW/YlnmbIHe7K4w5KAlCPkIadR/XS58vceG/lW6ll4M
         5ZCvJiCQ0j0xC1SiJH8g5noBgJfDmR4CQ+QJkvltlSRVv0IoHxxjAV6Oi40YUksV2NSY
         lavD8KE/xDfvCeS3cRI66aI35reLi+QgIbPUAY6yw9EQD8vZiUfvvO6lUTEDgUsjpb2Q
         UsR2Ytlik0lcZ+/RYY/SB/eGGQAL/5qvbXn/gQUeFHusBhydLwbiZfAFyC7yTtbAPjR2
         W5FwSBuBih9iFlboZWBI1xTaQ7Otwakp5t4gt9MWrQEFutPj8j6SDdA4IRtr2Xe7ckw7
         8zzg==
X-Gm-Message-State: APjAAAVS6qQAHYJgWVhd2DSVM5caLMQxYyk607hCwVzUWTWoHZVsvkkF
        j3AsMP8L8CynpRShaphAJSA=
X-Google-Smtp-Source: APXvYqysx7Cz+J5lQIaRo2e3DVo6R7Y7y2wl8cvbWyC1THec5nAXnrtMDskRp8AmuLY86c5fuJOH1g==
X-Received: by 2002:a63:5fca:: with SMTP id t193mr11620973pgb.28.1580493330762;
        Fri, 31 Jan 2020 09:55:30 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id h3sm11635709pfr.15.2020.01.31.09.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 09:55:29 -0800 (PST)
Date:   Fri, 31 Jan 2020 09:55:28 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [GIT PULL] MIPS changes
Message-ID: <20200131175528.m7t6bpd74cuknyht@pburton-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o5tdrcmegv4t2aie"
Content-Disposition: inline
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--o5tdrcmegv4t2aie
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Here are the main MIPS changes for 5.6. My apologies that they're coming
at the end of the week rather than the start, but there's nothing too
big or scary in here. Please pull.

There's one minor conflict with current master, in the DT
vendor-prefixes.yaml file. The correct resolution is of course to keep
both additions:

diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1bc7b3c4b591,31b364107e60..7fcd48adc276
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@@ -1082,8 -1062,8 +1084,10 @@@ patternProperties
      description: Xilinx
    "^xunlong,.*":
      description: Shenzhen Xunlong Software CO.,Limited
 +  "^xylon,.*":
 +    description: Xylon
+   "^yna,.*":
+     description: YSH & ATIL
    "^yones-toptech,.*":
      description: Yones Toptech Co., Ltd.
    "^ysoft,.*":

Thanks,
    Paul


The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.6

for you to fetch changes up to 2c4288719806ca0b3de1b742ada26b25a60d6a45:

  MIPS: PCI: Add detection of IOC3 on IO7, IO8, IO9 and Fuel (2020-01-24 11=
:37:45 -0800)

----------------------------------------------------------------
The main MIPS changes for 5.6:

- Support mremap() for the VDSO, primarily to allow CRIU to restore the
  VDSO to its checkpointed location.

- Restore the MIPS32 cBPF JIT, after having reverted the enablement of
  the eBPF JIT for MIPS32 systems in the 5.5 cycle.

- Improve cop0 counter synchronization behaviour whilst onlining CPUs by
  running with interrupts disabled.

- Better match FPU behaviour when emulating multiply-accumulate
  instructions on pre-r6 systems that implement IEEE754-2008 style MACs.

- Loongson64 kernels now build using the MIPS64r2 ISA, allowing them to
  take advantage of instructions introduced by r2.

- Support for the Ingenic X1000 SoC & the really nice little CU Neo
  development board that's using it.

- Support for WMAC on GARDENA Smart Gateway devices.

- Lots of cleanup & refactoring of SGI IP27 (Origin 2*) support in
  preparation for introducing IP35 (Origin 3*) support.

- Various Kconfig & Makefile cleanups.

----------------------------------------------------------------
Alexander Lobakin (8):
      MIPS: fix indentation of the 'RELOCS' message
      MIPS: boot: fix typo in 'vmlinux.lzma.its' target
      MIPS: syscalls: fix indentation of the 'SYSNR' message
      MIPS: don't explicitly select LIBFDT in Kconfig
      MIPS: generic: don't unconditionally select PINCTRL
      MIPS: make CPU_HAS_LOAD_STORE_LR opt-out
      MIPS: sort MIPS and MIPS_GENERIC Kconfig selects alphabetically (agai=
n)
      Revert "MIPS: Add custom serial.h with BASE_BAUD override for generic=
 kernel"

Colin Ian King (1):
      MIPS: OCTEON: octeon-irq: fix spelling mistake "to" -> "too"

Geert Uytterhoeven (2):
      MIPS: ip22-gio: Make gio_match_device() static
      tc: Make tc_match_device() static

Guoyun Sun (1):
      mips/vdso: Support mremap() for vDSO

James Hogan (1):
      MAINTAINERS: Drop James Hogan as MIPS maintainer

Jiaxun Yang (6):
      dt-bindings: Document loongson vendor-prefix
      MIPS: Add MAC2008 Support
      MIPS: Loongson64: Select mac2008 only feature
      MIPS: Make DIEI support as a config option
      MIPS: Loongson64: Bump ISA level to MIPSR2
      MIPS: Loongson64: Disable exec hazard

Julia Lawall (1):
      MIPS: use resource_size

Kees Cook (1):
      MIPS: BPF: Use sizeof_field() instead of FIELD_SIZEOF()

Mao Wenan (1):
      MIPS: Loongson2ef: drop pointless static qualifier in loongson_suspen=
d_enter()

Paul Burton (1):
      MIPS: BPF: Restore MIPS32 cBPF JIT

Reto Schneider (3):
      MIPS: ralink: dts: mt7628a.dtsi: Add WMAC DT node
      MIPS: ralink: dts: gardena_smart_gateway_mt7688: Enable WMAC
      MIPS: ralink: dts: gardena_smart_gateway_mt7688: Limit UART1

Sergey Korolev (1):
      MIPS: sync-r4k: do slave counter synchronization with disabled HW int=
errupts

Thomas Bogendoerfer (22):
      MIPS: SGI-IP27: Fix node_distance
      MIPS: Loongson64: Fix node_distance()
      MIPS: mm: Place per_cpu on different nodes, if NUMA is enabled
      MIPS: SGI-IP27: use nodemask instead of cpumask
      MIPS: SGI-IP27: use cpu physid already present while scanning for CPUs
      MIPS: SGI-IP27: use asm/sn/agent.h for including HUB related stuff
      MIPS: SGI-IP27: get rid of asm/sn/sn0/ip27.h
      MIPS: SGI-IP27: move IP27 specific macro to IP27 specific header file
      MIPS: SGI-IP27: Move get_nasid() to a IP27 specific file
      MIPS: SGI-IP27: Split kldir.h into generic SN and IP27 parts
      MIPS: SGI-IP27: Use union instead of typedef
      MIPS: SGI-IP27: Use structs for decoding error status registers
      MIPS: SGI-IP27: Use specific get_region_shift
      MIPS: SGI-IP27: Move all shared IP27 declarations to ip27-common.h
      MIPS: SGI-IP27: Only reserve interrupts used in Linux
      MIPS: SGI-IP27: Store cpu speed when scanning for CPUs and use it lat=
er
      MIPS: SGI-IP27: No need for slice_map
      MIPS: PCI: Support mapping of INTB/C/D for pci-xtalk-bridge
      MIPS: SGI-IP27: fix readb/writeb addressing
      mfd: ioc3: Add driver for SGI IOC3 chip
      MIPS: SGI-IP30: Check for valid pointer before using it
      MIPS: PCI: Add detection of IOC3 on IO7, IO8, IO9 and Fuel

Tiezhu Yang (1):
      MIPS: Loongson: Fix potential NULL dereference in loongson3_platform_=
init()

Wang Xuerui (1):
      MIPS: asm: local: add barriers for Loongson

Yangtao Li (1):
      soc: lantiq: convert to devm_platform_ioremap_resource

yu kuai (1):
      MIPS: ralink: add missing put_device in ill_acc_of_setup

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (7):
      MIPS: Ingenic: Add Ingenic X1000 support.
      dt-bindings: Document yna vendor-prefix.
      dt-bindings: MIPS: Add Ingenic XBurst based boards.
      MIPS: Ingenic: Add YSH & ATIL CU Neo board support.
      MIPS: X1830: Add X1830 system type.
      MIPS: Ingenic: Add missing nodes for X1000 and CU1000-Neo.
      MIPS: CU1000-Neo: Refresh defconfig to support HWMON and WiFi.

 .../devicetree/bindings/mips/ingenic/devices.yaml  |   35 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 MAINTAINERS                                        |    1 -
 arch/mips/Kconfig                                  |   84 +-
 arch/mips/Makefile.postlink                        |    2 +-
 arch/mips/boot/Makefile                            |    2 +-
 arch/mips/boot/dts/ingenic/Makefile                |    1 +
 arch/mips/boot/dts/ingenic/cu1000-neo.dts          |  170 +++
 arch/mips/boot/dts/ingenic/x1000.dtsi              |  317 +++++
 .../dts/ralink/gardena_smart_gateway_mt7688.dts    |    8 +
 arch/mips/boot/dts/ralink/mt7628a.dtsi             |   10 +
 arch/mips/cavium-octeon/octeon-irq.c               |    2 +-
 arch/mips/configs/cu1000-neo_defconfig             |  117 ++
 arch/mips/configs/generic/board-ocelot.config      |    1 +
 arch/mips/include/asm/Kbuild                       |    1 +
 arch/mips/include/asm/bootinfo.h                   |    1 +
 arch/mips/include/asm/cpu-features.h               |    4 +
 arch/mips/include/asm/cpu.h                        |    6 +-
 arch/mips/include/asm/gio_device.h                 |    2 -
 arch/mips/include/asm/hazards.h                    |    4 +-
 arch/mips/include/asm/irqflags.h                   |    6 +-
 arch/mips/include/asm/local.h                      |    4 +
 .../mips/include/asm/mach-ip27/kernel-entry-init.h |   12 +-
 arch/mips/include/asm/mach-ip27/mangle-port.h      |    4 +-
 arch/mips/include/asm/mach-ip27/mmzone.h           |    4 +-
 arch/mips/include/asm/mach-ip27/topology.h         |    2 +-
 .../asm/mach-loongson64/cpu-feature-overrides.h    |    2 +
 arch/mips/include/asm/mipsregs.h                   |    3 +
 arch/mips/include/asm/pci/bridge.h                 |    3 +-
 arch/mips/include/asm/serial.h                     |   18 -
 arch/mips/include/asm/sn/arch.h                    |    3 -
 arch/mips/include/asm/sn/hub.h                     |   17 -
 arch/mips/include/asm/sn/intr.h                    |   17 -
 arch/mips/include/asm/sn/ioc3.h                    |   42 +-
 arch/mips/include/asm/sn/klconfig.h                |    4 -
 arch/mips/include/asm/sn/kldir.h                   |  193 +--
 arch/mips/include/asm/sn/sn0/hub.h                 |   22 +
 arch/mips/include/asm/sn/sn0/hubni.h               |    8 +
 arch/mips/include/asm/sn/sn0/ip27.h                |   85 --
 arch/mips/include/asm/sn/sn0/kldir.h               |  186 +++
 arch/mips/include/asm/sn/sn_private.h              |   19 -
 arch/mips/include/asm/sn/types.h                   |    4 +
 arch/mips/jz4740/Kconfig                           |   10 +
 arch/mips/jz4740/setup.c                           |    4 +
 arch/mips/kernel/cpu-probe.c                       |   81 +-
 arch/mips/kernel/setup.c                           |    6 +-
 arch/mips/kernel/sync-r4k.c                        |    5 +
 arch/mips/kernel/syscalls/Makefile                 |    2 +-
 arch/mips/kernel/unaligned.c                       |   36 +-
 arch/mips/lib/memcpy.S                             |   14 +-
 arch/mips/lib/memset.S                             |   16 +-
 arch/mips/lib/mips-atomic.c                        |    4 +-
 arch/mips/loongson2ef/common/pm.c                  |    2 +-
 arch/mips/loongson64/numa.c                        |    2 +-
 arch/mips/loongson64/platform.c                    |    3 +
 arch/mips/math-emu/cp1emu.c                        |   38 +-
 arch/mips/math-emu/dp_maddf.c                      |   53 +-
 arch/mips/math-emu/ieee754.h                       |   16 +
 arch/mips/math-emu/ieee754int.h                    |    1 +
 arch/mips/math-emu/sp_maddf.c                      |   53 +-
 arch/mips/mm/init.c                                |   45 +
 arch/mips/net/Makefile                             |    1 +
 arch/mips/net/bpf_jit.c                            | 1270 ++++++++++++++++=
++++
 arch/mips/net/bpf_jit_asm.S                        |  285 +++++
 arch/mips/pci/pci-ip27.c                           |    2 +-
 arch/mips/pci/pci-xtalk-bridge.c                   |   52 +-
 arch/mips/ralink/ill_acc.c                         |    2 +
 arch/mips/sgi-ip22/ip22-gio.c                      |    6 +-
 arch/mips/sgi-ip27/ip27-berr.c                     |   40 +-
 arch/mips/sgi-ip27/ip27-common.h                   |   12 +-
 arch/mips/sgi-ip27/ip27-console.c                  |    5 +-
 arch/mips/sgi-ip27/ip27-hubio.c                    |    8 +-
 arch/mips/sgi-ip27/ip27-init.c                     |   25 +-
 arch/mips/sgi-ip27/ip27-irq.c                      |    5 +-
 arch/mips/sgi-ip27/ip27-klconfig.c                 |   51 -
 arch/mips/sgi-ip27/ip27-klnuma.c                   |   16 +-
 arch/mips/sgi-ip27/ip27-memory.c                   |   57 +-
 arch/mips/sgi-ip27/ip27-nmi.c                      |    5 +-
 arch/mips/sgi-ip27/ip27-reset.c                    |    2 +-
 arch/mips/sgi-ip27/ip27-smp.c                      |   33 +-
 arch/mips/sgi-ip27/ip27-timer.c                    |   48 +-
 arch/mips/sgi-ip27/ip27-xtalk.c                    |    1 -
 arch/mips/sgi-ip30/ip30-irq.c                      |    5 +-
 arch/mips/vdso/genvdso.c                           |   13 +
 drivers/mfd/Kconfig                                |   13 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/ioc3.c                                 |  669 +++++++++++
 drivers/net/ethernet/sgi/Kconfig                   |    5 +-
 drivers/net/ethernet/sgi/ioc3-eth.c                |  544 ++-------
 drivers/rtc/rtc-m48t35.c                           |   11 +
 drivers/soc/lantiq/fpi-bus.c                       |    4 +-
 drivers/tc/tc-driver.c                             |    5 +-
 drivers/tty/serial/8250/8250_ioc3.c                |   98 ++
 drivers/tty/serial/8250/Kconfig                    |   11 +
 drivers/tty/serial/8250/Makefile                   |    1 +
 95 files changed, 3888 insertions(+), 1239 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/ingenic/devices.=
yaml
 create mode 100644 arch/mips/boot/dts/ingenic/cu1000-neo.dts
 create mode 100644 arch/mips/boot/dts/ingenic/x1000.dtsi
 create mode 100644 arch/mips/configs/cu1000-neo_defconfig
 delete mode 100644 arch/mips/include/asm/serial.h
 delete mode 100644 arch/mips/include/asm/sn/hub.h
 delete mode 100644 arch/mips/include/asm/sn/sn0/ip27.h
 create mode 100644 arch/mips/include/asm/sn/sn0/kldir.h
 delete mode 100644 arch/mips/include/asm/sn/sn_private.h
 create mode 100644 arch/mips/net/bpf_jit.c
 create mode 100644 arch/mips/net/bpf_jit_asm.S
 create mode 100644 drivers/mfd/ioc3.c
 create mode 100644 drivers/tty/serial/8250/8250_ioc3.c


--o5tdrcmegv4t2aie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXjRqEAAKCRA+p5+stXUA
3SHjAP9G4edGzwJBzbxyry8yd1d+uKT/LTDr2Avuq7mr5WwLjwD+JbeqZ8rcJu/R
N7fMS3oGX8F8DgRsMzd6rn/DlX4c3gE=
=zgXc
-----END PGP SIGNATURE-----

--o5tdrcmegv4t2aie--
