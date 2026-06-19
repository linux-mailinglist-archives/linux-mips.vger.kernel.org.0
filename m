Return-Path: <linux-mips+bounces-15151-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wp4iCRM1NWr/ogYAu9opvQ
	(envelope-from <linux-mips+bounces-15151-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 14:24:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D006A5AB0
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 14:24:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WViAI322;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15151-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15151-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38F0A30131D6
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 12:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74C433F597;
	Fri, 19 Jun 2026 12:24:48 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720361E98EF;
	Fri, 19 Jun 2026 12:24:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871888; cv=none; b=Aon1mi5hBfK4hv7o7eE7IP9J3l2MlfQLv/XgaiFon42z4TDankbNh6pek8Ldh+6tmQomMr4XDVsfEtDD44jLhJR5Ia8AXJfcSpzFB7yqukn+3Fw3sMmTQKZodSgAV24L+KS8pkZy5gCTi9hBPCEetXv9cZ7MfDsBh1UreWzQv5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871888; c=relaxed/simple;
	bh=vL5v+k7dzjExYMQy4wUeJZIHTwb5UTblvAG+U2AaEzs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N+FuPOkeP37Q/5DCkVNb6mNbuAlclwkezmkGVY5aL9B5Tuxwq6b5wB21mKHaDL4gCh0GZjVjQe1DmuWNIJeXCvP5qeGd31HO0Cm7cQ3mmNihJ3q6rTT8vxHh+AqrFd8y8fVA8I1OxohWHz2pJLTBHFUAHamXY8vuYNz/5iTotWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WViAI322; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B751F000E9;
	Fri, 19 Jun 2026 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871887;
	bh=B05WHhjCBoRIjDtR67EQPJXf4Ssgj/DxNfy3or8+FkM=;
	h=From:Subject:Date:To:Cc;
	b=WViAI322jk7baWoNGngPCnMaotke3CZu+KrKpFFal9mQXhRb2mkJlgSjX5O2PZ9M+
	 h8OeBgQ0o/utp4shlpf17rv0f6l3YnsU8SAeGYLzyzsh9VQ/qm3GNqLH0J9ReN48N3
	 cldQv/F/Qb8DHWs0MhAji7zAeIH6y2CvAA4iPPEPzvkbuD6bXfxjFaiti3sqqbnfIN
	 D+1leWRKQf2soPbn1D+K01p1y71HsBCTR7ZwUsP93sv2aXl5uc+HLSx6HN77zEffFs
	 7DM7wcMZc0jM+lQB6FSRZUWxMFiEk17e9HsoCXwkQm7WfuTrzUBbwWYT4IarbG16fY
	 Z7saYJUrxnpBw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/78] drm/bridge: Convert all reset users to
 create_state
Date: Fri, 19 Jun 2026 14:24:05 +0200
Message-Id: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43QwW7CMAwG4FepcsaTk64lcNp7IA5tYsAaSZgTK
 hDi3ZfCYeKCdvwt+7Plm8okTFmtm5sSmjhzijW0i0a5wxD3BOxrVgZNj12L4CVATBCSEIzCvnY
 IZSrgBoO+I2OWn6jq+Elox5cHvdnWfOBcklwfmyY9V/+BThoQ7LLz1ljf6tF9fZNEOn4k2atZn
 cyf1KN9I5kq4bDSqO24s7Z/ke7Pg4V+zvUF5Xm1GodM4FIIXNbNLAfODiJdCswLAXvQqzp8/wV
 0Qh2DRwEAAA==
