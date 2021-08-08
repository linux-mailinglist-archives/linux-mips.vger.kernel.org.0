Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54A83E38E7
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 07:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhHHFLg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Aug 2021 01:11:36 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.177]:13929 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhHHFL1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Aug 2021 01:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628399450;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=AgNhKnnrM28zue4mAUQn3VQlXQfVMSZE6+Kj8AD2hck=;
    b=paUoKBoTD+FnyOT6CdORWc51RHSRQjKeW3qR+eKbCchtmlj8HFs74GpMvt+j5qYTMi
    05kutkVU+SuDO6tSEbW15Tcb9KroPve7+Qv2piDev6l7wXUBPnTvFQAcLMTWdY8nvqNh
    PJUiXEsMui/FlWS95bjZkWfkY0cS595qqao+u4OAegUQdqNUvfy50hTs7Ax7nSt9wIQf
    NzifeEGG7XbM29Xhi66QjK5ttNnf95U/A45VH2/1orplGBZGK15hUP43T7VXY6Tse8FQ
    WCRB0XQiou+mduAPe+qnmRWko8uWeWo9Y0a7JSCvKpzHDjiOjlg7jAo8hQizkLtBDgcn
    zqiQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id Q02727x785AnEyk
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 8 Aug 2021 07:10:49 +0200 (CEST)
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
Subject: [PATCH v3 9/9] drm/ingenic: add some jz4780 specific features
Date:   Sun,  8 Aug 2021 07:10:43 +0200
Message-Id: <aebcc6c5340f755268af268725939b1e59a83472.1628399442.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628399442.git.hns@goldelico.com>
References: <cover.1628399442.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Boddie <paul@boddie.org.uk>

The jz4780 has some features which need initialization
according to the vendor kernel.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 33ce3794aa126..f3b1b10bc079b 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -69,6 +69,10 @@ struct jz_soc_info {
 	bool needs_dev_clk;
 	bool has_osd;
 	bool map_noncoherent;
+	bool has_alpha;
+	bool has_pcfg;
+	bool has_recover;
+	bool has_rgbc;
 	bool use_extended_hwdesc;
 	unsigned int hwdesc_size;
 	unsigned int max_width, max_height;
@@ -671,6 +675,9 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
 	}
 
+	if (priv->soc_info->has_recover)
+		cfg |= JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN;
+
 	/* set use of the 8-word descriptor and OSD foreground usage. */
 	if (priv->soc_info->use_extended_hwdesc)
 		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
@@ -1208,6 +1215,25 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	if (soc_info->has_osd)
 		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
 
+	if (soc_info->has_alpha)
+		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_ALPHAEN);
+
+	/* Magic values from the vendor kernel for the priority thresholds. */
+	if (soc_info->has_pcfg)
+		regmap_write(priv->map, JZ_REG_LCD_PCFG,
+			     JZ_LCD_PCFG_PRI_MODE |
+			     JZ_LCD_PCFG_HP_BST_16 |
+			     (511 << JZ_LCD_PCFG_THRESHOLD2_OFFSET) |
+			     (400 << JZ_LCD_PCFG_THRESHOLD1_OFFSET) |
+			     (256 << JZ_LCD_PCFG_THRESHOLD0_OFFSET));
+
+	/* RGB output control may be superfluous. */
+	if (soc_info->has_rgbc)
+		regmap_write(priv->map, JZ_REG_LCD_RGBC,
+			     JZ_LCD_RGBC_RGB_FORMAT_ENABLE |
+			     JZ_LCD_RGBC_ODD_RGB |
+			     JZ_LCD_RGBC_EVEN_RGB);
+
 	mutex_init(&priv->clk_mutex);
 	priv->clock_nb.notifier_call = ingenic_drm_update_pixclk;
 
@@ -1355,6 +1381,9 @@ static const struct jz_soc_info jz4740_soc_info = {
 	.needs_dev_clk = true,
 	.has_osd = false,
 	.map_noncoherent = false,
+	.has_pcfg = false,
+	.has_recover = false,
+	.has_rgbc = false,
 	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
 	.max_width = 800,
 	.max_height = 600,
@@ -1368,6 +1397,9 @@ static const struct jz_soc_info jz4725b_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
 	.map_noncoherent = false,
+	.has_pcfg = false,
+	.has_recover = false,
+	.has_rgbc = false,
 	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
 	.max_width = 800,
 	.max_height = 600,
@@ -1382,6 +1414,9 @@ static const struct jz_soc_info jz4770_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
 	.map_noncoherent = true,
+	.has_pcfg = false,
+	.has_recover = false,
+	.has_rgbc = false,
 	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
 	.max_width = 1280,
 	.max_height = 720,
@@ -1395,6 +1430,10 @@ static const struct jz_soc_info jz4770_soc_info = {
 static const struct jz_soc_info jz4780_soc_info = {
 	.needs_dev_clk = true,
 	.has_osd = true,
+	.has_alpha = true,
+	.has_pcfg = true,
+	.has_recover = true,
+	.has_rgbc = true,
 	.use_extended_hwdesc = true,
 	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc_ext),
 	.max_width = 4096,
-- 
2.31.1

