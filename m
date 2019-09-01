Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E82BA4AA9
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfIAQgJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:36:09 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:33538 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQgJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:36:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0DCF33FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:36:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Rc02y_NILEGS for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:36:07 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 72DB73FBF6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:36:07 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:36:07 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 117/120] MIPS: PS2: Define R5900 feature overrides
Message-ID: <656c226804a2a6a93c4da13b8a95da2c60e905d7.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 .../asm/mach-ps2/cpu-feature-overrides.h      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/cpu-feature-overrides.h

diff --git a/arch/mips/include/asm/mach-ps2/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ps2/cpu-feature-overrides.h
new file mode 100644
index 000000000000..e9b218e657f7
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/cpu-feature-overrides.h
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 CPU features
+ *
+ * Copyright (C) 2010-2013 Jürgen Urban
+ */
+
+#ifndef __ASM_MACH_PS2_CPU_FEATURE_OVERRIDES_H
+#define __ASM_MACH_PS2_CPU_FEATURE_OVERRIDES_H
+
+#define cpu_has_llsc			0
+#define cpu_has_4k_cache		1
+#define cpu_has_divec			1
+#define cpu_has_4kex			1
+#define cpu_has_counter			1
+#define cpu_has_cache_cdex_p		0
+#define cpu_has_cache_cdex_s		0
+#define cpu_has_mcheck			0
+#define cpu_has_nofpuex			1
+#define cpu_has_mipsmt			0
+#define cpu_has_vce			0
+#define cpu_has_dsp			0
+#define cpu_has_userlocal		0
+#define cpu_has_64bit_addresses		0
+#define cpu_has_64bit   		1	/* FIXME */
+#define cpu_has_64bit_gp_regs		0	/* FIXME */
+#define cpu_has_64bit_zero_reg		0	/* FIXME */
+#define cpu_vmbits			31
+#define cpu_has_clo_clz			0
+#define cpu_has_ejtag			0
+#define cpu_has_ic_fills_f_dc		0
+#define cpu_has_inclusive_pcaches	0
+#define cpu_has_fpu 			0	/* FIXME */
+
+#endif /* __ASM_MACH_PS2_CPU_FEATURE_OVERRIDES_H */
-- 
2.21.0

