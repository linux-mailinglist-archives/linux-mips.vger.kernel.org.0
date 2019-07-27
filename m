Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD89577890
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 14:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387570AbfG0MEl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 08:04:41 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54818 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387520AbfG0MEl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Jul 2019 08:04:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so50003284wme.4;
        Sat, 27 Jul 2019 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+O/4XlmLaQhsCgT7V+9YOmnXRrZX0P274rj7HawDPDc=;
        b=nz+wsiaeaZ9hzfPNO1Hy+S4/9Z53EpUDDgGOwQKlqvsmoi5VyrutKT3okRXApRygIV
         mRRZibNXcsXbDu5M5zVe/tpB/Y2VtkyBhL8jdz/xWCjUCW9DMp9FHg5V5frOa2pdvEEw
         g/G8vrSi2edhtXoM22WiMUyTSXVt/7qp2Mt9Epkp0PyAIoCVQo254A9EfzWImZn7Ab6o
         kPB5QKaK2swdC8+irIThepKKvTJWVigblXaDbdAS7sik3LPn2vzwCPMLr8Wr0O9A1oyM
         D0x/+eAW9HF99ylEteVEXEE4kMTYQxdHY6qMR+L1YfYMZ9GQv+/MpusDpsByOlKpKlsT
         8t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+O/4XlmLaQhsCgT7V+9YOmnXRrZX0P274rj7HawDPDc=;
        b=fHt75Khfp3E4r0BSXZKxGxAodome4p8eYLP+KL7iNab0vddKbJDrDreAzxeIDnwGfM
         F8E01dpAK2POLEMnrFXmLVU2I6V56sYRZH06dGa4Bf6pk0hZaqtHCOr7YYOguh0G/Y5D
         b39ZvbpruR2XIUbXPNtA5nROXapZ56CayCBmojSCtz/HzQst8Slc3d8MaXfqs4joDFbm
         xdbVAvx8TSncVRAJEz7iz3SAuUb01GaUkoA1wQIa+G5Xcz88gKFbX+IiUHKX0PovVVLA
         EcNg6y8DuAqaQVlIUqJyUlyr2HQuifrXS2uU3glbtJg/PcPgpct9yOlOJ0wyWm9oh7j/
         6kbw==
X-Gm-Message-State: APjAAAWGaKd3XeyePApmqbyGDC/RLdYtE574p/lCt+rnnIRCIe/dGvDJ
        oWBhgN3pRvQ2EGBlNYBUDwvz853u
X-Google-Smtp-Source: APXvYqxOU2FijrYpqTHHBm4VO06qlh4UQiLx9W1uG4Kez5YKwnJDuNMisfoshLBHJYOQBB/53JbaSg==
X-Received: by 2002:a1c:2302:: with SMTP id j2mr87330408wmj.174.1564229079165;
        Sat, 27 Jul 2019 05:04:39 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de. [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
        by smtp.googlemail.com with ESMTPSA id r5sm58596219wmh.35.2019.07.27.05.04.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 05:04:38 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, paul.burton@mips.com,
        ralf@linux-mips.org
Cc:     robh+dt@kernel.org, linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        mark.rutland@arm.com, ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 3/4] phy: enable compile-testing for the Lantiq PHY drivers
Date:   Sat, 27 Jul 2019 14:04:14 +0200
Message-Id: <20190727120415.15859-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
References: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
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

