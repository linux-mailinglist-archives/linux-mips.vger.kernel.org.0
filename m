Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0496B25F741
	for <lists+linux-mips@lfdr.de>; Mon,  7 Sep 2020 12:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbgIGKHM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Sep 2020 06:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbgIGKHL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Sep 2020 06:07:11 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92263C061573
        for <linux-mips@vger.kernel.org>; Mon,  7 Sep 2020 03:07:09 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w7so8400505pfi.4
        for <linux-mips@vger.kernel.org>; Mon, 07 Sep 2020 03:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VairmXzYfCn1dnkA9xHTGhcEUlhFriElxDnD3N6Npyk=;
        b=kZL1jrnXQybAz0DFEyRqvosZgx+OlBeXHfD9ESKIiCg+fvLLIP4+mMomZBlmqmZ0rp
         ZpMcHGLHpPYGqfUb9a++dR/aBRClhdNzbeZelcaiObMC6dxuRKEkBgmWyzKo2i5uUqtH
         3PliAib18mRn7uOIPMEv/UkyYD7jk1na5lV5fQX3jD3HzyFOrqBttedzyGHoI1y+vgN7
         hFriYQUI5Wt4OtRiEX+9clDYe7i4W91bQeTR6ZGhKkCBJaVJ+1JKGQwZTbIg3PnUXW73
         kewQZvl89M8L3AEDwls+C8H5+flz3UGdARF87MHw3G6d++Ke2DALwVXHs6HtRWaBQOdA
         dWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=VairmXzYfCn1dnkA9xHTGhcEUlhFriElxDnD3N6Npyk=;
        b=pbNl+OghjW+XqVvtCzhTEVWCjNS5gYDADlJuHz6zsxaUU9rNLnWZrrf1EgVvbu6nOg
         oa76flhSXY5i0SL57Sha5OMf1lmprz+cdk+L71ZrBkZkK+VStKh23QP/+GQ3Cm7RUgDQ
         gvaf2WdMVVGrX/abjRjwy9VAvj3UWH8CKQPANP7Y4HsSzf7srfTMacEc/oE0uSbsIsjA
         UrHxNqv/jHICKx66UQA3hplUUiJpElch/nuNSMl5ZSPsIbjvLXYSeMmRlUyOoaJHCG3K
         WuZ1gEzoH4nce5NEw5MwDIjRRC+48GbeqQbImIxQsrbcei2kqzQ+RlEr1ddEPIXooNhh
         EnJg==
X-Gm-Message-State: AOAM530GJpqVk3Q8nh3Hy6TiXK06WY/yK+qAYcRJ/9AdMJeGbMUBnnV3
        lqO0DuPzoxvgjLjqIkJ7sgc=
X-Google-Smtp-Source: ABdhPJwpIy2VNGmFztGduNWanNgGnPa/nGXENVHb6xLjwigS3KIfiL7NaZiSXwY/bjWangsK0qXOQg==
X-Received: by 2002:a63:2a96:: with SMTP id q144mr16827351pgq.447.1599473229155;
        Mon, 07 Sep 2020 03:07:09 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id 64sm7992238pgi.90.2020.09.07.03.07.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:07:08 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V6 3/3] MIPS: Loongson-3: Calculate ra properly when unwinding the stack
Date:   Mon,  7 Sep 2020 18:06:09 +0800
Message-Id: <1599473169-6599-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1599473169-6599-1-git-send-email-chenhc@lemote.com>
References: <1599473169-6599-1-git-send-email-chenhc@lemote.com>
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
index b36297e..37f05c8 100644
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

