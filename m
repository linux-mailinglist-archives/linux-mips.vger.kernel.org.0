Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D30A0BFE8D
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2019 07:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbfI0FeB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Sep 2019 01:34:01 -0400
Received: from forward102j.mail.yandex.net ([5.45.198.243]:55024 "EHLO
        forward102j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725819AbfI0FeB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 27 Sep 2019 01:34:01 -0400
Received: from mxback17o.mail.yandex.net (mxback17o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::68])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id A0007F200BF;
        Fri, 27 Sep 2019 08:33:57 +0300 (MSK)
Received: from myt5-7474ca8e6aca.qloud-c.yandex.net (myt5-7474ca8e6aca.qloud-c.yandex.net [2a02:6b8:c12:1d21:0:640:7474:ca8e])
        by mxback17o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id B8Tq2bAybL-XvqCt9Ka;
        Fri, 27 Sep 2019 08:33:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1569562437;
        bh=8iaFIBm2jw++/UcJ13ziJXXSLuu3Qch1MTj9uqIr33E=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=rADb8K6Y7iWkeTvLSzEHfa7EjJI2S4UTpfhhkpsRiLMhMN4FFgSD+YH/5tih+4l3M
         wWwAVeI0lIXCN14LY/lCJhOPxM9Rgj6LFs5m15BSUIoOWu3NaVzUDXv3ll+dwUqlBY
         /UgAemgry5Pzx9oxSwzbyfE0PXTO5U6WKXsOEsDw=
Authentication-Results: mxback17o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt5-7474ca8e6aca.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id zmAVqBtjf1-XnHqV0fQ;
        Fri, 27 Sep 2019 08:33:51 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paul.burton@mips.com>
Subject: [PATCH] MIPS: cpu-bugs64: Mark inline functions as __always_inline
Date:   Fri, 27 Sep 2019 13:33:39 +0800
Message-Id: <20190927053339.11866-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING forcibly")
allows compiler to uninline functions marked as 'inline'. Leading to section
mismatch in this case.

Since we're using const variables to pass assembly flags, 'inline's can't
be dropped. So we simply mark them as __always_inline.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Paul Burton <paul.burton@mips.com>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/kernel/cpu-bugs64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/cpu-bugs64.c b/arch/mips/kernel/cpu-bugs64.c
index fa62cd1dff93..93d23232357c 100644
--- a/arch/mips/kernel/cpu-bugs64.c
+++ b/arch/mips/kernel/cpu-bugs64.c
@@ -24,7 +24,7 @@ static char r4kwar[] __initdata =
 static char daddiwar[] __initdata =
 	"Enable CPU_DADDI_WORKAROUNDS to rectify.";
 
-static inline void align_mod(const int align, const int mod)
+static __always_inline void align_mod(const int align, const int mod)
 {
 	asm volatile(
 		".set	push\n\t"
@@ -113,7 +113,7 @@ static __always_inline void mult_sh_align_mod(long *v1, long *v2, long *w,
 	*w = lw;
 }
 
-static inline void check_mult_sh(void)
+static __always_inline void check_mult_sh(void)
 {
 	long v1[8], v2[8], w[8];
 	int bug, fix, i;
@@ -176,7 +176,7 @@ asmlinkage void __init do_daddi_ov(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-static inline void check_daddi(void)
+static __always_inline void check_daddi(void)
 {
 	extern asmlinkage void handle_daddi_ov(void);
 	unsigned long flags;
@@ -242,7 +242,7 @@ static inline void check_daddi(void)
 
 int daddiu_bug	= IS_ENABLED(CONFIG_CPU_MIPSR6) ? 0 : -1;
 
-static inline void check_daddiu(void)
+static __always_inline void check_daddiu(void)
 {
 	long v, w, tmp;
 
-- 
2.23.0

