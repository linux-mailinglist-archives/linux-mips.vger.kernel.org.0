Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E604F680D
	for <lists+linux-mips@lfdr.de>; Wed,  6 Apr 2022 19:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239314AbiDFRob (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Apr 2022 13:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239521AbiDFRoH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Apr 2022 13:44:07 -0400
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6C111409D;
        Wed,  6 Apr 2022 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649262374;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=iZmJQU4w0loEJYUzL+duhnqemsckspj5xYLJuUIpWSY=;
    b=qHqDmUV+j/Sq5TxP/VqDgpS5xjh63cqKxuPUR58be0RRo6utMc8FwbdFcjTHvXkAy2
    bKMFMXG4FTIKmydbMdGCGmfroFSYBLW031PuV+lVV0WKbUtQUY954G8RWK8KIR6I+meb
    lgJF1AMsHEQXlzzWl2DXgP7/+GJdHe5xJOxaqIJqidJD6fNZurF2sK0O39us/x83KpR5
    oCvP0AO4ZTecg5tUiAddZiJd6D1ErWwUOXrNKLlNvi2Hs0LH4m44it6p+7c/ajtp8vL3
    Q84lGibkidslprwtZIO0ybKHG53FLSI5urwdK8vDCcxEp336hCmZuqN8/7QlgbAvHQjz
    Jgtw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVbgcbPa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
    with ESMTPSA id k708cfy36GQDgVQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 6 Apr 2022 18:26:13 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Paul Cercueil <paul@crapouillou.net>,
        Maxime Ripard <maxime@cerno.tech>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: [PATCH v17 4/6] drm/bridge: dw-hdmi: handle unusable or non-configured CSC module
Date:   Wed,  6 Apr 2022 18:26:06 +0200
Message-Id: <8de76ca2b478016f4dbed84e37db231e7810e56c.1649262368.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1649262368.git.hns@goldelico.com>
References: <cover.1649262368.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Neil Armstrong <narmstrong@baylibre.com>

The dw-hdmi integrates an optional Color Space Conversion feature used
to handle color-space conversions.

On some platforms, the CSC isn't built-in or non-functional.

This adds the necessary code to disable the CSC functionality
and limit the bus format negotiation to force using the same
input bus format as the output bus format.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 100 +++++++++++++++-------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |   1 +
 include/drm/bridge/dw_hdmi.h              |   1 +
 3 files changed, 71 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index f50af40e10340..b5a665c5e406e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -158,6 +158,8 @@ struct dw_hdmi {
 	struct hdmi_data_info hdmi_data;
 	const struct dw_hdmi_plat_data *plat_data;
 
+	bool csc_available;		/* indicates if the CSC engine is usable */
+
 	int vic;
 
 	u8 edid[HDMI_EDID_LEN];
@@ -1009,9 +1011,10 @@ static int is_color_space_interpolation(struct dw_hdmi *hdmi)
 
 static bool is_csc_needed(struct dw_hdmi *hdmi)
 {
-	return is_color_space_conversion(hdmi) ||
-	       is_color_space_decimation(hdmi) ||
-	       is_color_space_interpolation(hdmi);
+	return hdmi->csc_available &&
+	       (is_color_space_conversion(hdmi) ||
+		is_color_space_decimation(hdmi) ||
+		is_color_space_interpolation(hdmi));
 }
 
 static void dw_hdmi_update_csc_coeffs(struct dw_hdmi *hdmi)
@@ -1064,6 +1067,9 @@ static void hdmi_video_csc(struct dw_hdmi *hdmi)
 	int interpolation = HDMI_CSC_CFG_INTMODE_DISABLE;
 	int decimation = 0;
 
+	if (!hdmi->csc_available)
+		return;
+
 	/* YCC422 interpolation to 444 mode */
 	if (is_color_space_interpolation(hdmi))
 		interpolation = HDMI_CSC_CFG_INTMODE_CHROMA_INT_FORMULA1;
@@ -2665,6 +2671,7 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 					u32 output_fmt,
 					unsigned int *num_input_fmts)
 {
+	struct dw_hdmi *hdmi = bridge->driver_private;
 	u32 *input_fmts;
 	unsigned int i = 0;
 
@@ -2683,62 +2690,81 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	/* 8bit */
 	case MEDIA_BUS_FMT_RGB888_1X24:
 		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		}
 		break;
 	case MEDIA_BUS_FMT_YUV8_1X24:
 		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		}
 		break;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+		}
 		break;
 
 	/* 10bit */
 	case MEDIA_BUS_FMT_RGB101010_1X30:
 		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		}
 		break;
 	case MEDIA_BUS_FMT_YUV10_1X30:
 		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		}
 		break;
 	case MEDIA_BUS_FMT_UYVY10_1X20:
 		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		}
 		break;
 
 	/* 12bit */
 	case MEDIA_BUS_FMT_RGB121212_1X36:
 		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		}
 		break;
 	case MEDIA_BUS_FMT_YUV12_1X36:
 		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
