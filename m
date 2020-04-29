Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9063F1BD874
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 11:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgD2Jjb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 05:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726456AbgD2Jja (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 05:39:30 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0219C03C1AD
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2020 02:39:30 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a7so547466pju.2
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2020 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tc5PkCn7Dj5BWeN0h+WR3VTXGDNTcDZxVOy5zzY0udg=;
        b=siqDia8MX+8FQ58gB/sCND5dzm3deebrAwtbLHXe20vzvDh9r+iBbJnx+mt/RSCXjS
         vd1pnCvtlwnvbXX8WdTnmfmWcZnH/cvk5ZWw3hnZHNMuYHhPLodVLyoE6+bPSuo5cWFL
         pj3zHSFr2r2OOtkuj05i4s07Svsj8aLR59I0vHCNPimeyLz9IeL1wJTcfxKP1Z2wth2B
         Z0jIBAn5t5vRKfDr+DRIAk6YheQcyS0uzON+gM4370dF+1ZtpUWu7IVSqc0RvHYOE0Dr
         eaHHhyVH/I9ILgiJKPTsExlfA0b/999mvVZ4szVXP/85a/wiUm8o8KudBPnPRJIqezzk
         iNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=tc5PkCn7Dj5BWeN0h+WR3VTXGDNTcDZxVOy5zzY0udg=;
        b=bHPG1k6XTCTW1RnksOHamQxQ1yHULddvm7MXT1vRffFq8XYn41VOivoPnSAKsq5+12
         gHOfxjJm/ayZrjsqxyEvaLEsecOKuyWxFg6W/MuOlCKwGI3CJJUWz9JmkXk4g2tc95V5
         jYe1/7YgSS3iBAIM4CEJoPGKyWwbiYIOHDcK3e4TteLFU2uoUpgTHdAfbezlrDtRKQ3W
         PBOupq7Mp99tC53WhHfdmzQmVLBRyAWGZ/8P4vHh3nBDxN4/QvZwMJ98nyFOGBlBFWmD
         9Nc0A3KxsU23dQwtIIfAf6Fku/pMcXEW1YpC+uJ0e7vR/7tFtinayYvJ1N7uvwfA5YFk
         vWew==
X-Gm-Message-State: AGi0PuaGI1RKPTr7Sd1t7v7Ov2GHvoEKJIOQLIysgykae1a4QfhXBj8p
        08iftaOB2TvzioSDpVp0JMw=
X-Google-Smtp-Source: APiQypJYdzJEK9TJysGpigYQ89xnlWQlm8QJS3KF8c1cH8Akm9Gjs6UocP7IilPyOUXssPeg57YzMw==
X-Received: by 2002:a17:90a:1a46:: with SMTP id 6mr2095768pjl.111.1588153170246;
        Wed, 29 Apr 2020 02:39:30 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id v133sm709251pfc.113.2020.04.29.02.39.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2020 02:39:29 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 2/2] MIPS: Loongson-3: Calculate ra properly when unwinding the stack
Date:   Wed, 29 Apr 2020 17:38:41 +0800
Message-Id: <1588153121-28507-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1588153121-28507-1-git-send-email-chenhc@lemote.com>
References: <1588153121-28507-1-git-send-email-chenhc@lemote.com>
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
index b2a7975..be79218 100644
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

