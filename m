Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15CE75F7FA
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2019 14:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbfGDMXy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Jul 2019 08:23:54 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41899 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727678AbfGDMXn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Jul 2019 08:23:43 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so6413340wrm.8;
        Thu, 04 Jul 2019 05:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+O/4XlmLaQhsCgT7V+9YOmnXRrZX0P274rj7HawDPDc=;
        b=S7J0apL32EFmC62pJjO9qoIWm+ZYL9YlQMTN4XbKaTkpZbrKlaeawc7RGzt6gM1TKx
         1vvfUYgRHUabx09YnVXxFXrefIUTbLTXXq23VYUto55EoNpRqbfseBI1D2bcEVpIKr3U
         4AHp7Rvx3ewtGy9FcjYBVCy5UcnQ9DAmgaWCTozVnyjc0XN3IMxP45Jms1Cg504KusHc
         kPmTWxIeRgVc27dQTVqGmvSOhJQRJEyJQ6c2cdCeWc8CfyHjrbyk8yrweXlucIuNCTmp
         mqbX0yHAJ7FzOhx9NM6K5xjFIhkOhUxMLb/QX2+E7ZToG/3cxkuMOP/XJXRkmRfFuDHH
         2vXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+O/4XlmLaQhsCgT7V+9YOmnXRrZX0P274rj7HawDPDc=;
        b=JRsBkfrlMfYXUinQh6eSJWiltt24AoYyTaLfaSnzEffett+PoYk5bJY2uUly4BY8Br
         OAIvVpoOnjDC6FudzOnvafW3+z9P0zYWL7CQsb7dp3ZXNfAmr5LsclaJva9SC+Qdoavq
         8g16CsJ5+g6iBH5uqdkjq9wdVe/4nkcSzwODQiGzUnUXr3JprJK8UQzqWTEXaNtZHqcL
         Wz13q1kxllo4pZKYZZ90aLudvUofqfxqbEcg+sTtifyqmRfnc2Sf9BnMdn+iYF+cYUxG
         HphMnpUgEosK+AlvsWJVqfgWKZVF0Nt8BsSm36vBaACQvr2eEiXxVT5wURdWA6Sp+zGD
         Y/VA==
X-Gm-Message-State: APjAAAUAK0lCLT4Kh9QPxyRf3PkJOF1B1IIH/tMTiaYp0GAqF/yQ45/B
        xQvH5fff2BjlF5/IovzOEZsd91dL
X-Google-Smtp-Source: APXvYqzzkGlk7meuZ3ZE0zJcXoNI5znoptBlXF2xaFOKzFNmVQgDtQBagtdV5ByrmVkxlSEUL90fnA==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr26837686wrm.100.1562243021020;
        Thu, 04 Jul 2019 05:23:41 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D6200090FB6F2A0C02D39B.dip0.t-ipconnect.de. [2003:f1:33d6:2000:90fb:6f2a:c02:d39b])
        by smtp.googlemail.com with ESMTPSA id w10sm5141825wru.76.2019.07.04.05.23.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 05:23:40 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        paul.burton@mips.com, ralf@linux-mips.org, mark.rutland@arm.com,
        ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 3/4] phy: enable compile-testing for the Lantiq PHY drivers
Date:   Thu,  4 Jul 2019 14:23:18 +0200
Message-Id: <20190704122319.8983-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
References: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Unconditionally include the lantiq subdirectory in the phy Makefile.

All drivers in there have their dependencies maintained. One of these
(optional) dependencies is COMPILE_TEST, however this can only be
evaluated when Kconfig scans the lantiq subdirectory.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 0d9fddc498a6..c96a1afc95bd 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_ARCH_SUNXI)		+= allwinner/
 obj-$(CONFIG_ARCH_MESON)		+= amlogic/
-obj-$(CONFIG_LANTIQ)			+= lantiq/
 obj-$(CONFIG_ARCH_MEDIATEK)		+= mediatek/
 obj-$(CONFIG_ARCH_RENESAS)		+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
@@ -19,6 +18,7 @@ obj-y					+= broadcom/	\
 					   cadence/	\
 					   freescale/	\
 					   hisilicon/	\
+					   lantiq/	\
 					   marvell/	\
 					   motorola/	\
 					   mscc/	\
-- 
2.22.0

