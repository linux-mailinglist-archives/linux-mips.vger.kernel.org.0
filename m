Return-Path: <linux-mips+bounces-9160-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B808ACFD25
	for <lists+linux-mips@lfdr.de>; Fri,  6 Jun 2025 08:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2496B1724DC
	for <lists+linux-mips@lfdr.de>; Fri,  6 Jun 2025 06:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5CD283FD4;
	Fri,  6 Jun 2025 06:55:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF3D42AA9;
	Fri,  6 Jun 2025 06:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749192907; cv=none; b=gWAU2RiGxjohm0ezZS7nqVnAgpQ515ef3Ms3uUEOIMSaFmT+y1pUTwAjFzkAcyM23/tE9LnGxnO8wVxIUuNP+DrFq4WlTXJ66334PYWDyQU0ElnXPgooGwJSNy4t8UmGYIg5m/XPpm49LrwMWFRLhZtTtnwI+uWdV2Dti5ocUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749192907; c=relaxed/simple;
	bh=+KR7896HFgiNCh/FwADWs5fCnvi70stb4k6usaGIL+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMq79kHe1Pneyt+zBY8tkZzvzOK0xcCPs9R6HFgY0KUB88Vqq0T69/5gcHqAxKuumInO8vF1alKuUgn4MIi7tVXPdUqBHyX5wdlHUAYKRvEHIprbWEFCCv+y6KMGWmsEe0zFw/EvISoo3BIvzZ8tRzszWCcYQFgSSBVODXhMSV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uNQyb-00037B-00; Fri, 06 Jun 2025 08:54:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E95AEC0176; Fri,  6 Jun 2025 08:54:44 +0200 (CEST)
Date: Fri, 6 Jun 2025 08:54:44 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v6.16
Message-ID: <aEKQtJcSIeKklwz4@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.16

for you to fetch changes up to 5a0c749125c001cba673e9951b0002fba7ea2886:

  MIPS: loongson2ef: lemote-2f: add missing function prototypes (2025-05-30 14:19:02 +0200)

----------------------------------------------------------------
Added support for EcoNet platform
Added support for parallel CPU bring up on EyeQ
Other cleanups and fixes

----------------------------------------------------------------
Bartosz Golaszewski (4):
      MIPS: rb532: gpio: use new line value setter callbacks
      MIPS: bcm63xx: gpio: use new line value setter callbacks
      MIPS: alchemy: gpio: use new line value setter callbacks
      MIPS: txx9: gpio: use new line value setter callbacks

Caleb James DeLisle (6):
      dt-bindings: mips: Add EcoNet platform binding
      mips: Add EcoNet MIPS platform support
      dt-bindings: vendor-prefixes: Add SmartFiber
      mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board
      MAINTAINERS: Add entry for newly added EcoNet platform.
      mips: econet: Fix incorrect Kconfig dependencies

Charan Pedumuru (1):
      mips: dts: pic32: pic32mzda: Rename the sdhci nodename to match with common mmc-controller binding

Chris Packham (1):
      mips: dts: realtek: Add MDIO controller

Eric Biggers (1):
      MIPS: bcm63xx: nvram: avoid inefficient use of crc32_le_combine()

Gregory CLEMENT (3):
      MIPS: SMP: Implement parallel CPU bring up for EyeQ
      MIPS: SMP: Move the AP sync point before the non-parallel aware functions
      MIPS: SMP: Move the AP sync point before the calibration delay

Khem Raj (1):
      mips: Add -std= flag specified in KBUILD_CFLAGS to vdso CFLAGS

Randy Dunlap (2):
      MIPS: loongson2ef: cs5536: add missing function prototypes
      MIPS: loongson2ef: lemote-2f: add missing function prototypes

Thorsten Blum (3):
      mips: ptrace: Improve code formatting and indentation
      MIPS: BCM63XX: Replace strcpy() with strscpy() in board_prom_init()
      MIPS: Replace strcpy() with strscpy() in vpe_elfload()

WangYuli (1):
      MIPS: Loongson64: Add missing '#interrupt-cells' for loongson64c_ls7a

 Documentation/devicetree/bindings/mips/econet.yaml | 26 ++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 MAINTAINERS                                        | 12 ++++
 arch/mips/Kbuild.platforms                         |  1 +
 arch/mips/Kconfig                                  | 28 ++++++++
 arch/mips/alchemy/common/gpiolib.c                 |  6 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c          |  2 +-
 arch/mips/bcm63xx/gpio.c                           |  7 +-
 arch/mips/boot/compressed/uart-16550.c             |  5 ++
 arch/mips/boot/dts/Makefile                        |  1 +
 arch/mips/boot/dts/econet/Makefile                 |  2 +
 arch/mips/boot/dts/econet/en751221.dtsi            | 67 +++++++++++++++++++
 .../dts/econet/en751221_smartfiber_xp8421-b.dts    | 19 ++++++
 .../boot/dts/loongson/loongson64c_4core_ls7a.dts   |  1 +
 arch/mips/boot/dts/pic32/pic32mzda.dtsi            |  2 +-
 arch/mips/boot/dts/realtek/rtl930x.dtsi            | 33 +++++++++
 arch/mips/econet/Kconfig                           | 48 +++++++++++++
 arch/mips/econet/Makefile                          |  2 +
 arch/mips/econet/Platform                          |  5 ++
 arch/mips/econet/init.c                            | 78 ++++++++++++++++++++++
 .../asm/mach-loongson2ef/cs5536/cs5536_pci.h       | 20 ++++++
 arch/mips/include/asm/mach-loongson2ef/loongson.h  |  9 +++
 arch/mips/include/asm/topology.h                   |  3 +
 arch/mips/kernel/gpio_txx9.c                       |  8 ++-
 arch/mips/kernel/ptrace.c                          | 34 +++++-----
 arch/mips/kernel/smp-cps.c                         |  2 +
 arch/mips/kernel/smp.c                             | 18 +++++
 arch/mips/kernel/vpe.c                             |  3 +-
 arch/mips/rb532/gpio.c                             |  8 ++-
 arch/mips/txx9/generic/setup.c                     |  8 ++-
 arch/mips/vdso/Makefile                            |  1 +
 include/linux/bcm963xx_nvram.h                     | 16 ++---
 32 files changed, 434 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/econet.yaml
 create mode 100644 arch/mips/boot/dts/econet/Makefile
 create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
 create mode 100644 arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
 create mode 100644 arch/mips/econet/Kconfig
 create mode 100644 arch/mips/econet/Makefile
 create mode 100644 arch/mips/econet/Platform
 create mode 100644 arch/mips/econet/init.c
-- 

Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

