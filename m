Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EC63B0AC9
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 18:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhFVQ5r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 12:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhFVQ5q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 12:57:46 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3872CC061574
        for <linux-mips@vger.kernel.org>; Tue, 22 Jun 2021 09:55:28 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id v20-20020a05600c2154b02901dcefb16af0so2703050wml.5
        for <linux-mips@vger.kernel.org>; Tue, 22 Jun 2021 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e9qeGfQqX9AidIh5P5firULmSJWTcGcvWm/ynEhQoF4=;
        b=FsMWYJ5lfTGtzcLqUd3EzhgKtm9m+fy1KvQWXFaCde5o+EZ+PZUUGm7yrXT6k6eJnA
         09km8ePH7w9gw0X65qQcuqmY+bf9OR/Qy/fwAhRLNIl72ePTxcO34nLR1tQvvt1rYbsl
         MR5/ofJq5M3Wbh3ny3/NFevCNsYaA1M4qv7eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e9qeGfQqX9AidIh5P5firULmSJWTcGcvWm/ynEhQoF4=;
        b=TtmfJ6EJLWLEFxxnb1b7bEp6rcQ4G6xRMA5Tg9n0GbsaQRI9z7tww1N1KotxxQcloE
         G6eNl7u+pRK6nrUI7hVPS70ys0Y8Nsno8aHptIPkGz/Gvvm/SefI+qh7Ftgm9J2wroXP
         aTNdog0zCa6QNf70rm4GTWUM/fsSJ/Oy4BsydfcInDCRg76LDO28Dmp7XWc8mlaGcEhW
         DR4ok2Fmr79zbf2KtBALT1D4QjkULI76cd0hcZq8oBZcvFMm4RzB0pGrwzu+1kPJOROW
         PU5AniIJOOVK96b3CLp+sRDGbzr+GZ8L5j6jgfxpZwstRdT2xVqyQm0MFyT17UB/ZGAj
         c7og==
X-Gm-Message-State: AOAM533BjvIRL3fzkR6WkcTey4g+u2cpLrqKwY6rSyDqZeytAG2g9x95
        NkJCuRYFfD/PqbvzoEiPaazsAQ==
X-Google-Smtp-Source: ABdhPJzOPmNLsTWMFpwqN7N34Gpx1JMNymE2e7nC6sD/zrJEtqTDzyNJetvx1U9gGv/dxoQVzysYOA==
X-Received: by 2002:a05:600c:4f94:: with SMTP id n20mr5597106wmq.121.1624380926835;
        Tue, 22 Jun 2021 09:55:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 09:55:26 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
Subject: [PATCH 08/15] drm/<driver>: drm_gem_plane_helper_prepare_fb is now the default
Date:   Tue, 22 Jun 2021 18:55:04 +0200
Message-Id: <20210622165511.3169559-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

No need to set it explicitly.

