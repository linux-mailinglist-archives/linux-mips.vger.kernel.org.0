Return-Path: <linux-mips+bounces-7607-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F40BEA1D8FD
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 16:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 376421887502
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 15:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AC877102;
	Mon, 27 Jan 2025 15:05:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1777080E;
	Mon, 27 Jan 2025 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737990331; cv=none; b=j0ot1Fk5YpVJG3GgsfjawpnFDV8n+MCqxtrgV8JuxjzbrQ9+j3QCCM9orivVAFDJkxpq+I/C2CGmTmGddpUHbN01O6smW+/Lu+DZPIXkFN84iGtfgnSWuMcIWybC+VMGCvvCJIYl7/MZKScfOgBI9d6HLAwQ1z9sdwkEvn9tVYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737990331; c=relaxed/simple;
	bh=Qj0q49a+A5bbmXs6vmC7DkwR5iQrCI/wG6QO4qjwfQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDJDZZQYo3N4zslvIQT8N4ENmzE788uMIvfFTrY/hrepCdl5Tz4VLXMItNHJZmSe42Kx5vNrQfCPF83LgbMEsMstTRsJjX3yPiLE90cyDPpTMQjRPDmBDwFMJ7QPipFoxPi9NaN3xM8U8xU8Fo2DolovCZlT9ScX8sIg8JA0ths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tcQfo-00064A-00; Mon, 27 Jan 2025 16:05:12 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 580A7C013E; Mon, 27 Jan 2025 16:05:05 +0100 (CET)
Date: Mon, 27 Jan 2025 16:05:05 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v6.14
Message-ID: <Z5egoYZfTQvFYzx1@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.14

for you to fetch changes up to df1b8d6e89db0edd572a1e375f5d3dd5575b9a9b:

  MIPS: pci-legacy: Override pci_address_to_pio (2025-01-20 20:39:23 +0100)

----------------------------------------------------------------
Cleanups and fixes

----------------------------------------------------------------
Ism Hong (1):
      mips: fix shmctl/semctl/msgctl syscall for o32

Jiaxun Yang (1):
      MIPS: pci-legacy: Override pci_address_to_pio

Kexy Biscuit (2):
      MIPS: Loongson64: remove ROM Size unit in boardinfo
      MIPS: Loongson: Add comments for interface_info

Masahiro Yamada (1):
      MIPS: migrate to generic rule for built-in DTBs

Mateusz Jończyk (1):
      mips/math-emu: fix emulation of the prefx instruction

Rong Xu (1):
      MIPS: Add a blank line after __HEAD

Thomas Bogendoerfer (1):
      MIPS: kernel: Rename read/write_c0_ecc to read/writec0_errctl

Thorsten Blum (2):
      MIPS: traps: Use str_enabled_disabled() in parity_protection_init()
      MIPS: Loongson64: env: Use str_on_off() helper in prom_lefi_init_env()

WangYuli (1):
      MIPS: ftrace: Declare ftrace_get_parent_ra_addr() as static

Xi Ruoyao (1):
      Revert "MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT"

liujing (1):
      MIPS: Fix the wrong format specifier

 arch/mips/Kconfig                                  |  3 +-
 arch/mips/Makefile                                 |  3 --
 arch/mips/boot/dts/Makefile                        |  2 -
 arch/mips/boot/dts/brcm/Makefile                   |  2 -
 arch/mips/boot/dts/cavium-octeon/Makefile          |  2 -
 arch/mips/boot/dts/ingenic/Makefile                |  2 -
 arch/mips/boot/dts/lantiq/Makefile                 |  2 -
 arch/mips/boot/dts/loongson/Makefile               |  2 -
 arch/mips/boot/dts/mscc/Makefile                   |  3 --
 arch/mips/boot/dts/mti/Makefile                    |  2 -
 arch/mips/boot/dts/pic32/Makefile                  |  2 -
 arch/mips/boot/dts/ralink/Makefile                 |  2 -
 arch/mips/include/asm/mach-loongson64/boot_param.h |  8 ++--
 arch/mips/include/asm/mipsregs.h                   |  4 +-
 arch/mips/kernel/cevt-bcm1480.c                    |  2 +-
 arch/mips/kernel/ftrace.c                          |  2 +-
 arch/mips/kernel/head.S                            |  1 +
 arch/mips/kernel/mips-mt.c                         |  7 ++--
 arch/mips/kernel/spram.c                           |  4 --
 arch/mips/kernel/syscalls/syscall_o32.tbl          |  6 +--
 arch/mips/kernel/traps.c                           | 47 +++++++++++-----------
 arch/mips/loongson64/boardinfo.c                   |  2 -
 arch/mips/loongson64/env.c                         |  3 +-
 arch/mips/math-emu/cp1emu.c                        |  2 +-
 arch/mips/pci/pci-legacy.c                         |  8 ++++
 25 files changed, 52 insertions(+), 71 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

