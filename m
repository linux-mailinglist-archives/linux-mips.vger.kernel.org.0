Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B3D1A52BD
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2020 18:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgDKQEh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Apr 2020 12:04:37 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44392 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgDKQEh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 11 Apr 2020 12:04:37 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so1704104plr.11;
        Sat, 11 Apr 2020 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GMnG2j5kk+O2i07cQtSOcLpZb+BBBEK51LCwl+FnQqI=;
        b=pg0y+mBfFiZSt/IYWvDz/nhCt33BNvbN56cTCAcqw5qyzPpbHXsQvw4YiKwuoFigFJ
         x4+BpX5VTbRCs1SRjG1KXqcNhQt8mM/Hd1T1VvGfVNhAcJwcwUCpmHrW/nhv7atQ3t+s
         CeeooBxtZyLaN/LY+gOX7ZTgFPq7W7vmtJhHScjAgEc5L8ClIN6dQEZuQQZoS5kUebHi
         Z10rRnjLTam7/QpfojWmjvVxv4nRQG3PnjFd6/qdLgoG1Kwyt9Ufl24OFMlpz/7PKpai
         +2/INjOoCNyU1Kzj1oLav0YA83E7EI7rVkMGomKeJfI10L0WRCvYNY5wEyRlnkiEb7Jm
         /Zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GMnG2j5kk+O2i07cQtSOcLpZb+BBBEK51LCwl+FnQqI=;
        b=XJNbnIltavf+2oJmwS2Eq5PclSawBvOPG8o7Kzca3K0iI/J3I/qI6bY2Dzbis2QDPC
         B+s8/JLNdpDsgjpTaAM6QMl9YC2gqNgJJ4haaNGEvXaIIJu6NMNbDLzNZFbcSX35lFsN
         drbwN36aC7n1JmdOYCVug1JdadEv67y27MpkcjTl6aoMgov+um4LIp6wpbQsLWQG2lmE
         CInlAUr2WaUitTEQOf9QlrrC09ys9s50RzyxgT5BJZ/metdemeFGVHeGPB1GxnpkvNIY
         axPdl6GhZ5FbxyZgySVAdus6cMQcoDghV2I33SkhgGcjmAgWkjxtjrwhn5IpWOoI89PY
         xr3g==
X-Gm-Message-State: AGi0PuZfKXfcgHj1rwnQXmg3Qvko0zik40OreKC/snsPE5V+Ks/cMdGM
        LmzzJ4UnCcykT97Zaz3m8cw=
X-Google-Smtp-Source: APiQypJQzXujimSti9/fz8MJ4M5YV0AZUuCQiwLVQFZruk/bdW8Y/oYw0vDfupYOjS33Gyrzltg93A==
X-Received: by 2002:a17:902:b087:: with SMTP id p7mr9718749plr.287.1586621076622;
        Sat, 11 Apr 2020 09:04:36 -0700 (PDT)
Received: from localhost ([183.82.183.27])
        by smtp.gmail.com with ESMTPSA id r23sm4569628pfh.162.2020.04.11.09.04.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Apr 2020 09:04:36 -0700 (PDT)
Date:   Sat, 11 Apr 2020 21:34:34 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 1/3] MIPS: Replace setup_percpu_irq() by request_percpu_irq()
 variant
Message-ID: <82270883881f29f8ad4b289f915cdbb8620608f6.1586434781.git.afzal.mohd.ma@gmail.com>
References: <cover.1586434781.git.afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1586434781.git.afzal.mohd.ma@gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Recently all usages of setup_irq() was replaced by request_irq() as
allocators are ready by the time setup_irq() was invoked. Similarly
setup_percpu_irq() can be replaced by request_percpu_irq(). But in the
callers handled here __request_percpu_irq() has to be used as
request_percpu_irq() does not give the user a chance to pass the flags,
and IRQF_TIMER has to be passed here, so the variant
__request_percpu_irq() is used.

Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
---
 arch/mips/include/asm/cevt-r4k.h |  1 -
 arch/mips/kernel/cevt-r4k.c      | 11 -----------
 arch/mips/sgi-ip27/ip27-timer.c  | 13 +++++--------
 arch/mips/sgi-ip30/ip30-timer.c  |  6 +++---
 4 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/arch/mips/include/asm/cevt-r4k.h b/arch/mips/include/asm/cevt-r4k.h
