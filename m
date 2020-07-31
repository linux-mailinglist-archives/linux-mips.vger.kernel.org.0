Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E9E233E21
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 06:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgGaEMB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 00:12:01 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:42414 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgGaEMA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 00:12:00 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id E43091FEB5;
        Fri, 31 Jul 2020 04:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1596168719; bh=XbAuVWGJ53uaGf3mqTQrfRt8OpiJ6Pji6xLj0mTAQKQ=;
        h=From:To:Cc:Subject:Date:From;
        b=kOh9Sok6QKXxhL1spvB05M+RDY9CIXO2tecYEVK+HjrddvpOWJh02pUSnEtSFCy6/
         jOWPzrRkLnC/bRpg65lYp3ANWnSFHLatMac1GR5NnalTzlHwPl1+AFnUI8cMwjVqbk
         b4qzgasgZ/0k0xQqywDsbUrXJxABhsLazMfIarDMQXvwf64d7imG4l9ISfY+c0A+y6
         wprGjxZbCPoYFFBaeuCSngNVss1MIB8OkVl80hvgyYcz024iwRqW860bmlU47FV0LB
         LCmF3aATD/yWO8YqgSAseGjjBlgquKUrNqHFp0XlHeREdiByPeaWyVOK/C/75xEYb9
         voVtq7zwpHMLA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Provide Kconfig option for default IEEE754 conformance mode
Date:   Fri, 31 Jul 2020 12:11:50 +0800
Message-Id: <20200731041152.1382077-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Requested by downstream distros, a Kconfig option for default
IEEE754 conformance mode allows them to set their mode to
relaxed by default.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig            | 21 +++++++++++++++++++++
 arch/mips/kernel/cpu-probe.c | 12 +++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f6bb446d30f0..ef5b2a177b1b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2877,6 +2877,27 @@ config MIPS_NR_CPU_NR_MAP
 	default 1024 if MIPS_NR_CPU_NR_MAP_1024
 	default NR_CPUS if !MIPS_NR_CPU_NR_MAP_1024
 
+choice
+	prompt "Default IEEE Std 754 conformance mode"
+	default IEEE754_DEFAULT_STRICT
+	help
+	  Default IEEE Std 754 conformance mode, see ieee754= kernel parameter
+	  for detail.
+
+	config IEEE754_DEFAULT_STRICT
+		bool "Strict"
+
+	config IEEE754_DEFAULT_LEGACY
+		bool "Legacy"
+
+	config IEEE754_DEFAULT_STD2008
+		bool "2008"
+
+	config IEEE754_DEFAULT_RELAXED
+		bool "Relaxed"
+
+endchoice
+
 #
 # Timer Interrupt Frequency Configuration
 #
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index d9e8d39a7289..03adeed58efb 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -157,7 +157,17 @@ static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
  * IEEE 754 conformance mode to use.  Affects the NaN encoding and the
  * ABS.fmt/NEG.fmt execution mode.
  */
-static enum { STRICT, LEGACY, STD2008, RELAXED } ieee754 = STRICT;
+enum ieee754_mode { STRICT, LEGACY, STD2008, RELAXED };
+
+#if defined(CONFIG_IEEE754_DEFAULT_STRICT)
+static enum ieee754_mode ieee754 = STRICT;
+#elif defined(CONFIG_IEEE754_DEFAULT_LEGACY)
+static enum ieee754_mode ieee754 = LEGACY;
+#elif defined(CONFIG_IEEE754_DEFAULT_STD2008)
+static enum ieee754_mode ieee754 = STD2008;
+#elif defined(CONFIG_IEEE754_DEFAULT_RELAXED)
+static enum ieee754_mode ieee754 = RELAXED;
+#endif
 
 /*
  * Set the IEEE 754 NaN encodings and the ABS.fmt/NEG.fmt execution modes
-- 
2.28.0

