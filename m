Return-Path: <linux-mips+bounces-13039-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NrJAfcEemlE1gEAu9opvQ
	(envelope-from <linux-mips+bounces-13039-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jan 2026 13:45:43 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C8AA17AD
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jan 2026 13:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97B8A30480EE
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jan 2026 12:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7762F33F8C1;
	Wed, 28 Jan 2026 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oyf3ex5H"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538FC13DDAE
	for <linux-mips@vger.kernel.org>; Wed, 28 Jan 2026 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604265; cv=none; b=hQpk53Ibei2m30ASuzZGXliBgJCOQDSrYIecC/FQlU/HY6jjzrDE9yK/1EP86pIHZP0gNz1bXfsRqbfwhA7PtpV3+1W0k8aEGhDd45ByktTlftQdAi5+Cl20nSFpbR+p/tDl8G/9bir2veEaBI7h0JLQygXmR5KlDrs1ZSSVsR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604265; c=relaxed/simple;
	bh=VXCiYzHy7nSv04/kjM9P2ZRVAoNaL8fo/ZIuYPOGdw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eL+HnIQtKYYcfxf0yMnMzNXewLk30mxxQ0zeoXH4fJsVY2Ir6rdbqk4iB6XfBVFEVB8gybBplMACM70bJ0K/fEwLXOwaWVpgeKRAwy6CHIjYJePxllsXFpfkWxItE6f6Ci8/PzQ0jRGd3j1X5QUU3TpxPc9AuwfVPv7uh4FNugM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oyf3ex5H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE5EC116C6;
	Wed, 28 Jan 2026 12:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769604265;
	bh=VXCiYzHy7nSv04/kjM9P2ZRVAoNaL8fo/ZIuYPOGdw0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Oyf3ex5HXnPYgU/AEpFm1QwVva3l59Nh/8uVpqeeekK8/iZ8QOA191zZjvcGcHkx7
	 tC8SZlQc9zisZ+SfhLzelYh7XvUUL5vXtZytze0HerZtzbduEz2q0gCyOEMX2FarCY
	 8HvMoa5jH2C+r8Mm/VMXrv+vIXsf5HdG2JUuzJt56aV2ol7V98EWVFT+dipm2CP5L9
	 pIMAiJLgU5iIhiDDzSYNlBOWQWH9Fh2tMhkdeOhkG3XMzX71hNl2hZxmF3zDK3AfiC
	 W+flgI79WnGadZbivHH8OOJgQYKY/Tv07R5YnZW/m13pcJPKH4Wr80aDBQ8yo7rdf8
	 yw5yK3rIaiDGQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:53 +0100
Subject: [PATCH v4 09/15] drm/ingenic: Switch private_obj initialization to
 atomic_create_state
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-private-obj-reset-v4-9-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6401; i=mripard@redhat.com;
 h=from:subject:message-id; bh=VXCiYzHy7nSv04/kjM9P2ZRVAoNaL8fo/ZIuYPOGdw0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLJ1mpX4hJ/Z8UpZ2i8pyME+vnWAzvYz7veG2u8wG2
 Ut7l3l2TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgInsi2Ks01k1Jb9+74wQicCd
 fzTtlvx7evobo/dfx0WHEvyWHInVOL+OY+3KXdNCH+9rWLStMYjtBmN9lV3Z2ZXOsU2n8iUFStc
 9v7/vS9vzl9+FV+89/fXfi32aFywUzxou85vxb6n6eiH1DNEUAA==
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13039-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[crapouillou.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 79C8AA17AD
X-Rspamd-Action: no action

The ingenic driver relies on two drm_private_objs, that are initialized
by allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Paul Cercueil <paul@crapouillou.net>
---

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 +++++++++++++++++-----------
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 28 ++++++++++++++++------------
 2 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index d3213fbf22be14b177fc1b7100c5b721d5f17924..862691991ed2770d30342bf531e828e34bd7080a 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -952,10 +952,24 @@ static void ingenic_drm_destroy_state(struct drm_private_obj *obj,
 	struct ingenic_drm_private_state *priv_state = to_ingenic_drm_priv_state(state);
 
 	kfree(priv_state);
 }
 
+static struct drm_private_state *
+ingenic_drm_create_state(struct drm_private_obj *obj)
+{
+	struct ingenic_drm_private_state *priv_state;
+
+	priv_state = kzalloc(sizeof(*priv_state), GFP_KERNEL);
+	if (!priv_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &priv_state->base);
+
+	return &priv_state->base;
+}
+
 DEFINE_DRM_GEM_DMA_FOPS(ingenic_drm_fops);
 
 static const struct drm_driver ingenic_drm_driver_data = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.name			= "ingenic-drm",
@@ -1032,10 +1046,11 @@ static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
 static struct drm_mode_config_helper_funcs ingenic_drm_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail,
 };
 
 static const struct drm_private_state_funcs ingenic_drm_private_state_funcs = {
+	.atomic_create_state = ingenic_drm_create_state,
 	.atomic_duplicate_state = ingenic_drm_duplicate_state,
 	.atomic_destroy_state = ingenic_drm_destroy_state,
 };
 
 static void ingenic_drm_unbind_all(void *d)
@@ -1085,11 +1100,10 @@ static void ingenic_drm_atomic_private_obj_fini(struct drm_device *drm, void *pr
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
@@ -1385,23 +1399,17 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
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
@@ -1409,12 +1417,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
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
index 32638a713241abbd4eaed09f0aaec2b790650cc9..253a1ce30997308547b61339468d52e6875785d3 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -748,11 +748,26 @@ static void ingenic_ipu_destroy_state(struct drm_private_obj *obj,
 	struct ingenic_ipu_private_state *priv_state = to_ingenic_ipu_priv_state(state);
 
 	kfree(priv_state);
 }
 
+static struct drm_private_state *
+ingenic_ipu_create_state(struct drm_private_obj *obj)
+{
+	struct ingenic_ipu_private_state *priv_state;
+
+	priv_state = kzalloc(sizeof(*priv_state), GFP_KERNEL);
+	if (!priv_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &priv_state->base);
+
+	return &priv_state->base;
+}
+
 static const struct drm_private_state_funcs ingenic_ipu_private_state_funcs = {
+	.atomic_create_state = ingenic_ipu_create_state,
 	.atomic_duplicate_state = ingenic_ipu_duplicate_state,
 	.atomic_destroy_state = ingenic_ipu_destroy_state,
 };
 
 static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
@@ -791,11 +806,10 @@ static const struct regmap_config ingenic_ipu_regmap_config = {
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
@@ -885,24 +899,14 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
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
2.52.0


