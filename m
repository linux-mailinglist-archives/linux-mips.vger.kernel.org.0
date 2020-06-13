Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDA21F820A
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgFMIiu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgFMIiZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:38:25 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429F2C08C5C5;
        Sat, 13 Jun 2020 01:38:23 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id j198so10491189wmj.0;
        Sat, 13 Jun 2020 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=66G4WD3xEE6C4hSbqDUrv41NEzv9wNmeNrUJJ6vnwas=;
        b=ncNs2J9ALpRzB3pGJOwV+Nb2lbphf+F0bt3EQpJjgLalppTlj+Tshmln8tpixojc/L
         4aZDOBDao+rGD2MW0ftExo3XOHWqMxLUnNUaSiThk/QYi0CZRrkE7XMwHi6j4Nx3PnP/
         mFaCCClFWRRKmOU5sMqBt7gHiQLOg+bFqoeQyFEbClYg+zcxtcKpkot/ecvz7EvZEcim
         2jsfjaYtu2a3BOZz8ntlQbf/F+WVWIT+ODZqtKfN7EukooUyDWF4OL4wkGCb3RlrCxEy
         S2XylRdeYYJqoiz/7MyFsFhOhpsr4k5zJmOamSvo7pIHFZPljk4nxe3+JpBpWMsqGlS7
         jLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=66G4WD3xEE6C4hSbqDUrv41NEzv9wNmeNrUJJ6vnwas=;
        b=lNKTGk1E634A15/UtV0A1T77oeaWKeBtkdKEBNthorUyg+2y/roVFol8RmMeHPY069
         nz2Q1Fstx83iKOZxRgdtRE6nmUipura5BZojegfIZAXJF0W38bJ4xt8ZhRnqYhDfzawF
         /SWOS2AC6Fvwk9Id1Kp+CTVMOkmTYcZ6XX2T8xyftJ4qhE56ry2lrbs/u9bXNiVGHuXt
         Z7qqkVdBSweF3o1yEcS9AEClwREkwfiq37Qy4kPYQ3kaKCgnrz2ZbzT9seX4v39SS59E
         722yezw1xdGTzjflz7VYfHY4yLi9PjLzUHthXCB+jHCD9G98juEBEBwPLpgIsdQD0LVw
         5X1w==
X-Gm-Message-State: AOAM531i/5A36H0DPOXuxE5tGcyjFriCeyagjDw86JzM0XMUvKjrCJPV
        aBhbAmBZejbmxwyr26q0/RU=
X-Google-Smtp-Source: ABdhPJyssR4epn5nzbs+vNIfBV5/qjfCCkT2N1cB+HmCSNRfIAYE9hkzSttEOeMEj21zF4NsnqeJPA==
X-Received: by 2002:a05:600c:2259:: with SMTP id a25mr3118313wmm.32.1592037501903;
        Sat, 13 Jun 2020 01:38:21 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id l17sm11622704wmi.3.2020.06.13.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:38:21 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 6/9] mips: bmips: dts: add BCM6362 reset controller support
Date:   Sat, 13 Jun 2020 10:38:10 +0200
Message-Id: <20200613083813.2027186-7-noltari@gmail.com>
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

BCM6362 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
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

