Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA6DED1CF
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2019 06:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfKCFS1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 Nov 2019 01:18:27 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42099 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfKCFS1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 Nov 2019 01:18:27 -0400
Received: by mail-pg1-f195.google.com with SMTP id s23so5727279pgo.9
        for <linux-mips@vger.kernel.org>; Sat, 02 Nov 2019 22:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QMWsnmZes6BjXB3uf0hAsp7mY3XTpf71QcOtyWt+1+0=;
        b=HvcXZ8oBJFWAeGC98mFn9kW2PIldAWAgpvQWR0iK+6tRf4kHe7LgEJXuF1N/P6LrBu
         Xyb2UuPbkfa14crSmJCIDC4pnv+aSalt2a145aPRA9ymmO7up3hSRgI7RtLfjcUFPQlw
         jBJPNPbXqo3ZEZWhhtDIW0Fy7oyfXwLsmCkXi7uWYfVMd4yvFvQMUy5TCImBf5Ac376i
         rikzeWeCQVne45SeGb4MyjOtUGyHHcItoSDQW9mJFGQXUQhZjVqpSd2OCE6UDjWfInzi
         wIDfs/Im31tVUWhoIrdHVJoTA1f0lwpIfNdJxLMn3MzvlNqMWPkQFI2dB35HgIubxx3K
         t1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=QMWsnmZes6BjXB3uf0hAsp7mY3XTpf71QcOtyWt+1+0=;
        b=d3i9rzVyd22SsLkgE5wl3c3EN3KObWSjZ4TwG6iS0H/voVgc6U6cM8tEzrqAnj95zE
         3ZbAeJ8Lu/jPle05h9w6WKQp/9v76Zog2B+7c9u0fenUmQsbZHhHxp2x5ZQKWes4hNRm
         2SNH/XPVe48u86awKP0vuEBI/x2g61BRFTXatxTsN6EOro7wcJe11u9ZEVYlImyFHW7W
         UuBz6j/+vflX+uAjwVCiHLXX9tWqjnlwsWXR8YrqOl8+kDYSxngH6z/zKpcO6Bmtlp5e
         YaAYZ9HRtPK+LXeP0b0e4AiOtyNOficZsDRU7Rk0ZT/pb3G7OPPtvGe1Za+qGZ9zCT67
         +qOQ==
X-Gm-Message-State: APjAAAWFwvB2rompvGIYylC74mtdrz1TB15gDtEeZ8BG04O0Zge6UutJ
        AO/8qCchOFKsU4dG8C9RgRM=
X-Google-Smtp-Source: APXvYqwl2Myo/Xypy0eK69u7Iv+7Qjx6nH+StjArkbPPUznEuIeGUesWlNkqj8bbvNP1MmmLYDvsTA==
X-Received: by 2002:a17:90a:5a84:: with SMTP id n4mr11455029pji.72.1572758306251;
        Sat, 02 Nov 2019 22:18:26 -0700 (PDT)
Received: from software.domain.org (li566-100.members.linode.com. [192.155.80.100])
        by smtp.gmail.com with ESMTPSA id v2sm11191426pgf.39.2019.11.02.22.18.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 02 Nov 2019 22:18:25 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 2/3] MIPS: Loongson: Rename LOONGSON1 to LOONGSON32
Date:   Sun,  3 Nov 2019 13:20:16 +0800
Message-Id: <1572758417-29265-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1572758417-29265-1-git-send-email-chenhc@lemote.com>
References: <1572758417-29265-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Old Loongson-2E/2F has been removed, new Loongson-2/3 use LOONGSON64,
So rename LOONGSON1 to LOONGSON32 will make the naming style unified.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/Kconfig                    | 6 +++---
 arch/mips/include/asm/cpu-type.h     | 2 +-
 arch/mips/include/asm/cpu.h          | 2 +-
 arch/mips/include/asm/irqflags.h     | 2 +-
 arch/mips/include/asm/module.h       | 4 ++--
 arch/mips/kernel/cpu-probe.c         | 2 +-
 arch/mips/kernel/idle.c              | 2 +-
 arch/mips/kernel/perf_event_mipsxx.c | 2 +-
 arch/mips/kernel/traps.c             | 2 +-
 arch/mips/loongson32/Kconfig         | 2 +-
 arch/mips/loongson32/Platform        | 4 ++--
 arch/mips/oprofile/common.c          | 2 +-
 arch/mips/oprofile/op_model_mipsxx.c | 2 +-
 13 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 03e9304..b578eae 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1480,7 +1480,7 @@ config CPU_LOONGSON3_WORKAROUNDS
 config CPU_LOONGSON1B
 	bool "Loongson 1B"
 	depends on SYS_HAS_CPU_LOONGSON1B
