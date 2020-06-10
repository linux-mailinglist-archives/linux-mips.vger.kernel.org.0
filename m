Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6AED1F59F3
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729582AbgFJRQj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729570AbgFJRQj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:16:39 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60209C03E96B;
        Wed, 10 Jun 2020 10:16:38 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e1so3173156wrt.5;
        Wed, 10 Jun 2020 10:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lDdshItlwdnmfzepKbPpmuAaIp6dKQ9DCj4M6A5UrdU=;
        b=siGfsk35lzH86e5aquAsfKSdN/8giMFuhHWJ0Tl1Gagq+AHLgUk+aadRSFgiSh8IxB
         cSMnQzcrmRLpy84clpq/vKIJTgHEvfPII7jNF0s4bPab0HFG6fsbJzERkJ56wCN2YCuj
         jVkqCD/qcj/9SqdSzSFO9FOOjVZ0ATVHs5ck8NbmyGX8ceB+7nN+Ln/xrdr06jBOED+o
         iDvtERms7ChgxKij4vxBIRua5fCGCoTpd0+h/RpML/AObNw7glMMHm1xN6wGw/F4HYiV
         uAFHQOGhPZL9t0pvHNM30US0mXUKC2j7dS/YUU21RaQU449mr7qdGRbjIl9NA6icRS1/
         Uk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lDdshItlwdnmfzepKbPpmuAaIp6dKQ9DCj4M6A5UrdU=;
        b=IlDcNfGyl1Y5gQ/HIOv9ub19/04yTM24jTbkVFos+3dSi8AN1tg1EudYU3EP+3xyNE
         AQI2uZCIwHkkNMbCpyDHTDyc5+PQDWK47oHp9l1ilAOhdDlAcsHLtop/kF7DyswN4KIf
         TVAEkMH+rvhW5FlQaZKoZ0xjLs9m4lVS6p2C37JSf9O8xw68lp2fHGU90cAEObrCCYdn
         lA5Iooq/UIhKF5s14Xww0HULuVYkkXJ73J8nKa99rCugKd6skB5WdTEW5YOUHILSeZL9
         601eFOp2tm5zBtjkrs2kQ+mmp+rXhBS6naZOpTqE0lysHwvqHndMQ8YczSJU6QXDPAM7
         l0IQ==
X-Gm-Message-State: AOAM532ngoQrZSCaso5wwA+tyRpnmQ1bsiREF9Yr5qvpLbZUGmoqQ9r9
        nNmVtdg6FVNpfiwZdnc26BE=
X-Google-Smtp-Source: ABdhPJx1djunj5L522CBpgGonhSBd3Wjpc1V0cz4pd18fakQ5y2c8wzX2CITkveZB2icsrf1vSIbyg==
X-Received: by 2002:a5d:68c2:: with SMTP id p2mr4809378wrw.253.1591809397002;
        Wed, 10 Jun 2020 10:16:37 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id f11sm589048wrm.13.2020.06.10.10.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:16:36 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 4/9] mips: bmips: dts: add BCM63268 power domain definitions
Date:   Wed, 10 Jun 2020 19:16:25 +0200
Message-Id: <20200610171630.465579-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610171630.465579-1-noltari@gmail.com>
References: <20200610163301.461160-1-noltari@gmail.com>
 <20200610171630.465579-1-noltari@gmail.com>
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
2.26.2

