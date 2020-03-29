Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF80A196EAB
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgC2RgJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:36:09 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:17458 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgC2RgJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503366;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=3bPEDGqyJOBTZ1dmWLnKidK90rqP4ViQpq+Ni8TIszo=;
        b=ZW157KiEkI5Si2uEU7hBYeSSWdMfQqWLNbSYPBaIr7XsFuBNC2tLGKrC2Al6NNoG+j
        wGxFGfRF25h+nPIEyFdOGZctkTEvsM66xCTHObdx2xQyjQqt1eQv9fP+nhmZBsHs1eYp
        /NZaA+I8QDBYYnipKxkV+ZUGGwbCbD/YGazyA3HXXFQ5XyWTRC+rjuzlHRk7quI5a1Ht
        Df1AiCJZZEWtcEFyMVgyBCdDK20K/fw3BeOQw6Me42OtTKkxWiNZSZCHexna7wMcGDda
        15tIUp2VGq8hhLTYZYsX6EKrGt1qKjOMGfg7P2vRmGaHE+85iOQaDuIESxTmrK/B0HyX
        Nllw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THZwBM9
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 19:35:58 +0200 (CEST)
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
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        mips-creator-ci20-dev@googlegroups.com
Subject: [RFC v3 2/8] drm: ingenic-drm: add MODULE_DEVICE_TABLE
Date:   Sun, 29 Mar 2020 19:35:48 +0200
Message-Id: <02c8f35fde969fd852a62740b4fa8a01c53b79ef.1585503354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503354.git.hns@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

so that the driver can load by matching the device tree
if compiled as module.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 6d47ef7b148c..bcba2f024842 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -843,6 +843,7 @@ static const struct of_device_id ingenic_drm_of_match[] = {
 	{ .compatible = "ingenic,jz4770-lcd", .data = &jz4770_soc_info },
 	{ /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
 
 static struct platform_driver ingenic_drm_driver = {
 	.driver = {
-- 
2.25.1

