Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4BE283387
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 11:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgJEJm0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 05:42:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:41268 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgJEJmZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 5 Oct 2020 05:42:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5234BAB54;
        Mon,  5 Oct 2020 09:42:24 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: alchemy: Fix build breakage, if TOUCHSCREEN_WM97XX is disabled
Date:   Mon,  5 Oct 2020 11:42:19 +0200
Message-Id: <20201005094219.49254-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Only include wm97xx touchscreen probing code, if driver is enabled.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/alchemy/devboards/db1300.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index 8ac1f56ee57d..cd72eaa1168f 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -731,6 +731,7 @@ static struct platform_device db1300_lcd_dev = {
 
 /**********************************************************************/
 
+#if IS_ENABLED(CONFIG_TOUCHSCREEN_WM97XX)
 static void db1300_wm97xx_irqen(struct wm97xx *wm, int enable)
 {
 	if (enable)
@@ -762,6 +763,12 @@ static int db1300_wm97xx_probe(struct platform_device *pdev)
 
 	return wm97xx_register_mach_ops(wm, &db1300_wm97xx_ops);
 }
+#else
+static int db1300_wm97xx_probe(struct platform_device *pdev)
+{
+	return -ENODEV;
+}
+#endif
 
 static struct platform_driver db1300_wm97xx_driver = {
 	.driver.name	= "wm97xx-touch",
-- 
2.16.4

