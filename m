Return-Path: <linux-mips+bounces-8027-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C80A4816B
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 15:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9F4B19C043F
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 14:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD75223313E;
	Thu, 27 Feb 2025 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="B24PTjqM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E127003D;
	Thu, 27 Feb 2025 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666090; cv=none; b=LY/vT/h1Iw6h8VtSFo6YNgZMMNx0/D5eGwmaoQwOQKBmwKpvY5c4dzmF7r6OFDRudC29p1b0M/tU6gYQ6vJOcckgk767kjKc2pkltFA7pED73GfOGzAga3sZft7btm7XPDNLbHmksXzCSmJwmUiwTZZ+KgHVTDtnM86BSolzYGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666090; c=relaxed/simple;
	bh=ijvJbklRaVxatHySwEJGs2tGLouKIiKmqCoLYtwRaMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KsHmWXCcBoQIh0Nh4UiO9d84mlG+7wMgrAdhvXh7R29p0h91LxRcoE7lkS2GJ3utnvT3MCTWhut0BDCk35+h1hankKiwUK104DwaLMyiFjl9DyoJ+hoV47LKzdzV9yQs2o6xSaCwOcmv7q1QfU/8fTbjS1+DBbgaQuTsqhKWuXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=B24PTjqM; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1740666059;
	bh=Uz1jT418BDhN+2nYXqkBO9J7O5VbnfcOo+CUWIwEAC4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=B24PTjqMnJRHJrFVasn0NLd6DZOChOHbQHqaNtxCzI3v8rubO3dpcjZ3J/rtDPh1K
	 U/KTSSSlP3KgRBrtB1zfbh7fFn+/MAdrKNRkqCFw0yHE8di5PO1o2IhKM7PWyjO79l
	 ldeJMJsa9zW77E86GtEW2IbtkBfjQS8JU/IB7swE=
X-QQ-mid: bizesmtpip3t1740666005traeu0f
X-QQ-Originating-IP: SgmZ1DVddhf4853oGFIiBWgmEOe34RkqKKw0TqObrRw=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Feb 2025 22:20:03 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17606361630312257937
From: WangYuli <wangyuli@uniontech.com>
To: tsbogend@alpha.franken.de,
	macro@orcam.me.uk
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH v2] MIPS: dec: Create reset.h
Date: Thu, 27 Feb 2025 22:19:49 +0800
Message-ID: <EA0AFB15DDCF65C1+20250227141949.1129536-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OJzv1jSZYUX4OZ5CsXTBVQmsvPV8CRLKRW1/ZMugu4g3NG6ZzVbPqGFO
	/8XqWlStQ7zUuP4g3CFhguELVP3UU+kifFI6SWIvxsc5MNz6XtUAna8TTYLhgoLv84fvCuQ
	EKCaHY1Y0/eLAnq7cXUQ+GoQJ2EcHVJR68S//weYbVvwtL/LfsGG0GTx7capTui/bc1R9ec
	RhxpQZmJitEFqbCjLdbdkUUOulUZrNdw9z5EyDod11zWv5Xvd5Rz4rmn3FylQZQemrjUEyM
	8Gn8koPZpX+o0YRJ63th/wLvcKrCYENf52JCMjC2BLYP8m8nELT09ebAvaxqm9BCOpC2Pbw
	eNiXSGf6dWiEnLacup+H/oECDOC3m/WspwTOErqni3Nq0ARXbI3PotndWXfqmzmK9vBQ5Go
	SmwMJEat9K2j+xRVw8Sz3eObTscws2EZPRYSCRYoFfp0eW1EJc379ZX6S2NEwX5J6fRGE/h
	U3KZsPsYCG7p5ZqyVXV6/q4bvxJEL/1BdKe5yXgWVtyelC1nS5YmEklGWNuXJTh1Sf76IBM
	Lw5ZB9SdchhMUhrACQELJu7bphdybzj2FBABzw+mAv1zd4E4pEype6RKhIFi9REYwYfsNoB
	URDGDZJPdTVQJ6htVAWo+QIYWudJ0Ywnp8y3u0d/2vnKkIW/yoLyTpGJw4e8XihJFAp7RuP
	bq3FyfGWPwuVZgOPz6GDCcmS/1nISlAlKVvxISnKc06R8MAF7l7ModMlKltd3ZQHtcs/+G/
	gPhQPEkR1rvAh5FU78/IaQOm1bBNlNMCVZn2KmbyYj8G879yQH+1WQkHCWnF5T3EJnBf1BO
	ySI54MrEwD4Kb6aimfzEZnBGNelNq2mBlgSrG/Mz+g7IIA+myHOoypwYDnXy23TH3LGDuIu
	CYCk7kgL8NDRpUF3BcSDOJ/GFHTPwBd/l6JLPKT4xb1105E2ggOg/c+7gj92mbhW1tnNNzM
	n8JvopnHMpSnoG63jry3wtbB9W8AYvPJE/N6QADMsNEm8vvi9dvbVQeGU/48qc+dg4RIjNW
	9p1Q9teTN7KCrJzo6Gc0VKInKWaDLrbHV9fHHt8w8BYSeHLWId913CiBNbkLk=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

Declare externally used functions in reset.c to resolve compilation
warnings.

