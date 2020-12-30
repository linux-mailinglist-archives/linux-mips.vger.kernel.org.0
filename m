Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50302E75CD
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 04:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgL3DZR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 22:25:17 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:57467 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726138AbgL3DZP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 22:25:15 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id A4D349D7;
        Tue, 29 Dec 2020 22:24:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 29 Dec 2020 22:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=N587kIZF++Onsdnv505v6x5WYf
        BETpt5IAx0RuRgOzA=; b=aXLPl7s7zREyCZ4U7hSVnkES8/Ze2bJw7hmfrV2M1Y
        bz3rMaPKS0LxvHZsF4gSNePVopeGjZIf+DHdgfu5KrWOBi2OGH0Laj8huwWbpyRt
        3aahjUFHjCrUHVBKwOPjFXHmTH82ZNCeiGsyjOryZ0HPn9ke5PXRO+V6CRQF0yFy
        8t4uKm+h1VKKwg+zkNan/SQTKdy+FjcO7KYwux4v6c3ygm1Ve1sL7rC3i9EOGgaW
        YTeIbPNQ8Ia93lYfo5fsJmZmb9x9iSsl4yJ31VOTeK2rPnPw/vqm2fZ/0/26dS6n
        SZs7Yz3HqJ6pp8s6tdNdfyXldFpQgHCdw8QPv5jJ905g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N587kIZF++Onsdnv5
        05v6x5WYfBETpt5IAx0RuRgOzA=; b=b9Iid9/tiJXeJDOq/vwVdnaTaiWZTqgY4
        2ovR7GzBFQGcMYecZPdLRVfgv12PbGTxdiRSxk/TdbV8qgDloxDs+/PPl6iv1Nm3
        LFkOy9D8/DuL+8PrqTvZmgC0qSHzpdRjG4hH9CazrLNxr2jofsUT99VmVfw290GS
        vSn+JsCCwljOdrvVOlrM8yWEvnVBh7AOVHjYTXAIIPSmEyws/+ZhH0idwu8K/F89
        988gMA1RDc+dH2Oe+5jqy3hpN/MTNxnhLEaGweGgCM3eon3mQVm9b7udHSqpVV3w
        U1hNLu31GOpMrVskVs2t2OoJhxxLCErjCdFNgzXwD4PJUm5pr5o1A==
X-ME-Sender: <xms:0vLrXwHAeEaMowGFAyNa6Ctj2avG1bNuw26HH1_47m4sVGa6jsRu9A>
    <xme:0vLrX5XCzKR9Z3yu04EeX1KvQOBZHcGe8oiW4GEONZxMmkuaCe3vFaMrot0AoE0xO
    HZubTKYAihrV985-YM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvvddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
    jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
    grthhtvghrnhephfejtdektdeuhedtieefteekveffteejteefgeekveegffetvddugfel
    iefhtddunecukfhppeeitddrudejjedrudekledrudejudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhm
X-ME-Proxy: <xmx:0vLrX6IPvbCLgZMAYWxC3NmFrP1bbaynLX5DtuViineRISAhSO55tg>
    <xmx:0vLrXyGgxkY85AqztpAOn2htFz4Qau3ogazy_HbntVtbwwXUFYfx0g>
    <xmx:0vLrX2WYHw_O9chQZx-dI0mSgtWYdd8A3csEJB5iYxdDG64ZpjdT-Q>
    <xmx:1_LrX_MNYZQU6gDhv0RRAwRj3jgrEGjzMHT7esmuo5YucJC4u7QNpFUttMFfiAHa>
Received: from strike.202.net.flygoat.com (unknown [60.177.189.171])
        by mail.messagingengine.com (Postfix) with ESMTPA id B122A1080064;
        Tue, 29 Dec 2020 22:23:56 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        WANG Xuerui <git@xen0n.name>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>, YunQiang Su <syq@debian.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] MIPS: Add vulnerabilities infrastructure
