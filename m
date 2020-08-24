Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF3F25028F
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 18:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgHXQdR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:33:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:50544 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727906AbgHXQdP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 4F101AF6E;
        Mon, 24 Aug 2020 16:33:44 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH 00/12] Convert WAR defines to config options
Date:   Mon, 24 Aug 2020 18:32:42 +0200
Message-Id: <20200824163257.44533-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patches convert workaround (WAR) defines into config options and
gets rid of mach-*/war.h files.

Thomas Bogendoerfer (12):
  MIPS: Convert R4600_V1_INDEX_ICACHEOP into a config option
  MIPS: Convert R4600_V1_HIT_CACHEOP into a config option
  MIPS: Convert R4600_V2_HIT_CACHEOP into a config option
  MIPS: Remove MIPS4K_ICACHE_REFILL_WAR and MIPS_CACHE_SYNC_WAR
  MIPS: Convert TX49XX_ICACHE_INDEX_INV into a config option
  MIPS: Convert ICACHE_REFILLS_WORKAROUND_WAR into a config option
  MIPS: Convert R10000_LLSC_WAR info a config option
  MIPS: Convert MIPS34K_MISSED_ITLB_WAR into a config option
  MIPS: Replace SIBYTE_1956_WAR by CONFIG_SB1_PASS_2_WORKAROUNDS
  MIPS: Get rid of BCM1250_M3_WAR
  MIPS: Get rid of CAVIUM_OCTEON_DCACHE_PREFETCH_WAR
  MIPS: Remove mach-*/war.h

 arch/mips/Kconfig                              |  80 +++++++++++++
 arch/mips/cavium-octeon/setup.c                |   2 +-
 arch/mips/include/asm/futex.h                  |   4 +-
 arch/mips/include/asm/llsc.h                   |   2 +-
 arch/mips/include/asm/local.h                  |   4 +-
 arch/mips/include/asm/mach-cavium-octeon/war.h |  27 -----
 arch/mips/include/asm/mach-generic/war.h       |  23 ----
 arch/mips/include/asm/mach-ip22/war.h          |  27 -----
 arch/mips/include/asm/mach-ip27/war.h          |  23 ----
 arch/mips/include/asm/mach-ip28/war.h          |  23 ----
 arch/mips/include/asm/mach-ip30/war.h          |  24 ----
 arch/mips/include/asm/mach-ip32/war.h          |  23 ----
 arch/mips/include/asm/mach-malta/war.h         |  23 ----
 arch/mips/include/asm/mach-rc32434/war.h       |  23 ----
 arch/mips/include/asm/mach-rm/war.h            |  27 -----
 arch/mips/include/asm/mach-sibyte/war.h        |  38 -------
 arch/mips/include/asm/mach-tx49xx/war.h        |  23 ----
 arch/mips/include/asm/mipsregs.h               |   4 +-
 arch/mips/include/asm/war.h                    | 150 -------------------------
 arch/mips/kernel/signal.c                      |   8 +-
 arch/mips/kernel/syscall.c                     |   2 +-
 arch/mips/mm/c-r4k.c                           |  17 +--
 arch/mips/mm/page.c                            |  16 ++-
 arch/mips/mm/tlbex.c                           |   8 +-
 arch/mips/mm/uasm.c                            |   2 +-
 drivers/tty/serial/sb1250-duart.c              |   9 +-
 26 files changed, 127 insertions(+), 485 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-cavium-octeon/war.h
 delete mode 100644 arch/mips/include/asm/mach-generic/war.h
 delete mode 100644 arch/mips/include/asm/mach-ip22/war.h
 delete mode 100644 arch/mips/include/asm/mach-ip27/war.h
 delete mode 100644 arch/mips/include/asm/mach-ip28/war.h
 delete mode 100644 arch/mips/include/asm/mach-ip30/war.h
 delete mode 100644 arch/mips/include/asm/mach-ip32/war.h
 delete mode 100644 arch/mips/include/asm/mach-malta/war.h
 delete mode 100644 arch/mips/include/asm/mach-rc32434/war.h
 delete mode 100644 arch/mips/include/asm/mach-rm/war.h
 delete mode 100644 arch/mips/include/asm/mach-sibyte/war.h
 delete mode 100644 arch/mips/include/asm/mach-tx49xx/war.h

-- 
2.16.4

