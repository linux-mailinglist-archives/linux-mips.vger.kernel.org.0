Return-Path: <linux-mips+bounces-8507-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B76A7D646
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 09:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D08EC165B6E
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 07:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A05226CE0;
	Mon,  7 Apr 2025 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="dHcmbjUa"
X-Original-To: linux-mips@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0631448D5;
	Mon,  7 Apr 2025 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.67.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011477; cv=none; b=PrXQgLQ7zBhKi9mI9KpY1LGGXgGQQjhZ6hrrLNUFM+r79IHPH2S9U9/9oD3gNcYVlWtFmsUfWtSk6gtO+7xqlbdRABMrycNjOeLwTYEYk1Rqlpi2MEPuztpyBVdk3/o3KS258w9PML8YHkikPqE9XjMsOJ8SfNS/4HQOr4jFFVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011477; c=relaxed/simple;
	bh=/O6Rbhr6AzoHMZf+3CoXgWuQVv4trTtl/NYJeoc+md8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UdmKTFPU1EQfqxeSJOUOvz3z0bWPU2YkvHYmh72ET1ZXrLIPm7Aj9v12q1rFglQPacbmM8rZYlkczumquE1Uyt7vrhJ72r0kwMWmOjC9AXvP98ZMcIJoLPn5f2rwErKf4JXDjU/X87Jz79pIu9PrCdhbR7x8goxdQLCyCG2B7j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=dHcmbjUa; arc=none smtp.client-ip=114.132.67.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744011451;
	bh=SBqHbmT8GZqmsXFKwL7S/7VVJLbOp2xAK/sZMZYxjeo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dHcmbjUapNWvjgvDJ6WyKK95WL/R1BCNL+yf010+sKGJCFojIiCBbnF6A+AKRVDz2
	 Anccf3Mo01nm2NkgDeDWyWOzV1tCLcWQNLsOPXDLfERqD2W98pc91I8t1K9Le4jPPZ
	 6HoBb+lK90Y32v0Aixc3PJsuDZxe2zSYr6yaXx3c=
X-QQ-mid: bizesmtpip3t1744011407t9be885
X-QQ-Originating-IP: iSfGfpxYd9FTrfg41x2/1UisvpU3DSv0Zk6FQk+jQqc=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Apr 2025 15:36:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5477581190852730679
EX-QQ-RecipientCnt: 8
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH 3/6] MIPS: dec: Create reset.h
Date: Mon,  7 Apr 2025 15:36:19 +0800
Message-ID: <8E88DD5074AF3B33+20250407073622.495364-3-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
References: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: OYM3GZRvbPalw4TdM5yejJtM1kimv19+1FBmCojg/eMifuVgoo/rLvDG
	Q5+5n4cPgB7AUbdEweWmW+uyg1x99q84awkA5R7n3TPPN1AuE6Nnr7/bIVC4p9IDNpWjlBk
	vIlN4S93fPi4dhnq/c/WYCdpyfS0tP5N5iAkt7hHafAx2f9wk3aGxbIuWgeLKDpruRtnSwA
	W0yWNSVxuGnp4sMVW1OFGh3ItUO5+tyD9P9wesWmVq+pPoOiSSFXa1ViCGXwq8+wD+1tI3U
	ScyTWmj+Bmh/BhwrDElDJ+PyH6uSjpa19uFCEHputuS/Zom1hoPzv+7sfPq6Eb2DkGtc/Fy
	nKlHcbL3iKS5AJdqg1m32m59I7Y/55bVJL4Ci4tRANAeJYDeTBYOlQnx5wcBOyWn4AI4vMm
	qQ6kZfih3dThu1ap7E0zUv9nfcOAkyBDmz00/PmF3i7x8pNMy+8lWsbPq4BtkU6bjU6HdZx
	N5u8VpBr37CxjUkDGEbFts/Do5hLcPUkLAt2Xbu132AWr3GEXII43s8bksL3CmL0+nszUdz
	ziO7cvrDJAI+6jV3laJBKn3UM9IPxLF16+28ArKSo9AZHJJ5+SzXmOJdXRxgzKGQkvkqOWn
	SNDmAvjn8XaxSmtiQRTJWJhlPldEkAYwiF5VqDS+HSRKXSnKkVrjNUR/WLFQTZqHteNpW8k
	3bW281GbMOnaIgji3qVJc2KE/Qz2/RNntf/Yn+Qu+F8tsJv6aepU61O9wQYFFTiofMQpmT1
	HN8qI37rVoahf6DlSVlvSlqRiO3++UpoSvHg6R6f6iWzhi59liUEXkU6pKjKLzXXb3grH+R
	Nba0bCPAKKtjpWsiDbiTfWvjvjVgMz2wQFgPr3+dRGaqBRK1/XjqkzhBLPg6KK+gCwGbuPP
	NLMWC4YhOJfMSYWOntRxsF52FpxHOkaZwMY2rEjqY5l9+Uv8eQtogVonTByG0I8p2BDSX9Z
	e3LKNOqRiRZGdBrDEyJuSsg/HZNXUmAORpZAGuQrAHtq5GT0KtHcFutrsTl4aC9Kbk+P13y
	iwnbHO9g==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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


