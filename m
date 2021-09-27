Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99FE419978
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 18:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235631AbhI0Qq2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 12:46:28 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.102]:19969 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235500AbhI0Qq0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 12:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632761073;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=BCIaFfyAqCtZh0wUyZSMO+rmEFnD5zeAfuhAAioFjEA=;
    b=QYxYvONUUyMF3zywlECKzqm0lgWlkZSromxFEHFC3JXgu7YGI2yXekuY1/BnDM0L78
    5q9fmo16fG0qhS23Ja1k26oofHYbFtigjzbpGSlpXckTStmN0X/tZCLvx5DHTBAf1YTv
    sKLUHvDqfd8PZDaR60egrO5zVaylQAlhfryvlNB5O9qk0+Yv3rTnvVYjME4E97z7hdwX
    TZqtTAOed/3MtfM8bXdJTjNtox1EmxnoqupjFEAzvvc+zZElV+XfXrvfe7h/VSmN/9Gh
    WyCnIIDuyC7A2EwQaaWjIvEt6YUfwEa0G38xU5fVRcRz/LbNb2U8WKunnU6dkCM4wC/f
    rtQw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDFrDb4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id I01f74x8RGiXavC
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 27 Sep 2021 18:44:33 +0200 (CEST)
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
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/10] drm/bridge: synopsis: Add mode_fixup and bridge timings support
Date:   Mon, 27 Sep 2021 18:44:22 +0200
Message-Id: <f9709b4483d68ebfa12077b6500970763ba32570.1632761067.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632761067.git.hns@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
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
index f08d0fded61f..f082e14320e1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2767,6 +2767,11 @@ static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 		bridge_state->input_bus_cfg.format,
 		bridge_state->output_bus_cfg.format);
 
+	if (hdmi->plat_data->mode_fixup)
+		if (!hdmi->plat_data->mode_fixup(bridge, &crtc_state->mode,
+						 &crtc_state->adjusted_mode))
+			return -EINVAL;
+
 	return 0;
 }
 
@@ -3416,6 +3421,8 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
+	if (plat_data->timings)
+		hdmi->bridge.timings = plat_data->timings;
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 2a1f85f9a8a3..743038200044 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -8,6 +8,7 @@
 
 #include <sound/hdmi-codec.h>
 
+struct drm_bridge;
 struct drm_display_info;
 struct drm_display_mode;
 struct drm_encoder;
@@ -142,6 +143,10 @@ struct dw_hdmi_plat_data {
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

