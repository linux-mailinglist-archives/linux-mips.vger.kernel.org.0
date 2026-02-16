Return-Path: <linux-mips+bounces-13176-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBnJNjjnkmlSzwEAu9opvQ
	(envelope-from <linux-mips+bounces-13176-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Feb 2026 10:45:28 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75277142095
	for <lists+linux-mips@lfdr.de>; Mon, 16 Feb 2026 10:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 454F5300AEE9
	for <lists+linux-mips@lfdr.de>; Mon, 16 Feb 2026 09:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CF3284B25;
	Mon, 16 Feb 2026 09:45:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C972A1DDC2B;
	Mon, 16 Feb 2026 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771235125; cv=none; b=KWlEE9PoU40CxC7XLBPkXPa3T3o9HFHTiSPJsF+UjkX9U0SCSldv1dS3jy8jRf2jb4WGVEDrhidpLkmw8D4DYKpuv4nd1ArOfu+thLmHet7+MnKfrds1Q9nI5QSnxVELG5zqGKA+L3Y2tzgX63oE578ubYyCafaJ8Qev4uIMNd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771235125; c=relaxed/simple;
	bh=tpyvw3bDkR5AhgE/mlaxxf8wb/hhj6Q7Co0Anf6uM/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kSXGxgmRSQjFjmXTTKFRg9WX80lsJy8yVDgPd3nnbyQghjc5rubog68gupjGjjhMFYm1X5xYIH21D/I+d/GKLE6/keNHW9j5SMjCgX+uPKOJZrWFYue0Ehmr89ctNG1sOdh3LLN6thSLgR6HRckxzd4RzFm3eszgY2KdGJ/L5+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vrvAH-0005a0-00; Mon, 16 Feb 2026 10:45:13 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F0648C00EE; Mon, 16 Feb 2026 10:45:06 +0100 (CET)
Date: Mon, 16 Feb 2026 10:45:06 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v7.0
Message-ID: <aZLnItNUtfDgKenO@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13176-lists,linux-mips=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75277142095
X-Rspamd-Action: no action

The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:

  Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.0

for you to fetch changes up to 720452a6d0fdc94ec3301f31ea10b43102eaeeef:

  Revert "clk: microchip: core: allow driver to be compiled with COMPILE_TEST" (2026-02-10 16:48:59 +0100)

----------------------------------------------------------------
cleanups and fixes

----------------------------------------------------------------
Brian Masney (16):
      MIPS: pic32: include linux/io.h header on several files
      MIPS: pic32: include linux/types.h on pic32.h
      MIPS: pic32: drop unused include linux/io.h from pic32.h
      MIPS: copy pic32.h header file from asm/mach-pic32/ to include/platform-data/
      MAINTAINERS: add include/linux/platform_data/pic32.h to MIPS entry
      MIPS: update include to use pic32.h from platform_data
      clk: microchip: core: update include to use pic32.h from platform_data
      irqchip/irq-pic32-evic: update include to use pic32.h from platform_data
      mmc: sdhci-pic32: update include to use pic32.h from platform_data
      pinctrl: pic32: update include to use pic32.h from platform_data
      rtc: pic32: update include to use pic32.h from platform_data
      serial: pic32_uart: update include to use pic32.h from platform_data
      watchdog: pic32-dmt: update include to use pic32.h from platform_data
      watchdog: pic32-wdt: update include to use pic32.h from platform_data
      MIPS: drop unused pic32.h header
      clk: microchip: core: allow driver to be compiled with COMPILE_TEST

Icenowy Zheng (1):
      MIPS: Loongson64: dts: fix phy-related definition of LS7A GMAC

Jiaxun Yang (1):
      MIPS: rb532: Fix MMIO UART resource registration

John Garry (1):
      MIPS: Loongson: Make cpumask_of_node() robust against NUMA_NO_NODE

Lukas Bulwahn (1):
      clk: microchip: fix typo in reference to a config option

Randy Dunlap (1):
      mips: LOONGSON32: drop a dangling Kconfig symbol

Rong Zhang (2):
      MIPS: Loongson2ef: Register PCI controller in early stage
      MIPS: Loongson2ef: Use pcibios_align_resource() to block io range

Thomas Bogendoerfer (2):
      Revert "clk: microchip: fix typo in reference to a config option"
      Revert "clk: microchip: core: allow driver to be compiled with COMPILE_TEST"

Thomas Weißschuh (1):
      MIPS: Implement ARCH_HAS_CC_CAN_LINK

Yao Zi (2):
      MIPS: Loongson64: env: Fixup serial clock-frequency when using LEFI
      MIPS: Work around LLVM bug when gp is used as global register variable

 MAINTAINERS                                        |  1 +
 arch/mips/Kconfig                                  | 29 ++++++-
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi          |  6 +-
 arch/mips/include/asm/mach-loongson2ef/loongson.h  |  6 ++
 arch/mips/include/asm/mach-loongson64/topology.h   |  2 +-
 arch/mips/kernel/relocate.c                        | 13 +++
 arch/mips/loongson2ef/common/pci.c                 | 18 ++--
 arch/mips/loongson2ef/common/setup.c               |  1 +
 arch/mips/loongson64/env.c                         | 98 ++++++++++++++++++++++
 arch/mips/pic32/common/reset.c                     |  3 +-
 arch/mips/pic32/pic32mzda/config.c                 |  3 +-
 arch/mips/pic32/pic32mzda/early_clk.c              |  3 +-
 arch/mips/pic32/pic32mzda/early_console.c          |  3 +-
 arch/mips/rb532/devices.c                          |  5 +-
 drivers/clk/microchip/clk-core.c                   |  2 +-
 drivers/irqchip/irq-pic32-evic.c                   |  2 +-
 drivers/mmc/host/sdhci-pic32.c                     |  2 +-
 drivers/pinctrl/pinctrl-pic32.c                    |  3 +-
 drivers/rtc/rtc-pic32.c                            |  3 +-
 drivers/tty/serial/pic32_uart.c                    |  3 +-
 drivers/watchdog/pic32-dmt.c                       |  3 +-
 drivers/watchdog/pic32-wdt.c                       |  3 +-
 .../linux/platform_data}/pic32.h                   | 17 ++--
 23 files changed, 191 insertions(+), 38 deletions(-)
 rename {arch/mips/include/asm/mach-pic32 => include/linux/platform_data}/pic32.h (70%)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

