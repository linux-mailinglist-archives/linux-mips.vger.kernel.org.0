Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D978D4C8F1C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Mar 2022 16:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbiCAPcb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Mar 2022 10:32:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbiCAPcb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Mar 2022 10:32:31 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599E5245AC;
        Tue,  1 Mar 2022 07:31:49 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 6-20020a05600c024600b0038125fa8e43so1414842wmj.0;
        Tue, 01 Mar 2022 07:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AcFIzjsZokuLvaSvmAWJOq61tNoIHiYSYpbbWlxLmBk=;
        b=d/T51Q11+kQoua+DIks++L8WGjY2LIbqI6TdjaQMCYRls8xuPpUPt5PFjaayrTdkqH
         gmujYE9u7GNO0Z9HyLqbf12v3wpiRbB3LBxqiAfuZGMJCoda1l2oZcK23Pfwdjpbb1UC
         WyugQzpdtV7MQCGJuXNY7geimlE9xiQ7v2pRD0xzxYNk0JitsGrW5VqmUx5A3JP1LiDy
         W5x9IbyglvNCOsO5j3xTZO0tJpngKYoROqZfJTBvTQQdEtZmoqu1jqUNOkuxOFcVItn9
         oFcK3f1xe6pYMTHfB/r2uDa3uJ+K8liZ5IDYlCQB1zO8c6EZNHpHbt4XqvyBroykXvhu
         esog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AcFIzjsZokuLvaSvmAWJOq61tNoIHiYSYpbbWlxLmBk=;
        b=Alx8TSjf1oXZLdEAd3q1jSsqlJolo1rXJ0IvUs1zEeWS7gnvlw883hzYYVqp3ty12v
         MC7f84GLWAXjmB4UrU6Syzzuym691QN77vpZYrVb+1lql2EJKu/tKzgzHCujG5btLYIu
         1dSHZlVdHDSRzzJP5bKDVoX6ENJIczu4qYtPhc6JkykZGaLKiijJ3FgEwxx5TVunT9Xl
         NVe2k1DdpjfUE4l+0lMj+fsE1niaFnK2mTgZVu013E1wx0IQdMVLAiPeOrfbJOdiwihO
         azSbmziMGOcL47/SG7wNQgAA24wwwUkAshlFR6LQYtbiHguyPYx/sNPEz3Kb619/Ilor
         W2eQ==
X-Gm-Message-State: AOAM531f72f8n/Kp7G/aLH0ZOQs2XXYxqkXUus4dxsEiY3FpnKkvB6mY
        htgS5L6zpNsVNrIM2f6GjrLlFzrt9Yw=
X-Google-Smtp-Source: ABdhPJxBvjgoECNx0hXV0K29nYcbXhLGmltAH9m7qgn0P5+03jJfHC6W/dYWRnxGGmNLh5O79jwFlA==
X-Received: by 2002:a7b:c04e:0:b0:380:ead9:254a with SMTP id u14-20020a7bc04e000000b00380ead9254amr17403465wmc.58.1646148707674;
        Tue, 01 Mar 2022 07:31:47 -0800 (PST)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600c4e0d00b003816cb4892csm5797377wmq.0.2022.03.01.07.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 07:31:47 -0800 (PST)
From:   Christophe Branchereau <cbranchereau@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/3] drm/panel: Add panel driver for NewVision NV3052C based LCDs
Date:   Tue,  1 Mar 2022 16:31:21 +0100
Message-Id: <20220301153122.20660-3-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301153122.20660-1-cbranchereau@gmail.com>
References: <20220301153122.20660-1-cbranchereau@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This driver supports the NewVision NV3052C based LCDs. Right now, it
only supports the LeadTek LTK035C5444T 2.4" 640x480 TFT LCD panel, which
can be found in the Anbernic RG-350M handheld console.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 504 ++++++++++++++++++
 3 files changed, 514 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index bb2e47229c68..40084f709789 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -283,6 +283,15 @@ config DRM_PANEL_NEC_NL8048HL11
 	  panel (found on the Zoom2/3/3630 SDP boards). To compile this driver
 	  as a module, choose M here.
 
