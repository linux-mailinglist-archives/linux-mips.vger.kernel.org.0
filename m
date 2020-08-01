Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2E823530A
	for <lists+linux-mips@lfdr.de>; Sat,  1 Aug 2020 17:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgHAPoI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Aug 2020 11:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbgHAPoI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Aug 2020 11:44:08 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A230AC06174A
        for <linux-mips@vger.kernel.org>; Sat,  1 Aug 2020 08:44:07 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r4so27498274wrx.9
        for <linux-mips@vger.kernel.org>; Sat, 01 Aug 2020 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bHLK3Bi2pP1Ho8FYARp1XSE1OBWnsfktZ5SO7At57/I=;
        b=g8Ye2aPQKqQH+YwwhmifxE1BHkHX2VnLTTY0oW2bNalVJgjmhPHNSLHSzmYc+9yL6p
         yYlR/1wBvBeOTEiSfSGJa340zr4N4mRwr9oNTxMiv9Mxxaevk1svi/myS56x4w78t5YN
         cvsF8StXj35pbJkrWwgpBYjdpWroOiF+tBSPvK66bTZxHzdbSz/JIGCHpfJbWxlObii8
         tOorR6E9CdsChU11pqmpQ7N40CUsLnqO3LseTdeALkxLbdy3gIf9XElzsJlkANwHYSRg
         iODUHTH9PadwPElJ4pCrd/IJfYyBGzDMw9CGVr6INl5DT2Hj+WDvmPWetK/90UjGUrXj
         0BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bHLK3Bi2pP1Ho8FYARp1XSE1OBWnsfktZ5SO7At57/I=;
        b=Ygetj890ZJbQtoRLFwon77/V9zAPBnUL+sEPcs5/cTS1/6rgZlOApmeLJiaapbbvst
         Q+Jwwm4QhNZLBz1u1iE0hYzO0WH6WP2hCo3d/MCTxDS4XUXZlLC1VoyWhdwyP6yLz310
         75wt3vE5B0FbdrvwdTOlZ9uZmEObD8PBb34QCM4+B5YLYPXUUpQaWhhYHj4S6yxgsdBH
         8PD6vPbFKtl8bEoCF/20xIDbiQdYoPdir8WDikOlKfAKV49mtg2qdh7LNkTMCVbtJLCB
         lnOWyd/J4uzfc3xSHbygOVnVZJY0Ghm+z2m8o1KSTZDTxn4CjTx7W6yI1gc1GVgVWKO3
         GZgw==
X-Gm-Message-State: AOAM530YSO9oSbk7BtBbwRG6UdDPNBFF8bNkYKa3VsQjzDRUnshl7Rxo
        xqSpy8Pb0kwEN1DfZ+NJMB3fgxMm
X-Google-Smtp-Source: ABdhPJxIdTcXpgvn4m/0wcc7mml5pQpyW03wdADbx5tWzLZ5eECKotOaZmaWXryvfNb2snoN8nqQzQ==
X-Received: by 2002:adf:f388:: with SMTP id m8mr8201767wro.338.1596296644729;
        Sat, 01 Aug 2020 08:44:04 -0700 (PDT)
Received: from localhost.localdomain (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
        by smtp.gmail.com with ESMTPSA id o10sm16398780wrw.79.2020.08.01.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 08:44:04 -0700 (PDT)
From:   Romain Naour <romain.naour@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Romain Naour <romain.naour@gmail.com>
Subject: [PATCHv3] mips: Do not include hi and lo in clobber list for R6
Date:   Sat,  1 Aug 2020 17:44:01 +0200
Message-Id: <20200801154401.4177009-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From [1]
"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
available to be present in the clobber list anymore, resulting in build failure
for mips*r6 targets in form of:
...
.../sysdep.h:146:2: error: the register ‘lo’ cannot be clobbered in ‘asm’ for the current target
  146 |  __asm__ volatile (      \
      |  ^~~~~~~

This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
This patch provides the alternative clobber list for r6 targets that won't include
those registers."

Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
for mips r6 cpus with gcc 10 for the same reason as glibc.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3 Avoid duplicate code (Maciej W. Rozycki)
v2 use MIPS_ISA_REV instead of __mips_isa_rev (Alexander Lobakin)
---
 arch/mips/include/asm/vdso/gettimeofday.h | 30 +++++++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
index c63ddcaea54c..93008551282e 100644
--- a/arch/mips/include/asm/vdso/gettimeofday.h
+++ b/arch/mips/include/asm/vdso/gettimeofday.h
@@ -35,7 +35,11 @@ static __always_inline long gettimeofday_fallback(
 	: "=r" (ret), "=r" (error)
 	: "r" (tv), "r" (tz), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+	  "$14", "$15", "$24", "$25",
+#if MIPS_ISA_REV < 6
+	  "hi", "lo",
+#endif
+          "memory");
 
 	return error ? -ret : ret;
 }
@@ -59,7 +63,11 @@ static __always_inline long clock_gettime_fallback(
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+	  "$14", "$15", "$24", "$25",
+#if MIPS_ISA_REV < 6
+	  "hi", "lo",
+#endif
+	  "memory");
 
 	return error ? -ret : ret;
 }
@@ -83,7 +91,11 @@ static __always_inline int clock_getres_fallback(
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+	  "$14", "$15", "$24", "$25",
+#if MIPS_ISA_REV < 6
+	  "hi", "lo",
+#endif
+	  "memory");
 
 	return error ? -ret : ret;
 }
@@ -105,7 +117,11 @@ static __always_inline long clock_gettime32_fallback(
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+	  "$14", "$15", "$24", "$25",
+#if MIPS_ISA_REV < 6
+	  "hi", "lo",
+#endif
+	  "memory");
 
 	return error ? -ret : ret;
 }
@@ -125,7 +141,11 @@ static __always_inline int clock_getres32_fallback(
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+	  "$14", "$15", "$24", "$25",
+#if MIPS_ISA_REV < 6
+	  "hi", "lo",
+#endif
+	  "memory");
 
 	return error ? -ret : ret;
 }
-- 
2.25.4

