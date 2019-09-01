Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0C1A4A4B
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbfIAPzf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:55:35 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:42214 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAPze (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:55:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id D18843F684
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:55:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bH-CMv7QFr-n for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:55:33 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 356073F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:55:33 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:55:33 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 049/120] MIPS: PS2: Power off support
Message-ID: <f8961e0b92874c58c07951430d7b8d4899feb5b2.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/ps2/Makefile |  1 +
 arch/mips/ps2/reboot.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 arch/mips/ps2/reboot.c

diff --git a/arch/mips/ps2/Makefile b/arch/mips/ps2/Makefile
index b53bddcc8c01..6f671112fbcb 100644
--- a/arch/mips/ps2/Makefile
+++ b/arch/mips/ps2/Makefile
@@ -3,6 +3,7 @@ obj-y		+= identify.o
 obj-y		+= intc-irq.o
 obj-y		+= irq.o
 obj-y		+= memory.o
+obj-y		+= reboot.o
 obj-y		+= rom.o
 obj-m		+= rom-sysfs.o
 obj-y		+= scmd.o
diff --git a/arch/mips/ps2/reboot.c b/arch/mips/ps2/reboot.c
new file mode 100644
index 000000000000..b2a3ada5268b
--- /dev/null
+++ b/arch/mips/ps2/reboot.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 power off
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/init.h>
+#include <linux/pm.h>
+
+#include <asm/processor.h>
+#include <asm/reboot.h>
+
+#include <asm/mach-ps2/scmd.h>
+
+static void __noreturn power_off(void)
+{
+	scmd_power_off();
+
+	cpu_relax_forever();
+}
+
+static int __init ps2_init_reboot(void)
+{
+	pm_power_off = power_off;
+
+	return 0;
+}
+subsys_initcall(ps2_init_reboot);
-- 
2.21.0

