Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9B444E4D0
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 11:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbhKLKrr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 05:47:47 -0500
Received: from elvis.franken.de ([193.175.24.41]:44090 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232791AbhKLKrr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Nov 2021 05:47:47 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mlU3D-0003dq-00; Fri, 12 Nov 2021 11:44:55 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 79768C2D8F; Fri, 12 Nov 2021 11:44:47 +0100 (CET)
Date:   Fri, 12 Nov 2021 11:44:47 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes 2nd part for v5.16
Message-ID: <20211112104447.GA6127@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 36de23a4c5f0b61ceb4812b535422fa6c6e97447:

  MIPS: Cobalt: Explain GT64111 early PCI fixup (2021-11-03 17:34:11 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.16_1

for you to fetch changes up to f78b25ee922ef6faf59a258af1b9388ca894cfd9:

  mips: decompressor: do not copy source files while building (2021-11-10 19:45:06 +0100)

----------------------------------------------------------------
- Config updates for BMIPS platform
- Build fixes
- Makefile cleanups

----------------------------------------------------------------
Florian Fainelli (4):
      MIPS: Allow modules to set board_be_handler
      MIPS: Update bmips_stb_defconfig
      MIPS: BMIPS: Enable PCI Kconfig
      PCI: brcmstb: Allow building for BMIPS_GENERIC

Masahiro Yamada (4):
      MIPS: VDSO: remove -nostdlib compiler flag
      MIPS: fix *-pkg builds for loongson2ef platform
      MIPS: fix duplicated slashes for Platform file path
      mips: decompressor: do not copy source files while building

Randy Dunlap (2):
      mips: BCM63XX: ensure that CPU_SUPPORTS_32BIT_KERNEL is set
      MIPS: boot/compressed/: add __bswapdi2() to target for ZSTD decompression

 arch/mips/Kbuild.platforms             |   2 +-
 arch/mips/Kconfig                      |   5 ++
 arch/mips/Makefile                     |   2 +
 arch/mips/boot/compressed/.gitignore   |   3 -
 arch/mips/boot/compressed/Makefile     |  12 +--
 arch/mips/boot/compressed/ashldi3.c    |   2 +
 arch/mips/boot/compressed/bswapdi.c    |   2 +
 arch/mips/boot/compressed/bswapsi.c    |   2 +
 arch/mips/boot/compressed/uart-ath79.c |   2 +
 arch/mips/configs/bmips_stb_defconfig  | 155 +++++++++++++++++++++++++++++++--
 arch/mips/dec/setup.c                  |   6 +-
 arch/mips/include/asm/traps.h          |   2 +-
 arch/mips/kernel/traps.c               |   8 +-
 arch/mips/sgi-ip22/ip22-berr.c         |   2 +-
 arch/mips/sgi-ip22/ip28-berr.c         |   2 +-
 arch/mips/sgi-ip27/ip27-berr.c         |   2 +-
 arch/mips/sgi-ip32/ip32-berr.c         |   2 +-
 arch/mips/sibyte/swarm/setup.c         |   2 +-
 arch/mips/txx9/generic/setup_tx4927.c  |   2 +-
 arch/mips/txx9/generic/setup_tx4938.c  |   2 +-
 arch/mips/txx9/generic/setup_tx4939.c  |   2 +-
 arch/mips/vdso/Makefile                |   2 +-
 drivers/bus/brcmstb_gisb.c             |   2 +-
 drivers/pci/controller/Kconfig         |   3 +-
 scripts/remove-stale-files             |   5 ++
 25 files changed, 192 insertions(+), 39 deletions(-)
 delete mode 100644 arch/mips/boot/compressed/.gitignore
 create mode 100644 arch/mips/boot/compressed/ashldi3.c
 create mode 100644 arch/mips/boot/compressed/bswapdi.c
 create mode 100644 arch/mips/boot/compressed/bswapsi.c
 create mode 100644 arch/mips/boot/compressed/uart-ath79.c

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
