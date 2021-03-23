Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249363462B8
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 16:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhCWPZL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 11:25:11 -0400
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:49645 "EHLO
        out28-148.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbhCWPYy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 11:24:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09372319|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00677813-0.000306783-0.992915;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.Jp5t6E3_1616513066;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Jp5t6E3_1616513066)
          by smtp.aliyun-inc.com(10.147.44.129);
          Tue, 23 Mar 2021 23:24:45 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     hminas@synopsys.com, gregkh@linuxfoundation.org,
        paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com,
        =?UTF-8?q?Dragan=20=C4=8Ce=C4=8Davac?= <dragancecavac@yahoo.com>
Subject: [PATCH] USB: DWC2: Add VBUS overcurrent detection control.
Date:   Tue, 23 Mar 2021 23:24:26 +0800
Message-Id: <1616513066-62025-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Introduce configurable option for enabling GOTGCTL register
bits VbvalidOvEn and VbvalidOvVal. Once selected it disables
VBUS overcurrent detection.

This patch is derived from Dragan Čečavac (in the kernel 3.18
tree of CI20). It is very useful for the MIPS Creator CI20(r1).
Without this patch, CI20's OTG port has a great probability to
face overcurrent warning, which breaks the OTG functionality.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Dragan Čečavac <dragancecavac@yahoo.com>
---
 drivers/usb/dwc2/Kconfig | 6 ++++++
 drivers/usb/dwc2/core.c  | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/dwc2/Kconfig b/drivers/usb/dwc2/Kconfig
index c131719..e40d187 100644
--- a/drivers/usb/dwc2/Kconfig
+++ b/drivers/usb/dwc2/Kconfig
@@ -94,4 +94,10 @@ config USB_DWC2_DEBUG_PERIODIC
 	  non-periodic transfers, but of course the debug logs will be
 	  incomplete. Note that this also disables some debug messages
 	  for which the transfer type cannot be deduced.
+
+config USB_DWC2_DISABLE_VOD
+	bool "Disable VBUS overcurrent detection"
+	help
+	  Say Y here to switch off VBUS overcurrent detection. It enables USB
+	  functionality blocked by overcurrent detection.
 endif
diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index fec17a2..c629dc97 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -1200,6 +1200,7 @@ static int dwc2_hs_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
 int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
 {
 	u32 usbcfg;
+	u32 otgctl;
 	int retval = 0;
 
 	if ((hsotg->params.speed == DWC2_SPEED_PARAM_FULL ||
@@ -1231,6 +1232,14 @@ int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
 		dwc2_writel(hsotg, usbcfg, GUSBCFG);
 	}
 
+	if (IS_ENABLED(CONFIG_USB_DWC2_DISABLE_VOD)) {
+		if (dwc2_is_host_mode(hsotg)) {
+			otgctl = readl(hsotg->regs + GOTGCTL);
+			otgctl |= GOTGCTL_VBVALOEN | GOTGCTL_VBVALOVAL;
+			writel(otgctl, hsotg->regs + GOTGCTL);
+		}
+	}
+
 	return retval;
 }
 
-- 
2.7.4

