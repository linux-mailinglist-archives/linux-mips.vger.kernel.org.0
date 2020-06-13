Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F141D1F8208
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgFMIiv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbgFMIiZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:38:25 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0747CC08C5C3;
        Sat, 13 Jun 2020 01:38:21 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so12183697wrc.7;
        Sat, 13 Jun 2020 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c3LSxS5y9C3iZjIgZQHWu/m3qHf45XIGKZnAz+FSDeE=;
        b=WgjSWbIwDGFRtvWR/rcwO1/4rnZJxpSaityxQH4xSg4cvMCBz+hZYMLNJ7TQijbbNT
         N6lONhXyxL6IgHwAQHWZ4ytigf/g34U2GnMkugi8ltIaobS5nKbtEMPqUhx/P6TNL+jN
         z4zp2+PQ9E5r1IgN7kVIqAiPodKDeV9qB9anDQJm4PdDxDOXojb5jEguLRdzJatSeSoA
         JRqktpdQb+zhM4IN03KNnfedfw+rztjkvO9/f/sEAXkN4Nc/Yrhe/EyYL0hgJ5WqqGCF
         u16OwlVxZhKSPBZkEy8fd4/+I25xjrBwY2U/9QJahcsM/vwuj09D0LKzF0EhBvIgTjwY
         M/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c3LSxS5y9C3iZjIgZQHWu/m3qHf45XIGKZnAz+FSDeE=;
        b=LVNiQ2J848XrMJIaW7iY2T6VIj8uvkmcoDvBYrBeUYZBJJE1cow+NTBgPKWZoN/BYA
         HwZa5fOAZeRk3kYtsuSK88xOXBUkznTZkEQqA8u9C6Lhyii5woEEDgvXKSfa6/KrQfui
         iXq8Eaum1qSEbmELB1FwwkWscmNk07qkimQyxoRzI2PQgL8vaDekbnkAAThkR9wD/t/v
         Ad+KdmaEViu2ghJ7J1BzjCOK1/H1cW0S73im44qRLKexSUFUtcjB3TckxhCTRVGMjr8D
         Zmryn8KEO1N3vZLzznZ+2o2YicvX13M5NOCIk1XIRQ/le2253bASj4DIhi/CcZ8AguIh
         REpg==
X-Gm-Message-State: AOAM533gINxdprlKCYu1T8zPK6Oy8t0WATRAppZXMXhuekSf6vMq08b7
        ON1AFw0gU76vf7sw7DC5T5o=
X-Google-Smtp-Source: ABdhPJzv87O22EmB+aVOPqgmkyvXjpXoSYIBAIJzjW3OnpbpgVzrNUzK4aELEOhhcqfql5nB1z+YEQ==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr19988367wrr.164.1592037499613;
        Sat, 13 Jun 2020 01:38:19 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id l17sm11622704wmi.3.2020.06.13.01.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:38:19 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 4/9] mips: bmips: dts: add BCM6328 reset controller support
Date:   Sat, 13 Jun 2020 10:38:08 +0200
Message-Id: <20200613083813.2027186-5-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200613083813.2027186-1-noltari@gmail.com>
References: <20200610172859.466334-1-noltari@gmail.com>
 <20200613083813.2027186-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6328 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v4: no changes.
 v3: add reset controller definitions header file.
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6328.dtsi      |  6 ++++++
 include/dt-bindings/reset/bcm6328-reset.h | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6328-reset.h

diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/brcm/bcm6328.dtsi
index af860d06def6..590118cf5c12 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -57,6 +57,12 @@ clkctl: clock-controller@10000004 {
 			#clock-cells = <1>;
 		};
 
+		periph_rst: reset-controller@10000010 {
+			compatible = "brcm,bcm6345-reset";
+			reg = <0x10000010 0x4>;
+			#reset-cells = <1>;
+		};
+
 		periph_intc: interrupt-controller@10000020 {
 			compatible = "brcm,bcm6345-l1-intc";
 			reg = <0x10000020 0x10>,
diff --git a/include/dt-bindings/reset/bcm6328-reset.h b/include/dt-bindings/reset/bcm6328-reset.h
new file mode 100644
index 000000000000..0f3df87d47af
--- /dev/null
+++ b/include/dt-bindings/reset/bcm6328-reset.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM6328_H
+#define __DT_BINDINGS_RESET_BCM6328_H
+
+#define BCM6328_RST_SPI		0
+#define BCM6328_RST_EPHY	1
+#define BCM6328_RST_SAR		2
+#define BCM6328_RST_ENETSW	3
+#define BCM6328_RST_USBS	4
+#define BCM6328_RST_USBH	5
+#define BCM6328_RST_PCM		6
+#define BCM6328_RST_PCIE_CORE	7
+#define BCM6328_RST_PCIE	8
+#define BCM6328_RST_PCIE_EXT	9
+#define BCM6328_RST_PCIE_HARD	10
+
+#endif /* __DT_BINDINGS_RESET_BCM6328_H */
-- 
2.27.0

