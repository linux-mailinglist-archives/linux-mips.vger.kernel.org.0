Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409BF45CF01
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 22:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343978AbhKXVcw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Nov 2021 16:32:52 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:9001 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344088AbhKXVcp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Nov 2021 16:32:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637789361;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mgm9FcGOkzWufyh28STSVM1vIR8mFSf+dMssEkkvORM=;
    b=JSjxL52ofxgmBkjCHyaks5JrPO3dC54eXSMDfTEO5kC/ryIRb04BbjJHN4bGZ9+WUu
    vlnMueZVvZihZr4BFlMte8Xu/9975TRRil/xKfNUchen9TrUprJlKDeXO/nlEQQ+xeMv
    p2V9/BJ6FtJFr5mmVX9Y3FBRaw9HAXmU06ttsqkS3sKzgcotu/VT3dzCBSlzj8YYmqcA
    vDXqC5QaZQBLV7I2CwrSvTZAR4i0Cq7mZyUTzQXbZVBsoDcKpXJejQDqdkmRPZ4h7ixV
    oM9q2urzm74Ca++y54MYIVD79PtzqRTEvFQkvh6Y7zq6FgZkS4rfqUshVK3GJDBsLelB
    akDQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDRsZQ=="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
    with ESMTPSA id e05ed8xAOLTK5Ax
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 24 Nov 2021 22:29:20 +0100 (CET)
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
Subject: [PATCH v9 7/8] MIPS: defconfig: CI20: configure for DRM_DW_HDMI_JZ4780
Date:   Wed, 24 Nov 2021 22:29:13 +0100
Message-Id: <4569d54265134bf5e53cc5db6da6b2944b73861f.1637789354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1637789354.git.hns@goldelico.com>
References: <cover.1637789354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Enable CONFIG options as modules.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index ab7ebb0668340..cc69b215854ea 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -98,7 +98,13 @@ CONFIG_RC_DEVICES=y
 CONFIG_IR_GPIO_CIR=m
 CONFIG_IR_GPIO_TX=m
 CONFIG_MEDIA_SUPPORT=m
+CONFIG_DRM=m
+CONFIG_DRM_INGENIC=m
+CONFIG_DRM_INGENIC_DW_HDMI=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 # CONFIG_VGA_CONSOLE is not set
+CONFIG_FB=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
 # CONFIG_HID is not set
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
-- 
2.33.0

