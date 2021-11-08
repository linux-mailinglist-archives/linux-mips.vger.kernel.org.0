Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F494477EF
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 02:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237173AbhKHAyb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Nov 2021 19:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236310AbhKHAxE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Nov 2021 19:53:04 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA15C0797B6;
        Sun,  7 Nov 2021 16:48:26 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id y26so32420595lfa.11;
        Sun, 07 Nov 2021 16:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=guWA5fFZeGPtiBZOYoQcCwu2VFdVsVhLW9/JhrymZ0g=;
        b=huNVHXIGcNiboRU+2HneDlBr7/fF95MK9XlhWzznGv905YJrYCM7/NGsFdwo8k8UFe
         Lj3SyYz3IpnNt7q2Voe6Pu4zz0+FeyfEpSrAq2Vaj8WlmSZmZe5VZDtGhGZu6JEKkCPh
         gMgGfEHeF76DgdR1+EdclAhRRygJJkEC1TGe4eaa/+i2YXeZb8POvtFVgEvnFomKahuR
         1CUdLbfLeP5eRZ2U4i6Tdjox5OAMe0W1GonnC1QI/fQ1yCtNK2FU1q25/RcCCNMYaqXI
         QxhyIU1fG9BSFVOrVIf00oE2Z2Xcts2ZNKWQ3Qu0JtgfWiSVAD4GTBtX/QIgycMZN2W6
         kQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=guWA5fFZeGPtiBZOYoQcCwu2VFdVsVhLW9/JhrymZ0g=;
        b=k0LlQRF7BXLveGFwb4IQWxYdQtm+lL0ZTzvTSQSVwSBulDIaegDyPXhuCBRFNoT7tk
         gTV2p1rTlZbuH95Uo9/kq89OzwiTZ1WB5Ai/4iweR3BLfptuUrEntSplw2HEjy9KPHG+
         gxZbAFuS1vwTEOTpPBrtiOfAtoP/howX5FJlp2fI/OpbRdAmznPysxChUOwJPoBZuDVv
         xs9a4NrTSIebAwfZ1f/NWEuHaDuzrnf4xvsAYxen3Lu2qJ6MW7HAB71PRJnaJWT/NB2B
         Ab3aLdxrIIIMY7wGLsP1ekaG4mw+tPA+pkefjFI5x1Z6TvG4DtMIXCsB2cG8d4nJGwR8
         8uxw==
X-Gm-Message-State: AOAM531l5omZpp+mIjYy7HIjIpjZznxYCqnECrrhGvy9fpym9wyIRAWT
        v0jMIaIkZVbJt1fVpdyv85M=
X-Google-Smtp-Source: ABdhPJy93dX/dYcotZ6VcquokSWN9nEJE7uBT7JKSQJ2xpdMXwgcia+L2i9GFKzghCdM19cNeKxRFw==
X-Received: by 2002:ac2:5f6d:: with SMTP id c13mr16423138lfc.501.1636332504765;
        Sun, 07 Nov 2021 16:48:24 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru. [79.139.188.96])
        by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 16:48:24 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 21/25] m68k: Switch to new sys-off handler API
Date:   Mon,  8 Nov 2021 03:45:20 +0300
Message-Id: <20211108004524.29465-22-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
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
index 4b51bfd38e5f..50f4f120a4ff 100644
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
index 5d16f9b47aa9..727320dedf08 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -12,6 +12,7 @@
 
 #include <linux/errno.h>
 #include <linux/module.h>
+#include <linux/reboot.h>
 #include <linux/types.h>
 #include <linux/mm.h>
 #include <linux/tty.h>
@@ -139,7 +140,6 @@ void __init config_mac(void)
 	mach_hwclk = mac_hwclk;
 	mach_reset = mac_reset;
 	mach_halt = mac_poweroff;
-	mach_power_off = mac_poweroff;
 #if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
 	mach_beep = mac_mksound;
 #endif
@@ -159,6 +159,8 @@ void __init config_mac(void)
 
 	if (macintosh_config->ident == MAC_MODEL_IICI)
 		mach_l2_flush = via_l2_flush;
+
+	register_platform_power_off(mac_poweroff);
 }
 
 
-- 
2.33.1