index 2e13a038d260..5229eb34f28a 100644
--- a/arch/mips/include/asm/cevt-r4k.h
+++ b/arch/mips/include/asm/cevt-r4k.h
@@ -23,7 +23,6 @@ void mips_event_handler(struct clock_event_device *dev);
 int c0_compare_int_usable(void);
 irqreturn_t c0_compare_interrupt(int, void *);
 
-extern struct irqaction c0_compare_irqaction;
 extern int cp0_timer_irq_installed;
 
 #endif /* __ASM_CEVT_R4K_H */
diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 17a9cbb8b3df..4ffa9f485d07 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -158,17 +158,6 @@ irqreturn_t c0_compare_interrupt(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-struct irqaction c0_compare_irqaction = {
-	.handler = c0_compare_interrupt,
-	/*
-	 * IRQF_SHARED: The timer interrupt may be shared with other interrupts
-	 * such as perf counter and FDC interrupts.
-	 */
-	.flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED,
-	.name = "timer",
-};
-
-
 void mips_event_handler(struct clock_event_device *dev)
 {
 }
diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 61f3565f3645..6e2b58b47580 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -68,13 +68,6 @@ static irqreturn_t hub_rt_counter_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-struct irqaction hub_rt_irqaction = {
-	.handler	= hub_rt_counter_handler,
-	.percpu_dev_id	= &hub_rt_clockevent,
-	.flags		= IRQF_PERCPU | IRQF_TIMER,
-	.name		= "hub-rt",
-};
-
 /*
  * This is a hack; we really need to figure these values out dynamically
  *
@@ -111,9 +104,13 @@ void hub_rt_clock_event_init(void)
 
 static void __init hub_rt_clock_event_global_init(void)
 {
+	int irq = IP27_RT_TIMER_IRQ;
+
 	irq_set_handler(IP27_RT_TIMER_IRQ, handle_percpu_devid_irq);
 	irq_set_percpu_devid(IP27_RT_TIMER_IRQ);
-	setup_percpu_irq(IP27_RT_TIMER_IRQ, &hub_rt_irqaction);
+	if (__request_percpu_irq(irq, hub_rt_counter_handler, IRQF_TIMER,
+				 "hub-rt", &hub_rt_clockevent) < 0)
+		pr_err("Failed to request percpu irq %d (hub-rt)\n", irq);
 }
 
 static u64 hub_rt_read(struct clocksource *cs)
diff --git a/arch/mips/sgi-ip30/ip30-timer.c b/arch/mips/sgi-ip30/ip30-timer.c
index d13e105478ae..dcc22eaddcda 100644
--- a/arch/mips/sgi-ip30/ip30-timer.c
+++ b/arch/mips/sgi-ip30/ip30-timer.c
@@ -52,11 +52,11 @@ void __init plat_time_init(void)
 	int irq = get_c0_compare_int();
 
 	cp0_timer_irq_installed = 1;
-	c0_compare_irqaction.percpu_dev_id = &mips_clockevent_device;
-	c0_compare_irqaction.flags &= ~IRQF_SHARED;
 	irq_set_handler(irq, handle_percpu_devid_irq);
 	irq_set_percpu_devid(irq);
-	setup_percpu_irq(irq, &c0_compare_irqaction);
+	if (__request_percpu_irq(irq, c0_compare_interrupt, IRQF_TIMER, "timer",
+				 &mips_clockevent_device) < 0)
+		pr_err("Failed to request percpu irq %d (timer)\n", irq);
 	enable_percpu_irq(irq, IRQ_TYPE_NONE);
 
 	ip30_heart_clocksource_init();
-- 
2.18.0

