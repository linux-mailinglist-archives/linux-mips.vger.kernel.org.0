Return-Path: <linux-mips+bounces-11618-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA5BB954C
	for <lists+linux-mips@lfdr.de>; Sun, 05 Oct 2025 11:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA9CC3B6113
	for <lists+linux-mips@lfdr.de>; Sun,  5 Oct 2025 09:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6517925B67D;
	Sun,  5 Oct 2025 09:56:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8377C2E0;
	Sun,  5 Oct 2025 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759658211; cv=none; b=llIwRcqn97PyvUZ5fe4FTTzh9XvG4n+aHwHglbPqDyo/qA3frrlSMbjr5LArkDRlxCnZJjRn+uB4K3wGeEZGA6fnJ/QcD12C/4dclCemKcUqvHsrV/6L7zNtqsTyS1IFlsSH6ulfbJe63nQ4tWqywClU20gHP9soLwOATLmV76U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759658211; c=relaxed/simple;
	bh=1aqdjJShgFcODSsz0sXm/LeTFS1NvpG9cr7nau/Rqls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0nbvDQSfUvpBjAi4SAbbc5PzDduVJp/jKcU0uS6dZXWNmkxvU1mHNDLnntvFAI/8auoz3fdwFoO4qS+HUvv6iD1PWJqno5k9iCq3Sjpdj8le767SsbUx32+Pu1InUQOnxl5vfY8VKVcxMnekY4QK0/BeIJ5yI6ADRiavYLb6cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1v5L3Z-000065-00; Sun, 05 Oct 2025 11:29:29 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A6FF1C04FD; Sun,  5 Oct 2025 11:29:21 +0200 (CEST)
Date: Sun, 5 Oct 2025 11:29:21 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v6.18
Message-ID: <aOI6ca7yqZGqwTRL@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:

  Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.18

for you to fetch changes up to c662a6fef10aff3b13befc499335a334205316d5:

  mips: math-emu: replace deprecated strcpy() in me-debugfs (2025-09-12 11:56:06 +0200)

----------------------------------------------------------------
- switch longson32 platform to DT and use MIPS_GENERIC framework
- cleanups/fixes for lantiq DTs
- other cleanups and fixes

----------------------------------------------------------------
Aleksander Jan Bajkowski (6):
      dt-bindings: mips: cpu: Add MIPS 34Kc Core
      mips: lantiq: danube: add missing properties to cpu node
      mips: lantiq: danube: add missing device_type in pci node
      mips: lantiq: danube: add model to EASY50712 dts
      mips: lantiq: xway: sysctrl: rename stp clock
      mips: lantiq: danube: rename stp node on EASY50712 reference board

Brian Masney (1):
      MIPS: Alchemy: convert from round_rate() to determine_rate()

Colin Ian King (1):
      mips/octeon/smp: Remove space before newline

Florian Fainelli (1):
      MIPS: BMIPS: Properly define memory controller compatible

Keguang Zhang (9):
      dt-bindings: mips: loongson: Add LS1B-DEMO and CQ-T300B
      MIPS: dts: loongson: Add LS1B-DEMO board
      MIPS: dts: loongson: Add LSGZ_1B_DEV board
      MIPS: dts: loongson: Add Smartloong-1C board
      MIPS: dts: loongson: Add CQ-T300B board
      MIPS: loongson: Add built-in DTB support
      MIPS: loongson32: Switch to generic core
      MIPS: Unify Loongson1 PRID_REV
      MIPS: configs: Consolidate Loongson1 defconfigs

Osama Abdelkader (1):
      mips: math-emu: replace deprecated strcpy() in me-debugfs

Thomas Huth (1):
      mips: Replace __ASSEMBLY__ with __ASSEMBLER__ in the mips headers

