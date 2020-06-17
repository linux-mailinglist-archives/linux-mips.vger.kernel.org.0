Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526FD1FC8BD
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 10:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgFQIcv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 04:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgFQIcp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 04:32:45 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A76C061573;
        Wed, 17 Jun 2020 01:32:45 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id e1so1370488wrt.5;
        Wed, 17 Jun 2020 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mtgh77EZDHTSl2OGlFXF6sIBzn5cvZZO6RG0XKaIYi4=;
        b=cufRiZXrpvaLZE7sziT1epxNzsHpEMoSogP7HavYf2p16ud6XuPlKAu6v4jeW3OV2m
         EaGIY0KprGt2BYcceqSTvPd8BlOqWFy9D1tQeOvzqRKPRSJXcXHY0Fpu3U+79lKXqt7s
         ON+9SAGO1iNvahYc2OTcviHDl8B0ka+mJ+ixwBWOHKn0tYCMjDYsCa3jFg+34Lhnde+4
         6KeWO2w+5NkkWZ9BQcXYoBNYz338S/LYjoGKvm5CTilkUIa0I9eqhtnX8F/BD69/qYqR
         sT3si8FILYY4a+mGaEyDiN6Y1baj8BGEifCLMRZghJROMj22PKQnkmIMCX1Vhwsztb6A
         OwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mtgh77EZDHTSl2OGlFXF6sIBzn5cvZZO6RG0XKaIYi4=;
        b=WrSR9+U8XtwEAbWv0VCd1A84qxqRKyyb3GoNYTcfuxQRIjOw5MnOh7D0qI/HURtDzu
         TdxucPMNO++f0JKgte4+QkKp4Nw53KMP53IrTAYIaPr7nfVn1D0DewsRZJGtYAh6ZeMs
         vnhATv1J/SrX4ZOwq1+C2UjIlntHxapRKQQ+DoyXt6HpGEkiovZ2C+7bP9mcGGXaLgFq
         PsiuTwF66hXuPVkC9Xp//v5gptMU9bp8DG9SX9gHVZxGx2ZSYlyw1t1GU89ZqssLq4xM
         5gRXtRmwPxPY+7LqRVFy1/97ycIoJI2EvZ++qN9oUJ/7BXc1FV1ROMcyEjNIUQ+gaFYL
         YIgg==
X-Gm-Message-State: AOAM533Gp2m3jquDS5UsfJrYFiFGJVAlWyYGJLKdg13KNpcFZYaUMyJP
        49nYKaNGExiZeyXo7vC3igK5GtICFng=
X-Google-Smtp-Source: ABdhPJxuZ1/18SupCjUYuSc+tfO4uiY+HDt9HkQWHLDdCBZ2aF8/PNzPoOtvSv/Ftj96XiIJC+vABA==
X-Received: by 2002:adf:e604:: with SMTP id p4mr7069287wrm.212.1592382764007;
        Wed, 17 Jun 2020 01:32:44 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id a16sm32596863wrx.8.2020.06.17.01.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 01:32:43 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Florian Fainelli <F.fainelli@gmail.com>
Subject: [PATCH v6 9/9] mips: bmips: add BCM6318 reset controller definitions
Date:   Wed, 17 Jun 2020 10:32:31 +0200
Message-Id: <20200617083231.3699090-10-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617083231.3699090-1-noltari@gmail.com>
References: <20200617083231.3699090-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <F.fainelli@gmail.com>
---
 v6: fix BCM6318_RST_HOSTMIPS value (12 vs 11).
 v5: no changes.
 v4: no changes.
 v3: add new path with BCM6318 reset controller definitions.

 include/dt-bindings/reset/bcm6318-reset.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6318-reset.h

diff --git a/include/dt-bindings/reset/bcm6318-reset.h b/include/dt-bindings/reset/bcm6318-reset.h
new file mode 100644
index 000000000000..f882662505ea
--- /dev/null
+++ b/include/dt-bindings/reset/bcm6318-reset.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM6318_H
+#define __DT_BINDINGS_RESET_BCM6318_H
+
+#define BCM6318_RST_SPI		0
+#define BCM6318_RST_EPHY	1
+#define BCM6318_RST_SAR		2
+#define BCM6318_RST_ENETSW	3
+#define BCM6318_RST_USBD	4
+#define BCM6318_RST_USBH	5
+#define BCM6318_RST_PCIE_CORE	6
+#define BCM6318_RST_PCIE	7
+#define BCM6318_RST_PCIE_EXT	8
+#define BCM6318_RST_PCIE_HARD	9
+#define BCM6318_RST_ADSL	10
+#define BCM6318_RST_PHYMIPS	11
+#define BCM6318_RST_HOSTMIPS	12
+
+#endif /* __DT_BINDINGS_RESET_BCM6318_H */
-- 
2.27.0

