Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1201B8F2F
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 13:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgDZLAh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 07:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726119AbgDZLAh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 07:00:37 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7ACC061A0C
        for <linux-mips@vger.kernel.org>; Sun, 26 Apr 2020 04:00:37 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id fu13so5477205pjb.5
        for <linux-mips@vger.kernel.org>; Sun, 26 Apr 2020 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=GlOyPyPfRjTvez5ZkorKH5ft3Et6+ySp+Q2Ucq9SL78=;
        b=NosADfr9GqJxVHsH7Ct6unS9X0dRH665PJl0ZU0fjKg/lxf2vkhM4saw3n+y8xp41c
         MlfWccgPMXM3o0mpowm2jIfS/HQhRk7FtVWsabLyIDVtEdjOY7o7nkE1JB5tFOd1wuFA
         2nqXckH3k8ptmKDHcbEkNcddC+NJrkdbwycPdtC3Jub0CswqLJ4eoFTD0mkoIdb8Q6sp
         LqsdJYJRdMr8EYj23xS/Smbb+/jwPrfsNeE8jVChN1qSqBea616N5vCsrHcqLdLewYvg
         rF0i3XLkJI99mzqsEQDW62UpWCghObrCf2xloxafl/ljQvWunjkq9gyShtpkvu6BSDKF
         zB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=GlOyPyPfRjTvez5ZkorKH5ft3Et6+ySp+Q2Ucq9SL78=;
        b=dccycupvhKExja94Ya4zK8CBlkEonOAY849Ct7MEjaDLlizZ4eTYN1VGbSXfGl3j+9
         3zh3r7tQaXdCnyDjsYalq37d4r94kyG4e+zWsblO/Z9sPpA3WMKO8scxVr78VWO0Pi31
         NF2IwkwT54KiApBEefPM0UbeOSGloLieUbZ+NzVEHs9uxO7tp9tlfN3ekHeYUN73UQQY
         CBhiU9x4WYofTxFe9gSvbsKaWOrULKsfCdeF4XYds4+BjEq8nl3NOCBh5RiajUOZhnPV
         0Pk5kSx5YdzCduGSB6ufhcldvHJ+4e4Z4vJh8YKJnciFgT5S7DD90qE7XLKRvNFoadr8
         b3WQ==
X-Gm-Message-State: AGi0Pubu5Yrn1PurwP5B8HW5LNwx7g4hiE/1lhZaVaB1o6VxP3ZVa+56
        4HSMpnK72NAz3YnzHgHo6cE=
X-Google-Smtp-Source: APiQypI/XuICgGBBlfF0MWg3690wSuis34g6f8HFaoMyWe0balMJ4S6RdoNH9HrZrsxvJvudIYgkkw==
X-Received: by 2002:a17:902:8f89:: with SMTP id z9mr18663575plo.2.1587898836713;
        Sun, 26 Apr 2020 04:00:36 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id b1sm9647405pfa.202.2020.04.26.04.00.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Apr 2020 04:00:36 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: Rename the "Fill" cache ops to avoid build failure
Date:   Sun, 26 Apr 2020 19:09:52 +0800
Message-Id: <1587899392-10579-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS define a "Fill" macro as a cache operation in cacheops.h, this
will cause build failure under some special configurations because in
seq_file.c there is a "Fill" label. To avoid this failure we rename the
"Fill" macro to "Fill_I" which has the same coding style as other cache
operations in cacheops.h (we think renaming the "Fill" macro is more
reasonable than renaming the "Fill" label).

Callers of "Fill" macro is also updated.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/cacheops.h   | 2 +-
 arch/mips/mm/c-r4k.c               | 2 +-
 arch/mips/pmcs-msp71xx/msp_setup.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/cacheops.h b/arch/mips/include/asm/cacheops.h
index 8031fbc..50253ef 100644
--- a/arch/mips/include/asm/cacheops.h
+++ b/arch/mips/include/asm/cacheops.h
@@ -48,7 +48,7 @@
  * R4000-specific cacheops
  */
 #define Create_Dirty_Excl_D		(Cache_D | 0x0c)
-#define Fill				(Cache_I | 0x14)
+#define Fill_I				(Cache_I | 0x14)
 #define Hit_Writeback_I			(Cache_I | Hit_Writeback)
 #define Hit_Writeback_D			(Cache_D | Hit_Writeback)
 
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 36a3113..89b6839 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1049,7 +1049,7 @@ static inline void rm7k_erratum31(void)
 			"cache\t%1, 0x3000(%0)\n\t"
 			".set pop\n"
 			:
-			: "r" (addr), "i" (Index_Store_Tag_I), "i" (Fill));
+			: "r" (addr), "i" (Index_Store_Tag_I), "i" (Fill_I));
 	}
 }
 
diff --git a/arch/mips/pmcs-msp71xx/msp_setup.c b/arch/mips/pmcs-msp71xx/msp_setup.c
index d1e59ce..e0f20f4 100644
--- a/arch/mips/pmcs-msp71xx/msp_setup.c
+++ b/arch/mips/pmcs-msp71xx/msp_setup.c
@@ -55,7 +55,7 @@ void msp7120_reset(void)
 
 	for (iptr = (void *)((unsigned int)start & ~(L1_CACHE_BYTES - 1));
 	     iptr < end; iptr += L1_CACHE_BYTES)
-		cache_op(Fill, iptr);
+		cache_op(Fill_I, iptr);
 
 	__asm__ __volatile__ (
 		"startpoint:					\n"
-- 
2.7.0

