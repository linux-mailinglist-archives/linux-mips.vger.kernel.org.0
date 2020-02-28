Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64105173F67
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 19:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgB1SUH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 13:20:07 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:22581 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbgB1STo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 13:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582913982;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=D9agM20QrRnArSvglyPOXZXFB+hoe3Um3HfIIm8nM7k=;
        b=RLu388FEe/6AuWjJ/h0QmlGRsCSREwEfm8y+Y5gXiqLZDRyEIVVsuAbTEoMExSI/RU
        2nEvwFLr8+meWVhDw+TUfXGPbzeLQW7MfX+AuWTMcpWEzY7ZLohWsOLOKsllbOL7lnyq
        Z8nJsNt43T7ALss9a6QdCqaLm9PH9bRSXUzsHIsp8b+kt1ZORm/v+B//JXs3dUULZXBS
        PQsC/frBQp+h3IEKwksRcbWl4pkLOqCh98OgM0k5fqOYUacm6yX1um77JLM04qfRPol1
        4hCC+DWytqht677UhO1NI1+Y1Nh0x10sW8smfFynH95zpVpwgRWXex47LIbUFrSkxlk0
        hYQg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SIJe2Lu
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 19:19:40 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [RFC v2 8/8] MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780
Date:   Fri, 28 Feb 2020 19:19:33 +0100
Message-Id: <0565a55f0cbd96934dcb3bef8f16654b3a39c027.1582913973.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We configure them as loadable modules by default.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index be41df2a81fb..3f733a555cb2 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -103,6 +103,9 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_JZ4780=y
+CONFIG_DRM=m
+CONFIG_DRM_DW_HDMI_JZ4780=m
+CONFIG_DRM_DW_HDMI=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_MEMORY=y
 CONFIG_EXT4_FS=y
-- 
2.23.0

