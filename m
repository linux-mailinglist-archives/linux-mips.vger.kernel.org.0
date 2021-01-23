Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221813015E1
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 15:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbhAWOay (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 09:30:54 -0500
Received: from aposti.net ([89.234.176.197]:34542 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbhAWOaw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 09:30:52 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] remoteproc: ingenic: Add module parameter 'auto_boot'
Date:   Sat, 23 Jan 2021 14:29:56 +0000
Message-Id: <20210123142956.17865-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a 'auto_boot' module parameter that instructs the remoteproc driver
whether or not it should auto-boot the remote processor, which will
default to "false", since the VPU in Ingenic SoCs does not really have
any predetermined function.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/remoteproc/ingenic_rproc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
index 26e19e6143b7..e2618c36eaab 100644
--- a/drivers/remoteproc/ingenic_rproc.c
+++ b/drivers/remoteproc/ingenic_rproc.c
@@ -27,6 +27,11 @@
 #define AUX_CTRL_NMI		BIT(1)
 #define AUX_CTRL_SW_RESET	BIT(0)
 
+static bool auto_boot;
+module_param(auto_boot, bool, 0400);
+MODULE_PARM_DESC(auto_boot,
+		 "Auto-boot the remote processor [default=false]");
+
 struct vpu_mem_map {
 	const char *name;
 	unsigned int da;
@@ -172,6 +177,8 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
 	if (!rproc)
 		return -ENOMEM;
 
+	rproc->auto_boot = auto_boot;
+
 	vpu = rproc->priv;
 	vpu->dev = &pdev->dev;
 	platform_set_drvdata(pdev, vpu);
-- 
2.29.2

