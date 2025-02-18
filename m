Return-Path: <linux-mips+bounces-7819-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4D3A39C99
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 13:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C933A8BA6
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 12:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524BA264A65;
	Tue, 18 Feb 2025 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="J9rhzdl2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EC0264A64;
	Tue, 18 Feb 2025 12:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883468; cv=none; b=TVC+C7085iVO0jNj/XeAXIuuhdtvoOl3x7RL/rfUcBsf7cHblOSxsmWdQ8uR2k8iLy8rSFpb+E0Y90MWmoIh1BrqeWguFAlOKqQsn8j6kMri0ysoMW4v363RGOC917oXD9JyASdpldPrV3+TolYhTFEeN4VxjAymT7EODBJ9/20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883468; c=relaxed/simple;
	bh=B0cw1V0WWbSv6W+IJDae4P27mQS5mJPijK/THLDv2XI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JfNiBOROoYBpoiBEFtUqmHf6WtNFHw5FLUZhpPXG71UiKjhu3icHnsdF1PjYcMhP3ADb9ypW5WbFBpXqQixrogOFSfzr+7TQHcBRQFYcxXF/tudcuomxtnalhUNTpTfQj7HsDPKv+1RMfZYVsd0EGd3H47KTqu5ZoTk3yONxuic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=J9rhzdl2; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739883447;
	bh=VEbG+LuqDITNF5aS09ODkacNvzPLmBuo+Y5S4w8RYds=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=J9rhzdl2hgy9NYDyRE+u69RUsO0pl/iwpF48CRXXqguHKwZn6ImfQzvX5CHyqyH7B
	 FU68NUDRKula/J3TIgQq0MiBGNyIKDGhVCKIxFbOR18FCQWcz0CLv+CY0dzqQPuhXx
	 wpSl3+eZrB372RKHnpu41vzO4hBWk48hf7wC8YaA=
X-QQ-mid: bizesmtpip4t1739883400tkf5uey
X-QQ-Originating-IP: yFhL8vgklBZI5ayeD56aGt2cGV2R5s2iLXHzTKJTLJ0=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Feb 2025 20:56:38 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11245035312823928988
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: chenlinxuan@uniontech.com,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH 2/7] MIPS: dec: Create reset.h
Date: Tue, 18 Feb 2025 20:56:33 +0800
Message-ID: <65F124DA37C9CC6A+20250218125633.666501-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: NRLj+a+1JRyJptqqLa1zNFuqSBXDlIWd1FC99XrEikoWZyOJ91njqaZD
	MRjRq1J1USSOs0ITobdjeIBVmYbubBGDqbdAOa9hk15ShdA5An2GY+2fZklH5RVtSqykmbJ
	CM5LAfYT6eXw4zmwLLBj89tIVs6DhybHyFlQgXWl1t4Lx6K8SjWqSojJZzestIVUJ6uDtxG
	HVc/1qhTeA+AeNom6iijhj6AC+uCKhxCfwKtwZl+QhqUskEpqFYL68WZRBxcXNg1VXMTbOu
	Z2aeFDZksC9t8EEQ6QrPtt6NA/gsFJTWD5oRobEeptB6fsfDDZAEl2IZ/0xYoxXMKi5zdzH
	tzQDRxa2wIMtG9xFkiqAE1yKZ6wCNplyg+0xS0auePd5fv/nVxR9ACLS24WwSr9AEMwI4Bp
	M4Si1QEJKXsX+jDe+f1eOdTrYIbsHdw8Y8HnOMZoSxT8MGGqu1onn9DXFazw53MHP9nev0Y
	i/A815s25RGs9hlk8ap8LICB6lAnA5/y3ckJKcJmrx8ktGo85jgEOZGZJgANDSN9JPjl9wY
	jANBK/Pd8FDUueSBRoLEUVW1sWVCRdN3NBcyHKkWjzL5Laa/gwf3Z3ukAZZv3Shl4Y97bAI
	bLB1YrO9j96+Us0ddr0FBcQ8R4IuE/PnlS0hW7+h/jfAB8+LnSzrOs47m7ynCE14nmOUCQL
	lS2fC4QkxKTQuQD2obndcTlhiOXbV/eKJy7zHcTSXia/e5XOmkay/5xpy+q4oZYWUliIzxf
	VlW74lpEms6WSM37vwJCYjNrYnBoCxSAoV7HHHOouquTgjv+OetBx4WeOabfrclfv88z2Kp
	1VPWWXdQyZbKhfeAyZvQGHBlGrrKGlIVJ/rX0+/VeEPW6NeFXGUSbJiFlN4NT8hAgfE1cEy
	av23e3vRpwZBlqqud7OFmaD5NWR6vp6fQnM36epVH7n5HVDLFaurf+cec6PfsJ6upK1Vz2S
	qL1laTpnGKWmS3W1antF3Q94v/q/zm3YGCFUXRp/daNqn5CQw6ahjUZZ1d3VWjHfthz06YI
	iVoyIAovAWucgN0H3EqT2/5A+YqKHJ+uitgcfC9g==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/dec/prom/init.c         |  3 +--
 arch/mips/dec/reset.c             |  2 ++
 arch/mips/dec/setup.c             |  9 ++-------
 arch/mips/include/asm/dec/reset.h | 17 +++++++++++++++++
 4 files changed, 22 insertions(+), 9 deletions(-)
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
index 87f0a1436bf9..56a7ecf06b7b 100644
--- a/arch/mips/dec/setup.c
+++ b/arch/mips/dec/setup.c
@@ -17,11 +17,11 @@
 #include <linux/irqnr.h>
 #include <linux/memblock.h>
 #include <linux/param.h>
+#include <linux/pm.h>
 #include <linux/percpu-defs.h>
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
index 000000000000..5e7b27561fbe
--- /dev/null
+++ b/arch/mips/include/asm/dec/reset.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Reset a DECstation machine.
+ *
+ * Copyright (C) 2025  WangYuli
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


