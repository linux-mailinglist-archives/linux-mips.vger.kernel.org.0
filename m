Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D8C50A6D3
	for <lists+linux-mips@lfdr.de>; Thu, 21 Apr 2022 19:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387072AbiDURS3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Apr 2022 13:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390650AbiDURSW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Apr 2022 13:18:22 -0400
Received: from out28-125.mail.aliyun.com (out28-125.mail.aliyun.com [115.124.28.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FD617064;
        Thu, 21 Apr 2022 10:15:27 -0700 (PDT)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08302546|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0133573-0.000673897-0.985969;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047212;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.NVFIbBb_1650561320;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.NVFIbBb_1650561320)
          by smtp.aliyun-inc.com(33.40.31.76);
          Fri, 22 Apr 2022 01:15:22 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     gregkh@linuxfoundation.org, hminas@synopsys.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, tsbogend@alpha.franken.de,
        paul@crapouillou.net
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, reimu@sudomaker.com,
        =?UTF-8?q?Dragan=20=C4=8Ce=C4=8Davac?= <dragancecavac@yahoo.com>
Subject: [PATCH v4 2/3] USB: dwc2: Add OTG support for Ingenic SoCs.
Date:   Fri, 22 Apr 2022 01:15:07 +0800
Message-Id: <1650561308-54704-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650561308-54704-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1650561308-54704-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add OTG support for the JZ4775 SoC, the JZ4780 SoC, the X1000 SoC,
the X1600 SoC, the X1830 SoC, and the X2000 SoC from Ingenic.

Introduce support for disable Ingenic overcurrent detection, once
selected, it enables the GOTGCTL register bits VbvalidOvEn and
VbvalidOvVal to disable the VBUS overcurrent detection.

This patch is derived from Dragan Čečavac (in the kernel 3.18.3
tree of CI20). It is very useful for the MIPS Creator CI20 (r1).
Without this patch, OTG port of CI20 has a great probability to
face overcurrent warning, which breaks the OTG functionality.

Signed-off-by: Dragan Čečavac <dragancecavac@yahoo.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---

Notes:
    v1->v2:
    1.Add Minas Harutyunyan's Acked-by.
    2.Use "activate_ingenic_overcurrent_detection" instead
      "deactivate_ingenic_overcurrent_detection" as Greg's
      suggestion.
    
    v2->v3:
    No change.
    
    v3->v4:
    Remove the compatible string of X1700 since it could use
    the X1600 string　as the fallback.

 drivers/usb/dwc2/core.c   |  9 +++++++++
 drivers/usb/dwc2/core.h   |  5 +++++
 drivers/usb/dwc2/params.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index cf0bcd0..dc4fc72 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -1153,6 +1153,7 @@ static void dwc2_set_turnaround_time(struct dwc2_hsotg *hsotg)
 int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
 {
 	u32 usbcfg;
+	u32 otgctl;
 	int retval = 0;
 
 	if ((hsotg->params.speed == DWC2_SPEED_PARAM_FULL ||
@@ -1187,6 +1188,14 @@ int dwc2_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
 		dwc2_writel(hsotg, usbcfg, GUSBCFG);
 	}
 
+	if (!hsotg->params.activate_ingenic_overcurrent_detection) {
+		if (dwc2_is_host_mode(hsotg)) {
+			otgctl = readl(hsotg->regs + GOTGCTL);
+			otgctl |= GOTGCTL_VBVALOEN | GOTGCTL_VBVALOVAL;
+			writel(otgctl, hsotg->regs + GOTGCTL);
+		}
+	}
+
 	return retval;
 }
 
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 88c337b..0683852 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -426,6 +426,10 @@ enum dwc2_ep0_state {
  *			detection using GGPIO register.
  *			0 - Deactivate the external level detection (default)
  *			1 - Activate the external level detection
+ * @activate_ingenic_overcurrent_detection: Activate Ingenic overcurrent
+ *			detection.
+ *			0 - Deactivate the overcurrent detection
+ *			1 - Activate the overcurrent detection (default)
  * @g_dma:              Enables gadget dma usage (default: autodetect).
  * @g_dma_desc:         Enables gadget descriptor DMA (default: autodetect).
  * @g_rx_fifo_size:	The periodic rx fifo size for the device, in
@@ -494,6 +498,7 @@ struct dwc2_core_params {
 	u8 hird_threshold;
 	bool activate_stm_fs_transceiver;
 	bool activate_stm_id_vb_detection;
+	bool activate_ingenic_overcurrent_detection;
 	bool ipg_isoc_en;
 	u16 max_packet_count;
 	u32 max_transfer_size;
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 1306f4e..626eadc 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -73,6 +73,47 @@ static void dwc2_set_his_params(struct dwc2_hsotg *hsotg)
 	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
 }
 
+static void dwc2_set_jz4775_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->otg_caps.hnp_support = false;
+	p->speed = DWC2_SPEED_PARAM_HIGH;
+	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
+	p->phy_utmi_width = 16;
+	p->activate_ingenic_overcurrent_detection =
+		!device_property_read_bool(hsotg->dev, "disable-over-current");
+}
+
+static void dwc2_set_x1600_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->otg_caps.hnp_support = false;
+	p->speed = DWC2_SPEED_PARAM_HIGH;
+	p->host_channels = 16;
+	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
+	p->phy_utmi_width = 16;
+	p->activate_ingenic_overcurrent_detection =
+		!device_property_read_bool(hsotg->dev, "disable-over-current");
+}
+
+static void dwc2_set_x2000_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->otg_caps.hnp_support = false;
+	p->speed = DWC2_SPEED_PARAM_HIGH;
+	p->host_rx_fifo_size = 1024;
+	p->host_nperio_tx_fifo_size = 1024;
+	p->host_perio_tx_fifo_size = 1024;
+	p->host_channels = 16;
+	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
+	p->phy_utmi_width = 16;
+	p->activate_ingenic_overcurrent_detection =
+		!device_property_read_bool(hsotg->dev, "disable-over-current");
+}
+
 static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
@@ -221,7 +262,13 @@ static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
 
 const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "brcm,bcm2835-usb", .data = dwc2_set_bcm_params },
-	{ .compatible = "hisilicon,hi6220-usb", .data = dwc2_set_his_params  },
+	{ .compatible = "hisilicon,hi6220-usb", .data = dwc2_set_his_params },
+	{ .compatible = "ingenic,jz4775-otg", .data = dwc2_set_jz4775_params },
+	{ .compatible = "ingenic,jz4780-otg", .data = dwc2_set_jz4775_params },
+	{ .compatible = "ingenic,x1000-otg", .data = dwc2_set_jz4775_params },
+	{ .compatible = "ingenic,x1600-otg", .data = dwc2_set_x1600_params },
+	{ .compatible = "ingenic,x1830-otg", .data = dwc2_set_x1600_params },
+	{ .compatible = "ingenic,x2000-otg", .data = dwc2_set_x2000_params },
 	{ .compatible = "rockchip,rk3066-usb", .data = dwc2_set_rk_params },
 	{ .compatible = "lantiq,arx100-usb", .data = dwc2_set_ltq_params },
 	{ .compatible = "lantiq,xrx200-usb", .data = dwc2_set_ltq_params },
-- 
2.7.4