-		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		}
 		break;
 	case MEDIA_BUS_FMT_UYVY12_1X24:
 		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		if (hdmi->csc_available) {
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
+			input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		}
 		break;
 
 	/* 16bit */
 	case MEDIA_BUS_FMT_RGB161616_1X48:
 		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
+		if (hdmi->csc_available)
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
 		break;
 	case MEDIA_BUS_FMT_YUV16_1X48:
-		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
-		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
+		if (hdmi->csc_available)
+			input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
 		break;
 
 	/*YUV 4:2:0 */
@@ -2767,15 +2793,24 @@ static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
-	hdmi->hdmi_data.enc_out_bus_format =
-			bridge_state->output_bus_cfg.format;
+	if (!hdmi->csc_available &&
+	    bridge_state->output_bus_cfg.format != bridge_state->input_bus_cfg.format) {
+		dev_warn(hdmi->dev, "different input format 0x%04x & output format 0x%04x while CSC isn't usable, fallback to safe format\n",
+			 bridge_state->input_bus_cfg.format,
+			 bridge_state->output_bus_cfg.format);
+		hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_FIXED;
+		hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_FIXED;
+	} else {
+		hdmi->hdmi_data.enc_out_bus_format =
+				bridge_state->output_bus_cfg.format;
 
-	hdmi->hdmi_data.enc_in_bus_format =
-			bridge_state->input_bus_cfg.format;
+		hdmi->hdmi_data.enc_in_bus_format =
+				bridge_state->input_bus_cfg.format;
 
-	dev_dbg(hdmi->dev, "input format 0x%04x, output format 0x%04x\n",
-		bridge_state->input_bus_cfg.format,
-		bridge_state->output_bus_cfg.format);
+		dev_dbg(hdmi->dev, "input format 0x%04x, output format 0x%04x\n",
+			bridge_state->input_bus_cfg.format,
+			bridge_state->output_bus_cfg.format);
+	}
 
 	return 0;
 }
@@ -3481,6 +3516,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->cec = platform_device_register_full(&pdevinfo);
 	}
 
+	/* Get CSC useability from config0 register and permit override for platforms */
+	hdmi->csc_available = !plat_data->disable_csc || (config0 & HDMI_CONFIG0_CSC);
+
 	drm_bridge_add(&hdmi->bridge);
 
 	return hdmi;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index 1999db05bc3b2..279722e4d1898 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -541,6 +541,7 @@ enum {
 
 /* CONFIG0_ID field values */
 	HDMI_CONFIG0_I2S = 0x10,
+	HDMI_CONFIG0_CSC = 0x04,
 	HDMI_CONFIG0_CEC = 0x02,
 
 /* CONFIG1_ID field values */
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 2a1f85f9a8a3f..b2f689cbe864c 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -157,6 +157,7 @@ struct dw_hdmi_plat_data {
 			     unsigned long mpixelclock);
 
 	unsigned int disable_cec : 1;
+	unsigned int disable_csc : 1;
 };
 
 struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
-- 
2.33.0

