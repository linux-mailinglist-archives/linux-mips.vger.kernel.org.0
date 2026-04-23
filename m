Return-Path: <linux-mips+bounces-14286-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FoUM0QL6mnFsgIAu9opvQ
	(envelope-from <linux-mips+bounces-14286-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 14:06:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 796B6451C14
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 14:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81EB130E77BE
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 11:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5E23EB810;
	Thu, 23 Apr 2026 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WlStTxqG"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4423EB80A;
	Thu, 23 Apr 2026 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945570; cv=none; b=G0KzhnIB678gD2PwkJ/bhQUzzwIABZJh1w7b40uiuyZ9sBJse7syxXY1nNvThj+qCCKpwXVKwoZSHQ9YTl24v3rLJ1TQ6xCSdyn3lbXB0U5E8dMYaCQndB4mDrZEFDrHLfo2yEXoLerh7etX0Rf5wnnkS6TWhIzSQqXIFqEYNA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945570; c=relaxed/simple;
	bh=r400RnvBBwtf4yjnHfB5HfGRVqz7s/s46rjjt3dq68I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AO3SxlFRPAgdZwraW6ZS/cuTsBELMMFUOfm43CQejNjUEqGiDkD8mh8INyc3lepEDHOEjkGrx44nUjHIOQDbTv9CBSEDkPE12Njw/pr0oPqTZBHPJR2HHaGa7rr4kgGwISoRj5rG/LKS0TTIWEyJZio+OpDJ8wQpThnHd98AxI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WlStTxqG; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AF257C5EF0E;
	Thu, 23 Apr 2026 12:00:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69D61604EB;
	Thu, 23 Apr 2026 11:59:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5309B10460BF2;
	Thu, 23 Apr 2026 13:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776945564; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=0cIzziXQXBlswI5he/Z1p9UVN9gXfIafkur4yQLuNKM=;
	b=WlStTxqGzva9+UFSYhFfXw4/eyvnNhgwpre83ebDV7irThXx3jpNRYnWO16QrVNcMMUvPa
	FtqvwIEFzz1tDTi3nQMemL7s2ni2N5ABm2DKLe/xjA9s9AGh/vfXXFmQ+Ix5neYQpUggUE
	ZkZ21Yrus5l3d9xGjFkYkOvTZpps9BvhfTY2TQgvgGgOjnl7ZVfUyrQEb88q3IfxCsNhlP
	OFyLzhp9rcJGWmKKtalqgU7Zg963yUOKfMu+Yf0/VXh1SnUEd9dPdKa1GHuQ5iAzalT8L2
	gWTTR+Ma0QEQnp454zzEqKiIy5BYmW0LpXZy4mqze37S9YM/iIdSVAQFxUomwQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Liu Ying <victor.liu@nxp.com>,
	Douglas Anderson <dianders@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant call to drm_connector_attach_encoder()
Date: Thu, 23 Apr 2026 13:55:50 +0200
Message-ID: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_FROM(0.00)[bounces-14286-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[78];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 796B6451C14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

shmob_drm_connector_create() can init the connector in two ways, based on
the 'if (sdev->pdata)':

 1. manually in shmob_drm_connector_create(), or
 2. delegating to drm_bridge_connector_init()

Whichever branch is taken, drm_connector_attach_encoder() is called
immediately after to attach the connector to the encoder.

Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
connector so it is not needed anymore in case 2 and should be removed, but
it is still needed in case 1. Move drm_connector_attach_encoder() from the
common path to inside shmob_drm_connector_create() in order to get back to
a single drm_connector_attach_encoder() in both cases.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- rewrote completely, fixing potential ERR_PTR deref and ending up with
  a cleaner patch
- also wrote more extensive commit message
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c    | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 5f460b38596c..815c770147ed 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -583,6 +583,13 @@ shmob_drm_connector_init(struct shmob_drm_device *sdev,
 
 	drm_connector_helper_add(connector, &connector_helper_funcs);
 
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret < 0) {
+		drm_connector_cleanup(connector);
+		kfree(scon);
+		return ERR_PTR(ret);
+	}
+
 	return connector;
 }
 
@@ -594,7 +601,6 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
 			       struct drm_encoder *encoder)
 {
 	struct drm_connector *connector;
-	int ret;
 
 	if (sdev->pdata)
 		connector = shmob_drm_connector_init(sdev, encoder);
@@ -606,17 +612,9 @@ int shmob_drm_connector_create(struct shmob_drm_device *sdev,
 		return PTR_ERR(connector);
 	}
 
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret < 0)
-		goto error;
-
 	connector->dpms = DRM_MODE_DPMS_OFF;
 
 	sdev->connector = connector;
 
 	return 0;
-
-error:
-	drm_connector_cleanup(connector);
-	return ret;
 }
-- 
2.53.0


