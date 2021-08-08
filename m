Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 259233E38CF
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 07:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhHHFLZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Aug 2021 01:11:25 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:8775 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbhHHFLY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Aug 2021 01:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628399445;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=r8uH9OfkPi18OfoBjC7SXOXfarBdmqieXQKH3Ejk3CE=;
    b=ZuXHOkaJZ3srsEw4SLnt85cr5eV9kcO38u7UnSDj6Ijq82GflOAJ25Mv06ZYtuugO9
    Wkp0UkScAo5DXFB7a8TLoKBdVDE3fGccVRaSHPmW0BxD16VIq+W9mwvaUo6mKNjHmQr3
    bTfjLxvqt+Y+JHlwZG8HKlobFkfiDY8uqQpPZVphjzIXsPieYYdOpLfj0V/PB26pPk14
    d7bV1GmlLAEQUoOj3ywVF3x/SaPtcTLP0qzyofzhmx6r9dDdbyRH7OLe+r4VfpCD3Iai
    kNkH8H2xIF33ZK7wfKk6m44ePcpeBDGiEWTNIDwEeaxSPBRlcAJGJ1d4XBaCKtLiud5W
    PtGA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id Q02727x785AjEyd
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 8 Aug 2021 07:10:45 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/9] drm/bridge: synopsis: Add mode_fixup and bridge timings support
Date:   Sun,  8 Aug 2021 07:10:36 +0200
Message-Id: <bcbce9569fd5a1e6892d94187ecd9a31ff6730b9.1628399442.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628399442.git.hns@goldelico.com>
References: <cover.1628399442.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Boddie <paul@boddie.org.uk>

The platform-specific configuration structure is augmented with
mode_fixup and timings members so that specialisations of the
Synopsys driver can introduce mode flags and bus flags.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 +++++++
 include/drm/bridge/dw_hdmi.h              | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index e7c7c9b9c646f..d53bc557ef4ce 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2766,6 +2766,11 @@ static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 		bridge_state->input_bus_cfg.format,
 		bridge_state->output_bus_cfg.format);
 
+	if (hdmi->plat_data->mode_fixup)
+		if (!hdmi->plat_data->mode_fixup(bridge, &crtc_state->mode,
+						 &crtc_state->adjusted_mode))
+			return -EINVAL;
+
 	return 0;
 }
 
@@ -3364,6 +3369,8 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
+	if (plat_data->timings)
+		hdmi->bridge.timings = plat_data->timings;
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 6a5716655619b..677137445d534 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -8,6 +8,7 @@
 
 #include <sound/hdmi-codec.h>
 
+struct drm_bridge;
 struct drm_display_info;
 struct drm_display_mode;
 struct drm_encoder;
@@ -140,6 +141,10 @@ struct dw_hdmi_plat_data {
 	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
 					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
+	bool (*mode_fixup)(struct drm_bridge *bridge,
+			   const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
+	const struct drm_bridge_timings *timings;
 
 	/* Vendor PHY support */
 	const struct dw_hdmi_phy_ops *phy_ops;
-- 
2.31.1

