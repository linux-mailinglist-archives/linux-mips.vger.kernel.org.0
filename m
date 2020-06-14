Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDE61F87E3
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 10:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgFNI7T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 04:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbgFNI7C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 04:59:02 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A333C08C5C2;
        Sun, 14 Jun 2020 01:59:02 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c3so14003439wru.12;
        Sun, 14 Jun 2020 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b3Tc7VPsrQBr9yBYFFU3xKPThV3B3q+o3TqJAkgQp7w=;
        b=r4uuttNhXvHSSfYcisGD8Qw0fij46//r52uU61zXXDjMG89xar2LaVHYfvWCN+4myF
         ovBS3kaKurk0pEpDXQXru0iWB2FjyUvBa7y6twND+ZX0GbIKr0KR0QIX3Rp20LabIjyo
         EEmXOoyWNBTL/gVZdyXcXDhkDb2HgvM7pQkae1/k4/gFuVAyyg+0aub2UPC8XaZk4/NQ
         tr0V2uNejAx03W8+p8WtgHBhqjdhQaaFodHJK5HepeU7vP1R0vWR1XCzF5+Rg9G99qX4
         BEtdXW3F8L1MAkraE5zYUp2eig/EPJqkqrlx2auwmiPpFUkqujada1J/r9mE17h3yTb2
         TQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b3Tc7VPsrQBr9yBYFFU3xKPThV3B3q+o3TqJAkgQp7w=;
        b=dMMRZcE+H+1FllmVoWA3/e/bJgf6ZAzqyvAwQ2nNW4V7pmRGnZYOldc8XcAzxnZOuc
         4BvDBhiA8cNCzQLcP056EKV1u96cUZFMoi+oq8WYEo5nik0G1uAU/I/bPB9Rf8f6ZMfO
         ovo1jTmoedzn28Wl25mB1b3f30zFMSBT3J9Rwj+4uFqzH9Mo7H8el6OsPpV4Ln3Y9l5N
         hTc+qRdI+5kMErieXHTMZso3o73aGi8a8MmiwEr2Au+RcNyM0yOBzxDjIazyvwb2oi9g
         xUuHIBLPZyPPWVXCw+R7v/3WotaYmFulDQwRjtD+ja4H4+LL77M1wA6JzxLezD9+TN4p
         P7Xg==
X-Gm-Message-State: AOAM531N1a/5mB6EYg54VljUGvaagi6lKw/lBV7FP+9eMFb7DVsbHqve
        UQrCmM3/60X9ejwTfu0HVCA=
X-Google-Smtp-Source: ABdhPJz04NkwP45t5wOuXMHgxlomTGqUYCoW8IokzDM8f2Q4VewqodSK71vsQY2CYAI5Gh7mfFk5cQ==
X-Received: by 2002:adf:bb4f:: with SMTP id x15mr22457950wrg.332.1592125140956;
        Sun, 14 Jun 2020 01:59:00 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id u4sm17174043wmb.48.2020.06.14.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 01:59:00 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v5 6/9] mips: bmips: dts: add BCM6362 reset controller support
Date:   Sun, 14 Jun 2020 10:58:49 +0200
Message-Id: <20200614085852.2130147-7-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614085852.2130147-1-noltari@gmail.com>
References: <20200613083813.2027186-1-noltari@gmail.com>
 <20200614085852.2130147-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6362 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v5: no changes.
 v4: no changes.
 v3: add reset controller definitions header file.
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6362.dtsi      |  6 ++++++
 include/dt-bindings/reset/bcm6362-reset.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6362-reset.h

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index 8ae6981735b8..443af6b4c838 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -70,6 +70,12 @@ reboot: syscon-reboot@10000008 {
 			mask = <0x1>;
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
diff --git a/include/dt-bindings/reset/bcm6362-reset.h b/include/dt-bindings/reset/bcm6362-reset.h
new file mode 100644
index 000000000000..7ebb0546e0ab
--- /dev/null
+++ b/include/dt-bindings/reset/bcm6362-reset.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM6362_H
+#define __DT_BINDINGS_RESET_BCM6362_H
+
+#define BCM6362_RST_SPI		0
+#define BCM6362_RST_IPSEC	1
+#define BCM6362_RST_EPHY	2
+#define BCM6362_RST_SAR		3
+#define BCM6362_RST_ENETSW	4
+#define BCM6362_RST_USBD	5
+#define BCM6362_RST_USBH	6
+#define BCM6362_RST_PCM		7
+#define BCM6362_RST_PCIE_CORE	8
+#define BCM6362_RST_PCIE	9
+#define BCM6362_RST_PCIE_EXT	10
+#define BCM6362_RST_WLAN_SHIM	11
+#define BCM6362_RST_DDR_PHY	12
+#define BCM6362_RST_FAP		13
+#define BCM6362_RST_WLAN_UBUS	14
+
+#endif /* __DT_BINDINGS_RESET_BCM6362_H */
-- 
2.27.0

