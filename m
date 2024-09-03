Return-Path: <linux-mips+bounces-5290-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C6896913F
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 04:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37688283346
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 02:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891701CDA31;
	Tue,  3 Sep 2024 02:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VvmFJTiQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D81CCEFB
	for <linux-mips@vger.kernel.org>; Tue,  3 Sep 2024 02:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725328930; cv=none; b=MyobS/RW3qG4EZU4qmyLRqDcbQNM64w5zxEW8Tdk9dDpYk/GAI0OEemho+IJw6x4LRQGpZErk/3JQy5JN2DNoTmw8bR+OCB7qDq995zW7Z917DBCwhyJeqH9KRsLblaO5N2rfDs5p7OTk1PXyul92QbzkIHuA0IAAT69BG8tVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725328930; c=relaxed/simple;
	bh=u0qb3bEY05HUAox2PHoKFXF0Np7w89XwqKfDLq37bxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BV1qcoy0LSA1ihyVeW7tukNp/c2vdWWM6Z3Cc7CU4bkTINgtCfK3y2JOwIAb0kvj42s1I0x6KEQKlLvAUmWWbf6Ikjd3v4rKP44pglI0c3Xp6o/8301DvYuHcrVLJSZBfO+UMeRjTeZpqvz0g6wdOaTPirpQC1cGxsUUQfeKLrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VvmFJTiQ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f502086419so48027221fa.3
        for <linux-mips@vger.kernel.org>; Mon, 02 Sep 2024 19:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725328926; x=1725933726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuDiUUeOXHyePUkATAqMzosvFvUGjVShWzWv3I0BgWE=;
        b=VvmFJTiQR6RTPEWtWoNZEtlUk2dIrjtzBYOazveGXXvzEirzomNEbEhY6JU2kNDIYj
         J6RLVIgZ7U7QLgxwxGFscksr5mIJQwk7inGl5gFK/cYMXdhg9/ydaHBXbYY4wxAbOXzd
         Nx+fcqjY+E+qkXHQgCpgRVNZatU7ZKke3qVBxautecOowWA0q4p2hQGZUwRGGVJx+EWh
         AS++dzQqjYdHXo5GbYRE0z4TULU4TzOtvMIdQry8P0+AgMiEYi2wnBoEA45vN+zzO+FP
         xjJ/d9/H0IiMy7H6zUDrQ3sRsVC7+u+JOw25INSi7y24YFuUj2myrn8aqlXiFt1pQGcD
         OnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725328926; x=1725933726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuDiUUeOXHyePUkATAqMzosvFvUGjVShWzWv3I0BgWE=;
        b=VwbJpqLR9/pvgXY2hMLAmFpZ/jE3wlUhUXLjzbFIk/aop8u/dwqkvryLABaoiqJGHx
         wxnn+rsNenc09h/egQLTtdq1BVgaHda6/f5FbsjlQZ/C9YGv4YcO5J7TUiUDlWTYGcDp
         2EYCYknBGAlYsLHt42MY1xCDukbNQwQ87mE3Xofx0aloFGgLgRtq5JyrmY1T2rB8TVdQ
         CyNMnKUC0JO6QtiTRWXm6AhZe5S8pKn6gHwyLmXJrHn4mOeJNvAoRSiCmUq6rYqP1k2+
         Ye0imwxtiIZ0o8CBtfNbL8JWFDDYKwwyouypz+ujyO54m09bVr77/npqlJaJyP3N40pZ
         Gcew==
X-Forwarded-Encrypted: i=1; AJvYcCWLTL2QjDgy7k6oKSnpwh1jaBJT/PXkcR+tXYqILd731KeaxykqFWgDBZWrUC+cUZ7HZKMejh6QjRyO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/+jO9Tvt94qhDlx1aAStLEsHLecIqZxv2GJWK3XcYTlxWUKA
	pHK5cG/Zj/eeG868BU2eulC1uYcxREXKE+y7w9vqYmsgYuzOo3+wEy7x0AI0Tl4=
X-Google-Smtp-Source: AGHT+IFWhS1oYYAVacz2ydRhPkLwJEpZU3w+Ve0zSJGvTGxUh12Lt/6JCcXmIdkMLU3430tF4F0SAg==
X-Received: by 2002:a2e:4e1a:0:b0:2ef:2344:deec with SMTP id 38308e7fff4ca-2f64449a4cfmr8822041fa.45.1725328924812;
        Mon, 02 Sep 2024 19:02:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm20827761fa.8.2024.09.02.19.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 19:02:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 05:01:57 +0300
