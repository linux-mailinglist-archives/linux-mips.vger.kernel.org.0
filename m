Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C90404F7DBE
	for <lists+linux-mips@lfdr.de>; Thu,  7 Apr 2022 13:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234562AbiDGLSb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Apr 2022 07:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244804AbiDGLST (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Apr 2022 07:18:19 -0400
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95456710D0;
        Thu,  7 Apr 2022 04:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649330174;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=vGhCyz1GPf2jh1WBHKte1uugDSUBVLnc0vdCb4M+ec4=;
    b=HnTl5Nq1rQqjIns7XRRSlVSHLw4DmZySH3duvU89b1kI+S+ZjTnIyK4y85w2Y5LyfE
    90rO8Ln0U32u/rjgdp2vQK+w3DIao+tXVBl2Gihev+Z3GxXJ627LLNBcNwYqY7slxrl0
    YI6AogwqEbR8ETCREEsoatUBCLNuERAisCPM54AijYhJp6CZwddSpfcYU4EkjriTBGgp
    xEV0PnEd7csDXe/JkDEpVTM8lnwMA6xBm3dmcLmbXqH4+XQN7OIKdpqzgoQnj4oP7BnI
    qiJLWNQta1q2RmWsZOnP2uGY8DkOazG9sTT1XmRzhypBm69l3wU55spADop4txkAuYXL
    yv/g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDFsCr4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
    with ESMTPSA id k708cfy37BGDjxF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 7 Apr 2022 13:16:13 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Paul Cercueil <paul@crapouillou.net>,
        Maxime Ripard <maxime@cerno.tech>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        letux-kernel@openphoenux.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v18 3/3] drm/ingenic: Add dw-hdmi driver specialization for jz4780
Date:   Thu,  7 Apr 2022 13:16:11 +0200
Message-Id: <e5cdf9cd44bde52cce379cc830f2d6117ea15c32.1649330171.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1649330170.git.hns@goldelico.com>
References: <cover.1649330170.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Boddie <paul@boddie.org.uk>

A specialisation of the generic Synopsys HDMI driver is employed for
JZ4780 HDMI support. This requires a new driver, plus device tree and
configuration modifications.

Here we add Kconfig DRM_INGENIC_DW_HDMI, Makefile and driver code.

Note that there is no hpd-gpio installed on the CI20 board HDMI
connector. Hence there is no hpd detection by the connector driver
and we have to enable polling in the dw-hdmi core driver.

For that we need to set .poll_enabled but that struct component
can only be accessed by core code. Hence we use the public
setter function drm_kms_helper_hotplug_event() introduced before.

Also note that we disable Color Space Conversion since it is not
working on jz4780.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/Kconfig           |   9 ++
 drivers/gpu/drm/ingenic/Makefile          |   1 +
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 103 ++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 001f59fb06d56..090830bcbde7f 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -24,4 +24,13 @@ config DRM_INGENIC_IPU
 
 	  The Image Processing Unit (IPU) will appear as a second primary plane.
 
+config DRM_INGENIC_DW_HDMI
+	tristate "Ingenic specific support for Synopsys DW HDMI"
+	depends on MACH_JZ4780
+	select DRM_DW_HDMI
+	help
+	  Choose this option to enable Synopsys DesignWare HDMI based driver.
+	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you should
+	  select this option.
+
 endif
diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/Makefile
index d313326bdddbb..f10cc1c5a5f22 100644
--- a/drivers/gpu/drm/ingenic/Makefile
+++ b/drivers/gpu/drm/ingenic/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
 ingenic-drm-y = ingenic-drm-drv.o
 ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) += ingenic-ipu.o
+obj-$(CONFIG_DRM_INGENIC_DW_HDMI) += ingenic-dw-hdmi.o
diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
new file mode 100644
index 0000000000000..72f8b44998a51
--- /dev/null
+++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
+ * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
+ *
+ * Derived from dw_hdmi-imx.c with i.MX portions removed.
+ */
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_of.h>
+#include <drm/drm_print.h>
+
+static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] = {
+	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, 0x0000 } } },
+	{ 92500000,  { { 0x0140, 0x0005 }, { 0x2141, 0x0005 }, { 0x4142, 0x0005 } } },
+	{ 148500000, { { 0x00a0, 0x000a }, { 0x20a1, 0x000a }, { 0x40a2, 0x000a } } },
+	{ 216000000, { { 0x00a0, 0x000a }, { 0x2001, 0x000f }, { 0x4002, 0x000f } } },
+	{ ~0UL,      { { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 } } }
+};
+
+static const struct dw_hdmi_curr_ctrl ingenic_cur_ctr[] = {
+	/*pixelclk     bpp8    bpp10   bpp12 */
+	{ 54000000,  { 0x091c, 0x091c, 0x06dc } },
+	{ 58400000,  { 0x091c, 0x06dc, 0x06dc } },
+	{ 72000000,  { 0x06dc, 0x06dc, 0x091c } },
+	{ 74250000,  { 0x06dc, 0x0b5c, 0x091c } },
+	{ 118800000, { 0x091c, 0x091c, 0x06dc } },
+	{ 216000000, { 0x06dc, 0x0b5c, 0x091c } },
+	{ ~0UL,      { 0x0000, 0x0000, 0x0000 } },
+};
+
+/*
+ * Resistance term 133Ohm Cfg
+ * PREEMP config 0.00
+ * TX/CK level 10
+ */
+static const struct dw_hdmi_phy_config ingenic_phy_config[] = {
+	/*pixelclk   symbol   term   vlev */
+	{ 216000000, 0x800d, 0x0005, 0x01ad},
+	{ ~0UL,      0x0000, 0x0000, 0x0000}
+};
+
+static enum drm_mode_status
+ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
+			   const struct drm_display_info *info,
+			   const struct drm_display_mode *mode)
+{
+	if (mode->clock < 13500)
+		return MODE_CLOCK_LOW;
+	/* FIXME: Hardware is capable of 270MHz, but setup data is missing. */
+	if (mode->clock > 216000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static struct dw_hdmi_plat_data ingenic_dw_hdmi_plat_data = {
+	.mpll_cfg   = ingenic_mpll_cfg,
+	.cur_ctr    = ingenic_cur_ctr,
+	.phy_config = ingenic_phy_config,
+	.mode_valid = ingenic_dw_hdmi_mode_valid,
+	.output_port	= 1,
+};
+
+static const struct of_device_id ingenic_dw_hdmi_dt_ids[] = {
+	{ .compatible = "ingenic,jz4780-dw-hdmi" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
+
+static void ingenic_dw_hdmi_cleanup(void *data)
+{
+	struct dw_hdmi *hdmi = (struct dw_hdmi *)data;
+
+	dw_hdmi_remove(hdmi);
+}
+
+static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
+{
+	struct dw_hdmi *hdmi;
+
+	hdmi = dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
+
+	return devm_add_action_or_reset(&pdev->dev, ingenic_dw_hdmi_cleanup, hdmi);
+}
+
+static struct platform_driver ingenic_dw_hdmi_driver = {
+	.probe  = ingenic_dw_hdmi_probe,
+	.driver = {
+		.name = "dw-hdmi-ingenic",
+		.of_match_table = ingenic_dw_hdmi_dt_ids,
+	},
+};
+module_platform_driver(ingenic_dw_hdmi_driver);
+
+MODULE_DESCRIPTION("JZ4780 Specific DW-HDMI Driver Extension");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:dw-hdmi-ingenic");
-- 
2.33.0