X-Change-ID: 20260530-drm-no-more-bridge-reset-ca20d5e22740
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, 
 Phong LE <ple@baylibre.com>, Douglas Anderson <dianders@chromium.org>, 
 Inki Dae <inki.dae@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
 linux-rockchip@lists.infradead.org, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10278; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vL5v+k7dzjExYMQy4wUeJZIHTwb5UTblvAG+U2AaEzs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJi/3JS7zVti6W8suc+e7Fa/Vj0qu7OUI3ubR/9F9v
 Uay86SrHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAid7wZG9qmpXjLBsoIFySd
 CG6KDHis8Ijj/T2eflX1/3MntG9oDrzu8vTfdw6eT4qPykQXysV8Yawz4AmxD9Jknv+RK0mh7l9
 jv9i7O2ufBVXm/fjv82ASd0pzmtyioqVe8/etvyDDYTO59ToA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15151-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,ideasonboard.com,amarulasolutions.com,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org,rock-chips.com,baylibre.com,chromium.org,samsung.com,crapouillou.net,vger.kernel.org,collabora.com,googlemail.com,glider.be,bp.renesas.com,sntech.de,foss.st.com,st-md-mailman.stormreply.com,iki.fi,raspberrypi.com,igalia.com,iscas.ac.cn,amd.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:lumag@kernel.org,m:dri-devel@lists.freedesktop.org,m:mripard@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:jagan@amarulasolutions.com,m:victor.liu@nxp.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:andy.yan@rock-chips.com,m:ple@baylibre.com,m:dianders@chromium.org,m:inki.dae@samsung.com,m:m.szyprowski@samsung.com,m:p.zabel@pengutronix.de,m:paul@crapouillou.net,m:linux-mips@vger.kernel.org,m:angelogioacchino.delregno@collabora.com,m:chunkuang.hu@kernel.org,m:matthias.bgg@gmail.com,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:khilman@baylibre.c
 om,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kieran.bingham+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:heiko@sntech.de,m:hjc@rock-chips.com,m:linux-rockchip@lists.infradead.org,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:zhengxingda@iscas.ac.cn,m:laurent.pinchart@ideasonboard.com,m:michal.simek@amd.com,m:jernejskrabec@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71D006A5AB0

Hi, 

All the bridges use reset to create a blank state only and don't use it
to reset the hardware at all. This is what the new atomic_create_state
is exactly supposed to be doing, so we can convert all existing bridge
users to it, and remove the reset hook and helpers.

Let me know what you think,
Maxime 

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v3:
- Rebase on current drm-misc-next
- Link to v2: https://lore.kernel.org/r/20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org

Changes in v2:
- Split the return value fix for cadence bridges into their own patches
- Fix bisection
- Collect tags
- Link to v1: https://lore.kernel.org/r/20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org