Thorsten Blum (10):
      MIPS: sgi-ip22: Replace deprecated strcpy() in plat_mem_setup()
      MIPS: sgi-ip32: Replace deprecated strcpy() in plat_mem_setup()
      MIPS: sni: Replace deprecated strcpy() in sni_console_setup()
      MIPS: txx9: Replace deprecated strcpy() with strscpy()
      MIPS: arc: Replace deprecated strcpy() with memcpy()
      MIPS: octeon: Replace memset(0) + deprecated strcpy() with strscpy_pad()
      MIPS: octeon: Replace deprecated strcpy() in octeon_model_get_string_buffer()
      MIPS: generic: Replace deprecated strcpy() in ocelot_detect()
      MIPS: Loongson64: Replace deprecated strcpy() with strscpy_pad()
      MIPS: RB532: Replace deprecated strcpy() with memcpy() and strscpy()

 Documentation/devicetree/bindings/mips/cpus.yaml   |   1 +
 .../devicetree/bindings/mips/loongson/devices.yaml |   2 +
 MAINTAINERS                                        |   3 +-
 arch/mips/Kconfig                                  |  64 ++---
 arch/mips/alchemy/common/clock.c                   |  18 +-
 arch/mips/boot/dts/Makefile                        |   1 +
 arch/mips/boot/dts/brcm/bcm7346.dtsi               |   3 +-
 arch/mips/boot/dts/brcm/bcm7360.dtsi               |   3 +-
 arch/mips/boot/dts/brcm/bcm7362.dtsi               |   3 +-
 arch/mips/boot/dts/brcm/bcm7425.dtsi               |   6 +-
 arch/mips/boot/dts/brcm/bcm7435.dtsi               |   6 +-
 arch/mips/boot/dts/lantiq/danube.dtsi              |   6 +
 arch/mips/boot/dts/lantiq/danube_easy50712.dts     |   4 +-
 arch/mips/boot/dts/loongson/Makefile               |  10 +
 arch/mips/boot/dts/loongson/cq-t300b.dts           | 110 ++++++++
 arch/mips/boot/dts/loongson/loongson1.dtsi         | 136 ++++++++++
 arch/mips/boot/dts/loongson/loongson1b.dtsi        | 198 ++++++++++++++
 arch/mips/boot/dts/loongson/loongson1c.dtsi        | 141 ++++++++++
 arch/mips/boot/dts/loongson/ls1b-demo.dts          | 125 +++++++++
 arch/mips/boot/dts/loongson/lsgz_1b_dev.dts        | 162 ++++++++++++
 arch/mips/boot/dts/loongson/smartloong-1c.dts      | 110 ++++++++
 arch/mips/cavium-octeon/executive/octeon-model.c   |  31 +--
 arch/mips/cavium-octeon/octeon-platform.c          |   4 +-
 arch/mips/cavium-octeon/smp.c                      |   2 +-
 .../{loongson1b_defconfig => loongson1_defconfig}  |  94 +++++--
 arch/mips/configs/loongson1c_defconfig             | 121 ---------
 arch/mips/fw/arc/cmdline.c                         |  22 +-
 arch/mips/generic/board-ocelot.c                   |   3 +-
 arch/mips/include/asm/addrspace.h                  |   4 +-
 arch/mips/include/asm/asm-eva.h                    |   6 +-
 arch/mips/include/asm/asm.h                        |   8 +-
 arch/mips/include/asm/bmips.h                      |   4 +-
 arch/mips/include/asm/cpu-type.h                   |   3 +-
 arch/mips/include/asm/cpu.h                        |   7 +-
 arch/mips/include/asm/dec/ecc.h                    |   2 +-
 arch/mips/include/asm/dec/interrupts.h             |   4 +-
 arch/mips/include/asm/dec/kn01.h                   |   2 +-
 arch/mips/include/asm/dec/kn02.h                   |   2 +-
 arch/mips/include/asm/dec/kn02xa.h                 |   2 +-
 arch/mips/include/asm/eva.h                        |   4 +-
 arch/mips/include/asm/ftrace.h                     |   8 +-
 arch/mips/include/asm/hazards.h                    |   4 +-
 arch/mips/include/asm/irqflags.h                   |   4 +-
 arch/mips/include/asm/jazz.h                       |  16 +-
 arch/mips/include/asm/jump_label.h                 |   4 +-
 arch/mips/include/asm/linkage.h                    |   2 +-
 arch/mips/include/asm/mach-generic/spaces.h        |   4 +-
 arch/mips/include/asm/mach-loongson32/irq.h        | 107 --------
 arch/mips/include/asm/mach-loongson32/loongson1.h  |  50 ----
 arch/mips/include/asm/mach-loongson32/platform.h   |  23 --
 arch/mips/include/asm/mach-loongson32/regs-mux.h   | 124 ---------
 arch/mips/include/asm/mips-boards/bonito64.h       |   4 +-
 arch/mips/include/asm/mipsmtregs.h                 |   6 +-
 arch/mips/include/asm/mipsregs.h                   |   6 +-
 arch/mips/include/asm/msa.h                        |   4 +-
 arch/mips/include/asm/pci/bridge.h                 |   4 +-
 arch/mips/include/asm/pm.h                         |   6 +-
 arch/mips/include/asm/prefetch.h                   |   2 +-
 arch/mips/include/asm/regdef.h                     |   4 +-
 arch/mips/include/asm/sibyte/board.h               |   4 +-
 arch/mips/include/asm/sibyte/sb1250.h              |   2 +-
 arch/mips/include/asm/sibyte/sb1250_defs.h         |   6 +-
 arch/mips/include/asm/smp-cps.h                    |   6 +-
 arch/mips/include/asm/sn/addrs.h                   |  18 +-
 arch/mips/include/asm/sn/gda.h                     |   4 +-
 arch/mips/include/asm/sn/kldir.h                   |   4 +-
 arch/mips/include/asm/sn/klkernvars.h              |   4 +-
 arch/mips/include/asm/sn/launch.h                  |   4 +-
 arch/mips/include/asm/sn/nmi.h                     |   8 +-
 arch/mips/include/asm/sn/sn0/addrs.h               |  14 +-
 arch/mips/include/asm/sn/sn0/hub.h                 |   2 +-
 arch/mips/include/asm/sn/sn0/hubio.h               |  36 +--
 arch/mips/include/asm/sn/sn0/hubmd.h               |   4 +-
 arch/mips/include/asm/sn/sn0/hubni.h               |   6 +-
 arch/mips/include/asm/sn/sn0/hubpi.h               |   4 +-
 arch/mips/include/asm/sn/types.h                   |   2 +-
 arch/mips/include/asm/sync.h                       |   2 +-
 arch/mips/include/asm/thread_info.h                |   4 +-
 arch/mips/include/asm/unistd.h                     |   4 +-
 arch/mips/include/asm/vdso/gettimeofday.h          |   4 +-
 arch/mips/include/asm/vdso/processor.h             |   4 +-
 arch/mips/include/asm/vdso/vdso.h                  |   4 +-
 arch/mips/include/asm/vdso/vsyscall.h              |   4 +-
 arch/mips/include/asm/xtalk/xtalk.h                |   4 +-
 arch/mips/include/asm/xtalk/xwidget.h              |   4 +-
 arch/mips/kernel/cpu-probe.c                       |   6 +-
 arch/mips/lantiq/xway/sysctrl.c                    |   2 +-
 arch/mips/loongson32/Kconfig                       |  43 +---
 arch/mips/loongson32/Makefile                      |  17 --
 arch/mips/loongson32/Platform                      |   1 -
 arch/mips/loongson32/common/Makefile               |   6 -
 arch/mips/loongson32/common/irq.c                  | 191 --------------
 arch/mips/loongson32/common/platform.c             | 285 ---------------------
 arch/mips/loongson32/common/prom.c                 |  42 ---
 arch/mips/loongson32/common/setup.c                |  26 --
 arch/mips/loongson32/common/time.c                 |  23 --
 arch/mips/loongson32/ls1b/Makefile                 |   6 -
 arch/mips/loongson32/ls1b/board.c                  |  55 ----
 arch/mips/loongson32/ls1c/Makefile                 |   6 -
 arch/mips/loongson32/ls1c/board.c                  |  23 --
 arch/mips/loongson64/boardinfo.c                   |   9 +-
 arch/mips/math-emu/me-debugfs.c                    |   6 +-
 arch/mips/rb532/prom.c                             |  17 +-
 arch/mips/sgi-ip22/ip22-setup.c                    |   3 +-
 arch/mips/sgi-ip32/ip32-setup.c                    |   3 +-
 arch/mips/sni/setup.c                              |   3 +-
 arch/mips/txx9/generic/setup.c                     |   4 +-
 drivers/soc/bcm/brcmstb/pm/pm.h                    |   2 +-
 108 files changed, 1355 insertions(+), 1405 deletions(-)
 create mode 100644 arch/mips/boot/dts/loongson/cq-t300b.dts
 create mode 100644 arch/mips/boot/dts/loongson/loongson1.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson1b.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson1c.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/ls1b-demo.dts
 create mode 100644 arch/mips/boot/dts/loongson/lsgz_1b_dev.dts
 create mode 100644 arch/mips/boot/dts/loongson/smartloong-1c.dts
 rename arch/mips/configs/{loongson1b_defconfig => loongson1_defconfig} (51%)
 delete mode 100644 arch/mips/configs/loongson1c_defconfig
 delete mode 100644 arch/mips/include/asm/mach-loongson32/irq.h
 delete mode 100644 arch/mips/include/asm/mach-loongson32/loongson1.h
 delete mode 100644 arch/mips/include/asm/mach-loongson32/platform.h
 delete mode 100644 arch/mips/include/asm/mach-loongson32/regs-mux.h
 delete mode 100644 arch/mips/loongson32/common/Makefile
 delete mode 100644 arch/mips/loongson32/common/irq.c
 delete mode 100644 arch/mips/loongson32/common/platform.c
 delete mode 100644 arch/mips/loongson32/common/prom.c
 delete mode 100644 arch/mips/loongson32/common/setup.c
 delete mode 100644 arch/mips/loongson32/common/time.c
 delete mode 100644 arch/mips/loongson32/ls1b/Makefile
 delete mode 100644 arch/mips/loongson32/ls1b/board.c
 delete mode 100644 arch/mips/loongson32/ls1c/Makefile
 delete mode 100644 arch/mips/loongson32/ls1c/board.c

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

