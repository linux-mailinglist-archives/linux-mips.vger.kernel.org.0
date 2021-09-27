Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38D4419976
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 18:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbhI0Qq1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 12:46:27 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:20521 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbhI0Qq0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 12:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632761071;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=LU4lfColDeP7+GT2wUXoyBAWybalNrAF4K5LeFlXp4c=;
    b=kBi+WQR8VqF+GI9q2dvWTjLG0WgtiFJCz1RHry6FXqqjzlgPCJErG2x4VnBGd9vaYT
    bekXg3H6G41LV2h0dFdab/salHMv4HtdGGRztlLvTFATk/5Bg9P0MwghweiBqKy4+R+j
    yXSlQwUVgbyZsMfrsMwmKc+Iemuwq6tdUK5njvZ7zOWv7pKdwA/BMCyfap4v75qAK/AS
    /semqM+5DIZgBFYarbzwbyy5SkOnaIVSJ+/tQR7cTuaMj/akm8AAAnPAFXsc6DcD1haj
    eP2zG8ludyYVHp+tGAnLEJHadiIiKZ0fvdXcH9pqkH+HzX5Kv+4o5GR55AZTA9F7+we7
    zkwg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDFrDb4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id I01f74x8RGiUav9
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 27 Sep 2021 18:44:30 +0200 (CEST)
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
Subject: [PATCH v4 01/10] drm/ingenic: Fix drm_init error path if IPU was registered
Date:   Mon, 27 Sep 2021 18:44:19 +0200
Message-Id: <7b6132aa8319a28e83068d0fbe0bfe3d8b69cf2a.1632761067.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632761067.git.hns@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Boddie <paul@boddie.org.uk>

If ingenic drm driver can not be registered, the IPU driver won't be
deregistered.

Code structure is chosen in preparation to add hdmi unregistration
in error case following the same pattern by a later patch.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 35b61657d9f6..f73522bdacaa 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1498,7 +1498,16 @@ static int ingenic_drm_init(void)
 			return err;
 	}
 
-	return platform_driver_register(&ingenic_drm_driver);
+	err = platform_driver_register(&ingenic_drm_driver);
+	if (err)
+		goto err_ipu_unreg;
+
+	return 0;
+
+err_ipu_unreg:
+	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
+		platform_driver_unregister(ingenic_ipu_driver_ptr);
+	return err;
 }
 module_init(ingenic_drm_init);
 
-- 
2.31.1

