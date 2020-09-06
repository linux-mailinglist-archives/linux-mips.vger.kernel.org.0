Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B10125F038
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgIFTbo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:31:44 -0400
Received: from crapouillou.net ([89.234.176.41]:36074 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726858AbgIFTbl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420598; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rEKyNfo45oGWfwAyWXYVakAaidQd5uH9fd/cmH2s8cY=;
        b=v662w+tuMPG02WOhLky+mqODR1WbURumu4wNoIrqTqyITRC/wI/y20SnPr2+iXbobyhgxN
        Bb06aAZwBu+JD7kMs2STpiYdXSGExzdHoIOaSCioV8eW3MvDI81hm/CqRfk8qiVKq5gWua
        cVyISMnzaNGg6bvTKG7HHtWjQpkAgsM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 13/15] MIPS: jz4740: Rename jz4740 folders to ingenic
Date:   Sun,  6 Sep 2020 21:29:33 +0200
Message-Id: <20200906192935.107086-14-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that all the jz4740 platform code has been removed, and we're left
with only a Kconfig and the cpu-feature-overrides.h file, finalize the
cleanup process by renaming the jz4740 and include/mach-jz4740 folders
to ingenic and include/mach-ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v3: New patch

 arch/mips/Kconfig                                               | 2 +-
 arch/mips/generic/Platform                                      | 2 +-
 .../asm/{mach-jz4740 => mach-ingenic}/cpu-feature-overrides.h   | 0
 arch/mips/{jz4740 => ingenic}/Kconfig                           | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/mips/include/asm/{mach-jz4740 => mach-ingenic}/cpu-feature-overrides.h (100%)
 rename arch/mips/{jz4740 => ingenic}/Kconfig (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 61e8d32eea1b..0e2895423c80 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1024,8 +1024,8 @@ source "arch/mips/bcm47xx/Kconfig"
 source "arch/mips/bcm63xx/Kconfig"
 source "arch/mips/bmips/Kconfig"
 source "arch/mips/generic/Kconfig"
+source "arch/mips/ingenic/Kconfig"
 source "arch/mips/jazz/Kconfig"
-source "arch/mips/jz4740/Kconfig"
 source "arch/mips/lantiq/Kconfig"
 source "arch/mips/pic32/Kconfig"
 source "arch/mips/pistachio/Kconfig"
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index 7d511fc28a01..f8ef2f9d107e 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -9,7 +9,7 @@
 #
 
 # Note: order matters, keep the asm/mach-generic include last.
-cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-jz4740
+cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-ingenic
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
diff --git a/arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h
rename to arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/ingenic/Kconfig
similarity index 100%
rename from arch/mips/jz4740/Kconfig
rename to arch/mips/ingenic/Kconfig
-- 
2.28.0

