Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B08224F800
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 11:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgHXJY0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 05:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbgHXJYY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Aug 2020 05:24:24 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB585C061573
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2020 02:24:23 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id g6so2001325pjl.0
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2020 02:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0sZaz/VyycuoChmF6tm3frTdEvnNpUVNY3yIXV61ue8=;
        b=tLJJyDXNj8q3l725W6RKZQSBQ8FPEejYaE8AyRfhOea+oa72TpVoDkp2MyD4/8Bns4
         hXxQhjfvx/c3IVOxhv9GTdLdPaGLfnRX1gAwUgZjoC7c6aLG5GgKck90mtGGI5tKQbWO
         fRR0cqAM0+wbBvQyJ6ZsMs7vr+AU1G1+j7dghxMvP2KX4GslrGC2PYTcv5/JhYee3wXo
         2M226V18lhx5Bto8k8Bm1mbnkUHPpvbDjFebQlC//EShUx2PLIqkr2L1doPosz1lBcCV
         5ihObmkc+VcBg0yJKricRNnpmv3OmAMR1t2+qjPonZOpPtexqqKWULtW1AI4XiSFTDlQ
         gkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=0sZaz/VyycuoChmF6tm3frTdEvnNpUVNY3yIXV61ue8=;
        b=SER1B0RAoFfidx8o8gjEyl0ia/5PAA+akfUX+03e/H48z4xkbPMuw2zCJcCOWuYaes
         Im2LPKhN0Uj3Cl+6XRhALuG+lVckD1PLY++/q0/wyxiMtPsPuTicjyNHj6xC5vwTRcgU
         Bz4d5pA6FoEi9p6O2l2ikz7p6VWnY86V+cwgXaSWVj/1fYLJvD70I7SFG3WxnUwqjLkg
         +8DNJsYUZCdlY3iY9+Xo5WZvgkRpZQBHwFH5gFYCKT7IppesU5FFu5+Lbi0Cg5+mRASP
         pM8Yb6jzCgCbsHt4/JHYm6UgjlXRzXIK7ckXJQRuQj1QaOuFBgKo0o8LmegNXRKJcp3K
         4FAA==
X-Gm-Message-State: AOAM53004yq82IPsKgNrB+zSF6th8PUdzbLNb/p9+Svqwwkz0eaZ5TBP
        jUjW7q5fRJAK5uoaaTM5STY=
X-Google-Smtp-Source: ABdhPJwGdFpotcmFT6hIIyNH31Qn9lFoF1orJ+IB/DI/R8nL3ojmi/ZiUytPtefY0LFNu1G1rOWjHw==
X-Received: by 2002:a17:902:8bcb:: with SMTP id r11mr3149623plo.65.1598261062865;
        Mon, 24 Aug 2020 02:24:22 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id gz7sm9230808pjb.45.2020.08.24.02.24.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2020 02:24:22 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V4 2/2] MIPS: Loongson-3: Calculate ra properly when unwinding the stack
Date:   Mon, 24 Aug 2020 17:27:17 +0800
Message-Id: <1598261237-21342-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1598261237-21342-1-git-send-email-chenhc@lemote.com>
References: <1598261237-21342-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson-3 has 16-bytes load/store instructions: gslq and gssq. This
patch calculate ra properly when unwinding the stack, if ra is saved
by gssq and restored by gslq.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/process.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 9412314..c4e9fd8 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -279,7 +279,21 @@ static inline int is_ra_save_ins(union mips_instruction *ip, int *poff)
 		*poff = ip->i_format.simmediate / sizeof(ulong);
 		return 1;
 	}
-
+#ifdef CONFIG_CPU_LOONGSON64
+	if ((ip->loongson3_lswc2_format.opcode == swc2_op) &&
+		      (ip->loongson3_lswc2_format.ls == 1) &&
+		      (ip->loongson3_lswc2_format.fr == 0) &&
+		      (ip->loongson3_lswc2_format.base == 29)) {
+		if (ip->loongson3_lswc2_format.rt == 31) {
+			*poff = ip->loongson3_lswc2_format.offset << 1;
+			return 1;
+		}
+		if (ip->loongson3_lswc2_format.rq == 31) {
+			*poff = (ip->loongson3_lswc2_format.offset << 1) + 1;
+			return 1;
+		}
+	}
+#endif
 	return 0;
 #endif
 }
-- 
2.7.0

