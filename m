Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC3C45CEEC
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 22:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343673AbhKXVcg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Nov 2021 16:32:36 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.102]:14063 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbhKXVcg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Nov 2021 16:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637789357;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=CDnhZE/bCmY+sU+9kBR2+/QdGVAtCkJSkm9JjrgStzg=;
    b=fuma3x8fG2syRP/1CXz2QsA4qT+Kcm5bcgmrqoT6FT8VtO6gUh2OUZLcsFMna0XNG5
    scHLI9EW5PPX+c9p8yhkSi4fcsMYb9676mDDyH3BOJTCH5LWeOYfAkUiHBVlpP3uwyWQ
    JUANIUwDq88cyw7alHqBLmUOLZyI/bBS8eWz6+fz484O9TNv6vS/94rm/TKfc59PfEZH
    YDfPYJwdViEM4VKHU86811xNn4NaoUkyCAfr4mw752WSHP2FdpeA98/gRCaUvrl+fJjZ
    EN3zk8ax1VKDPT9zVf0H2qtvY7B3DO4WlxBFUAN2TQ/1whOjzO7BA2daXoS5GgdfEb5J
    yYTw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDRsZQ=="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
    with ESMTPSA id e05ed8xAOLTG5Aq
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 24 Nov 2021 22:29:16 +0100 (CET)
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
Subject: [PATCH v9 1/8] drm/ingenic: prepare ingenic drm for later addition of JZ4780
Date:   Wed, 24 Nov 2021 22:29:07 +0100
Message-Id: <de5ed6a7225e17b0d978a5211052346123b0532b.1637789354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1637789354.git.hns@goldelico.com>
References: <cover.1637789354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This changes the way the regmap is allocated to prepare for the
later addition of the JZ4780 which has more registers and bits
than the others.

Therefore we make the regmap as big as the reg property in
the device tree tells.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 462bc0f35f1bf..0bb590c3910d9 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -173,7 +173,6 @@ static const struct regmap_config ingenic_drm_regmap_config = {
 	.val_bits = 32,
 	.reg_stride = 4,
 
-	.max_register = JZ_REG_LCD_SIZE1,
 	.writeable_reg = ingenic_drm_writeable_reg,
 };
 
@@ -1011,6 +1010,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	struct ingenic_drm_bridge *ib;
 	struct drm_device *drm;
 	void __iomem *base;
+	struct resource *res;
+	struct regmap_config regmap_config;
 	long parent_rate;
 	unsigned int i, clone_mask = 0;
 	int ret, irq;
@@ -1056,14 +1057,16 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	drm->mode_config.funcs = &ingenic_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &ingenic_drm_mode_config_helpers;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base)) {
 		dev_err(dev, "Failed to get memory resource\n");
 		return PTR_ERR(base);
 	}
 
+	regmap_config = ingenic_drm_regmap_config;
+	regmap_config.max_register = res->end - res->start;
 	priv->map = devm_regmap_init_mmio(dev, base,
-					  &ingenic_drm_regmap_config);
+					  &regmap_config);
 	if (IS_ERR(priv->map)) {
 		dev_err(dev, "Failed to create regmap\n");
 		return PTR_ERR(priv->map);
-- 
2.33.0

