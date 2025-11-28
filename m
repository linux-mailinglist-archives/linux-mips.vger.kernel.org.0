Return-Path: <linux-mips+bounces-12366-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D3222C9125C
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 09:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 770DD347283
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 08:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3415627BF93;
	Fri, 28 Nov 2025 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JViFz/5V"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4C2571A0;
	Fri, 28 Nov 2025 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318616; cv=none; b=pdHOc7zkQ4RkV3zvHJucGFiayVW4LdRV9EFCcESq2hxlkCSUadxSdAU7eMgKePjwVtTM2Mhavb3+qHDpiRRAxWpBlPck5kt/VBRGHmNiU8L4/vtmgann9S1CCL5g09QRsjcE9WdVblB6i5Uv1i9BQuagCEMuzh3jT7x2/Iag6Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318616; c=relaxed/simple;
	bh=MpMcHD2tp5uuKwb5c+sfdkPhGUuflywsKRBHkJYCeP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RvodLSW+b/umgFLONrL2/9GZfWtSilT3NtxEUI+N+4NqXlCBdbcfHAWxauGVLYndhLdFbVfH/HDePws3AsABMaH+OEAQf6LWRuzeiq97Kb38dTvScV3INpY8xaWz7X29ufVJI/czPhr5ujQ8C5ENXnoBIFDEQ6QA2qpRwL60AyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JViFz/5V; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 77E761A1DA0;
	Fri, 28 Nov 2025 08:30:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45F5560706;
	Fri, 28 Nov 2025 08:30:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A38F4103C8EF1;
	Fri, 28 Nov 2025 09:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764318610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Cq+xlD9USMJsrxvq8O+HZTXWZMa79CT1USg//Gkx7R8=;
	b=JViFz/5VcrUwXMeNG7zxowcDJm5b1tIc2Rm/98Cy3UutNOC+KiWlPOBkjQ1br//GAnq1+T
	QibxW4GYxCW5HdOwVks5zYGWaxhfN+owYfuVgeNX2dbFxbvBH0nRrO5mXGqyCiSU5S/xnA
	cxUjS/bazmcaZl6nqX9dAX4FVl3KtvALk1twhS/ZJtYND+nVKwdpq0oSt1FXQ8yZnyLatK
	c9jTCBYRGq64D6vQUbDqc0PQxRHODTDkHmm26w0NQbCpt43o0p6ozjYTGt/A5Tnc10l/cq
	oR+iV9pdZPBGz2pUKQSC98ZkdDm0YgNMjraopMua2KBzZl/0ZECj0kExvWPsfg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 28 Nov 2025 09:30:06 +0100
Subject: [PATCH] MIPS: ftrace: Fix memory corruption when kernel is located
 beyond 32 bits
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251128-fix_mips_ftrace-v1-1-e6169f8777f2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAI1dKWkC/x2MQQqAIBAAvyJ7TkgrrL4SEVuttYdMNCII/550H
 JiZFyIFpgi9eCHQzZFPl0EVApYd3UaS18ygS90oVdbS8jMd7ONkr4ALSYOIc9tRZY2BXPlAWfm
 Pw5jSB7nYEBFhAAAA
X-Change-ID: 20251104-fix_mips_ftrace-7aaab89e3f77
To: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Since commit e424054000878 ("MIPS: Tracing: Reduce the overhead of
dynamic Function Tracer"), the macro UASM_i_LA_mostly has been used,
and this macro can generate more than 2 instructions. At the same
time, the code in ftrace assumes that no more than 2 instructions can
be generated, which is why it stores them in an int[2] array. However,
as previously noted, the macro UASM_i_LA_mostly (and now UASM_i_LA)
causes a buffer overflow when _mcount is beyond 32 bits. This leads to
corruption of the variables located in the __read_mostly section.

This corruption was observed because the variable
__cpu_primary_thread_mask was corrupted, causing a hang very early
during boot.

This fix prevents the corruption by avoiding the generation of
instructions if they could exceed 2 instructions in
length. Fortunately, insn_la_mcount is only used if the instrumented
code is located outside the kernel code section, so dynamic ftrace can
still be used, albeit in a more limited scope. This is still
preferable to corrupting memory and/or crashing the kernel.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
To go further and remove the limitations of dynamic trace support, the
ftrace implementation for MIPS should be completely rewritten and
inspired by what was done for arm64. This approach was chosen by
Loongson: instead of trying to manage multiple instructions added on
the fly, the support relies on a breakpoint, which is more robust.

However, this effort is significant, so I’ll leave it to those who are
motivated to work on it. If needed, I can provide some guidance on the
topic.
---
 arch/mips/kernel/ftrace.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index f39e85fd58fa9..b15615b285690 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -54,10 +54,20 @@ static inline void ftrace_dyn_arch_init_insns(void)
 	u32 *buf;
 	unsigned int v1;
 
-	/* la v1, _mcount */
-	v1 = 3;
-	buf = (u32 *)&insn_la_mcount[0];
-	UASM_i_LA(&buf, v1, MCOUNT_ADDR);
+	/* If we are not in compat space, the number of generated
+	 * instructions will exceed the maximum expected limit of 2.
+	 * To prevent buffer overflow, we avoid generating them.
+	 * insn_la_mcount will not be used later in ftrace_make_call.
+	 */
+	if (uasm_in_compat_space_p(MCOUNT_ADDR)) {
+		/* la v1, _mcount */
+		v1 = 3;
+		buf = (u32 *)&insn_la_mcount[0];
+		UASM_i_LA(&buf, v1, MCOUNT_ADDR);
+	} else {
+		pr_warn("ftrace: mcount address beyond 32 bits is not supported (%lX)\n",
+			MCOUNT_ADDR);
+	}
 
 	/* jal (ftrace_caller + 8), jump over the first two instruction */
 	buf = (u32 *)&insn_jal_ftrace_caller;
@@ -189,6 +199,13 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	unsigned int new;
 	unsigned long ip = rec->ip;
 
+	/* When the code to patch does not belong to the kernel code
+	 * space, we must use insn_la_mcount. However, if MCOUNT_ADDR
+	 * is not in compat space, insn_la_mcount is not usable.
+	 */
+	if (!core_kernel_text(ip) && !uasm_in_compat_space_p(MCOUNT_ADDR))
+		return -EFAULT;
+
 	new = core_kernel_text(ip) ? insn_jal_ftrace_caller : insn_la_mcount[0];
 
 #ifdef CONFIG_64BIT

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251104-fix_mips_ftrace-7aaab89e3f77

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


