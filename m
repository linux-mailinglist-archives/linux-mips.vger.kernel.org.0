Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0917A300128
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 12:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbhAVLFr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 06:05:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:54416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728253AbhAVLDw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 06:03:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D93002376F;
        Fri, 22 Jan 2021 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611313391;
        bh=c1ltoVhdYo2mnapWxvPYgwklFq//YU8QypVWjUHCFgY=;
        h=From:To:Cc:Subject:Date:From;
        b=uzaO3R2V7hJkNpOhxfKXrMFjoFljCLJRaQ1EeUqzMwcaDHGTDLKz4zNrHlL09wXVt
         JLuMKJwyLJc6Y4uyD+pvTY4XvnhnySmRzNdlM7OxbYKM6b8vMd/G1Wo2YCqYuxBayB
         eZN+cL8yBEWq83+2QWcQLqXKXwZo2Dd3tJWsYm7tMxQmhsrOZNKf9XPmPcSmAxpRoM
         x6Z7w4vjaAbUBWD+rYXzcdCd2s4+JYH7njGLQMgaOSwi/duNpbk+o7WfFiODx/njoJ
         /uPEiE/XuT9IncHW2i+mMT25U2RWJ1jucN99PdZBDdlGCZBwj7oBOMuNzqWr63MK0j
         coNsHCkxCrGKA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: jazz: always allow little-endian builds
Date:   Fri, 22 Jan 2021 12:02:50 +0100
Message-Id: <20210122110307.934543-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The kernel test robot keeps reporting the same bug when it
shows up in new files after random unrelated patches:

In file included from arch/mips/include/uapi/asm/byteorder.h:13,
                 from arch/mips/include/asm/bitops.h:20,
                 from include/linux/bitops.h:26,
                 from include/linux/kernel.h:12,
                 from include/linux/clk.h:13,
                 from drivers/base/regmap/regmap-mmio.c:7:
include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
    8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
      |  ^~~~~~~
drivers/base/regmap/regmap-mmio.c: In function 'regmap_mmio_gen_context':
>> drivers/base/regmap/regmap-mmio.c:274:2: error: duplicate case value
  274 |  case REGMAP_ENDIAN_NATIVE:
      |  ^~~~
drivers/base/regmap/regmap-mmio.c:246:2: note: previously used here
  246 |  case REGMAP_ENDIAN_NATIVE:

The problem is that some randconfig builds end up on the MIPS jazz
platform with neither CONFIG_CPU_BIG_ENDIAN nor CONFIG_CPU_LITTLE_ENDIAN
because no specific machine is selected. As it turns out, all jazz
machines support little-endian kernels, so this can simply be allowed
globally.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
The configuration used by lkp here showed two other unrelated bugs,
one of which I'm addressing in another patch. The one I'm not
addressing is that 32-bit JAZZ with hugepages and 4K pages triggers
BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)).
---
 arch/mips/Kconfig      | 1 +
 arch/mips/jazz/Kconfig | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2000bb2b0220..e6bd1eee70f2 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -406,6 +406,7 @@ config MACH_JAZZ
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_100HZ
+	select SYS_SUPPORTS_LITTLE_ENDIAN
 	help
 	  This a family of machines based on the MIPS R4030 chipset which was
 	  used by several vendors to build RISC/os and Windows NT workstations.
diff --git a/arch/mips/jazz/Kconfig b/arch/mips/jazz/Kconfig
index 06838f80a5d7..42932ca98db9 100644
--- a/arch/mips/jazz/Kconfig
+++ b/arch/mips/jazz/Kconfig
@@ -3,7 +3,6 @@ config ACER_PICA_61
 	bool "Support for Acer PICA 1 chipset"
 	depends on MACH_JAZZ
 	select DMA_NONCOHERENT
-	select SYS_SUPPORTS_LITTLE_ENDIAN
 	help
 	  This is a machine with a R4400 133/150 MHz CPU. To compile a Linux
 	  kernel that runs on these, say Y here. For details about Linux on
@@ -15,7 +14,6 @@ config MIPS_MAGNUM_4000
 	depends on MACH_JAZZ
 	select DMA_NONCOHERENT
 	select SYS_SUPPORTS_BIG_ENDIAN
-	select SYS_SUPPORTS_LITTLE_ENDIAN
 	help
 	  This is a machine with a R4000 100 MHz CPU. To compile a Linux
 	  kernel that runs on these, say Y here. For details about Linux on
@@ -26,7 +24,6 @@ config OLIVETTI_M700
 	bool "Support for Olivetti M700-10"
 	depends on MACH_JAZZ
 	select DMA_NONCOHERENT
-	select SYS_SUPPORTS_LITTLE_ENDIAN
 	help
 	  This is a machine with a R4000 100 MHz CPU. To compile a Linux
 	  kernel that runs on these, say Y here. For details about Linux on
-- 
2.29.2

