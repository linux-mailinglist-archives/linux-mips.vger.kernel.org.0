Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DFD4A75F0
	for <lists+linux-mips@lfdr.de>; Wed,  2 Feb 2022 17:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345914AbiBBQb7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Feb 2022 11:31:59 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.123]:44593 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237418AbiBBQbt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Feb 2022 11:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643819489;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Qc45+SOWiHQsSwqJWHKd4NUWcMBcTy0RmkvrlEWuGrE=;
    b=pBetLco65hVt+08W2NqB0xRi4WakKaeXaOm5ixtZjgDSVmoLBiSnErJ2PYjjFyi0wQ
    /eZzJUGfv6bcPrX1GxS3+4KOWKJTj6aMuOojVenbtx07coGLWZPDBJFMshmFAOF44fVg
    pyLsRoQEZJDnhv2dkjPkdOej1iZLzqpUIywtr7/rqVs0oo8TB1W0K70T8geJC/QHRt4M
    AoQGXeSmjuAW6FT+NAYQQSCNrTxAyQaVu883NTmM+ZNfzQ/2H0WUGbfFdZRg3AX6vuhm
    h/C2X7xLtlclxkAWj+9th0/79cVLH/wC/IsGGlW2rOo1MLk7CS/qQupIS6St0hEniVKR
    QAIQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVbjc9Y="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
    with ESMTPSA id L29417y12GVTBmr
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 2 Feb 2022 17:31:29 +0100 (CET)
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
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v13 6/9] dw-hdmi/ingenic-dw-hdmi: repair interworking with hdmi-connector
Date:   Wed,  2 Feb 2022 17:31:20 +0100
Message-Id: <866f84621974992f4831bd471ae5a53414de9255.1643819482.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1643819482.git.hns@goldelico.com>
References: <cover.1643819482.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")

introduced a new mechanism to negotiate bus formats between hdmi connector
and the synopsys hdmi driver inside the jz4780.

By this, the dw-hdmi is no longer the only bridge and sets up a list
of formats in dw_hdmi_bridge_atomic_get_output_bus_fmts().

This includes MEDIA_BUS_FMT_UYVY8_1X16 which is chosen for the jz4780 but only
produces a black screen.

This fix is based on the observation that max_bpc = 0 when running this
function while info->bpc = 8. Since the formats checks before this always test
for max_bpc >= info->pbc indirectly my assumption is that we must check it
here as well.

Adding the proposed patch makes the CI20/jz4780 panel work again in
MEDIA_BUS_FMT_RGB888_1X24 mode.

Fixes: 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 52e7cd2e020d3..34703a15ee4ff 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2620,10 +2620,10 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
 	}
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+	if (max_bpc >= info->bpc && info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
 		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+	if (max_bpc >= info->bpc && info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 
 	/* Default 8bit RGB fallback */
-- 
2.33.0

