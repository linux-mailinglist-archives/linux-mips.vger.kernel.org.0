Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46D744FC8CC
	for <lists+linux-mips@lfdr.de>; Tue, 12 Apr 2022 01:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241766AbiDKXo1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Apr 2022 19:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239027AbiDKXmI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Apr 2022 19:42:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFA22316F;
        Mon, 11 Apr 2022 16:39:45 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id A8ED81F43D21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1649720384;
        bh=3jxNCr50hXMiuQKPY6aSTyDwgW9MB8tpZKXxC2xIhis=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R6Pz+NW8C1nY5ThJ2I8cAwEUAIBn3TF8sggu7KSDpBA2Ut/0exz6Xps+3/DnVgwBN
         qp6Lqyx7CPyAYk+qZkUxz2KCm7SnCRJ4eOYnawabjYhGt6nRnQa9Y02z/Ytkv2jXpZ
         wEcsyt2MDHlC1WX/nw52J0c857HvVJOhLeDrY7yRKznEzlbGj2ZC8hDBsKt1V+pZeP
         zbdktiCEBi99v8s5+GasfGckA5YJsjqZH0zL18RDx2s4TE9tXf9pP/XNP1Ahm7vU8u
         u3DSr1rfrTs/d19jgQcujhTQ+xjiQHnAYsKAqXTDcAVEVHrQCWORpLx/uihf64AFFO
         sfXLGACDgXMIg==
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sebastian Reichel <sre@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v7 12/20] m68k: Switch to new sys-off handler API
Date:   Tue, 12 Apr 2022 02:38:24 +0300
Message-Id: <20220411233832.391817-13-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Kernel now supports chained power-off handlers. Use
register_power_off_handler() that registers power-off handlers and
do_kernel_power_off() that invokes chained power-off handlers. Legacy
pm_power_off() will be removed once all drivers will be converted to
the new power-off API.

Normally arch code should adopt only the do_kernel_power_off() at first,
but m68k is a special case because it uses pm_power_off() "inside out",
i.e. pm_power_off() invokes machine_power_off() [in fact it does nothing],
while it's machine_power_off() that should invoke the pm_power_off(), and
thus, we can't convert platforms to the new API separately. There are only
two platforms changed here, so it's not a big deal.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 arch/m68k/emu/natfeat.c         | 3 ++-
 arch/m68k/include/asm/machdep.h | 1 -
 arch/m68k/kernel/process.c      | 5 ++---
 arch/m68k/kernel/setup_mm.c     | 1 -
 arch/m68k/kernel/setup_no.c     | 1 -
 arch/m68k/mac/config.c          | 4 +++-
 6 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/emu/natfeat.c b/arch/m68k/emu/natfeat.c
index 71b78ecee75c..b19dc00026d9 100644
--- a/arch/m68k/emu/natfeat.c
+++ b/arch/m68k/emu/natfeat.c
@@ -15,6 +15,7 @@
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/reboot.h>
 #include <linux/io.h>
 #include <asm/machdep.h>
 #include <asm/natfeat.h>
@@ -90,5 +91,5 @@ void __init nf_init(void)
 	pr_info("NatFeats found (%s, %lu.%lu)\n", buf, version >> 16,
 		version & 0xffff);
 
-	mach_power_off = nf_poweroff;
+	register_platform_power_off(nf_poweroff);
 }
diff --git a/arch/m68k/include/asm/machdep.h b/arch/m68k/include/asm/machdep.h
index 8fd80ef1b77e..8d8c3ee2069f 100644
--- a/arch/m68k/include/asm/machdep.h
+++ b/arch/m68k/include/asm/machdep.h
@@ -24,7 +24,6 @@ extern int (*mach_get_rtc_pll)(struct rtc_pll_info *);
 extern int (*mach_set_rtc_pll)(struct rtc_pll_info *);
 extern void (*mach_reset)( void );
 extern void (*mach_halt)( void );
-extern void (*mach_power_off)( void );
 extern unsigned long (*mach_hd_init) (unsigned long, unsigned long);
 extern void (*mach_hd_setup)(char *, int *);
 extern void (*mach_heartbeat) (int);
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index a6030dbaa089..e160a7c57bd3 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -67,12 +67,11 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
-	if (mach_power_off)
-		mach_power_off();
+	do_kernel_power_off();
 	for (;;);
 }
 
-void (*pm_power_off)(void) = machine_power_off;
+void (*pm_power_off)(void);
 EXPORT_SYMBOL(pm_power_off);
 
 void show_regs(struct pt_regs * regs)
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 8f94feed969c..47d55541612f 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -98,7 +98,6 @@ EXPORT_SYMBOL(mach_get_rtc_pll);
 EXPORT_SYMBOL(mach_set_rtc_pll);
 void (*mach_reset)( void );
 void (*mach_halt)( void );
-void (*mach_power_off)( void );
 #ifdef CONFIG_HEARTBEAT
 void (*mach_heartbeat) (int);
 EXPORT_SYMBOL(mach_heartbeat);
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 5e4104f07a44..00bf82258233 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -55,7 +55,6 @@ int (*mach_hwclk) (int, struct rtc_time*);
 /* machine dependent reboot functions */
 void (*mach_reset)(void);
 void (*mach_halt)(void);
-void (*mach_power_off)(void);
 
 #ifdef CONFIG_M68000
 #if defined(CONFIG_M68328)
diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 65d124ec80bb..382f656c29ea 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -12,6 +12,7 @@
 
 #include <linux/errno.h>
 #include <linux/module.h>
+#include <linux/reboot.h>
 #include <linux/types.h>
 #include <linux/mm.h>
 #include <linux/tty.h>
@@ -140,7 +141,6 @@ void __init config_mac(void)
 	mach_hwclk = mac_hwclk;
 	mach_reset = mac_reset;
 	mach_halt = mac_poweroff;
-	mach_power_off = mac_poweroff;
 #if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
 	mach_beep = mac_mksound;
 #endif
@@ -160,6 +160,8 @@ void __init config_mac(void)
 
 	if (macintosh_config->ident == MAC_MODEL_IICI)
 		mach_l2_flush = via_l2_flush;
+
+	register_platform_power_off(mac_poweroff);
 }
 
 
-- 
2.35.1