Date:   Wed, 30 Dec 2020 11:23:07 +0800
Message-Id: <20201230032314.10042-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add infrastructure to display CPU vulnerabilities.
As most MIPS CPU vendors are dead today and we can't confirm
vulnerabilities states with them, we'll display vulnerabilities
as "Unknown" by default and override them in cpu-probe.c

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                |  1 +
 arch/mips/include/asm/cpu-info.h |  5 ++++
 arch/mips/include/asm/cpu.h      |  7 +++++
 arch/mips/kernel/Makefile        |  2 +-
 arch/mips/kernel/vulnbl.c        | 46 ++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/kernel/vulnbl.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ef5b2a177b1b..524053b8f769 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -24,6 +24,7 @@ config MIPS
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
+	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_IOMAP
 	select GENERIC_IRQ_PROBE
diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
index a600670d00e9..1a964dbfc0a8 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -106,6 +106,11 @@ struct cpuinfo_mips {
 	unsigned int		guestid_mask;
 	unsigned int		guestid_cache;
 
+	/* Vulnerabilities */
+	unsigned int		vulnerabilities; /* Vulnerabilities states that we known */
+	unsigned int		vulnerable; /* Vulnerabilities affated */
+	unsigned int		mitigations; /* Mitigations */
+
 #ifdef CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION
 	/* CPUCFG data for this CPU, synthesized at probe time.
 	 *
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index f5b04e8f6061..3414c9f5464e 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -447,4 +447,11 @@ enum cpu_type_enum {
 #define MIPS_ASE_LOONGSON_EXT	0x00002000 /* Loongson EXTensions */
 #define MIPS_ASE_LOONGSON_EXT2	0x00004000 /* Loongson EXTensions R2 */
 
+/*
+ * CPU security vulnerabilities
+ */
+#define MIPS_VULNBL_MELTDOWN	BIT(0)
+#define MIPS_VULNBL_SPECTRE_V1	BIT(1)
+#define MIPS_VULNBL_SPECTRE_V2	BIT(2)
+
 #endif /* _ASM_CPU_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 13a26d254829..39abc8ead5e0 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -8,7 +8,7 @@ extra-y		:= head.o vmlinux.lds
 obj-y		+= cmpxchg.o cpu-probe.o branch.o elf.o entry.o genex.o idle.o irq.o \
 		   process.o prom.o ptrace.o reset.o setup.o signal.o \
 		   syscall.o time.o topology.o traps.o unaligned.o watch.o \
-		   vdso.o cacheinfo.o
+		   vdso.o cacheinfo.o vulnbl.o
 
 ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_ftrace.o = -pg
diff --git a/arch/mips/kernel/vulnbl.c b/arch/mips/kernel/vulnbl.c
new file mode 100644
index 000000000000..fc73da6214fe
--- /dev/null
+++ b/arch/mips/kernel/vulnbl.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2020, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  MIPS CPU vulnerabilities
+ */
+
+#include <linux/device.h>
+
+#include <asm/cpu-info.h>
+#include <asm/cpu.h>
+
+ssize_t cpu_show_meltdown(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_MELTDOWN))
+		return sprintf(buf, "Unknown\n");
+
+	if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_MELTDOWN))
+		return sprintf(buf, "Not affected\n");
+
+	return sprintf(buf, "Affected\n");
+}
+
+ssize_t cpu_show_spectre_v1(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_SPECTRE_V1))
+		return sprintf(buf, "Unknown\n");
+
+	if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_SPECTRE_V1))
+		return sprintf(buf, "Not affected\n");
+
+	return sprintf(buf, "Affected\n");
+}
+
+ssize_t cpu_show_spectre_v2(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	if (!(boot_cpu_data.vulnerabilities & MIPS_VULNBL_SPECTRE_V2))
+		return sprintf(buf, "Unknown\n");
+
+	if (!(boot_cpu_data.vulnerable & MIPS_VULNBL_SPECTRE_V2))
+		return sprintf(buf, "Not affected\n");
+
+	return sprintf(buf, "Affected\n");
+}
-- 
2.30.0

