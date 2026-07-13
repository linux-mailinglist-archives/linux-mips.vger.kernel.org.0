Return-Path: <linux-mips+bounces-15803-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ue2iNPjRVGonfQAAu9opvQ
	(envelope-from <linux-mips+bounces-15803-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:54:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B374A938
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:54:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="IFuFs/ZH";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15803-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15803-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 399C93006F06
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 11:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBED3F4829;
	Mon, 13 Jul 2026 11:54:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1132F3F23AF
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 11:54:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943670; cv=none; b=SPTrkCfge8Ip5meJTngmu1kAgbGW1d9XODqDXO5MBIq8PkeoQ/4g020sAcfwo/RY4/RkNgrrhsgIYGNq4LMxixTvjUURczMDPFhAUa2PEm+Nk4GotCZQVMpT8hVH0sNoyy/Af8iabov3zwBHvLMK3Jui7OtAf9I6TtKHMaFZ+5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943670; c=relaxed/simple;
	bh=C9hytV/WNG6Ap25BpMyeNrBHlKSUexgcfqP7CuoqfAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qI6UNhYIvrhm4o+d9N7LM+fQ+hsDDZX+G9gkTwT7yssxQXADb285oqGhOSGd3z79yHrIhnzYR3Ah2B32lD7cGjoWoKu+TsXLGN+pq/Ua2z3gS1BKseDg4YNtuDIKPZzDQAPDaYXUCX/aYkx2sso/qzJl/6B6mg0LcFPomyxaIzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFuFs/ZH; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783943667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Q5VowINj2yU54368FNGAMpi2UxsPxgNkM0hkGifsc8=;
	b=IFuFs/ZHrNIuEynYOXc/48PYQbvlKvVdS1qYa0smm6Y4/TsUtbolTccO/iYPmV2BJTiObU
	ajjo/VnSBXlu5/EtSIzDd3DVjXIzXSwjjVHS6sCf5AOw3t7+IZfcJMJwc8k5UB6Ndy06st
	rvg18hTv8n8prI44DPuPg8IGym07SiQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-GtD5X-FANaS0mdA-0SGRaw-1; Mon,
 13 Jul 2026 07:54:23 -0400
X-MC-Unique: GtD5X-FANaS0mdA-0SGRaw-1
X-Mimecast-MFC-AGG-ID: GtD5X-FANaS0mdA-0SGRaw_1783943661
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 632B718052E3;
	Mon, 13 Jul 2026 11:54:21 +0000 (UTC)
Received: from [192.168.1.153] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA3051800598;
	Mon, 13 Jul 2026 11:54:06 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 13 Jul 2026 13:53:06 +0200
Subject: [PATCH v2 3/5] drm/panel: of_drm_find_panel() return a counted
 reference
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-drm_refcount_wiring-v2-3-d3bb61f4bd4d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783943594; l=14844;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=C9hytV/WNG6Ap25BpMyeNrBHlKSUexgcfqP7CuoqfAE=;
 b=jowyFI3R17ujw461VNkIiwW6hauoRj3AdxrjqhlBgzyDKDalUIhjlSK5NlYNqSQl+zN6S8L5y
 O+40NxFXujbCEz+BB2GSVuLeibMjiAy3q1F+c2/7pIPI7RXRfyAwe+H
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
	TAGGED_FROM(0.00)[bounces-15803-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 246B374A938

Callers of of_drm_find_panel() receive a pointer with no reference
held, creating a window where the panel device can be unregistered
and freed between the lookup and first use (e.g., drm_panel_prepare()).

Fix the lookup function by acquiring a reference with drm_panel_get()
before returning, under panel_lock. Callers are now responsible for
calling drm_panel_put() when they no longer need the pointer.

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
 drivers/gpu/drm/drm_of.c                           |  3 ++-
 drivers/gpu/drm/drm_panel.c                        | 12 ++++++++----
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
 16 files changed, 111 insertions(+), 7 deletions(-)

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
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index d03ada82eac96..1873a84514a68 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -225,7 +225,8 @@ EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
  * @np: device tree node containing encoder output ports
  * @port: port in the device tree node
  * @endpoint: endpoint in the device tree node
- * @panel: pointer to hold returned drm_panel, must not be NULL
+ * @panel: pointer to hold returned drm_panel, must not be NULL. On success
+ *         the caller must call drm_panel_put() when done with the panel
  * @bridge: pointer to hold returned drm_bridge
  *
  * Given a DT node's port and endpoint number, find the connected node and
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 545fe93dc28fe..72cf86253c0cd 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -458,14 +458,17 @@ EXPORT_SYMBOL(__devm_drm_panel_alloc);
 
 #ifdef CONFIG_OF
 /**
- * of_drm_find_panel - look up a panel using a device tree node
+ * of_drm_find_panel - look up and reference a panel by device tree node
  * @np: device tree node of the panel
  *
  * Searches the set of registered panels for one that matches the given device
- * tree node. If a matching panel is found, return a pointer to it.
+ * tree node. If a matching panel is found, the panel's reference count is
+ * incremented before returning a pointer to it. The caller must call
+ * drm_panel_put() when it no longer needs the panel pointer.
  *
- * Return: A pointer to the panel registered for the specified device tree
- * node or an ERR_PTR() if no panel matching the device tree node can be found.
+ * Return: A reference-counted pointer to the panel registered for the specified
+ * device tree node or an ERR_PTR() if no panel matching the device tree node
+ * can be found.
  *
  * Possible error codes returned by this function:
  *
@@ -484,6 +487,7 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 
 	list_for_each_entry(panel, &panel_list, list) {
 		if (panel->dev->of_node == np) {
+			drm_panel_get(panel);
 			mutex_unlock(&panel_lock);
 			return panel;
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


