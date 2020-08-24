Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D8A24F337
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 09:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgHXHks (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 03:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgHXHkq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Aug 2020 03:40:46 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01422C061573
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2020 00:40:46 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v16so3827647plo.1
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2020 00:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=SWHMn/zd8YAUkxx9TFRCQo/VuqA/MuRQerGJlATWBrE=;
        b=DcbYlXDWIBDX+J+ZKNza+BViFpAlDP94K3v0EGA+HnLMKcs3YKgplGC2Y3btUTdwwz
         PO7JWT8KCHo0ihECUBDQFR4+cmAWI3BS+y4H75UD2Mk/UwxDvtgJ3rkpGf/ZsINReLpv
         GW1Qg8xHGx+xVVG4OBf1XrlV6ShypN1F4ILtvM2rjbPT9697088lcbetwxbo9tZP/mm2
         eFNMtnVhwOjiSRYP8TA+FZWLds81SrdyAt65zeigWtZcftKUglww8Um2ox7XazD/bebW
         8veZAk4hayyErUlyrOGTG7uDUPDvEkEKLxmq/4R0e5r/Enxy9nXQzunBdBWxLKIMYxB1
         rbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=SWHMn/zd8YAUkxx9TFRCQo/VuqA/MuRQerGJlATWBrE=;
        b=ACKtK4mAMYH9b9trQuzsJ8jl5zCoZ8ibkiUZ/v7Zbv39Z9HUaJKQZF3QQnUbjfxunK
         Lg6U51PKhzDe0jm0BxywDVB0kbD5yr3dwolPX929k7Be1yCOpBgj64oWfs+CBKFLERFd
         f9l7kXDOWg1VPsDpMyabrp7LOmqJqxsovLP6cKVX29N3ppeHHHtD/3ZNtIwpMmBL7u37
         MumFo0SUN1Ucbqq1podYKjgYJxCzqxewYpuyW4EeGAYcOnX5o8yQhDRvx/L9mfrlCsdZ
         bmmm7XGUyUDxqLJZ4Zta3bQsbamSQIzVveVmBWlDTV0yiUlPYWFC0ab2TBhkWWKojeji
         Slyg==
X-Gm-Message-State: AOAM533berR4B8deCE7JJ5wBXvrlri7TIWHpixhhNse66A+yz77ilv2B
        sq4neE9L1gSAUwuUw3wJ38B9FxP6nEuxWmGM
X-Google-Smtp-Source: ABdhPJz29QLZUIpJhULyvASlvCLcXbphuzcCWO7eBDpCWzKBKHmoeG7jLMhDza7QVi5Ew1i6+yIuHg==
X-Received: by 2002:a17:90a:8d0b:: with SMTP id c11mr3781249pjo.196.1598254845511;
        Mon, 24 Aug 2020 00:40:45 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id v18sm6620908pfu.15.2020.08.24.00.40.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2020 00:40:45 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Pei Huang <huangpei@loongson.cn>
Subject: [PATCH] MIPS: Loongson-3: Fix fp register access if MSA enabled
Date:   Mon, 24 Aug 2020 15:44:03 +0800
Message-Id: <1598255043-11839-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If MSA is enabled, FPU_REG_WIDTH is 128 rather than 64, then get_fpr64()
/set_fpr64() in the original unaligned instruction emulation code access
the wrong fp registers. This is because the current code doesn't specify
the correct index field, so fix it.

Fixes: f83e4f9896eff614d0f2547a ("MIPS: Loongson-3: Add some unaligned instructions emulation")
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Pei Huang <huangpei@loongson.cn>
---
 arch/mips/loongson64/cop2-ex.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/mips/loongson64/cop2-ex.c b/arch/mips/loongson64/cop2-ex.c
index f130f62..00055d4 100644
--- a/arch/mips/loongson64/cop2-ex.c
+++ b/arch/mips/loongson64/cop2-ex.c
@@ -95,10 +95,8 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 			if (res)
 				goto fault;
 
-			set_fpr64(current->thread.fpu.fpr,
-				insn.loongson3_lswc2_format.rt, value);
-			set_fpr64(current->thread.fpu.fpr,
-				insn.loongson3_lswc2_format.rq, value_next);
+			set_fpr64(&current->thread.fpu.fpr[insn.loongson3_lswc2_format.rt], 0, value);
+			set_fpr64(&current->thread.fpu.fpr[insn.loongson3_lswc2_format.rq], 0, value_next);
 			compute_return_epc(regs);
 			own_fpu(1);
 		}
@@ -130,15 +128,13 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 				goto sigbus;
 
 			lose_fpu(1);
-			value_next = get_fpr64(current->thread.fpu.fpr,
-					insn.loongson3_lswc2_format.rq);
+			value_next = get_fpr64(&current->thread.fpu.fpr[insn.loongson3_lswc2_format.rq], 0);
 
 			StoreDW(addr + 8, value_next, res);
 			if (res)
 				goto fault;
 
-			value = get_fpr64(current->thread.fpu.fpr,
-					insn.loongson3_lswc2_format.rt);
+			value = get_fpr64(&current->thread.fpu.fpr[insn.loongson3_lswc2_format.rt], 0);
 
 			StoreDW(addr, value, res);
 			if (res)
@@ -204,8 +200,7 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 			if (res)
 				goto fault;
 
-			set_fpr64(current->thread.fpu.fpr,
-					insn.loongson3_lsdc2_format.rt, value);
+			set_fpr64(&current->thread.fpu.fpr[insn.loongson3_lsdc2_format.rt], 0, value);
 			compute_return_epc(regs);
 			own_fpu(1);
 
@@ -221,8 +216,7 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 			if (res)
 				goto fault;
 
-			set_fpr64(current->thread.fpu.fpr,
-					insn.loongson3_lsdc2_format.rt, value);
+			set_fpr64(&current->thread.fpu.fpr[insn.loongson3_lsdc2_format.rt], 0, value);
 			compute_return_epc(regs);
 			own_fpu(1);
 			break;
@@ -286,8 +280,7 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 				goto sigbus;
 
 			lose_fpu(1);
-			value = get_fpr64(current->thread.fpu.fpr,
-					insn.loongson3_lsdc2_format.rt);
+			value = get_fpr64(&current->thread.fpu.fpr[insn.loongson3_lsdc2_format.rt], 0);
 
 			StoreW(addr, value, res);
 			if (res)
@@ -305,8 +298,7 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 				goto sigbus;
 
 			lose_fpu(1);
-			value = get_fpr64(current->thread.fpu.fpr,
-					insn.loongson3_lsdc2_format.rt);
+			value = get_fpr64(&current->thread.fpu.fpr[insn.loongson3_lsdc2_format.rt], 0);
 
 			StoreDW(addr, value, res);
 			if (res)
-- 
2.7.0

