Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B921C231F
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 06:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgEBE4u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 00:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726058AbgEBE4t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 00:56:49 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77467C061A0C
        for <linux-mips@vger.kernel.org>; Fri,  1 May 2020 21:56:48 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x77so2581778pfc.0
        for <linux-mips@vger.kernel.org>; Fri, 01 May 2020 21:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XgJB8DtSdMC3UFhuj/Sd0LnnrydeAX5jTMtlOK8/DpU=;
        b=HFDDUeIR3431jVq0bgGcWEaqKvTWMY0mAEkjGooVIW934IZL19R9qJnPuA9oEMEJy0
         APLoIM488TjjQ2yXR6NJbLTGG0n1igOmrNziUpMIV9zVhu9jBeWTU4JUQN4pig/kRjkr
         1GeZINcCX7YE27ZLpGmd3rcR5Jctmro49F3MZPtTyqy4ihw9EDny3lrksgP+Relaw/NU
         5RyR2vA2sycUNb6NmdXbkIBzpI+Fx5Wf4MA/r2A5otcHy+YdI0V4kjRrM5sYFSONv6Mr
         jvy+WqUlQp/YJ+m5i1V3NTQ+JT22tXuOZfEIIXzuEF9m1Pgo3Dzcv4qRA1E2qCqzHY/w
         3ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=XgJB8DtSdMC3UFhuj/Sd0LnnrydeAX5jTMtlOK8/DpU=;
        b=ESpTs7HPed0jFUWQT4ouOgU6UmXuJmfn0pqyfTZPZSCKcpG3Je62rSJb08xq0aNbPW
         2Qg7tZhUbTNSFrYmAQjpsaEof63sFsSSs+ift7lyuhcHgAzpORai78pklKjuFYBta5lJ
         847c+jPxVRKJcWtu4DSS26NbCjG0BFuIA21pfoe2jaiMCUj94VRPZC7FZ15HZylixKtl
         gdmCQK0sC2C0y77YJvyoN8xUYjuN9uE86XJVaVmlzyzJU9j4oVTbn6ppNu4KW69atluf
         x4z28jvwYl3fr8AzUpDXhD++nEVo/k6kN2L8Le+SSRLvnvolTPYR2xVkih6cHrq82zU2
         +zFw==
X-Gm-Message-State: AGi0PuYNm/heZE5VSBsmkzdfwIrZeFNq7/IE84lirLxjHCRmf6Vl/iFw
        S9qvvH7u6zt3T4T78A0VDhg=
X-Google-Smtp-Source: APiQypLBZ6U08JEPzG4yJMy3gUN+sDK/MAIDcPca7Y8tKt1MycaDS5K3sTnxMi9Yv8I+bIMss7n+qQ==
X-Received: by 2002:aa7:9e07:: with SMTP id y7mr7466581pfq.257.1588395408081;
        Fri, 01 May 2020 21:56:48 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id b1sm3555402pfi.140.2020.05.01.21.56.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 May 2020 21:56:47 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V3 2/2] MIPS: Loongson-3: Calculate ra properly when unwinding the stack
Date:   Sat,  2 May 2020 12:55:44 +0800
Message-Id: <1588395344-5400-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
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
index b2a7975..3993554 100644
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

