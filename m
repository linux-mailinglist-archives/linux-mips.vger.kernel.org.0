Return-Path: <linux-mips+bounces-15218-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CkJyL6ZrPmo1FwkAu9opvQ
	(envelope-from <linux-mips+bounces-15218-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 14:08:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2286CCD12
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 14:08:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=GNX8nfi+;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15218-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15218-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82C4930F0910
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 12:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5616C3F411D;
	Fri, 26 Jun 2026 12:05:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC613F39FB
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 12:05:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475519; cv=none; b=e+12TqXflNtlHe1/GDHid/A4WGdb7userzYXS+PbOmMK2ATzy9Qf+veK9EWyvpatcKFfTNn0XGaoeQBrcZ/6Y1FtrBh/uWmnWpym8QZ3e+wdpJsmSuVmQKGyi1H40zfXi4lrkXPCSPv5vZtrmfJJtXRLnqnmIZieSx5Iisqa40c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475519; c=relaxed/simple;
	bh=T2Ao5+iz+3qTZqrkkMQusaqsyc6X0/IUM3eCHqSE84g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJ/J7repaf+64vG9uWkvE6hro8aEm/0WtVs9V7Njj087+rRSenKgEwA2wqwVoQkMvqx13+ixr+FBj9/d6vtkGnqi8hAFwdOOvQhMnb6BHERbWVu2v/CWfGWZ2v9j8aIlUn4CHXhA3A16foXGVrwipFlD6aT+CaMkVYY0QZRnDz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GNX8nfi+; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782475511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TemmnxQbHr9Z/Q/ceT6zMqLs8C3scMoXLKxAejKWG7s=;
	b=GNX8nfi+m0hZ0sQkVrYQPtdb6arx5We5EQbicdobW7OGjUm+ycY7pEdYpu5aDGSE6YzXn/
	GAmhz2BV63WYrIs+bOgCs1VK9kNCrA6bMHe27anl7HnqSkGkDWeZgAXkZGVBjbQQR7Obyp
	fPZqFZULtCtUT3iEuBTpGQNOK+5X2xo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-509-YIJuIVyvO-SNN5Iom2lGqA-1; Fri,
 26 Jun 2026 08:05:08 -0400
X-MC-Unique: YIJuIVyvO-SNN5Iom2lGqA-1
X-Mimecast-MFC-AGG-ID: YIJuIVyvO-SNN5Iom2lGqA_1782475506
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D129E18004D4;
	Fri, 26 Jun 2026 12:05:05 +0000 (UTC)
Received: from [192.168.1.153] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D936A18005B2;
	Fri, 26 Jun 2026 12:04:46 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 14:03:26 +0200
Subject: [PATCH 4/5] drm/bridge: release panel reference on all lookup exit
 paths
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-drm_refcount_wiring-v1-4-cca1a7b3bdef@redhat.com>
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
In-Reply-To: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Jingoo Han <jingoohan1@gmail.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Alison Wang <alison.wang@nxp.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782475410; l=12194;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=T2Ao5+iz+3qTZqrkkMQusaqsyc6X0/IUM3eCHqSE84g=;
 b=hzpiWvwLM+5qpfDIMWlznGOaLU4GSmjxtdzTxZHRLVvHflNpkUjejCDBakbypFLovUiDDs9gh
 GLiUutSsO2sDdecj6L2tu6UiYVfSS2eChQyucPXoUjbMNGTg4NIRfnC
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15218-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:laurentiu.palcu@oss.nxp.com,m:l.stach@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:paul@crapouillou.net,m:linusw@kernel.org,m:marex@denx.de,m:stefan@agner.ch,m:tomi.valkeinen@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.
 st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:samuel@sholland.org,m:jyri.sarha@iki.fi,m:jingoohan1@gmail.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:alison.wang@nxp.com,m:paulk@sys-base.io,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-samsung-soc@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:aesteve@redhat.com,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,ideasonboard.com,kwiboo.se,bootlin.com,samsung.com,amarulasolutions.com,oss.nxp.com,pengutronix.de,nxp.com,crapouillou.net,denx.de,agner.ch,glider.be,bp.renesas.com,rock-chips.com,sntech.de,foss.st.com,sholland.org,iki.fi,sys-base.io,nvidia.com];
	FORGED_SENDER(0.00)[aesteve@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[68];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A2286CCD12

of_drm_find_panel() and drm_of_find_panel_or_bridge() now return a
counted reference that the caller must release with drm_panel_put().

For bridge drivers that immediately wrap the panel in a panel_bridge
(which acquires its own reference), release the lookup reference right
after the bridge creation call.

For analogix-anx6345, which stores the panel for direct use, release
the reference in the i2c remove path.

For platform drivers using analogix_dp_core with a component lifecycle
(exynos_dp, rockchip analogix_dp), release the lookup reference in the
platform remove() function. The panel_bridge created during bind() holds
a separate reference that devm cleanup releases after remove() returns.

Also fix devm_drm_of_get_bridge() and drmm_of_get_bridge() in
bridge/panel.c itself: both call drm_of_find_panel_or_bridge() and
then pass the panel to devm/drmm_panel_bridge_add(), which acquires
its own reference via drm_panel_bridge_add_typed(). The lookup
reference was never released; add drm_panel_put() after each bridge
creation call.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  3 +++
 drivers/gpu/drm/bridge/panel.c                     |  8 ++++++--
 drivers/gpu/drm/exynos/exynos_dp.c                 | 10 ++++++++++
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  3 +++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          | 18 ++++++++++++++++++
 drivers/gpu/drm/logicvc/logicvc_interface.c        | 12 ++++++++++++
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 11 +++++++++++
 drivers/gpu/drm/sti/sti_dvo.c                      |  3 +++
 drivers/gpu/drm/stm/lvds.c                         |  3 +++
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |  2 ++
 drivers/gpu/drm/tegra/dsi.c                        |  1 +
 drivers/gpu/drm/tegra/output.c                     |  3 +++
 14 files changed, 101 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index f3fe47b12edca..1fe11b075f860 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -756,6 +756,9 @@ static void anx6345_i2c_remove(struct i2c_client *client)
 {
 	struct anx6345 *anx6345 = i2c_get_clientdata(client);
 
+	if (anx6345->panel)
+		drm_panel_put(anx6345->panel);
+
 	drm_bridge_remove(&anx6345->bridge);
 
 	unregister_i2c_dummy_clients(anx6345);
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6b98ad19508df..04b53ae698e5b 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -513,8 +513,10 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (panel)
+	if (panel) {
 		bridge = devm_drm_panel_bridge_add(dev, panel);
+		drm_panel_put(panel);
+	}
 
 	return bridge;
 }
@@ -547,8 +549,10 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (panel)
+	if (panel) {
 		bridge = drmm_panel_bridge_add(drm, panel);
+		drm_panel_put(panel);
+	}
 
 	return bridge;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index b805403281504..14f5b1b452506 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -193,6 +193,16 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 static void exynos_dp_remove(struct platform_device *pdev)
 {
+	struct exynos_dp_device *dp = platform_get_drvdata(pdev);
+
+	/*
+	 * Release the probe-time reference from of_drm_find_panel(). If bind
+	 * ran, the panel_bridge holds a second reference that devm cleanup
+	 * will release when the bridge is destroyed after remove() returns.
+	 */
+	if (dp->plat_data.panel)
+		drm_panel_put(dp->plat_data.panel);
+
 	component_del(&pdev->dev, &exynos_dp_ops);
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 0dc36df6ada34..9d15a0035ea99 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -245,5 +245,8 @@ int exynos_dpi_remove(struct drm_encoder *encoder)
 
 	exynos_dpi_disable(&ctx->encoder);
 
+	if (ctx->panel)
+		drm_panel_put(ctx->panel);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 84eff7519e322..ec71fbbb0eb89 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -109,6 +109,13 @@ static int fsl_dcu_attach_panel(struct fsl_dcu_drm_device *fsl_dev,
 	return ret;
 }
 
+static void fsl_dcu_panel_put_action(void *data)
+{
+	struct drm_panel *panel = data;
+
+	drm_panel_put(panel);
+}
+
 int fsl_dcu_create_outputs(struct fsl_dcu_drm_device *fsl_dev)
 {
 	struct device_node *panel_node;
@@ -124,6 +131,12 @@ int fsl_dcu_create_outputs(struct fsl_dcu_drm_device *fsl_dev)
 		if (IS_ERR(fsl_dev->connector.panel))
 			return PTR_ERR(fsl_dev->connector.panel);
 
+		ret = devm_add_action_or_reset(fsl_dev->dev,
+					       fsl_dcu_panel_put_action,
+					       fsl_dev->connector.panel);
+		if (ret)
+			return ret;
+
 		return fsl_dcu_attach_panel(fsl_dev, fsl_dev->connector.panel);
 	}
 
@@ -132,6 +145,11 @@ int fsl_dcu_create_outputs(struct fsl_dcu_drm_device *fsl_dev)
 		return ret;
 
 	if (panel) {
+		ret = devm_add_action_or_reset(fsl_dev->dev,
+					       fsl_dcu_panel_put_action, panel);
+		if (ret)
+			return ret;
+
 		fsl_dev->connector.panel = panel;
 		return fsl_dcu_attach_panel(fsl_dev, panel);
 	}
diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
index 689049d395c0d..81f760dc07f8d 100644
--- a/drivers/gpu/drm/logicvc/logicvc_interface.c
+++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
@@ -28,6 +28,11 @@
 #define logicvc_interface_from_drm_connector(c) \
 	container_of(c, struct logicvc_interface, drm_connector)
 
+static void logicvc_panel_put_action(void *data)
+{
+	drm_panel_put(data);
+}
+
 static void logicvc_encoder_enable(struct drm_encoder *drm_encoder)
 {
 	struct logicvc_drm *logicvc = logicvc_drm(drm_encoder->dev);
@@ -160,6 +165,13 @@ int logicvc_interface_init(struct logicvc_drm *logicvc)
 	if (ret == -EPROBE_DEFER)
 		goto error_early;
 
+	if (interface->drm_panel) {
+		ret = devm_add_action_or_reset(dev, logicvc_panel_put_action,
+					       interface->drm_panel);
+		if (ret)
+			goto error_early;
+	}
+
 	ret = drm_encoder_init(drm_dev, &interface->drm_encoder,
 			       &logicvc_encoder_funcs, encoder_type, NULL);
 	if (ret) {
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 06072efd7fca3..4b2795a6caf8c 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -27,6 +27,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -472,6 +473,16 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 
 static void rockchip_dp_remove(struct platform_device *pdev)
 {
+	struct rockchip_dp_device *dp = platform_get_drvdata(pdev);
+
+	/*
+	 * Release the probe-time reference from of_drm_find_panel(). If bind
+	 * ran, the panel_bridge holds a second reference that devm cleanup
+	 * will release when the bridge is destroyed after remove() returns.
+	 */
+	if (dp->plat_data.panel)
+		drm_panel_put(dp->plat_data.panel);
+
 	component_del(&pdev->dev, &rockchip_dp_component_ops);
 }
 
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 7484d3c3f4ed5..64a9da0362fb8 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -492,6 +492,9 @@ static void sti_dvo_unbind(struct device *dev,
 {
 	struct sti_dvo *dvo = dev_get_drvdata(dev);
 
+	if (dvo->panel)
+		drm_panel_put(dvo->panel);
+
 	drm_bridge_remove(&dvo->bridge);
 }
 
diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 50a878688e477..77735e26c56e3 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -1189,6 +1189,9 @@ static void lvds_remove(struct platform_device *pdev)
 {
 	struct stm_lvds *lvds = platform_get_drvdata(pdev);
 
+	if (lvds->panel)
+		drm_panel_put(lvds->panel);
+
 	lvds_pixel_clk_unregister(lvds);
 
 	drm_bridge_remove(&lvds->lvds_bridge);
diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index 6716e895ae8a4..e1b342c922224 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -18,6 +18,11 @@
 #include "sun4i_tcon.h"
 #include "sun4i_lvds.h"
 
+static void sun4i_panel_put_action(void *data)
+{
+	drm_panel_put(data);
+}
+
 struct sun4i_lvds {
 	struct drm_connector	connector;
 	struct drm_encoder	encoder;
@@ -113,6 +118,14 @@ int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 		return 0;
 	}
 
+	if (lvds->panel) {
+		ret = devm_add_action_or_reset(tcon->dev,
+					       sun4i_panel_put_action,
+					       lvds->panel);
+		if (ret)
+			return ret;
+	}
+
 	drm_encoder_helper_add(&lvds->encoder,
 			       &sun4i_lvds_enc_helper_funcs);
 	ret = drm_simple_encoder_init(drm, &lvds->encoder,
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index dfb6acc42f02e..0066bec5a9e5a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -43,6 +43,11 @@ drm_encoder_to_sun4i_rgb(struct drm_encoder *encoder)
 			    encoder);
 }
 
+static void sun4i_panel_put_action(void *data)
+{
+	drm_panel_put(data);
+}
+
 static int sun4i_rgb_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_rgb *rgb =
@@ -205,6 +210,14 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 		return 0;
 	}
 
+	if (rgb->panel) {
+		ret = devm_add_action_or_reset(tcon->dev,
+					       sun4i_panel_put_action,
+					       rgb->panel);
+		if (ret)
+			return ret;
+	}
+
 	drm_encoder_helper_add(&rgb->encoder,
 			       &sun4i_rgb_enc_helper_funcs);
 	ret = drm_simple_encoder_init(drm, &rgb->encoder,
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index c35b70d83e53b..1e8bc12fb6d04 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -985,6 +985,8 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
 
+	if (dsi->panel)
+		drm_panel_put(dsi->panel);
 	dsi->panel = NULL;
 	dsi->device = NULL;
 
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 7f25c50621c94..57a016f47434d 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1516,6 +1516,7 @@ static int tegra_dsi_host_detach(struct mipi_dsi_host *host,
 	struct tegra_output *output = &dsi->output;
 
 	if (output->panel && &device->dev == output->panel->dev) {
+		drm_panel_put(output->panel);
 		output->panel = NULL;
 
 		if (output->connector.dev)
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 49e4f63a5550d..90db39dbdd332 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -195,6 +195,9 @@ int tegra_output_probe(struct tegra_output *output)
 
 void tegra_output_remove(struct tegra_output *output)
 {
+	if (output->panel)
+		drm_panel_put(output->panel);
+
 	if (output->hpd_gpio)
 		free_irq(output->hpd_irq, output);
 

-- 
2.54.0


