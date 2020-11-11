Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452CC2AE6F8
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 04:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgKKDVO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 22:21:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgKKDVO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 22:21:14 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A21C0613D1
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2020 19:21:13 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id i39so324732qtb.1
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2020 19:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=IdlC5wqSkRhZShxcvJ+y95nrehDlV8OQP0epQPlLIWE=;
        b=EnKewTgXgaSmoXfD2a9BEb8tDZsMGoDM2tsiIT2kYkvgoP8RtYZO1rS8PjbwpoDQ8K
         63CTVypmu2ZzuJxL9+skXcx1SoGutWmgCRAZ0IWyuEIPRlTfdtvCzi4scaItAz3ECsKQ
         PYJG0Rsypx/Ae3CAfyEh9FohjtAIcxQIwlJTMbuXFJ6W2npYKCclkQUjEhl+GlxjZxJc
         VpnJpPZqfWZuKHS8ED/93KgooKWWysMkNbtBdETUs5NQNf4YsgYXza0/0E33+GmOMqr/
         b5XIupgOVfSiP8RUufaeXfd9qfSNtALrClk/mMMwMCBDcZoRbfuCBW1rvm72WuOE992p
         N3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=IdlC5wqSkRhZShxcvJ+y95nrehDlV8OQP0epQPlLIWE=;
        b=E5WU9v1zckZ8Gqp7WEvKy9T1z7mFROvSt/zVGYuFp6cSCCM8utV7HOZzEAyxaR8smA
         aSrYAyu5D2Wi0GNxv2eFCVkNeZswt8jW/Tut02B5/1+JdXJ3rog0/ZJ6x++fBKt28K86
         FtWig99Kc9Q730skMP0GrkSvDO4vnRq4uBPH4tRLVdFUSNO852xLLgDz1gwXr2QmNn/y
         5fjjaaXdeoELOXBSb6MtIJMVDOl/GzZNByq5OH+7v45ohEZTPUHAmElntVZqin7pg2K4
         kW07tcWGcnYakvysfNRi7bFpej/xqMx0Eclj8hRJsYeI2c2jLFXZBO+HSVIFWFyLnr0X
         tK6Q==
X-Gm-Message-State: AOAM530Sbn+YvlDqlq+mxf/guXJ36mV73sl4cnfB1xiUun/hFkiNJTrH
        KsoVZjQ7xXrd1i+LQkVFMAKkdsMVciVmGKN26J0=
X-Google-Smtp-Source: ABdhPJwfi/IPPyVyY2ehAk2JNOjzoYo1jE6HGXvUT6R0y6gvsnnmjdrsGg/IPL8zpcxlHOOpixPJDocBuLvelyjj4/8=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:612:: with SMTP id
 z18mr5959926qvw.41.1605064873065; Tue, 10 Nov 2020 19:21:13 -0800 (PST)
Date:   Tue, 10 Nov 2020 19:21:05 -0800
Message-Id: <20201111032105.2346303-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
Subject: [PATCH] MIPS: remove GCC < 4.9 support
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove a tautology; since
commit 0bddd227f3dc ("Documentation: update for gcc 4.9 requirement")
which raised the minimally supported version of GCC to 4.9, this case is
always true.

Link: https://github.com/ClangBuiltLinux/linux/issues/427
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/mips/include/asm/compiler.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/compiler.h b/arch/mips/include/asm/compiler.h
index a2cb2d2b1c07..2b06090a78b2 100644
--- a/arch/mips/include/asm/compiler.h
+++ b/arch/mips/include/asm/compiler.h
@@ -43,14 +43,7 @@
 #undef barrier_before_unreachable
 #define barrier_before_unreachable() asm volatile(".insn")
 
-#if !defined(CONFIG_CC_IS_GCC) || \
-    (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 9)
-# define GCC_OFF_SMALL_ASM() "ZC"
-#elif defined(CONFIG_CPU_MICROMIPS)
-# error "microMIPS compilation unsupported with GCC older than 4.9"
-#else
-# define GCC_OFF_SMALL_ASM() "R"
-#endif
+#define GCC_OFF_SMALL_ASM() "ZC"
 
 #ifdef CONFIG_CPU_MIPSR6
 #define MIPS_ISA_LEVEL "mips64r6"
-- 
2.29.2.222.g5d2a92d10f8-goog