---
Maxime Ripard (78):
      drm/bridge: cdns-dsi: Return an error pointer on allocation failure
      drm/bridge: cdns-mhdp8546: Return an error pointer on allocation failure
      drm/atomic-state-helper: Rename __drm_atomic_helper_bridge_reset()
      drm/atomic-state-helper: Reorder __drm_atomic_helper_bridge_state_init() arguments
      drm/atomic-state-helper: Drop memset from __drm_atomic_helper_bridge_state_init()
      drm/bridge: Add new atomic_create_state callback
      drm/atomic-state-helper: Add drm_atomic_helper_bridge_create_state()
      drm/bridge: adv7511: Switch to atomic_create_state
      drm/bridge: analogix_dp: Switch to atomic_create_state
      drm/bridge: anx7625: Switch to atomic_create_state
      drm/bridge: chipone-icn6211: Switch to atomic_create_state
      drm/bridge: display-connector: Switch to atomic_create_state
      drm/bridge: fsl-ldb: Switch to atomic_create_state
      drm/bridge: imx8mp-hdmi-pvi: Switch to atomic_create_state
      drm/bridge: imx8qm-ldb: Switch to atomic_create_state
      drm/bridge: imx8qxp-ldb: Switch to atomic_create_state
      drm/bridge: imx8qxp-pixel-combiner: Switch to atomic_create_state
      drm/bridge: imx8qxp-pixel-link: Switch to atomic_create_state
      drm/bridge: imx8qxp-pxl2dpi: Switch to atomic_create_state
      drm/bridge: inno-hdmi: Switch to atomic_create_state
      drm/bridge: ite-it6263: Switch to atomic_create_state
      drm/bridge: ite-it6505: Switch to atomic_create_state
      drm/bridge: ite-it66121: Switch to atomic_create_state
      drm/bridge: lontium-lt9211: Switch to atomic_create_state
      drm/bridge: lontium-lt9611: Switch to atomic_create_state
      drm/bridge: lvds-codec: Switch to atomic_create_state
      drm/bridge: nwl-dsi: Switch to atomic_create_state
      drm/bridge: panel: Switch to atomic_create_state
      drm/bridge: parade-ps8640: Switch to atomic_create_state
      drm/bridge: samsung-dsim: Switch to atomic_create_state
      drm/bridge: sii902x: Switch to atomic_create_state
      drm/bridge: ssd2825: Switch to atomic_create_state
      drm/bridge: dw-dp: Switch to atomic_create_state
      drm/bridge: dw-hdmi-qp: Switch to atomic_create_state
      drm/bridge: dw-hdmi: Switch to atomic_create_state
      drm/bridge: dw-mipi-dsi: Switch to atomic_create_state
      drm/bridge: dw-mipi-dsi2: Switch to atomic_create_state
      drm/bridge: tc358762: Switch to atomic_create_state
      drm/bridge: tc358767: Switch to atomic_create_state
      drm/bridge: tc358768: Switch to atomic_create_state
      drm/bridge: tc358775: Switch to atomic_create_state
      drm/bridge: ti-dlpc3433: Switch to atomic_create_state
      drm/bridge: ti-sn65dsi83: Switch to atomic_create_state
      drm/bridge: ti-sn65dsi86: Switch to atomic_create_state
      drm/bridge: ti-tdp158: Switch to atomic_create_state
      drm/bridge: ti-tfp410: Switch to atomic_create_state
      drm/imx: parallel-display: Switch to atomic_create_state
      drm/ingenic: Switch to atomic_create_state
      drm/mediatek: dp: Switch to atomic_create_state
      drm/mediatek: dpi: Switch to atomic_create_state
      drm/mediatek: dsi: Switch to atomic_create_state
      drm/mediatek: hdmi: Switch to atomic_create_state
      drm/mediatek: hdmi_v2: Switch to atomic_create_state
      drm/meson: encoder_cvbs: Switch to atomic_create_state
      drm/meson: encoder_dsi: Switch to atomic_create_state
      drm/meson: encoder_hdmi: Switch to atomic_create_state
      drm/msm: dp: Switch to atomic_create_state
      drm/msm: hdmi: Switch to atomic_create_state
      drm/omap: hdmi4: Switch to atomic_create_state
      drm/omap: hdmi5: Switch to atomic_create_state
      drm/renesas: rcar-du: lvds: Switch to atomic_create_state
      drm/renesas: rcar-du: mipi_dsi: Switch to atomic_create_state
      drm/renesas: rz-du: mipi_dsi: Switch to atomic_create_state
      drm/rockchip: cdn-dp: Switch to atomic_create_state
      drm/rockchip: rk3066_hdmi: Switch to atomic_create_state
      drm/rockchip: lvds: Switch to atomic_create_state
      drm/stm: lvds: Switch to atomic_create_state
      drm/tests: bridge: Switch to atomic_create_state
      drm/tidss: encoder: Switch to atomic_create_state
      drm/tidss: oldi: Switch to atomic_create_state
      drm/vc4: dsi: Switch to atomic_create_state
      drm/verisilicon: Switch to atomic_create_state
      drm/xlnx: zynqmp_dp: Switch to atomic_create_state
      drm/atomic-state-helper: Remove drm_atomic_helper_bridge_reset()
      drm/bridge: cdns-dsi: Use __drm_atomic_helper_bridge_state_init()
      drm/bridge: cdns-dsi: Switch to atomic_create_state
      drm/bridge: cdns-mhdp8546: Switch to atomic_create_state
      drm/bridge: Remove atomic_reset support

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  9 +++--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  8 ++---
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  2 +-
 drivers/gpu/drm/bridge/display-connector.c         |  2 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  2 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  2 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  2 +-
 drivers/gpu/drm/bridge/inno-hdmi.c                 |  2 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |  2 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  2 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |  2 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |  2 +-
 drivers/gpu/drm/bridge/panel.c                     |  2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |  2 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |  2 +-
 drivers/gpu/drm/bridge/sii902x.c                   |  2 +-
 drivers/gpu/drm/bridge/ssd2825.c                   |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  2 +-
 drivers/gpu/drm/bridge/tc358762.c                  |  2 +-
 drivers/gpu/drm/bridge/tc358767.c                  |  4 +--
 drivers/gpu/drm/bridge/tc358768.c                  |  2 +-
 drivers/gpu/drm/bridge/tc358775.c                  |  2 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  2 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |  2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  2 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          | 40 ++++++++++++----------
 drivers/gpu/drm/drm_bridge.c                       |  4 +--
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |  2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  2 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |  2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  4 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |  2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |  2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |  2 +-
 drivers/gpu/drm/stm/lvds.c                         |  2 +-
 drivers/gpu/drm/tests/drm_bridge_test.c            |  6 ++--
 drivers/gpu/drm/tidss/tidss_encoder.c              |  2 +-
 drivers/gpu/drm/tidss/tidss_oldi.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c            |  4 +--
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  2 +-
 include/drm/drm_atomic_state_helper.h              |  6 ++--
 include/drm/drm_bridge.h                           | 33 ++++++------------
 72 files changed, 117 insertions(+), 125 deletions(-)
---
base-commit: 4c85094a73431c26d5774aa74e422fc6bb94a7d5
change-id: 20260530-drm-no-more-bridge-reset-ca20d5e22740

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


