Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA6016B72
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2019 21:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfEGTev (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 15:34:51 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56332 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbfEGTev (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 May 2019 15:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1557257688; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VwOd1vHk2caupJwTyK7JV6vMq+wzdAQFWVN9AKB37ls=;
        b=VaeSnH40VcHq8kXxQKdYCnDVUKrCUmsSuTPJ/boMHF/GWNFtrlDX7Ss6f0m3KQPJI0vnnd
        q5bw4VXT6+mxFC0D1neOewzBRfn83uMVOnmReEsa1SMy+sgNm7QNPEKdT6r0ZNv5AUf4MT
        FplYnFCuhDrtHH1w+OKv2VudKxk9elE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/5] MIPS: Remove dead code
Date:   Tue,  7 May 2019 21:34:21 +0200
Message-Id: <20190507193421.12260-5-paul@crapouillou.net>
In-Reply-To: <20190507193421.12260-1-paul@crapouillou.net>
References: <20190507193421.12260-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove the unused <asm/mach-jz4740/clock.h> include.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/include/asm/mach-jz4740/clock.h | 31 -----------------------
 arch/mips/jz4740/board-qi_lb60.c          |  2 --
 arch/mips/jz4740/platform.c               |  2 --
 arch/mips/jz4740/time.c                   |  3 ---
 4 files changed, 38 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-jz4740/clock.h

diff --git a/arch/mips/include/asm/mach-jz4740/clock.h b/arch/mips/include/asm/mach-jz4740/clock.h
deleted file mode 100644
index 104d2dfe1e36..000000000000
--- a/arch/mips/include/asm/mach-jz4740/clock.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
- *
- *  This program is free software; you can redistribute it and/or modify it
- *  under  the terms of the GNU General	 Public License as published by the
- *  Free Software Foundation;  either version 2 of the License, or (at your
- *  option) any later version.
- *
- *  You should have received a copy of the GNU General Public License along
- *  with this program; if not, write to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
- *
- */
-
-#ifndef __ASM_JZ4740_CLOCK_H__
-#define __ASM_JZ4740_CLOCK_H__
-
-enum jz4740_wait_mode {
-	JZ4740_WAIT_MODE_IDLE,
-	JZ4740_WAIT_MODE_SLEEP,
-};
-
-void jz4740_clock_set_wait_mode(enum jz4740_wait_mode mode);
-
-void jz4740_clock_suspend(void);
-void jz4740_clock_resume(void);
-
-void jz4740_clock_udc_enable_auto_suspend(void);
-void jz4740_clock_udc_disable_auto_suspend(void);
-
-#endif
diff --git a/arch/mips/jz4740/board-qi_lb60.c b/arch/mips/jz4740/board-qi_lb60.c
index 6718efb400f4..b418b23ff1d1 100644
--- a/arch/mips/jz4740/board-qi_lb60.c
+++ b/arch/mips/jz4740/board-qi_lb60.c
@@ -40,8 +40,6 @@
 
 #include <asm/mach-jz4740/platform.h>
 
-#include "clock.h"
-
 /* GPIOs */
 #define QI_LB60_GPIO_KEYOUT(x)		(JZ_GPIO_PORTC(10) + (x))
 #define QI_LB60_GPIO_KEYIN(x)		(JZ_GPIO_PORTD(18) + (x))
diff --git a/arch/mips/jz4740/platform.c b/arch/mips/jz4740/platform.c
index cbc5f8e87230..cf9c66031199 100644
--- a/arch/mips/jz4740/platform.c
+++ b/arch/mips/jz4740/platform.c
@@ -30,8 +30,6 @@
 #include <linux/serial_core.h>
 #include <linux/serial_8250.h>
 
-#include "clock.h"
-
 /* USB Device Controller */
 struct platform_device jz4740_udc_xceiv_device = {
 	.name = "usb_phy_generic",
diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
index 2ca9160f642a..32cdde0cad01 100644
--- a/arch/mips/jz4740/time.c
+++ b/arch/mips/jz4740/time.c
@@ -22,13 +22,10 @@
 #include <linux/clockchips.h>
 #include <linux/sched_clock.h>
 
-#include <asm/mach-jz4740/clock.h>
 #include <asm/mach-jz4740/irq.h>
 #include <asm/mach-jz4740/timer.h>
 #include <asm/time.h>
 
-#include "clock.h"
-
 #define TIMER_CLOCKEVENT 0
 #define TIMER_CLOCKSOURCE 1
 
-- 
2.21.0.593.g511ec345e18

