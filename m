Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD9D5D8AC
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2019 02:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbfGCA1E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Jul 2019 20:27:04 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39509 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGCA1E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Jul 2019 20:27:04 -0400
Received: by mail-wm1-f68.google.com with SMTP id z23so383552wma.4;
        Tue, 02 Jul 2019 17:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+O/4XlmLaQhsCgT7V+9YOmnXRrZX0P274rj7HawDPDc=;
        b=uGGmnOmRvda3YKo0xznaly0v881+AvMmMbLuaDgk0Pjv00bnUVWBMhCL0lvOR3JfEf
         AFrm/yStdB5n+mQAOeN2gXP4JRCSYbsnHnLWi/VPoHZGJDOLlwDOI85Gmowdkd98LoFm
         3vW36XqWaXkKQgVXTSUb9j8WtJ1hHPjUOFdYnFVudX37IOtaNE7NMB+R5mJHbeGm1yQD
         aoMl//ecNu8rE8XolH86QwR26UQHaSYsaGbZ2HMqxVDqlZWyE6hiWpED8mcSvzXG1efz
         IZCG3qSXkr7lbzRL0Zedpr0b83FbLgQVF4MLbJF3Sum3+fyddZ0JDkhVLYFP+LEUxeob
         14CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+O/4XlmLaQhsCgT7V+9YOmnXRrZX0P274rj7HawDPDc=;
        b=R7v9xpiNGhWzxUmuYDOuSQygt0AsBOluF2/1jR3ZGT7n65mtGmgUSAOZwUUZ1oNwpN
         BpxmN0SbPNPaY+o09CCMXP0OANha1t59n/OAKylE+GTp6KviXk6SR0DGyO+SPv1fAIdm
         3GxY7Y+ax6gwtIcycQZ8si2OfZ8SQRGPmC77gODllQ2vPm8gT5hPn83mJSXHHjSWDdWv
         aSnT9ZhiLeDvxKQTsrFjeT91w66p125uphJCnzbZJe9kyBVy/td6NfV7DFK8sXJkUj+Y
         dFG/WV4CVDV0TNybfVPxXOZoxpOhZk6hd7FiOjvYMu/1WTdSHfMGyuJXr6OjL7XRbQEm
         gyjg==
X-Gm-Message-State: APjAAAU/GR7gxjaysaAtLCIw/+Diva69PR/R5dH8Oel/yPOi6se9qq4R
        j3Gaw7dbbm920de3D3xUL3rUMKSg
X-Google-Smtp-Source: APXvYqz/C8NzljAqkT2+IPe9wv6/jTO8TaQOLQdWFlx/v7fDDx4zsKAxYUR3mJvsWfOyeIqwFAEgfg==
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr4377605wmg.54.1562099733574;
        Tue, 02 Jul 2019 13:35:33 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D62000A09003363445C98E.dip0.t-ipconnect.de. [2003:f1:33d6:2000:a090:336:3445:c98e])
        by smtp.googlemail.com with ESMTPSA id s12sm100041wmh.34.2019.07.02.13.35.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 13:35:32 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        paul.burton@mips.com, ralf@linux-mips.org, mark.rutland@arm.com,
        ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/4] phy: enable compile-testing for the Lantiq PHY drivers
Date:   Tue,  2 Jul 2019 22:35:22 +0200
Message-Id: <20190702203523.2412-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
References: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
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

