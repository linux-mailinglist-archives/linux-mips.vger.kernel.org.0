Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0950F242312
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 02:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgHLAPW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 20:15:22 -0400
Received: from crapouillou.net ([89.234.176.41]:52050 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726271AbgHLAPV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Aug 2020 20:15:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1597191318; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=CfEFh8k7eWE5NUFOPuJC1Ql4YUVM6wmSQ0wshhmMmPA=;
        b=DIQvIU1Lbbx3xtka5IpNNOGUE/62Y7Ml1sL4q9yXHAQ4HBHb/ExV9nGBG4tCrVEGTav95r
        OEn/e+z11dFBEhboNw4/iKiMD0Cm8pB1T3D+DsUb7ieJrH+ca6Iomu1S8uM9lMMsctzCxU
        6u2ad4aHRv5XJKPPJHLsh9pUjiiFkJU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 00/13] Convert Ingenic to a generic board v2
Date:   Wed, 12 Aug 2020 02:14:57 +0200
Message-Id: <20200812001510.460382-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Changes since V1:

- the get_system_type() now will simply return the "system_type"
  variable if non-NULL, and the various boards can set this pointer
  should they want to set a custom value. The .get_system_type
  callback that v1 added to the struct mips_machine is gone.

- the board-ingenic.c has been modified accordingly.

- patch [06/13] is new, it makes sure that the kernel's command line is
  initialized properly and includes the parameters passed by the
  bootloader.

- the cu1830-neo board defconfig has now been regenerated in patch
  [12/13].

Cheers,
-Paul

Paul Cercueil (13):
  MIPS: cpu-probe: Set Ingenic's writecombine to _CACHE_CACHABLE_WA
  MIPS: cpu-probe: Mark XBurst CPU as having vtagged caches
  MIPS: cpu-probe: ingenic: Fix broken BUG_ON
  MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
  MIPS: generic: Allow boards to set system type
  MIPS: generic: Init command line with fw_init_cmdline()
  MIPS: generic: Support booting with built-in or appended DTB
  MIPS: generic: Add support for zboot
  MIPS: generic: Increase NR_IRQS to 256
  MIPS: generic: Add support for Ingenic SoCs
  MIPS: jz4740: Drop folder
  MIPS: configs: Regenerate configs of Ingenic boards
  MAINTAINERS: Update paths to Ingenic platform code

 MAINTAINERS                                   |   4 +-
 arch/mips/Kbuild.platforms                    |   1 -
 arch/mips/Kconfig                             |  43 ++++--
 arch/mips/configs/ci20_defconfig              |   4 +-
 arch/mips/configs/cu1000-neo_defconfig        |  16 +-
 arch/mips/configs/cu1830-neo_defconfig        |  15 +-
 arch/mips/configs/gcw0_defconfig              |   2 +-
 arch/mips/configs/qi_lb60_defconfig           |   5 +-
 arch/mips/configs/rs90_defconfig              |   4 +-
 arch/mips/generic/Kconfig                     |   8 +-
 arch/mips/generic/Makefile                    |   1 +
 arch/mips/generic/Platform                    |   1 +
 arch/mips/generic/board-ingenic.c             | 108 +++++++++++++
 arch/mips/generic/init.c                      |  11 +-
 arch/mips/generic/proc.c                      |   5 +
 arch/mips/include/asm/mach-generic/irq.h      |   2 +-
 .../asm/mach-jz4740/cpu-feature-overrides.h   |  50 ------
 arch/mips/include/asm/mach-jz4740/irq.h       |  13 --
 arch/mips/include/asm/pgtable-bits.h          |   5 -
 arch/mips/{jz4740 => ingenic}/Kconfig         |  16 +-
 arch/mips/jz4740/Makefile                     |   9 --
 arch/mips/jz4740/Platform                     |   3 -
 arch/mips/jz4740/setup.c                      | 145 ------------------
 arch/mips/kernel/cpu-probe.c                  |   8 +-
 24 files changed, 186 insertions(+), 293 deletions(-)
 create mode 100644 arch/mips/generic/board-ingenic.c
 delete mode 100644 arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/irq.h
 rename arch/mips/{jz4740 => ingenic}/Kconfig (91%)
 delete mode 100644 arch/mips/jz4740/Makefile
 delete mode 100644 arch/mips/jz4740/Platform
 delete mode 100644 arch/mips/jz4740/setup.c

-- 
2.28.0