Subject: [PATCH v5 2/3] drm/bridge-connector: move to DRM_DISPLAY_HELPER
 module
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-2-daebde6d9857@linaro.org>
References: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
In-Reply-To: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11764;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u0qb3bEY05HUAox2PHoKFXF0Np7w89XwqKfDLq37bxI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1m4Z7OHdzXgI7iKlcHjqUN1VR0kFSbKsUb9xt
 64KU0cK57CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtZuGQAKCRCLPIo+Aiko
 1XJxCACzrWSdBNy2/qY7LdD1PvMrMfsyOSN2E6Ghfhb14Rxou6tRcAKvNUFF3OhkpFPjH3aJgkR
 17lAll1SxKb+66j5Iv+bYkZR/xOwoHu9+WYoFNZJUT4RMtmvumXufsiDAwmExOfP1wQy6s8dl5B
 cMZWPB50tQg0hnjD488zR5FhhIWL2mgv46oIKpPh/hxXrFIhAAj5jppb8R5TrnNLiqCPZND7+GK
 KdJgtt/GmFMwZiwLZqDUe1sk6ypGlya/NdnOBlZjkNeJmy756ceI24/EOSg4x4k9YE5Ri1k+Y5x
 lq8giCFLD8RuzBDBt7T3e8c9Pg7M/0XU+eo/uaMZF4nVoEgn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

drm_bridge_connector is a "leaf" driver, belonging to the display
helper, rather than the "CRTC" drm_kms_helper module. Move the driver
to the drm/display and add necessary Kconfig selection clauses.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS                                          | 2 +-
 drivers/gpu/drm/Makefile                             | 1 -
 drivers/gpu/drm/bridge/Kconfig                       | 1 +
 drivers/gpu/drm/display/Kconfig                      | 5 +++++
 drivers/gpu/drm/display/Makefile                     | 2 ++
 drivers/gpu/drm/{ => display}/drm_bridge_connector.c | 0
 drivers/gpu/drm/imx/dcss/Kconfig                     | 2 ++
 drivers/gpu/drm/imx/lcdc/Kconfig                     | 2 ++
 drivers/gpu/drm/ingenic/Kconfig                      | 2 ++
 drivers/gpu/drm/kmb/Kconfig                          | 2 ++
 drivers/gpu/drm/mediatek/Kconfig                     | 2 ++
 drivers/gpu/drm/meson/Kconfig                        | 2 ++
 drivers/gpu/drm/msm/Kconfig                          | 1 +
 drivers/gpu/drm/omapdrm/Kconfig                      | 2 ++
 drivers/gpu/drm/renesas/rcar-du/Kconfig              | 2 ++
 drivers/gpu/drm/renesas/rz-du/Kconfig                | 2 ++
 drivers/gpu/drm/renesas/shmobile/Kconfig             | 2 ++
 drivers/gpu/drm/rockchip/Kconfig                     | 4 ++++
 drivers/gpu/drm/tegra/Kconfig                        | 1 +
 drivers/gpu/drm/tidss/Kconfig                        | 2 ++
 drivers/gpu/drm/xlnx/Kconfig                         | 1 +
 21 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a38754d1cc86..6b152eae4f5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7463,8 +7463,8 @@ S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/
 F:	drivers/gpu/drm/bridge/
+F:	drivers/gpu/drm/display/drm_bridge_connector.c
 F:	drivers/gpu/drm/drm_bridge.c
-F:	drivers/gpu/drm/drm_bridge_connector.c
 F:	include/drm/drm_bridge.h
 F:	include/drm/drm_bridge_connector.h
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c62339b89d46..784229d4504d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -129,7 +129,6 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 drm_kms_helper-y := \
 	drm_atomic_helper.o \
 	drm_atomic_state_helper.o \
-	drm_bridge_connector.o \
 	drm_crtc_helper.o \
 	drm_damage_helper.o \
 	drm_encoder_slave.o \
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c621be1a99a8..3eb955333c80 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -390,6 +390,7 @@ config DRM_TI_SN65DSI86
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 9c2da1e48b75..8c174ceb0c4d 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -13,6 +13,11 @@ config DRM_DISPLAY_HELPER
 
 if DRM_DISPLAY_HELPER
 
+config DRM_BRIDGE_CONNECTOR
+	bool
+	help
+	  DRM connector implementation terminating DRM bridge chains.
+
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	select DRM_DISPLAY_DP_HELPER
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index a023f72fa139..629c834c3192 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -3,6 +3,8 @@
 obj-$(CONFIG_DRM_DISPLAY_DP_AUX_BUS) += drm_dp_aux_bus.o
 
 drm_display_helper-y := drm_display_helper_mod.o
+drm_display_helper-$(CONFIG_DRM_BRIDGE_CONNECTOR) += \
+	drm_bridge_connector.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
 	drm_dp_dual_mode_helper.o \
 	drm_dp_helper.o \
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
similarity index 100%
rename from drivers/gpu/drm/drm_bridge_connector.c
rename to drivers/gpu/drm/display/drm_bridge_connector.c
diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 3ffc061d392b..59e3b6a1dff0 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -2,6 +2,8 @@ config DRM_IMX_DCSS
 	tristate "i.MX8MQ DCSS"
 	select IMX_IRQSTEER
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
 	depends on DRM && ARCH_MXC && ARM64
