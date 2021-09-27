Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E023941997A
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 18:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbhI0Qq3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 12:46:29 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.124]:25868 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235594AbhI0Qq1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 12:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632761074;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=W8bGAE+jGiWF/qdrJhsGdafReGpU/Gom2sh3Sv962rM=;
    b=YLe/E5D+W4Ia7b6RAebVdiO8ZE2pUBgdHa6lvJ9gtlBNlPVEH2EIu01iEi7TTueIb7
    Av7qkqwQz9SqInLpPvYzH7CqgQiwHg59wdwoHYkPvm6zc4VWNCzudpH75OGJ26Puq4Is
    D1dg9iX09YYrDnpxYfTl44yWaMkurHEzIaH9VuBICy782fJsu6TIlGDHesytxpv/ma6R
    9HnWNEWRnJ2wXMAF84/SMFDucfkmJahOfJdgtIKMRDjdtbeo9ryltB9eA+gKePIKcaeU
    t7ONopCM/2CzuZvCosuTjHSfdxUlUJJIvSv5Mtq1s0Fd9GLXol1Y7D3MB/WpOvIEC8uc
    uhvQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDFrDb4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id I01f74x8RGiXavE
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
Subject: [PATCH v4 05/10] drm/bridge: synopsis: Fix to properly handle HPD
Date:   Mon, 27 Sep 2021 18:44:23 +0200
Message-Id: <dd2356790b774c7885afecc9d29783cb51a26e6d.1632761068.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632761067.git.hns@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It appears that dw-hdmi plugin detection is not properly
propagated unless we call drm_kms_helper_hotplug_event().

Maybe drm_bridge_hpd_notify should have been setup to
call this.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index f082e14320e1..edea04f80576 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3018,6 +3018,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 		if (hdmi->bridge.dev) {
 			drm_helper_hpd_irq_event(hdmi->bridge.dev);
 			drm_bridge_hpd_notify(&hdmi->bridge, status);
+
+			drm_kms_helper_hotplug_event(hdmi->bridge.dev);
 		}
 	}
 
-- 
2.31.1

