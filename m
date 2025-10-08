Return-Path: <linux-mips+bounces-11630-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B1BC4B1A
	for <lists+linux-mips@lfdr.de>; Wed, 08 Oct 2025 14:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 010D24E261E
	for <lists+linux-mips@lfdr.de>; Wed,  8 Oct 2025 12:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460892F7464;
	Wed,  8 Oct 2025 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlKRGsRX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201032F656C
	for <linux-mips@vger.kernel.org>; Wed,  8 Oct 2025 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759925080; cv=none; b=EwaEllWz1S9xxc7p8RalLOMiaAnIO6EYgEub5XBsydM3tCbSAwsLPnxJaw0SK22M0j91qb5h4XjGXr8Ra7RMH0WO2hgHjf6xYXyDrHDj5kx6CKlQ7UKH2ifvaXYDkrI5+lhAtWD+O6UIwz5tXRvV2M2CGqgOQea9QQNDXGFSuc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759925080; c=relaxed/simple;
	bh=CdvOfveanFDKEPKkm80bIuNwKY3LEyqDrkHmrGH0vOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HzRi75m8wewvL2dlAzDR+Ar7GN/y56cV9loaehCdappbtLujvBXRDbwu7ZvVQ9PcSTybiHz6TiBUSVfXf8BJlLxEN4JQwJ7NM35kTkgTTIUeEbMqCEtBkC/4KIqGDy1o3x5HpW/5omb+p1c4SPVYb04rkXVRs1sRV6VZMX/pgp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlKRGsRX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FC8C4CEF4;
	Wed,  8 Oct 2025 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759925079;
	bh=CdvOfveanFDKEPKkm80bIuNwKY3LEyqDrkHmrGH0vOQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mlKRGsRXj6+yzCMk7TNDv2dufJ8oCZSiySlBkCAA39V9SsBpIIfFV4bTLmA0JDHss
	 RbeY2KJy65TenBSvkHpzklnsdJDjOMJvLDOBPMWpe8PLLPIIBVSLg9Ca0GsJRmPUsa
	 Dfo8GO3cOezCh4Vt7/3cexu361jYMbIup0GZHlWXm/mmBVAU6mD5psZnhLR+br9OmR
	 Y3BoTRkQGIBdNw8dd6aie3gVEZbESQZlJ9HbCwPpnHiESGhruimC2PNaNkZKZgDzWt
	 T6rSVg13j5YJppwb7+4j+8BOM3p88VFXQGtApHiCChHSXLcqfzxzKBBrDMAfNpIC26
	 bCmYJhtoWAh/w==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:07 +0200
Subject: [PATCH 09/16] drm/ingenic: Switch private_obj initialization to
 reset
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-9-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6270; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CdvOfveanFDKEPKkm80bIuNwKY3LEyqDrkHmrGH0vOQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgs2u7a9vOM127hTbtynlh56VvWOXsO5Q1zrkzb1Bt
 399yWSNjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRE4cYG7pnZbaIcAi8Zjpk
 MjlnX8qeFOcw181njedOndy5+9D8eZMVX939HPcsdcfSrEtMv8w69jLWx0ZctX2W/vmK694ps+a
 VejbPt9fZPU8r5m+I/rVOJn6OPZufLYve7H36/oW9qbMnm+yWAQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The ingenic driver relies on two drm_private_objs, that are initialized
by allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a reset implementation, let's migrate this
instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 30 +++++++++++++++++++-----------
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 30 ++++++++++++++++++------------
 2 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 9db1ceaed5188a4ef0897280dc72108eb3815b5f..18f20d96f6e4a7d9e5209ee770c7b4fc81adbad7 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -947,10 +947,26 @@ static void ingenic_drm_destroy_state(struct drm_private_obj *obj,
 	struct ingenic_drm_private_state *priv_state = to_ingenic_drm_priv_state(state);
 
 	kfree(priv_state);
 }
 
