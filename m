Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C037545AB1D
	for <lists+linux-mips@lfdr.de>; Tue, 23 Nov 2021 19:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239843AbhKWSRX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Nov 2021 13:17:23 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.123]:26590 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239798AbhKWSRV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Nov 2021 13:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637691247;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mgm9FcGOkzWufyh28STSVM1vIR8mFSf+dMssEkkvORM=;
    b=nj8Cls6KtZsyzSDmpckN7X6MjC2D67HipjRBKc9uGXOq7F1tbCS9xwwzbtIUBHu8QP
    Ayd88r1yrU9DFZDDXhB39zbGoGPeI/aN4rdaGRifdnpd2bnWQxLHsWw31hlVLLy1yalX
    j0Qi5oxf4ThAryWob/UQJHljUAA6zNSr5U6lWNeTI+Akwg+bUk6yfn44umSIetjD+KZq
    kNw44QrjCwwn0xz9uZ+4WR3g642NG6Fswf8DqLgL0kyW/0jp8KuuNNiQ66d4kOccTDkE
    WQcSh1UWtYqjtgwYP7lPxKYHrjqByDg19LaYlUe/1Qm43yrB/Uvw1gz+qc78kUNiCcoc
    UAiw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.6 DYNA|AUTH)
    with ESMTPSA id g09b5fxANIE67md
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 23 Nov 2021 19:14:06 +0100 (CET)
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
Subject: [PATCH v8 7/8] MIPS: defconfig: CI20: configure for DRM_DW_HDMI_JZ4780
Date:   Tue, 23 Nov 2021 19:14:00 +0100
Message-Id: <49ffa769bfb0fbac22202af2e133f00dc7fb2371.1637691240.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1637691240.git.hns@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
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

