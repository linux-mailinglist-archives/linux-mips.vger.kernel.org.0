Return-Path: <linux-mips+bounces-15805-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lxXWBh/SVGo1fQAAu9opvQ
	(envelope-from <linux-mips+bounces-15805-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:55:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D274A971
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:55:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="DIq/q0NX";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15805-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15805-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CB76300AEC1
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 11:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597673F4DE2;
	Mon, 13 Jul 2026 11:55:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F953F4829
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 11:55:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943709; cv=none; b=ufio6i+vhwevluZsmtmabZD8oU1G8gKDvaVMvCvZjOp2jgmbZUqCdE4lAPlUHtL5N2RLivsb4ZnKh6GeMUJeLWWJsky4PbhCi58v2YL5Zyn6tPTX2JP6u5zCTqytB0SL6MPUJVntPB4bzcCJQa3KnxG7B9bTEt7d6IppExkB3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943709; c=relaxed/simple;
	bh=dzpeOF7sIt4/OTXPktgi6VTN8JiIFkFsUfT9qr3ZGsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IYah00YA+O9iphcb1Cw8yDqwfMPbYmDiuyHp0Qnt3OfKIrgzvVAMyp5GfUL8TDAi572XF342ZVHzpOJ3mCvPuAcvv/f4G1J31M+HjYbGyepLj3K2LSfV15cqEe5cE0CEpPGbkz2BfeYLvmCC88Ha/t8T5JFvDEytQWHoayI9hv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DIq/q0NX; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783943706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNPubKjBMqN3gTmvYDkvcmawrm5Mwj72gRd4ijQR7wo=;
	b=DIq/q0NXmWZDOjeSVmV8z22vIgsZWDQAVEL5sf/86cPyNxz4+SzzU4tHZYFNKaZrNYYG9K
	Z5AK82cv0Ng16UqxLltZK7vaPzXZXH742FqGzKI/rfxFBPHS5yopp9ciUm6uVcnUl47AQr
	XQw/ab63REvjOC8mJLLT/tpeQxQH8AA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-316-vNmpurXYNa6bs7uAyrgySw-1; Mon,
 13 Jul 2026 07:54:57 -0400
X-MC-Unique: vNmpurXYNa6bs7uAyrgySw-1
X-Mimecast-MFC-AGG-ID: vNmpurXYNa6bs7uAyrgySw_1783943689
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 265081955D98;
	Mon, 13 Jul 2026 11:54:49 +0000 (UTC)
Received: from [192.168.1.153] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 464E41800586;
	Mon, 13 Jul 2026 11:54:35 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 13 Jul 2026 13:53:08 +0200
Subject: [PATCH v2 5/5] drm: release panel reference after panel bridge
 creation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-drm_refcount_wiring-v2-5-d3bb61f4bd4d@redhat.com>
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
In-Reply-To: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783943594; l=10544;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=dzpeOF7sIt4/OTXPktgi6VTN8JiIFkFsUfT9qr3ZGsc=;
 b=GTZrudD6UEdPrnwfxKbrh6LYnSu+4moS+csq9PLxmamwmOpey3SHrVdp4Cw1NF18XT2asYUWL
 /5o3jUmUMIMBF0G2HX7WJZ5BCOeYsD6p9xLxNE+1MBRYjLSN1ZCU0L1
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15805-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:laurentiu.palcu@oss.nxp.com,m:l.stach@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:paul@crapouillou.net,m:linusw@kernel.org,m:marex@denx.de,m:stefan@agner.ch,m:tomi.valkeinen@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.
 st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:samuel@sholland.org,m:jyri.sarha@iki.fi,m:jingoohan1@gmail.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:alison.wang@nxp.com,m:paulk@sys-base.io,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-samsung-soc@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:aesteve@redhat.com,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aesteve@redhat.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,ideasonboard.com,kwiboo.se,bootlin.com,samsung.com,amarulasolutions.com,oss.nxp.com,pengutronix.de,nxp.com,crapouillou.net,denx.de,agner.ch,glider.be,bp.renesas.com,rock-chips.com,sntech.de,foss.st.com,sholland.org,iki.fi,sys-base.io,nvidia.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[68];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C7D274A971

Update a second batch of drivers calling of_drm_find_panel() or
drm_of_find_panel_or_bridge() to release the lookup reference after
wrapping the panel in a bridge.

Also handle the cases where a panel is found but cannot be used,
dropping the reference immediately in those paths.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c               |  3 +++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c         |  4 +++-
 drivers/gpu/drm/mcde/mcde_drv.c                   |  1 +
 drivers/gpu/drm/mcde/mcde_dsi.c                   |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                 |  1 +
 drivers/gpu/drm/omapdrm/dss/output.c              |  1 +
 drivers/gpu/drm/pl111/pl111_drv.c                 |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c       |  1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  1 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c          |  1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c           |  1 +
 drivers/gpu/drm/stm/ltdc.c                        |  1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c                |  2 ++
 drivers/gpu/drm/tidss/tidss_kms.c                 | 16 +++++++++++-----
 drivers/gpu/drm/tve200/tve200_drv.c               |  1 +
 16 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 50bd7f36d36dd..01e0c10b6ea1a 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -77,6 +77,9 @@ static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
 	if (ret)
 		return ret;
 
+	if (panel)
+		drm_panel_put(panel);
+
 	if (!bridge) {
 		dev_err(ddev->dev, "No bridge found %d.\n", ret);
 		return -ENODEV;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 42c86f195c66b..1887e01d29701 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1297,9 +1297,11 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			goto err_drvdata;
 		}
 
-		if (panel)
+		if (panel) {
 			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
 								 DRM_MODE_CONNECTOR_DPI);
+			drm_panel_put(panel);
+		}
 
 		ib = drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
 					NULL, DRM_MODE_ENCODER_DPI, NULL);
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e1..53275b575f0cb 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -153,6 +153,7 @@ static int mcde_modeset_init(struct drm_device *drm)
 		if (panel) {
 			bridge = drm_panel_bridge_add_typed(panel,
 					DRM_MODE_CONNECTOR_DPI);
+			drm_panel_put(panel);
 			if (IS_ERR(bridge)) {
 				dev_err(drm->dev,
 					"Could not connect panel bridge\n");
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 47d45897ed069..d9a454f226f79 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1124,6 +1124,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_DSI);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge)) {
 			dev_err(dev, "error adding panel bridge\n");
 			return PTR_ERR(bridge);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 0b756da2fec22..bfcdc0c237ee1 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -128,6 +128,7 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	if (panel) {
 		bridge = devm_drm_panel_bridge_add_typed(drm->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);
 	}
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index ca891aba38209..6e9bc605ee22f 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -43,6 +43,7 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		struct drm_bridge *bridge;
 
 		bridge = drm_panel_bridge_add(out->panel);
+		drm_panel_put(out->panel);
 		if (IS_ERR(bridge)) {
 			dev_err(out->dev,
 				"unable to create panel bridge (%ld)\n",
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ac7b1d12a0f59..8ec659b3c08eb 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -145,6 +145,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_Unknown);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge)) {
 			ret = PTR_ERR(bridge);
 			goto finish;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index db2088529b480..d8e7e9877ba86 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -69,6 +69,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(no_free_ptr(bridge));
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 154410745a74b..cc2996f044721 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -791,6 +791,7 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 	if (lvds->panel) {
 		lvds->next_bridge = devm_drm_panel_bridge_add(lvds->dev,
 							      lvds->panel);
+		drm_panel_put(lvds->panel);
 		if (IS_ERR_OR_NULL(lvds->next_bridge)) {
 			ret = -EINVAL;
 			goto done;
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index f50d166b764f5..3d0999e4fcfdf 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -90,6 +90,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(no_free_ptr(bridge));
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 7a0c4fa29f2f0..f754445d2631b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -605,6 +605,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 	if (lvds->panel) {
 		lvds->bridge = drm_panel_bridge_add_typed(lvds->panel, DRM_MODE_CONNECTOR_LVDS);
+		drm_panel_put(lvds->panel);
 		if (IS_ERR(lvds->bridge)) {
 			ret = PTR_ERR(lvds->bridge);
 			goto err_free_encoder;
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index add3123e5ce70..ea66c70013787 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -139,6 +139,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_LVDS);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return ERR_CAST(bridge);
 	}
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 95fcfa48d8be3..daf198edb42f5 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1982,6 +1982,7 @@ int ltdc_load(struct drm_device *ddev)
 
 		if (panel) {
 			bridge = drmm_panel_bridge_add(ddev, panel);
+			drm_panel_put(panel);
 			if (IS_ERR(bridge)) {
 				drm_err(ddev, "panel-bridge endpoint %d\n", i);
 				ret = PTR_ERR(bridge);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291da..d4c1723c5e3d8 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1326,6 +1326,8 @@ static int sun4i_tcon_probe(struct platform_device *pdev)
 		ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
 		if (ret == -EPROBE_DEFER)
 			return ret;
+		if (panel)
+			drm_panel_put(panel);
 	}
 
 	return component_add(&pdev->dev, &sun4i_tcon_ops);
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 1512ee2574b66..70c14c3be10d5 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -162,6 +162,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 
 		if (panel) {
 			u32 conn_type;
+			int ret;
 
 			dev_dbg(dev, "Setting up panel for port %d\n", i);
 
@@ -176,7 +177,8 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 				break;
 			default:
 				WARN_ON(1);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto put_panel;
 			}
 
 			if (panel->connector_type != conn_type) {
@@ -184,16 +186,20 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 					"%s: Panel %s has incompatible connector type for vp%d (%d != %d)\n",
 					 __func__, dev_name(panel->dev), i,
 					 panel->connector_type, conn_type);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto put_panel;
 			}
 
 			bridge = devm_drm_panel_bridge_add(dev, panel);
-			if (IS_ERR(bridge)) {
+			ret = PTR_ERR_OR_ZERO(bridge);
+			if (ret)
 				dev_err(dev,
 					"failed to set up panel bridge for port %d\n",
 					i);
-				return PTR_ERR(bridge);
-			}
+put_panel:
+			drm_panel_put(panel);
+			if (ret)
+				return ret;
 		}
 
 		pipes[num_pipes].hw_videoport = i;
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 562f3f11812a3..f858c58ccb994 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -84,6 +84,7 @@ static int tve200_modeset_init(struct drm_device *dev)
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_Unknown);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge)) {
 			ret = PTR_ERR(bridge);
 			goto out_bridge;

-- 
2.54.0


