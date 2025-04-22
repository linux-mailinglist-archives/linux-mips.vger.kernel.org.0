Return-Path: <linux-mips+bounces-8695-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD6A965D1
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 12:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CCD63BA00A
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D241F215066;
	Tue, 22 Apr 2025 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="MtXHJ80k"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE82135D0;
	Tue, 22 Apr 2025 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317464; cv=none; b=MjRn5/qcQfICw2RF0kLcW6SEbLvNeTMZgUaTszbHH8GOxZoSSeW8dGwREo63GDF/EWqMC6rFD1vRdz71SvnCByzqo/Og6fY+ngO9U1kH+UsEgwaXDsjCWCAwN6SwicYyAyZCiw2S5PhCuehH6FfIKP+P62adWVZoF5pMvNtKtUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317464; c=relaxed/simple;
	bh=AqT7m1u440zOibe16v2sMSLTv4oY8kFJKxRTDSjSEe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0QyA/Q72EJbhRq4TaB1fAAlBCGd2zjAie+up2LHujPzZIvBWDv76gmZ4sCoBMg6KXy/zxJWEVtUVjI+UszjpbTt4hGKsrtieiRW8EGK/9UDbRjXO+5rcI74zUSBIPEeVMzTzABOmMUg9ih/Z7U5QfvJjDsqZmlhEmOPREcdjvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=MtXHJ80k; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745317436;
	bh=28bWYpBODBMHyOWNKQNC1L/Lz6MllkPxMRU2S9jr7eA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MtXHJ80kZ2xKqxpKJmxfPhh+0lSbJkAxuPJ1xc9vX3eIG0C3nMxa4nBQdu3paI+5A
	 xbz5biP9tCzAS9a/r+4xLEDXZMt0W8XYnjZBE02QGabuZupv5XkDLz5PaCymoXxS5S
	 1JZRFC3WTPiCExozrZxFOLTk9+SStgrJxQCR7vy8=
X-QQ-mid: zesmtpip4t1745317394tbdcae06d
X-QQ-Originating-IP: 7kb3nrCfv66PVDKlai2IcJySyp79o6yy/taB80T1yig=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 18:23:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5605286764837814321
EX-QQ-RecipientCnt: 9
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/6] MIPS: dec: Create reset.h
Date: Tue, 22 Apr 2025 18:22:50 +0800
Message-ID: <3AD7E5DDE3F05C6D+20250422102253.137944-3-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M1gP/lprZGJnT407nQc5mQ8kDHXKhY9nuOVDzr0dckA1Hcs5cHhABbfx
	kQ+vD8FjePSmNqWTxoRXHmLrw5uNWn1ZHvAFYtDfTaORyuSHg5/0PudfJdRPvk2QGuEeU9U
	aCwLRJ257x3FCdL4BoS1tVcaLWQPGiqA0rTkjU7Aj8sGooRHiSlQK4ALzItuCe+aEHaZ6Zm
	L+DOs9DRop1Y3Z2Mh4SllPKI43JnpxMPCmujP0HubX/scMkYbEPgLEWfgQ9NcX/kXaZZSP6
	q0fbJPJgVZyqTIsfJ/BKLoWPBORIJ/nAKaPzx4lHvP6TdAP1H1o1UFjdgWZvRkOC6QltehB
	ZKg600VhSxOTgmu662jNRk72imJ5L5Qlbceo4Idp+W3bOTmMwNQS8GJy4JlcGLvqyLlsWGF
	/8AmupaSkd14i8hxHqMhrBbUZJ2BfjhcKIHDb4QjAD7cmc0r7CGZ25PvLGX4uhlVTaYMMm+
	JARUXH89pX1Z5RIne9XzUVt8HcNkMvhhSeMNtKKZOOaw03Rnc9Q1p7arkITprfyiwm6lIfi
	vZzzGL/KxEChte7IVeu0MA73BWV1XemY03VLMhJiU4ocU+zRwf630X9qxLjfQqbBjzBWxMH
	zQTdSEeBTblsZTUSAIeRfedhlYfjzKXmyWQJskZdfjh40Ws48u6YAO0VMl5u3Q3UBUTaQEw
	BHiDgD2qJ9SASJGkE/qsUFgZ0doeqtojjS/WizDN+4d/JFDONj2vsryFaRe6jFKgOpEl2St
	QoSMvIRNtjZsJXvQexLe1uJevze1RFQjdndiL/tEARLvySEpkIeUgIqKn9/cbP5+FCD+yW7
	L6a01iEdnVjyXFuXSFoTvAwv9Tk1Ajf89P2iPc2dlSNCIj7mMl6gAfUq8h4GkACYeWoSGP2
	iGhfLZeTwz6JFN/jKDBOwCo/K3BpYHkmQAAG5ULOawTkABOt78PayTs4v/65vZFvnS3Jb+y
	coTAGhH+8GOxsbX9fq0yYaSl3i1z/hlQmdkk7DpRZimIYNOI3lCFb80P/Kg6DaJRBwozV9e
	daU1oEEmMVPSQfB/+CemIRSCd8QUK/fsxWx+2KBMSAhU5xujzAd90Usc1LysAXX+s7yOQu9
	6hyNWpMli0F
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2: Add Philippe Mathieu-Daudé's "Reviewed-by" tag.
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
2.49.0