Fix follow errors with gcc-14 when -Werror:

arch/mips/dec/reset.c:22:17: error: no previous prototype for ‘dec_machine_restart’ [-Werror=missing-prototypes]
   22 | void __noreturn dec_machine_restart(char *command)
      |                 ^~~~~~~~~~~~~~~~~~~
arch/mips/dec/reset.c:27:17: error: no previous prototype for ‘dec_machine_halt’ [-Werror=missing-prototypes]
   27 | void __noreturn dec_machine_halt(void)
      |                 ^~~~~~~~~~~~~~~~
arch/mips/dec/reset.c:32:17: error: no previous prototype for ‘dec_machine_power_off’ [-Werror=missing-prototypes]
   32 | void __noreturn dec_machine_power_off(void)
      |                 ^~~~~~~~~~~~~~~~~~~~~
arch/mips/dec/reset.c:38:13: error: no previous prototype for ‘dec_intr_halt’ [-Werror=missing-prototypes]
   38 | irqreturn_t dec_intr_halt(int irq, void *dev_id)
      |             ^~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[7]: *** [scripts/Makefile.build:207: arch/mips/dec/reset.o] Error 1
make[7]: *** Waiting for unfinished jobs....

In passing, also correct the include file ordering in setup.c as it
doesn't merit a separate commit.

Link: https://lore.kernel.org/all/Z8A0JeFYfBxXOFCD@alpha.franken.de/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2: Rationalize the copyright for reset.h.
---
 arch/mips/dec/prom/init.c         |  3 +--
 arch/mips/dec/reset.c             |  2 ++
 arch/mips/dec/setup.c             |  9 ++-------
 arch/mips/include/asm/dec/reset.h | 20 ++++++++++++++++++++
 4 files changed, 25 insertions(+), 9 deletions(-)
 create mode 100644 arch/mips/include/asm/dec/reset.h

diff --git a/arch/mips/dec/prom/init.c b/arch/mips/dec/prom/init.c
index 8d74d7d6c05b..a8393052a443 100644
--- a/arch/mips/dec/prom/init.c
+++ b/arch/mips/dec/prom/init.c
@@ -18,7 +18,7 @@
 #include <asm/processor.h>
 
 #include <asm/dec/prom.h>
-
+#include <asm/dec/reset.h>
 
 int (*__rex_bootinit)(void);
 int (*__rex_bootread)(void);
@@ -88,7 +88,6 @@ static void __init which_prom(s32 magic, s32 *prom_vec)
 
 void __init prom_init(void)
 {
-	extern void dec_machine_halt(void);
 	static const char cpu_msg[] __initconst =
 		"Sorry, this kernel is compiled for a wrong CPU type!\n";
 	s32 argc = fw_arg0;
diff --git a/arch/mips/dec/reset.c b/arch/mips/dec/reset.c
index 3df01f1da347..ee1ad38f4a69 100644
--- a/arch/mips/dec/reset.c
+++ b/arch/mips/dec/reset.c
@@ -10,6 +10,8 @@
 
 #include <asm/addrspace.h>
 
+#include <asm/dec/reset.h>
+
 typedef void __noreturn (* noret_func_t)(void);
 
 static inline void __noreturn back_to_prom(void)
diff --git a/arch/mips/dec/setup.c b/arch/mips/dec/setup.c
index 87f0a1436bf9..6b100c7d0633 100644
--- a/arch/mips/dec/setup.c
+++ b/arch/mips/dec/setup.c
@@ -18,10 +18,10 @@
 #include <linux/memblock.h>
 #include <linux/param.h>
 #include <linux/percpu-defs.h>
+#include <linux/pm.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-#include <linux/pm.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -48,14 +48,9 @@
 #include <asm/dec/kn02ca.h>
 #include <asm/dec/kn03.h>
 #include <asm/dec/kn230.h>
+#include <asm/dec/reset.h>
 #include <asm/dec/system.h>
 
-
-extern void dec_machine_restart(char *command);
-extern void dec_machine_halt(void);
-extern void dec_machine_power_off(void);
-extern irqreturn_t dec_intr_halt(int irq, void *dev_id);
-
 unsigned long dec_kn_slot_base, dec_kn_slot_size;
 
 EXPORT_SYMBOL(dec_kn_slot_base);
diff --git a/arch/mips/include/asm/dec/reset.h b/arch/mips/include/asm/dec/reset.h
new file mode 100644
index 000000000000..c1557b88264c
--- /dev/null
+++ b/arch/mips/include/asm/dec/reset.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Reset a DECstation machine.
+ *
+ * File created to eliminate warnings; copyright from reset.c.
+ *
+ * Copyright (C) 199x  the Anonymous
+ * Copyright (C) 2001, 2002, 2003  Maciej W. Rozycki
+ */
+
+#ifndef __ASM_DEC_RESET_H
+
+#include <linux/interrupt.h>
+
+extern void __noreturn dec_machine_restart(char *command);
+extern void __noreturn dec_machine_halt(void);
+extern void __noreturn dec_machine_power_off(void);
+extern irqreturn_t dec_intr_halt(int irq, void *dev_id);
+
+#endif /* __ASM_DEC_RESET_H */
-- 
2.47.2


