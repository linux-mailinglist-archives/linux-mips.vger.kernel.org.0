Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9BF196ECC
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgC2RgK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:36:10 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.100]:14194 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgC2RgJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503366;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=608ZIT1Aeycmx2TZcRDnlS8hCsD6AfKCyIa3+nJQXYQ=;
        b=SqEugBYIJdeCjFdTC4pjkM95s78xDpMNR/yt03iCH252dLps8BJcohpJLBxQJJLADg
        wha3snm+xqax46Y7XX2WpLCNNSJiCtFcNrHiRy8hO1KvqV0ibtQrDOw8C2jeX6QmHH99
        EogK+aNqtSs9n9RRELZDUuB9j4x/L0Y73TVya6db5tLrCpe1fJ4LSgeLzbFQZMfw8gxw
        Kl+QQdvwUufhGnW8MX8QOCeOqqzisdy3iFch5u43RFT049Hg1caWtqAKkJUQeAh4CX3k
        9mB3eiZPT4G38KeN2opI3T40sicRwoK9smsjomEvlxYQ8LX/2Lv4mrGUv34aq9c2/NIO
        1pdA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THZxBMA
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 19:35:59 +0200 (CEST)
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
Subject: [RFC v3 3/8] drm: ingenic-drm: add support for ingenic,jz4780-lcd
Date:   Sun, 29 Mar 2020 19:35:49 +0200
Message-Id: <fdd3b0952f5000865f427a4853992d4e6a3de197.1585503354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503354.git.hns@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This adds jz_soc_info and a compatible string for the jz4780
lcd controller.

Note that the jz4780 lcdc is a superset of the jz4740 lcdc
and the additional functions are not used if they stay
uninitialized.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index bcba2f024842..82c28ef1ac02 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -837,10 +837,17 @@ static const struct jz_soc_info jz4770_soc_info = {
 	.max_height = 720,
 };
 
+static const struct jz_soc_info jz4780_soc_info = {
+	.needs_dev_clk = true,
+	.max_width = 4096,
+	.max_height = 2048,
+};
+
 static const struct of_device_id ingenic_drm_of_match[] = {
 	{ .compatible = "ingenic,jz4740-lcd", .data = &jz4740_soc_info },
 	{ .compatible = "ingenic,jz4725b-lcd", .data = &jz4725b_soc_info },
 	{ .compatible = "ingenic,jz4770-lcd", .data = &jz4770_soc_info },
+	{ .compatible = "ingenic,jz4780-lcd", .data = &jz4780_soc_info },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
-- 
2.25.1

