Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F35D2350B9
	for <lists+linux-mips@lfdr.de>; Sat,  1 Aug 2020 08:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgHAGMA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Aug 2020 02:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgHAGMA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Aug 2020 02:12:00 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E35AC06174A;
        Fri, 31 Jul 2020 23:12:00 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id DF58A1F404;
        Sat,  1 Aug 2020 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1596262319; bh=d78HnpdokE7y3GpAwWH4pwZ1zgRImI58SarwkmVYDWM=;
        h=From:To:Cc:Subject:Date:From;
        b=fzK9SH7cTg6oULXyMul1G89s3GotfnnxSPgHDyp6pR9IeyJLs0iH2nCdSfggGZPBC
         gPDeU2vC4q3KJ0gfoykImCDbAiIOuyfkhqU2F6svGqFaOMHjQVgZwZPfYu4D/tlWFW
         +6CnUrWZMRJrjedOWx44rHqKJLIAyG89RFtmZdV8ixVBtITLMnwZsPpDJ5V0CngHHl
         eUAWHNYx6+CcxmiGldVyz+V42KIjd44ULM3u+J5dlCd6/iV/KafZtIOEa50u8Fjzqh
         ypwKipmAmMoJs3zvam7VSPOrEYZANdaW8ZpdvAaRjllsFTi1218RrRd707cHNQRb9S
         SrP8rGN30/SgQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        WANG Xuerui <git@xen0n.name>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: Provide Kconfig option for default IEEE 754 conformance mode
Date:   Sat,  1 Aug 2020 14:11:46 +0800
Message-Id: <20200801061147.1412187-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Requested by downstream distros, a Kconfig option for default
IEEE 754 conformance mode allows them to set their mode to
relaxed by default.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Huacai Chen <chenhc@lemote.com>

--
v2: Reword according to Xuerui's suggestion.
---
 arch/mips/Kconfig            | 22 ++++++++++++++++++++++
 arch/mips/kernel/cpu-probe.c | 12 +++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index eaf7519e3033..ac35df2b9133 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2899,6 +2899,28 @@ config MIPS_NR_CPU_NR_MAP
 	default 1024 if MIPS_NR_CPU_NR_MAP_1024
 	default NR_CPUS if !MIPS_NR_CPU_NR_MAP_1024
 
+choice
+	prompt "Default IEEE 754 conformance mode"
+	default IEEE754_DEFAULT_STRICT
+	help
+	  Sets the default IEEE 754 conformance mode, same as overriding the
+	  default value for the ieee754= kernel parameter. See the kernel
+	  parameter for details.
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
index c231c1b67889..a5b8fe019afc 100644
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
2.28.0.rc1