+config DRM_PANEL_NEWVISION_NV3052C
+	tristate "NewVision NV3052C RGB/SPI panel"
+	depends on OF && SPI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DBI
+	help
+	  Say Y here if you want to enable support for the panels built
+	  around the NewVision NV3052C display controller.
+
 config DRM_PANEL_NOVATEK_NT35510
 	tristate "Novatek NT35510 RGB panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 5740911f637c..42a7ab54234b 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
+obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
 obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
new file mode 100644
index 000000000000..08a3b33bcce0
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -0,0 +1,504 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NevVision NV3052C IPS LCD panel driver
+ *
+ * Copyright (C) 2020, Paul Cercueil <paul@crapouillou.net>
+ * Copyright (C) 2022, Christophe Branchereau <cbranchereau@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+struct nv3052c_panel_info {
+	const struct drm_display_mode *display_modes;
+	unsigned int num_modes;
+	u16 width_mm, height_mm;
+	u32 bus_format, bus_flags;
+};
+
+struct nv3052c {
+	struct device *dev;
+	struct drm_panel panel;
+	struct mipi_dbi dbi;
+
+	const struct nv3052c_panel_info *panel_info;
+
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+};
+
+struct nv3052c_reg {
+	u8 cmd;
+	u8 val;
+};
+
+static const struct nv3052c_reg nv3052c_panel_regs[] = {
+	{ 0xff, 0x30 },
+	{ 0xff, 0x52 },
+	{ 0xff, 0x01 },
+	{ 0xe3, 0x00 },
+	{ 0x40, 0x00 },
+	{ 0x03, 0x40 },
+	{ 0x04, 0x00 },
+	{ 0x05, 0x03 },
+	{ 0x08, 0x00 },
+	{ 0x09, 0x07 },
+	{ 0x0a, 0x01 },
+	{ 0x0b, 0x32 },
+	{ 0x0c, 0x32 },
+	{ 0x0d, 0x0b },
+	{ 0x0e, 0x00 },
+	{ 0x23, 0xa0 },
+
+	{ 0x24, 0x0c },
+	{ 0x25, 0x06 },
+	{ 0x26, 0x14 },
+	{ 0x27, 0x14 },
+
+	{ 0x38, 0xcc },
+	{ 0x39, 0xd7 },
+	{ 0x3a, 0x4a },
+
+	{ 0x28, 0x40 },
+	{ 0x29, 0x01 },
+	{ 0x2a, 0xdf },
+	{ 0x49, 0x3c },
+	{ 0x91, 0x77 },
+	{ 0x92, 0x77 },
+	{ 0xa0, 0x55 },
+	{ 0xa1, 0x50 },
+	{ 0xa4, 0x9c },
+	{ 0xa7, 0x02 },
+	{ 0xa8, 0x01 },
+	{ 0xa9, 0x01 },
+	{ 0xaa, 0xfc },
+	{ 0xab, 0x28 },
+	{ 0xac, 0x06 },
+	{ 0xad, 0x06 },
+	{ 0xae, 0x06 },
+	{ 0xaf, 0x03 },
+	{ 0xb0, 0x08 },
+	{ 0xb1, 0x26 },
+	{ 0xb2, 0x28 },
+	{ 0xb3, 0x28 },
+	{ 0xb4, 0x33 },
+	{ 0xb5, 0x08 },
+	{ 0xb6, 0x26 },
+	{ 0xb7, 0x08 },
+	{ 0xb8, 0x26 },
+	{ 0xf0, 0x00 },
+	{ 0xf6, 0xc0 },
+
+	{ 0xff, 0x30 },
+	{ 0xff, 0x52 },
+	{ 0xff, 0x02 },
+	{ 0xb0, 0x0b },
+	{ 0xb1, 0x16 },
+	{ 0xb2, 0x17 },
+	{ 0xb3, 0x2c },
+	{ 0xb4, 0x32 },
+	{ 0xb5, 0x3b },
+	{ 0xb6, 0x29 },
+	{ 0xb7, 0x40 },
+	{ 0xb8, 0x0d },
+	{ 0xb9, 0x05 },
+	{ 0xba, 0x12 },
+	{ 0xbb, 0x10 },
+	{ 0xbc, 0x12 },
+	{ 0xbd, 0x15 },
+	{ 0xbe, 0x19 },
+	{ 0xbf, 0x0e },
+	{ 0xc0, 0x16 },
+	{ 0xc1, 0x0a },
+	{ 0xd0, 0x0c },
+	{ 0xd1, 0x17 },
+	{ 0xd2, 0x14 },
+	{ 0xd3, 0x2e },
+	{ 0xd4, 0x32 },
+	{ 0xd5, 0x3c },
+	{ 0xd6, 0x22 },
+	{ 0xd7, 0x3d },
+	{ 0xd8, 0x0d },
+	{ 0xd9, 0x07 },
+	{ 0xda, 0x13 },
+	{ 0xdb, 0x13 },
+	{ 0xdc, 0x11 },
+	{ 0xdd, 0x15 },
+	{ 0xde, 0x19 },
+	{ 0xdf, 0x10 },
+	{ 0xe0, 0x17 },
+	{ 0xe1, 0x0a },
+
+	{ 0xff, 0x30 },
+	{ 0xff, 0x52 },
+	{ 0xff, 0x03 },
+	{ 0x00, 0x2a },
+	{ 0x01, 0x2a },
+	{ 0x02, 0x2a },
+	{ 0x03, 0x2a },
+	{ 0x04, 0x61 },
+	{ 0x05, 0x80 },
+	{ 0x06, 0xc7 },
+	{ 0x07, 0x01 },
+	{ 0x08, 0x03 },
+	{ 0x09, 0x04 },
+	{ 0x70, 0x22 },
+	{ 0x71, 0x80 },
+	{ 0x30, 0x2a },
+	{ 0x31, 0x2a },
+	{ 0x32, 0x2a },
+	{ 0x33, 0x2a },
+	{ 0x34, 0x61 },
+	{ 0x35, 0xc5 },
+	{ 0x36, 0x80 },
+	{ 0x37, 0x23 },
+	{ 0x40, 0x03 },
+	{ 0x41, 0x04 },
+	{ 0x42, 0x05 },
+	{ 0x43, 0x06 },
+	{ 0x44, 0x11 },
+	{ 0x45, 0xe8 },
+	{ 0x46, 0xe9 },
+	{ 0x47, 0x11 },
+	{ 0x48, 0xea },
+	{ 0x49, 0xeb },
+	{ 0x50, 0x07 },
+	{ 0x51, 0x08 },
+	{ 0x52, 0x09 },
+	{ 0x53, 0x0a },
+	{ 0x54, 0x11 },
+	{ 0x55, 0xec },
+	{ 0x56, 0xed },
+	{ 0x57, 0x11 },
+	{ 0x58, 0xef },
+	{ 0x59, 0xf0 },
+	{ 0xb1, 0x01 },
+	{ 0xb4, 0x15 },
+	{ 0xb5, 0x16 },
+	{ 0xb6, 0x09 },
+	{ 0xb7, 0x0f },
+	{ 0xb8, 0x0d },
+	{ 0xb9, 0x0b },
+	{ 0xba, 0x00 },
+	{ 0xc7, 0x02 },
+	{ 0xca, 0x17 },
+	{ 0xcb, 0x18 },
+	{ 0xcc, 0x0a },
+	{ 0xcd, 0x10 },
+	{ 0xce, 0x0e },
+	{ 0xcf, 0x0c },
+	{ 0xd0, 0x00 },
+	{ 0x81, 0x00 },
+	{ 0x84, 0x15 },
+	{ 0x85, 0x16 },
+	{ 0x86, 0x10 },
+	{ 0x87, 0x0a },
+	{ 0x88, 0x0c },
+	{ 0x89, 0x0e },
+	{ 0x8a, 0x02 },
+	{ 0x97, 0x00 },
+	{ 0x9a, 0x17 },
+	{ 0x9b, 0x18 },
+	{ 0x9c, 0x0f },
+	{ 0x9d, 0x09 },
+	{ 0x9e, 0x0b },
+	{ 0x9f, 0x0d },
+	{ 0xa0, 0x01 },
+
+	{ 0xff, 0x30 },
+	{ 0xff, 0x52 },
+	{ 0xff, 0x02 },
+	{ 0x01, 0x01 },
+	{ 0x02, 0xda },
+	{ 0x03, 0xba },
+	{ 0x04, 0xa8 },
+	{ 0x05, 0x9a },
+	{ 0x06, 0x70 },
+	{ 0x07, 0xff },
+	{ 0x08, 0x91 },
+	{ 0x09, 0x90 },
+	{ 0x0a, 0xff },
+	{ 0x0b, 0x8f },
+	{ 0x0c, 0x60 },
+	{ 0x0d, 0x58 },
+	{ 0x0e, 0x48 },
+	{ 0x0f, 0x38 },
+	{ 0x10, 0x2b },
+
+	{ 0xff, 0x30 },
+	{ 0xff, 0x52 },
+	{ 0xff, 0x00 },
+	{ 0x36, 0x0a },
+};
+
+static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
+{
+	return container_of(panel, struct nv3052c, panel);
+}
+
+static int nv3052c_prepare(struct drm_panel *panel)
+{
+	struct nv3052c *priv = to_nv3052c(panel);
+	struct mipi_dbi *dbi = &priv->dbi;
+	unsigned int i;
+	int err;
+
+	err = regulator_enable(priv->supply);
+	if (err) {
+		dev_err(priv->dev, "Failed to enable power supply: %d\n", err);
+		return err;
+	}
+
+	/* Reset the chip */
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	usleep_range(10, 1000);
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+	msleep(5);
+
+	for (i = 0; i < ARRAY_SIZE(nv3052c_panel_regs); i++) {
+		err = mipi_dbi_command(dbi, nv3052c_panel_regs[i].cmd,
+				       nv3052c_panel_regs[i].val);
+
+		if (err) {
+			dev_err(priv->dev, "Unable to set register: %d\n", err);
+			goto err_disable_regulator;
+		}
+	}
+
+	err = mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	if (err) {
+		dev_err(priv->dev, "Unable to exit sleep mode: %d\n", err);
+		goto err_disable_regulator;
+	}
+
+	return 0;
+
+err_disable_regulator:
+	regulator_disable(priv->supply);
+	return err;
+}
+
+static int nv3052c_unprepare(struct drm_panel *panel)
+{
+	struct nv3052c *priv = to_nv3052c(panel);
+	struct mipi_dbi *dbi = &priv->dbi;
+	int err;
+
+	err = mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE);
+	if (err) {
+		dev_err(priv->dev, "Unable to enter sleep mode: %d\n", err);
+		return err;
+	}
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	regulator_disable(priv->supply);
+
+	return 0;
+}
+
+static int nv3052c_enable(struct drm_panel *panel)
+{
+	struct nv3052c *priv = to_nv3052c(panel);
+	struct mipi_dbi *dbi = &priv->dbi;
+	int err;
+
+	err = mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+	if (err) {
+		dev_err(priv->dev, "Unable to enable display: %d\n", err);
+		return err;
+	}
+
+	if (panel->backlight) {
+		/* Wait for the picture to be ready before enabling backlight */
+		msleep(120);
+	}
+
+	return 0;
+}
+
+static int nv3052c_disable(struct drm_panel *panel)
+{
+	struct nv3052c *priv = to_nv3052c(panel);
+	struct mipi_dbi *dbi = &priv->dbi;
+	int err;
+
+	err = mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
+	if (err) {
+		dev_err(priv->dev, "Unable to disable display: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int nv3052c_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
+{
+	struct nv3052c *priv = to_nv3052c(panel);
+	const struct nv3052c_panel_info *panel_info = priv->panel_info;
+	struct drm_display_mode *mode;
+	unsigned int i;
+
+	for (i = 0; i < panel_info->num_modes; i++) {
+		mode = drm_mode_duplicate(connector->dev,
+					  &panel_info->display_modes[i]);
+		if (!mode)
+			return -ENOMEM;
+
+		drm_mode_set_name(mode);
+
+		mode->type = DRM_MODE_TYPE_DRIVER;
+		if (panel_info->num_modes == 1)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_probed_add(connector, mode);
+	}
+
+	connector->display_info.bpc = 8;
+	connector->display_info.width_mm = panel_info->width_mm;
+	connector->display_info.height_mm = panel_info->height_mm;
+
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &panel_info->bus_format, 1);
+	connector->display_info.bus_flags = panel_info->bus_flags;
+
+	return panel_info->num_modes;
+}
+
+static const struct drm_panel_funcs nv3052c_funcs = {
+	.prepare	= nv3052c_prepare,
+	.unprepare	= nv3052c_unprepare,
+	.enable		= nv3052c_enable,
+	.disable	= nv3052c_disable,
+	.get_modes	= nv3052c_get_modes,
+};
+
+static int nv3052c_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct nv3052c *priv;
+	int err;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	priv->panel_info = of_device_get_match_data(dev);
+	if (!priv->panel_info)
+		return -EINVAL;
+
+	priv->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(priv->supply)) {
+		dev_err(dev, "Failed to get power supply\n");
+		return PTR_ERR(priv->supply);
+	}
+
+	priv->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset_gpio)) {
+		dev_err(dev, "Failed to get reset GPIO\n");
+		return PTR_ERR(priv->reset_gpio);
+	}
+
+	err = mipi_dbi_spi_init(spi, &priv->dbi, NULL);
+	if (err)
+		return dev_err_probe(dev, err, "MIPI DBI init failed\n");
+
+	priv->dbi.read_commands = NULL;
+
+	spi_set_drvdata(spi, priv);
+
+	drm_panel_init(&priv->panel, dev, &nv3052c_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
+	err = drm_panel_of_backlight(&priv->panel);
+	if (err < 0) {
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "Failed to attach backlight\n");
+		return err;
+	}
+
+	drm_panel_add(&priv->panel);
+
+	return 0;
+}
+
+static int nv3052c_remove(struct spi_device *spi)
+{
+	struct nv3052c *priv = spi_get_drvdata(spi);
+
+	drm_panel_remove(&priv->panel);
+	drm_panel_disable(&priv->panel);
+	drm_panel_unprepare(&priv->panel);
+
+	return 0;
+}
+
+static const struct drm_display_mode ltk035c5444t_modes[] = {
+	{ /* 60 Hz */
+		.clock = 24000,
+		.hdisplay = 640,
+		.hsync_start = 640 + 96,
+		.hsync_end = 640 + 96 + 16,
+		.htotal = 640 + 96 + 16 + 48,
+		.vdisplay = 480,
+		.vsync_start = 480 + 5,
+		.vsync_end = 480 + 5 + 2,
+		.vtotal = 480 + 5 + 2 + 13,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+	{ /* 50 Hz */
+		.clock = 18000,
+		.hdisplay = 640,
+		.hsync_start = 640 + 39,
+		.hsync_end = 640 + 39 + 2,
+		.htotal = 640 + 39 + 2 + 39,
+		.vdisplay = 480,
+		.vsync_start = 480 + 5,
+		.vsync_end = 480 + 5 + 2,
+		.vtotal = 480 + 5 + 2 + 13,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
+};
+
+static const struct nv3052c_panel_info ltk035c5444t_spi_panel_info = {
+	.display_modes = ltk035c5444t_modes,
+	.num_modes = ARRAY_SIZE(ltk035c5444t_modes),
+	.width_mm = 77,
+	.height_mm = 64,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+};
+
+static const struct of_device_id nv3052c_of_match[] = {
+	{ .compatible = "leadtek,ltk035c5444t-spi", .data = &ltk035c5444t_spi_panel_info },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, nv3052c_of_match);
+
+static struct spi_driver nv3052c_driver = {
+	.driver = {
+		.name = "nv3052c",
+		.of_match_table = nv3052c_of_match,
+	},
+	.probe = nv3052c_probe,
+	.remove = nv3052c_remove,
+};
+module_spi_driver(nv3052c_driver);
+
+MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
+MODULE_AUTHOR("Christophe Branchereau <cbranchereau@gmail.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

