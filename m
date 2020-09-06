Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF3D25F01C
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgIFT3q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:29:46 -0400
Received: from crapouillou.net ([89.234.176.41]:35626 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgIFT3p (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420583; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=jqZboY76ritiQk4T/8QgfGP/0GT75qYhHnQkOLRfZaY=;
        b=Zm1sK8UxWobLIKxtzL4GBJAyS6O8YVBtz1eT6T6iJLn81qqqTSMQNM4xy/LFxC3eDXYxzL
        fsx18U304UXvAeVPhYSN0WMEQ/fD+kNyWk8xQhZ+s/RGSLDL/A0xm1vWbwhc04/OF2D9Ok
        TuJFUsyLg0gQvQ15ra3Qd87qkNc2ayU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 00/15] MIPS: Convert Ingenic to a generic board v3
Date:   Sun,  6 Sep 2020 21:29:20 +0200
Message-Id: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas, list,

Here's a V3 of my patchset that updates the old jz4740 platform code to
work with the generic MIPS board code base.

Noteworthy changes since V2:
- Patch [01/15] is a fix to the LB60's defconfig, which expected a
  symbol to be the default value of an enum, but the default changed in
  kernel 5.7.

- Patch [11/15] has been modified to address the issue with
  cpu-feature-overrides.h being dropped. Now, The Ingenic-specific
  version of the file will be used when building a Ingenic-only kernel,
  otherwise the generic dummy one will be used.

- Patch [13/15] is new, instead of doing code removal + rename in one
  patch in v2, we now do code removal in patch [12/15] and rename in
  [13/15]. It makes more sense to split since we have more files/folders
  (as we keep the cpu-feature-overrides.h header around).

Cheers,
-Paul

Paul Cercueil (15):
  MIPS: configs: lb60: Fix defconfig not selecting correct board
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
  MIPS: jz4740: Drop all obsolete files
  MIPS: jz4740: Rename jz4740 folders to ingenic
  MIPS: configs: Regenerate configs of Ingenic boards
  MAINTAINERS: Update paths to Ingenic platform code

 MAINTAINERS                                   |   5 +-
 arch/mips/Kbuild.platforms                    |   1 -
 arch/mips/Kconfig                             |  43 ++++--
 arch/mips/configs/ci20_defconfig              |   4 +-
 arch/mips/configs/cu1000-neo_defconfig        |  15 +-
 arch/mips/configs/cu1830-neo_defconfig        |  15 +-
 arch/mips/configs/gcw0_defconfig              |   2 +-
 arch/mips/configs/qi_lb60_defconfig           |   7 +-
 arch/mips/configs/rs90_defconfig              |   4 +-
 arch/mips/generic/Kconfig                     |   8 +-
 arch/mips/generic/Makefile                    |   1 +
 arch/mips/generic/Platform                    |   4 +
 arch/mips/generic/board-ingenic.c             | 108 +++++++++++++
 arch/mips/generic/init.c                      |  11 +-
 arch/mips/generic/proc.c                      |   5 +
 arch/mips/include/asm/mach-generic/irq.h      |   2 +-
 .../cpu-feature-overrides.h                   |   0
 arch/mips/include/asm/mach-jz4740/irq.h       |  13 --
 arch/mips/include/asm/pgtable-bits.h          |   5 -
 arch/mips/{jz4740 => ingenic}/Kconfig         |  16 +-
 arch/mips/jz4740/Makefile                     |   9 --
 arch/mips/jz4740/Platform                     |   3 -
 arch/mips/jz4740/setup.c                      | 145 ------------------
 arch/mips/kernel/cpu-probe.c                  |   8 +-
 24 files changed, 191 insertions(+), 243 deletions(-)
 create mode 100644 arch/mips/generic/board-ingenic.c
 rename arch/mips/include/asm/{mach-jz4740 => mach-ingenic}/cpu-feature-overrides.h (100%)
 delete mode 100644 arch/mips/include/asm/mach-jz4740/irq.h
 rename arch/mips/{jz4740 => ingenic}/Kconfig (91%)
 delete mode 100644 arch/mips/jz4740/Makefile
 delete mode 100644 arch/mips/jz4740/Platform
 delete mode 100644 arch/mips/jz4740/setup.c

-- 
2.28.0

