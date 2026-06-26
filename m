Return-Path: <linux-mips+bounces-15217-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CIqLMr1rPmpKFwkAu9opvQ
	(envelope-from <linux-mips+bounces-15217-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 14:08:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 420AB6CCD34
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 14:08:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=OWKsr9Nr;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15217-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15217-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B02DF302D300
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 12:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814283F4115;
	Fri, 26 Jun 2026 12:04:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A69F3F39FB
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 12:04:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475496; cv=none; b=p48eNLeAhMOG4FB2HGuoEi41TsNUcDEJ1nOmB6ptIKKX/pooP4BJHLLTL827X+yfECNV4Y6y+QF4ApTF4i5ts835I8BGn0huVwsIeP1vxXv7tKEcb17h1waxz2oTyB1xqEIBNuqzOMFgsaKQfuh310pxbyx/tW5cffINL3PmASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475496; c=relaxed/simple;
	bh=RQvWf2cmmOjDppG6XHJdIYzhop10IpGk0cqKF1/LF20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXM3TgTfgXHmcbyISHlBiVUXW3JBRnLuOU6cL8dLfZPsGds5dm4HADCXh3g0bbuuWoWxWWqvnaRBZARQmT3NC2IIebyQhjAPdaq8AryAnVndLpQ/oVaEjtwvmxZsrQhatlNnct0QjgNqipyYhW3YuG8MAwlzd/FTZD04kulFpms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OWKsr9Nr; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782475494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tAXt9BpJq2YIR4eaVSRC7C34o5liCLbDvfRHWn5C0ys=;
	b=OWKsr9Nry6UfmoBr05POUQinuXS1EEegxY3e0nEZDOrUJlrz02rD5WDqDufdnkSMJLUnz0
	bFn21KEHCpK5sptExNxl7dt/9JI5m4f+v2NCCd3/Bd5u4Mz9FAIm/fJq624ZJMqXev4Vdy
	enph0lnu73FDN4z43GcjTFWpDgGEMu8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-G2zlNTvQMl24BS8r5DdFsw-1; Fri,
 26 Jun 2026 08:04:49 -0400
X-MC-Unique: G2zlNTvQMl24BS8r5DdFsw-1
X-Mimecast-MFC-AGG-ID: G2zlNTvQMl24BS8r5DdFsw_1782475486
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA244180AE0E;
	Fri, 26 Jun 2026 12:04:45 +0000 (UTC)
Received: from [192.168.1.153] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6643118005B1;
	Fri, 26 Jun 2026 12:04:26 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 14:03:25 +0200
Subject: [PATCH 3/5] drm/panel: make *find_panel*() return a counted
 reference
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-drm_refcount_wiring-v1-3-cca1a7b3bdef@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782475410; l=3606;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=RQvWf2cmmOjDppG6XHJdIYzhop10IpGk0cqKF1/LF20=;
 b=8W4ovjLmvfzm95lBgOYTjqgTr37+/SUy6z65QeUY1DlWACyNlGh9CVciNc0EOMA4rxo+vhk6F
 nJQflgDdg2KBtgX+1gkj9BX1jBOVslRJjljQ/ZPAFhjR23p1/0zbIA9
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15217-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 420AB6CCD34

Callers of of_drm_find_panel() receive a pointer with no reference
held, creating a window where the panel device can be unregistered
and freed between the lookup and first use (e.g., drm_panel_prepare()).

find_panel_by_fwnode() is the fwnode counterpart of of_drm_find_panel().
drm_panel_add_follower() worked around the missing panel kref by calling
get_device() on the panel's underlying struct device. However, get_device()
only prevents the device kobject from being freed. It does not prevent the
panel's kzalloc()'d container memory from being released when the kref
reaches zero.

Fix both lookup functions by acquiring a reference with drm_panel_get()
before returning, under panel_lock. Callers are now responsible for calling
drm_panel_put() when they no longer need the pointer.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 545fe93dc28fe..a00ae98ed0956 100644
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
@@ -538,7 +542,13 @@ int of_drm_get_panel_orientation(const struct device_node *np,
 EXPORT_SYMBOL(of_drm_get_panel_orientation);
 #endif
 
-/* Find panel by fwnode. This should be identical to of_drm_find_panel(). */
+/*
+ * Find panel by fwnode, returning a counted reference.
+ *
+ * Behaves identically to of_drm_find_panel(). On success the returned
+ * pointer has been passed through drm_panel_get(); the caller must call
+ * drm_panel_put() when done with it.
+ */
 static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handle *fwnode)
 {
 	struct drm_panel *panel;
@@ -550,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handle *fwnode
 
 	list_for_each_entry(panel, &panel_list, list) {
 		if (dev_fwnode(panel->dev) == fwnode) {
+			drm_panel_get(panel);
 			mutex_unlock(&panel_lock);
 			return panel;
 		}
@@ -686,6 +697,7 @@ void drm_panel_remove_follower(struct drm_panel_follower *follower)
 	mutex_unlock(&panel->follower_lock);
 
 	put_device(panel->dev);
+	drm_panel_put(panel);
 }
 EXPORT_SYMBOL(drm_panel_remove_follower);
 

-- 
2.54.0


