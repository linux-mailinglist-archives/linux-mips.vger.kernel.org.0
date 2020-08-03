Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC1623AB35
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 19:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgHCRBr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 13:01:47 -0400
Received: from crapouillou.net ([89.234.176.41]:36854 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgHCRBr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Aug 2020 13:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596474104; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=IHahTxqH5pJQsph2AgIZKKb59G/0qrY+uO1a0r6IFQQ=;
        b=u5qUlejNFsTbId8n+cwzby1MYQsmxrbPl5dEr2QJ6d1qoJetE+odh7OAw7lg3LjTZFTN1c
        1kvHDx6jTh8bMHdwXZ+Jkin7/w3hByNV/ioSPNx5PNg5qpNJThsXc2gQqnQwgB+LtR5YwX
        fsdpkDpDye10wHtF6tBfOk4YM/SJXhw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 00/13] MIPS: Convert Ingenic to a generic board
Date:   Mon,  3 Aug 2020 19:01:11 +0200
Message-Id: <20200803170124.231110-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas & list,

Here is a set of patches for 5.10 (no rush) to move Ingenic support from
arch/mips/jz4740/ to arch/mips/generic/.

There are some Kconfig changes that I think should be reviewed in detail
to avoid breakages elsewhere. The idea behind these changes is to allow
the Ingenic "generic" code to be built in a non-generic kernel, since
generic kernels bring lots of dependencies which result in a +7% size
increase.

Support for booting the generic kernel with a built-in and/or appended
devicetree, as well as support for compressed (vmlinuz) kernels, has
been added as well.

Cheers,
-Paul

Paul Cercueil (13):
  MIPS: cpu-probe: Set Ingenic's writecombine to _CACHE_CACHABLE_WA
  MIPS: cpu-probe: Mark XBurst CPU as having vtagged caches
  MIPS: cpu-probe: ingenic: Fix broken BUG_ON
  MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
  MIPS: machine: Add get_system_type callback
  MIPS: generic: Call the machine's .get_system_type callback if
    provided
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
 arch/mips/configs/gcw0_defconfig              |   2 +-
 arch/mips/configs/qi_lb60_defconfig           |   5 +-
 arch/mips/configs/rs90_defconfig              |   4 +-
 arch/mips/generic/Kconfig                     |   8 +-
 arch/mips/generic/Makefile                    |   2 +-
 arch/mips/generic/Platform                    |   1 +
 arch/mips/generic/board-ingenic.c             | 108 +++++++++++++
 arch/mips/generic/init.c                      |  28 +++-
 arch/mips/generic/proc.c                      |  25 ---
 arch/mips/include/asm/mach-generic/irq.h      |   2 +-
 .../asm/mach-jz4740/cpu-feature-overrides.h   |  50 ------
 arch/mips/include/asm/mach-jz4740/irq.h       |  13 --
 arch/mips/include/asm/machine.h               |   1 +
 arch/mips/include/asm/pgtable-bits.h          |   5 -
 arch/mips/{jz4740 => ingenic}/Kconfig         |  16 +-
 arch/mips/jz4740/Makefile                     |   9 --
 arch/mips/jz4740/Platform                     |   3 -
 arch/mips/jz4740/setup.c                      | 145 ------------------
 arch/mips/kernel/cpu-probe.c                  |   8 +-
 24 files changed, 198 insertions(+), 305 deletions(-)
 create mode 100644 arch/mips/generic/board-ingenic.c
 delete mode 100644 arch/mips/generic/proc.c
 delete mode 100644 arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/irq.h
 rename arch/mips/{jz4740 => ingenic}/Kconfig (91%)
 delete mode 100644 arch/mips/jz4740/Makefile
 delete mode 100644 arch/mips/jz4740/Platform
 delete mode 100644 arch/mips/jz4740/setup.c

-- 
2.27.0

