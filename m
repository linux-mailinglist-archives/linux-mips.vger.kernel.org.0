Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A7A1F81DF
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgFMIWQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgFMIVv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:21:51 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A118AC08C5C1;
        Sat, 13 Jun 2020 01:21:49 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id x6so12098549wrm.13;
        Sat, 13 Jun 2020 01:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AEQAdXu90LvQ2AREiNSrBT25q02451T/bmVdo1rl85I=;
        b=sTnosNkZfJq+enWfeEumBw83MbvfBfG6O7SlMeJ/WYrtUtcLAB1wLSEOWFDU3bOomI
         iFCk4aKwwJFkOcH8rRK+aJZu49MwPVIbuvEyHhv3PGuviq1a0BKJZUvlsCJQoLbTqtsN
         rNROXAF0k2OeRIK7/Cw8iOJa20T/uGGsEcoiZnLDchldCOLQAkTTHtEvgKwNqAxQg8tD
         TxRr6Ez8n2GZYYDCuc4PhOVDicHvBpuxd5B5oXuq0vE+rViJVYlhcYgRLJwoYhdORU7N
         bwSpAQKjJBwbiYf0vq+qf2HUFWyhr97YL+19u33duS8s4yXA5981vx5wOLI0+NSYTjZb
         yv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AEQAdXu90LvQ2AREiNSrBT25q02451T/bmVdo1rl85I=;
        b=TgVXzaDhWnPHqYLGa3gP99pQkExznfe6IDn1GCuaM90HcZBKdpziVzCdFX2utWBDGv
         oCwA8zidHjKckmoSOi8STTWTY1BmSi6dpeW6NBSalWBczuCBThvSBbop2GNkV6uz5com
         I6qFdqu6cAcIc6qXAd61lbPGbLw80s35090nLXLGQ1TH2G0e5xwvIkmp2kRPqt1b4X2Z
         Zr73CypfmZ52F6l3Gc922YwtZHAIJhc35jNhzAmEfnuXj6fTOMY8ssukjXiF2juI/rJX
         7ypk/zbKB49xFivNcbv93piI4g+blQI06jok8AGNUHqb5w0NQvreUPu3vAHMLEiE3Zig
         jDYg==
X-Gm-Message-State: AOAM530CACpy4vpUHKPOhG4QT0VqfptNgL/nkb1OfUZs4WcHQYUVbK2x
        dEwjxUxFFdNuCJcZLkUGbTU=
X-Google-Smtp-Source: ABdhPJzZiBiKIJ/ojqWqqYiFeDDIRCdctUBs/8RqjN3cMLJipWuI2orIRKuQT/6WUVAOKXCPDQ159w==
X-Received: by 2002:a5d:4bc5:: with SMTP id l5mr19165177wrt.104.1592036507929;
        Sat, 13 Jun 2020 01:21:47 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id n189sm12243603wmb.43.2020.06.13.01.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:21:47 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 4/9] mips: bmips: add BCM63268 power domain definitions
Date:   Sat, 13 Jun 2020 10:21:35 +0200
Message-Id: <20200613082140.2009461-5-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200613082140.2009461-1-noltari@gmail.com>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM63268 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v4: Remove "dts: " from commit title.
 v3: Separate dt-bindings definitions from power domain .dtsi support.

 include/dt-bindings/soc/bcm63268-pm.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/soc/bcm63268-pm.h

diff --git a/include/dt-bindings/soc/bcm63268-pm.h b/include/dt-bindings/soc/bcm63268-pm.h
new file mode 100644
index 000000000000..84ded53a732f
--- /dev/null
+++ b/include/dt-bindings/soc/bcm63268-pm.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_BMIPS_BCM63268_PM_H
+#define __DT_BINDINGS_BMIPS_BCM63268_PM_H
+
+#define BCM63268_POWER_DOMAIN_SAR	0
+#define BCM63268_POWER_DOMAIN_IPSEC	1
+#define BCM63268_POWER_DOMAIN_MIPS	2
+#define BCM63268_POWER_DOMAIN_DECT	3
+#define BCM63268_POWER_DOMAIN_USBH	4
+#define BCM63268_POWER_DOMAIN_USBD	5
+#define BCM63268_POWER_DOMAIN_ROBOSW	6
+#define BCM63268_POWER_DOMAIN_PCM	7
+#define BCM63268_POWER_DOMAIN_PERIPH	8
+#define BCM63268_POWER_DOMAIN_VDSL_PHY	9
+#define BCM63268_POWER_DOMAIN_VDSL_MIPS	10
+#define BCM63268_POWER_DOMAIN_FAP	11
+#define BCM63268_POWER_DOMAIN_PCIE	12
+#define BCM63268_POWER_DOMAIN_WLAN_PADS	13
+
+#endif /* __DT_BINDINGS_BMIPS_BCM63268_PM_H */
-- 
2.27.0

