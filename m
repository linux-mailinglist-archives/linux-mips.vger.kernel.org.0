Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0C13F4F8C
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 19:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhHWRfC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 13:35:02 -0400
Received: from aposti.net ([89.234.176.197]:54898 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229946AbhHWRfB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 13:35:01 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, list@opendingux.net,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] MIPS: ingenic: Unconditionally enable clock of CPU #0
Date:   Mon, 23 Aug 2021 18:34:05 +0100
Message-Id: <20210823173405.153323-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Make sure that the PLL that feeds the CPU won't be stopped while the
kernel is running.

This fixes a problem on JZ4760 (and probably others) where under very
specific conditions, the main PLL would be turned OFF when the kernel
was shutting down, causing the shutdown process to fail.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/generic/board-ingenic.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/mips/generic/board-ingenic.c b/arch/mips/generic/board-ingenic.c
index 00161ed4884a..5064cf770d64 100644
--- a/arch/mips/generic/board-ingenic.c
+++ b/arch/mips/generic/board-ingenic.c
@@ -7,6 +7,8 @@
  * Copyright (C) 2020 Paul Cercueil <paul@crapouillou.net>
  */
 
+#include <linux/clk.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_fdt.h>
 #include <linux/pm.h>
@@ -114,10 +116,36 @@ static const struct platform_suspend_ops ingenic_pm_ops __maybe_unused = {
 
 static int __init ingenic_pm_init(void)
 {
+	struct device_node *cpu_node;
+	struct clk *cpu0_clk;
+	int ret;
+
 	if (boot_cpu_type() == CPU_XBURST) {
 		if (IS_ENABLED(CONFIG_PM_SLEEP))
 			suspend_set_ops(&ingenic_pm_ops);
 		_machine_halt = ingenic_halt;
+
+		/*
+		 * Unconditionally enable the clock for the first CPU.
+		 * This makes sure that the PLL that feeds the CPU won't be
+		 * stopped while the kernel is running.
+		 */
+		cpu_node = of_get_cpu_node(0, NULL);
+		if (!cpu_node) {
+			pr_err("Unable to get CPU node\n");
+		} else {
+			cpu0_clk = of_clk_get(cpu_node, 0);
+			if (IS_ERR(cpu0_clk)) {
+				pr_err("Unable to get CPU0 clock\n");
+				return PTR_ERR(cpu0_clk);
+			}
+
+			ret = clk_prepare_enable(cpu0_clk);
+			if (ret) {
+				pr_err("Unable to enable CPU0 clock\n");
+				return ret;
+			}
+		}
 	}
 
 	return 0;
-- 
2.32.0