-	select CPU_LOONGSON1
+	select CPU_LOONGSON32
 	select LEDS_GPIO_REGISTER
 	help
 	  The Loongson 1B is a 32-bit SoC, which implements the MIPS32
@@ -1490,7 +1490,7 @@ config CPU_LOONGSON1B
 config CPU_LOONGSON1C
 	bool "Loongson 1C"
 	depends on SYS_HAS_CPU_LOONGSON1C
-	select CPU_LOONGSON1
+	select CPU_LOONGSON32
 	select LEDS_GPIO_REGISTER
 	help
 	  The Loongson 1C is a 32-bit SoC, which implements the MIPS32
@@ -1853,7 +1853,7 @@ config SYS_SUPPORTS_ZBOOT_UART_PROM
 	bool
 	select SYS_SUPPORTS_ZBOOT
 
-config CPU_LOONGSON1
+config CPU_LOONGSON32
 	bool
 	select CPU_MIPS32
 	select CPU_MIPSR2
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index f40da24..d324c3d 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -21,7 +21,7 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 
 #if defined(CONFIG_SYS_HAS_CPU_LOONGSON1B) || \
     defined(CONFIG_SYS_HAS_CPU_LOONGSON1C)
-	case CPU_LOONGSON1:
+	case CPU_LOONGSON32:
 #endif
 
 #ifdef CONFIG_SYS_HAS_CPU_MIPS32_R1
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index b39ae3f..2d74f03 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -312,7 +312,7 @@ enum cpu_type_enum {
 	 */
 	CPU_4KC, CPU_4KEC, CPU_4KSC, CPU_24K, CPU_34K, CPU_1004K, CPU_74K,
 	CPU_ALCHEMY, CPU_PR4450, CPU_BMIPS32, CPU_BMIPS3300, CPU_BMIPS4350,
-	CPU_BMIPS4380, CPU_BMIPS5000, CPU_XBURST, CPU_LOONGSON1, CPU_M14KC,
+	CPU_BMIPS4380, CPU_BMIPS5000, CPU_XBURST, CPU_LOONGSON32, CPU_M14KC,
 	CPU_M14KEC, CPU_INTERAPTIV, CPU_P5600, CPU_PROAPTIV, CPU_1074K,
 	CPU_M5150, CPU_I6400, CPU_P6600, CPU_M6250,
 
diff --git a/arch/mips/include/asm/irqflags.h b/arch/mips/include/asm/irqflags.h
index 4d742ac..881754d 100644
--- a/arch/mips/include/asm/irqflags.h
+++ b/arch/mips/include/asm/irqflags.h
@@ -41,7 +41,7 @@ static inline unsigned long arch_local_irq_save(void)
 	"	.set	push						\n"
 	"	.set	reorder						\n"
 	"	.set	noat						\n"
-#if defined(CONFIG_CPU_LOONGSON64) || defined (CONFIG_CPU_LOONGSON1)
+#if defined(CONFIG_CPU_LOONGSON64) || defined (CONFIG_CPU_LOONGSON32)
 	"	mfc0	%[flags], $12					\n"
 	"	di							\n"
 #else
diff --git a/arch/mips/include/asm/module.h b/arch/mips/include/asm/module.h
index 03cc882..161e7b5 100644
--- a/arch/mips/include/asm/module.h
+++ b/arch/mips/include/asm/module.h
@@ -119,8 +119,8 @@ search_module_dbetables(unsigned long addr)
 #define MODULE_PROC_FAMILY "RM7000 "
 #elif defined CONFIG_CPU_SB1
 #define MODULE_PROC_FAMILY "SB1 "
-#elif defined CONFIG_CPU_LOONGSON1
-#define MODULE_PROC_FAMILY "LOONGSON1 "
+#elif defined CONFIG_CPU_LOONGSON32
+#define MODULE_PROC_FAMILY "LOONGSON32 "
 #elif defined CONFIG_CPU_LOONGSON64
 #define MODULE_PROC_FAMILY "LOONGSON64 "
 #elif defined CONFIG_CPU_CAVIUM_OCTEON
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 0933cfb..229d0ae 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1557,7 +1557,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 	case PRID_IMP_LOONGSON_32:  /* Loongson-1 */
 		decode_configs(c);
 
-		c->cputype = CPU_LOONGSON1;
+		c->cputype = CPU_LOONGSON32;
 
 		switch (c->processor_id & PRID_REV_MASK) {
 		case PRID_REV_LOONGSON1B:
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 57dfa6c..37f8e78 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -173,7 +173,7 @@ void __init check_wait(void)
 	case CPU_CAVIUM_OCTEON2:
 	case CPU_CAVIUM_OCTEON3:
 	case CPU_XBURST:
-	case CPU_LOONGSON1:
+	case CPU_LOONGSON32:
 	case CPU_XLR:
 	case CPU_XLP:
 		cpu_wait = r4k_wait;
diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 0af456a..128fc99 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -1764,7 +1764,7 @@ init_hw_perf_events(void)
 		mipspmu.general_event_map = &mipsxxcore_event_map;
 		mipspmu.cache_event_map = &mipsxxcore_cache_map;
 		break;
-	case CPU_LOONGSON1:
+	case CPU_LOONGSON32:
 		mipspmu.name = "mips/loongson1";
 		mipspmu.general_event_map = &mipsxxcore_event_map;
 		mipspmu.cache_event_map = &mipsxxcore_cache_map;
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 0c2570e..83f2a43 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1761,7 +1761,7 @@ static inline void parity_protection_init(void)
 
 	case CPU_5KC:
 	case CPU_5KE:
-	case CPU_LOONGSON1:
+	case CPU_LOONGSON32:
 		write_c0_ecc(0x80000000);
 		back_to_back_c0_hazard();
 		/* Set the PE bit (bit 31) in the c0_errctl register. */
diff --git a/arch/mips/loongson32/Kconfig b/arch/mips/loongson32/Kconfig
index 6dacc14..e27879b 100644
--- a/arch/mips/loongson32/Kconfig
+++ b/arch/mips/loongson32/Kconfig
@@ -38,7 +38,7 @@ endchoice
 menuconfig CEVT_CSRC_LS1X
 	bool "Use PWM Timer for clockevent/clocksource"
 	select MIPS_EXTERNAL_TIMER
-	depends on CPU_LOONGSON1
+	depends on CPU_LOONGSON32
 	help
 	  This option changes the default clockevent/clocksource to PWM Timer,
 	  and is required by Loongson1 CPUFreq support.
diff --git a/arch/mips/loongson32/Platform b/arch/mips/loongson32/Platform
index 3332155..7f8e342 100644
--- a/arch/mips/loongson32/Platform
+++ b/arch/mips/loongson32/Platform
@@ -1,4 +1,4 @@
-cflags-$(CONFIG_CPU_LOONGSON1)		+= -march=mips32r2 -Wa,--trap
+cflags-$(CONFIG_CPU_LOONGSON32)		+= -march=mips32r2 -Wa,--trap
 platform-$(CONFIG_MACH_LOONGSON32)	+= loongson32/
 cflags-$(CONFIG_MACH_LOONGSON32)	+= -I$(srctree)/arch/mips/include/asm/mach-loongson32
-load-$(CONFIG_CPU_LOONGSON1)		+= 0xffffffff80200000
+load-$(CONFIG_CPU_LOONGSON32)		+= 0xffffffff80200000
diff --git a/arch/mips/oprofile/common.c b/arch/mips/oprofile/common.c
index cbfa849..606aa12 100644
--- a/arch/mips/oprofile/common.c
+++ b/arch/mips/oprofile/common.c
@@ -92,7 +92,7 @@ int __init oprofile_arch_init(struct oprofile_operations *ops)
 	case CPU_P5600:
 	case CPU_I6400:
 	case CPU_M5150:
-	case CPU_LOONGSON1:
+	case CPU_LOONGSON32:
 	case CPU_SB1:
 	case CPU_SB1A:
 	case CPU_R10000:
diff --git a/arch/mips/oprofile/op_model_mipsxx.c b/arch/mips/oprofile/op_model_mipsxx.c
index 96c13a0..a537bf9 100644
--- a/arch/mips/oprofile/op_model_mipsxx.c
+++ b/arch/mips/oprofile/op_model_mipsxx.c
@@ -420,7 +420,7 @@ static int __init mipsxx_init(void)
 		op_model_mipsxx_ops.cpu_type = "mips/sb1";
 		break;
 
-	case CPU_LOONGSON1:
+	case CPU_LOONGSON32:
 		op_model_mipsxx_ops.cpu_type = "mips/loongson1";
 		break;
 
-- 
2.7.0

