Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C0B25F022
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgIFTaE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:30:04 -0400
Received: from crapouillou.net ([89.234.176.41]:35696 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgIFTaB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420585; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T+mA6CdIialbdEw/Jj1NoajCxjCDwcIsx8+EvoIPNT8=;
        b=Dk/I2dnRZZeARyAHmtKYj5EyfP1IxJjePqFmFiZA042nOblAuTxSqAveU6zA60pPNryYJH
        lHnL2Z0muH62dnWgAS1AejFrUmeshA581tCOEvugZiDTrAoO9fbivM5miY70yM6nRTPv8O
        lVwjn/rPfejovTWFIMhytpkb4av/j6A=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 02/15] MIPS: cpu-probe: Set Ingenic's writecombine to _CACHE_CACHABLE_WA
Date:   Sun,  6 Sep 2020 21:29:22 +0200
Message-Id: <20200906192935.107086-3-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Previously, in cpu_probe_ingenic(), c->writecombine was set to
_CACHE_UNCACHED_ACCELERATED, but this macro was defined differently when
CONFIG_MACH_INGENIC was set. This made it impossible to support multiple
CPUs.

Address this issue by setting c->writecombine to _CACHE_CACHABLE_WA
directly and removing the dependency on CONFIG_MACH_INGENIC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2-v3: No change

 arch/mips/include/asm/pgtable-bits.h | 5 -----
 arch/mips/kernel/cpu-probe.c         | 3 ++-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index e26dc41a8a68..2362842ee2b5 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -249,11 +249,6 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
 
 #define _CACHE_CACHABLE_NONCOHERENT (5<<_CACHE_SHIFT)
 
-#elif defined(CONFIG_MACH_INGENIC)
-
-/* Ingenic uses the WA bit to achieve write-combine memory writes */
-#define _CACHE_UNCACHED_ACCELERATED (1<<_CACHE_SHIFT)
-
 #endif
 
 #ifndef _CACHE_CACHABLE_NO_WA
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index e2955f1f6316..a18f3611fa5e 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -2169,8 +2169,9 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 
 	/* XBurst®1 with MXU2.0 SIMD ISA */
 	case PRID_IMP_XBURST_REV2:
+		/* Ingenic uses the WA bit to achieve write-combine memory writes */
+		c->writecombine = _CACHE_CACHABLE_WA;
 		c->cputype = CPU_XBURST;
-		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		__cpu_name[cpu] = "Ingenic XBurst";
 		break;
 
-- 
2.28.0