Acked-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
Acked-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c       | 1 -
 drivers/gpu/drm/imx/ipuv3-plane.c           | 1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c   | 1 -
 drivers/gpu/drm/ingenic/ingenic-ipu.c       | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 1 -
 drivers/gpu/drm/meson/meson_overlay.c       | 1 -
 drivers/gpu/drm/meson/meson_plane.c         | 1 -
 drivers/gpu/drm/mxsfb/mxsfb_kms.c           | 2 --
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 1 -
 drivers/gpu/drm/stm/ltdc.c                  | 1 -
 drivers/gpu/drm/sun4i/sun4i_layer.c         | 1 -
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c      | 1 -
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c      | 1 -
 drivers/gpu/drm/tidss/tidss_plane.c         | 1 -
 14 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 044d3bdf313c..ac45d54acd4e 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -361,7 +361,6 @@ static void dcss_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs dcss_plane_helper_funcs = {
-	.prepare_fb = drm_gem_plane_helper_prepare_fb,
 	.atomic_check = dcss_plane_atomic_check,
 	.atomic_update = dcss_plane_atomic_update,
 	.atomic_disable = dcss_plane_atomic_disable,
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 8710f55d2579..ef114b6aa691 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -772,7 +772,6 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs ipu_plane_helper_funcs = {
-	.prepare_fb = drm_gem_plane_helper_prepare_fb,
 	.atomic_check = ipu_plane_atomic_check,
 	.atomic_disable = ipu_plane_atomic_disable,
 	.atomic_update = ipu_plane_atomic_update,
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5244f4763477..c296472164d9 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -830,7 +830,6 @@ static const struct drm_plane_helper_funcs ingenic_drm_plane_helper_funcs = {
 	.atomic_update		= ingenic_drm_plane_atomic_update,
 	.atomic_check		= ingenic_drm_plane_atomic_check,
 	.atomic_disable		= ingenic_drm_plane_atomic_disable,
-	.prepare_fb		= drm_gem_plane_helper_prepare_fb,
 };
 
 static const struct drm_crtc_helper_funcs ingenic_drm_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 61b6d9fdbba1..aeb8a757d213 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -625,7 +625,6 @@ static const struct drm_plane_helper_funcs ingenic_ipu_plane_helper_funcs = {
 	.atomic_update		= ingenic_ipu_plane_atomic_update,
 	.atomic_check		= ingenic_ipu_plane_atomic_check,
 	.atomic_disable		= ingenic_ipu_plane_atomic_disable,
-	.prepare_fb		= drm_gem_plane_helper_prepare_fb,
 };
 
 static int
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index b5582dcf564c..1667a7e7de38 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -227,7 +227,6 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
-	.prepare_fb = drm_gem_plane_helper_prepare_fb,
 	.atomic_check = mtk_plane_atomic_check,
 	.atomic_update = mtk_plane_atomic_update,
 	.atomic_disable = mtk_plane_atomic_disable,
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index ed063152aecd..dfef8afcc245 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -747,7 +747,6 @@ static const struct drm_plane_helper_funcs meson_overlay_helper_funcs = {
 	.atomic_check	= meson_overlay_atomic_check,
 	.atomic_disable	= meson_overlay_atomic_disable,
 	.atomic_update	= meson_overlay_atomic_update,
-	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
 };
 
 static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index a18510dae4c8..8640a8a8a469 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -422,7 +422,6 @@ static const struct drm_plane_helper_funcs meson_plane_helper_funcs = {
 	.atomic_check	= meson_plane_atomic_check,
 	.atomic_disable	= meson_plane_atomic_disable,
 	.atomic_update	= meson_plane_atomic_update,
-	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
 };
 
 static bool meson_plane_format_mod_supported(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 300e7bab0f43..8797c671d0d5 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -500,13 +500,11 @@ static bool mxsfb_format_mod_supported(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs = {
-	.prepare_fb = drm_gem_plane_helper_prepare_fb,
 	.atomic_check = mxsfb_plane_atomic_check,
 	.atomic_update = mxsfb_plane_primary_atomic_update,
 };
 
 static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_funcs = {
-	.prepare_fb = drm_gem_plane_helper_prepare_fb,
 	.atomic_check = mxsfb_plane_atomic_check,
 	.atomic_update = mxsfb_plane_overlay_atomic_update,
 };
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index f5b9028a16a3..ba9e14da41b4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1110,7 +1110,6 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
 	.atomic_disable = vop_plane_atomic_disable,
 	.atomic_async_check = vop_plane_atomic_async_check,
 	.atomic_async_update = vop_plane_atomic_async_update,
-	.prepare_fb = drm_gem_plane_helper_prepare_fb,
 };
 
 static const struct drm_plane_funcs vop_plane_funcs = {
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 08b71248044d..0a6f0239a9f8 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -947,7 +947,6 @@ static const struct drm_plane_funcs ltdc_plane_funcs = {
 };
 
 static const struct drm_plane_helper_funcs ltdc_plane_helper_funcs = {
-	.prepare_fb = drm_gem_plane_helper_prepare_fb,
 	.atomic_check = ltdc_plane_atomic_check,
 	.atomic_update = ltdc_plane_atomic_update,
 	.atomic_disable = ltdc_plane_atomic_disable,
diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index 11771bdd6e7c..929e95f86b5b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -127,7 +127,6 @@ static bool sun4i_layer_format_mod_supported(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs sun4i_backend_layer_helper_funcs = {
-	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
 	.atomic_disable	= sun4i_backend_layer_atomic_disable,
 	.atomic_update	= sun4i_backend_layer_atomic_update,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index e779855bcd6e..7845c2a53a7f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -332,7 +332,6 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
-	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
 	.atomic_check	= sun8i_ui_layer_atomic_check,
 	.atomic_disable	= sun8i_ui_layer_atomic_disable,
 	.atomic_update	= sun8i_ui_layer_atomic_update,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1c86c2dd0bbf..bb7c43036dfa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -436,7 +436,6 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
-	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
 	.atomic_check	= sun8i_vi_layer_atomic_check,
 	.atomic_disable	= sun8i_vi_layer_atomic_disable,
 	.atomic_update	= sun8i_vi_layer_atomic_update,
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 1acd15aa4193..217415ec8eea 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -158,7 +158,6 @@ static void drm_plane_destroy(struct drm_plane *plane)
 }
 
 static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
-	.prepare_fb = drm_gem_plane_helper_prepare_fb,
 	.atomic_check = tidss_plane_atomic_check,
 	.atomic_update = tidss_plane_atomic_update,
 	.atomic_disable = tidss_plane_atomic_disable,
-- 
2.32.0.rc2