+static void ingenic_drm_reset(struct drm_private_obj *obj)
+{
+	struct ingenic_drm_private_state *priv_state;
+
+	if (obj->state) {
+		ingenic_drm_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	priv_state = kzalloc(sizeof(*priv_state), GFP_KERNEL);
+	if (!priv_state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &priv_state->base);
+}
+
 DEFINE_DRM_GEM_DMA_FOPS(ingenic_drm_fops);
 
 static const struct drm_driver ingenic_drm_driver_data = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.name			= "ingenic-drm",
@@ -1029,10 +1045,11 @@ static struct drm_mode_config_helper_funcs ingenic_drm_mode_config_helpers = {
 };
 
 static const struct drm_private_state_funcs ingenic_drm_private_state_funcs = {
 	.atomic_duplicate_state = ingenic_drm_duplicate_state,
 	.atomic_destroy_state = ingenic_drm_destroy_state,
+	.reset = ingenic_drm_reset,
 };
 
 static void ingenic_drm_unbind_all(void *d)
 {
 	struct ingenic_drm *priv = d;
@@ -1080,11 +1097,10 @@ static void ingenic_drm_atomic_private_obj_fini(struct drm_device *drm, void *pr
 }
 
 static int ingenic_drm_bind(struct device *dev, bool has_components)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct ingenic_drm_private_state *private_state;
 	const struct jz_soc_info *soc_info;
 	struct ingenic_drm *priv;
 	struct clk *parent_clk;
 	struct drm_plane *primary;
 	struct drm_bridge *bridge;
@@ -1380,23 +1396,17 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	if (ret) {
 		dev_err(dev, "Unable to register clock notifier\n");
 		goto err_devclk_disable;
 	}
 
-	private_state = kzalloc(sizeof(*private_state), GFP_KERNEL);
-	if (!private_state) {
-		ret = -ENOMEM;
-		goto err_clk_notifier_unregister;
-	}
-
-	drm_atomic_private_obj_init(drm, &priv->private_obj, &private_state->base,
+	drm_atomic_private_obj_init(drm, &priv->private_obj, NULL,
 				    &ingenic_drm_private_state_funcs);
 
 	ret = drmm_add_action_or_reset(drm, ingenic_drm_atomic_private_obj_fini,
 				       &priv->private_obj);
 	if (ret)
-		goto err_private_state_free;
+		goto err_clk_notifier_unregister;
 
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register DRM driver\n");
 		goto err_clk_notifier_unregister;
@@ -1404,12 +1414,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 	drm_client_setup(drm, NULL);
 
 	return 0;
 
-err_private_state_free:
-	kfree(private_state);
 err_clk_notifier_unregister:
 	clk_notifier_unregister(parent_clk, &priv->clock_nb);
 err_devclk_disable:
 	if (priv->lcd_clk)
 		clk_disable_unprepare(priv->lcd_clk);
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 26ebf424d63ec21ccee80221745c3e8bcc6b3d7f..ddaf80052f03b8e366c89a6562b430a400b6dacd 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -748,13 +748,30 @@ static void ingenic_ipu_destroy_state(struct drm_private_obj *obj,
 	struct ingenic_ipu_private_state *priv_state = to_ingenic_ipu_priv_state(state);
 
 	kfree(priv_state);
 }
 
+static void ingenic_ipu_reset(struct drm_private_obj *obj)
+{
+	struct ingenic_ipu_private_state *priv_state;
+
+	if (obj->state) {
+		ingenic_ipu_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	priv_state = kzalloc(sizeof(*priv_state), GFP_KERNEL);
+	if (!priv_state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &priv_state->base);
+}
+
 static const struct drm_private_state_funcs ingenic_ipu_private_state_funcs = {
 	.atomic_duplicate_state = ingenic_ipu_duplicate_state,
 	.atomic_destroy_state = ingenic_ipu_destroy_state,
+	.reset = ingenic_ipu_reset,
 };
 
 static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
 {
 	struct ingenic_ipu *ipu = arg;
@@ -791,11 +808,10 @@ static const struct regmap_config ingenic_ipu_regmap_config = {
 };
 
 static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct ingenic_ipu_private_state *private_state;
 	const struct soc_info *soc_info;
 	struct drm_device *drm = d;
 	struct drm_plane *plane;
 	struct ingenic_ipu *ipu;
 	void __iomem *base;
@@ -885,24 +901,14 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 	if (err) {
 		dev_err(dev, "Unable to prepare clock\n");
 		return err;
 	}
 
-	private_state = kzalloc(sizeof(*private_state), GFP_KERNEL);
-	if (!private_state) {
-		err = -ENOMEM;
-		goto err_clk_unprepare;
-	}
-
-	drm_atomic_private_obj_init(drm, &ipu->private_obj, &private_state->base,
+	drm_atomic_private_obj_init(drm, &ipu->private_obj, NULL,
 				    &ingenic_ipu_private_state_funcs);
 
 	return 0;
-
-err_clk_unprepare:
-	clk_unprepare(ipu->clk);
-	return err;
 }
 
 static void ingenic_ipu_unbind(struct device *dev,
 			       struct device *master, void *d)
 {

-- 
2.51.0