diff --git a/drivers/gpu/drm/imx/lcdc/Kconfig b/drivers/gpu/drm/imx/lcdc/Kconfig
index 7e57922bbd9d..9c28bb0f4662 100644
--- a/drivers/gpu/drm/imx/lcdc/Kconfig
+++ b/drivers/gpu/drm/imx/lcdc/Kconfig
@@ -3,5 +3,7 @@ config DRM_IMX_LCDC
       depends on DRM && (ARCH_MXC || COMPILE_TEST)
       select DRM_GEM_DMA_HELPER
       select DRM_KMS_HELPER
+      select DRM_DISPLAY_HELPER
+      select DRM_BRIDGE_CONNECTOR
       help
         Found on i.MX1, i.MX21, i.MX25 and i.MX27.
diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 3db117c5edd9..8cd7b750dffe 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -8,6 +8,8 @@ config DRM_INGENIC
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select REGMAP
 	select REGMAP_MMIO
diff --git a/drivers/gpu/drm/kmb/Kconfig b/drivers/gpu/drm/kmb/Kconfig
index fd011367db1d..e5ae3ec52392 100644
--- a/drivers/gpu/drm/kmb/Kconfig
+++ b/drivers/gpu/drm/kmb/Kconfig
@@ -3,6 +3,8 @@ config DRM_KMB_DISPLAY
 	depends on DRM
 	depends on ARCH_KEEMBAY || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DSI
 	help
diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index d6449ebae838..417ac8c9af41 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -9,6 +9,8 @@ config DRM_MEDIATEK
 	depends on MTK_MMSYS
 	select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	select MEMORY
diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index 615fdd0ce41b..2544756538cc 100644
--- a/drivers/gpu/drm/meson/Kconfig
+++ b/drivers/gpu/drm/meson/Kconfig
@@ -4,6 +4,8 @@ config DRM_MESON
 	depends on DRM && OF && (ARM || ARM64)
 	depends on ARCH_MESON || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_DISPLAY_CONNECTOR
 	select VIDEOMODE_HELPERS
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 420385c47193..94d3ed4f7761 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -17,6 +17,7 @@ config DRM_MSM
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index 64e440a2649b..fbd9af758581 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -5,6 +5,8 @@ config DRM_OMAP
 	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS || (COMPILE_TEST && PAGE_SIZE_LESS_THAN_64KB)
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	select VIDEOMODE_HELPERS
 	select HDMI
diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
index be86ecb9f559..e1f41468a9a6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
@@ -5,6 +5,8 @@ config DRM_RCAR_DU
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 8ec14271ebba..89bdb598e0ae 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -6,6 +6,8 @@ config DRM_RZG2L_DU
 	depends on VIDEO_RENESAS_VSP1
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select VIDEOMODE_HELPERS
 	help
 	  Choose this option if you have an RZ/G2L alike chipset.
diff --git a/drivers/gpu/drm/renesas/shmobile/Kconfig b/drivers/gpu/drm/renesas/shmobile/Kconfig
index 027220b8fe1c..c329ab8a7a8b 100644
--- a/drivers/gpu/drm/renesas/shmobile/Kconfig
+++ b/drivers/gpu/drm/renesas/shmobile/Kconfig
@@ -5,6 +5,8 @@ config DRM_SHMOBILE
 	depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 7df875e38517..23c49e91f1cc 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -86,6 +86,8 @@ config ROCKCHIP_LVDS
 	bool "Rockchip LVDS support"
 	depends on DRM_ROCKCHIP
 	depends on PINCTRL && OF
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  Choose this option to enable support for Rockchip LVDS controllers.
 	  Rockchip rk3288 SoC has LVDS TX Controller can be used, and it
@@ -96,6 +98,8 @@ config ROCKCHIP_RGB
 	bool "Rockchip RGB support"
 	depends on DRM_ROCKCHIP
 	depends on PINCTRL
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  Choose this option to enable support for Rockchip RGB output.
 	  Some Rockchip CRTCs, like rv1108, can directly output parallel
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 782f51d3044a..e688d8104652 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -8,6 +8,7 @@ config DRM_TEGRA
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/tidss/Kconfig b/drivers/gpu/drm/tidss/Kconfig
index 378600806167..2385c56493b9 100644
--- a/drivers/gpu/drm/tidss/Kconfig
+++ b/drivers/gpu/drm/tidss/Kconfig
@@ -3,6 +3,8 @@ config DRM_TIDSS
 	depends on DRM && OF
 	depends on ARM || ARM64 || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	help
 	  The TI Keystone family SoCs introduced a new generation of
diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index 68ee897de9d7..626e5ac4c33d 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -8,6 +8,7 @@ config DRM_ZYNQMP_DPSUB
 	select DMA_ENGINE
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select GENERIC_PHY

-- 
2.39.2


