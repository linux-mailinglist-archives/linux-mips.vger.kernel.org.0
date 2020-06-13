Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998701F820B
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgFMIiu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgFMIi0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:38:26 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592ADC08C5C1;
        Sat, 13 Jun 2020 01:38:25 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h5so12183808wrc.7;
        Sat, 13 Jun 2020 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MTL3mFHal5gyxBhhw5JCJ323TJpZOzIoxk/BoxVrxCY=;
        b=MCYZVX2EAkbpny5bY7kxIY34pcojF5sb9zpRxh6YzqOm7hJ/H2vj/yWe/tTMBvWtvX
         TwpTB0C/YbyxPtR/sQ2pumYFJGlYOxKTvhWWGV+y3MO2kXE6VFgSp+5A9RAjT/c2416B
         0LCigbvkjbLx6MetPf9E04BVRC8YTbUfoqljs3JqyAM7dsaSHMQgkHjjipV36qVZ54GC
         QHeVhZyTc+m4QKaJvCkGHaHMyHnsckpmnupImvb/VrfYuHIRxJHiWeaZbr6sNNgWHyRN
         Cts4oBkfTbIE4wElxd2Fw/lkmqlaIdSm2dhmAh6uPZs+qgiwoxMU6lbpPuOZAWHmjv4d
         RiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MTL3mFHal5gyxBhhw5JCJ323TJpZOzIoxk/BoxVrxCY=;
        b=VD9rbMX8keqypgRkhVyp52KqZz9/14Pcv+hgN3bxXyv41AZJQ+cpDmmuXGId+/ageO
         DZCQQi5DzxCrkXw70psHn0ZhFlVuPWXVz1fgsQU/jcMOvAeT0d1yvgWDoA3zzPA5z9Hn
         MILH9FEufTlnBruJNkuQauiF3+X9/TJ0m/MHJhTaEk7+jJ7MBmkfoCnByCPf0j60jjdf
         V0f5b53dnofP5Qk10GK/5ybRGWIU5CJqAPetfCpc8EClkEZAPJSL0h66vvX1olskMu1E
         kP7xeSGtgg2GOUu5nvlwIkJAy2K1Z93yAOSQQb9YHtj5VjLc34e0oYlJRb8TpEjNfq7N
         xMIg==
X-Gm-Message-State: AOAM532gOtPA7TaTfqVKjwyfEBmzF3XCnoO6Qom4hrXoPYfnodxVLpWM
        ggLiGDM6rbw3xop3HLrDjko=
X-Google-Smtp-Source: ABdhPJyat4YhdE/eqJ8RyMfkVugG2EQZt0Wl8ol9rGNYgpNSJgQriqbOLJBmoHRghoP/toHgANblIQ==
X-Received: by 2002:adf:dc42:: with SMTP id m2mr20152781wrj.342.1592037503975;
        Sat, 13 Jun 2020 01:38:23 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id l17sm11622704wmi.3.2020.06.13.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:38:23 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 8/9] mips: bmips: dts: add BCM63268 reset controller support
Date:   Sat, 13 Jun 2020 10:38:12 +0200
Message-Id: <20200613083813.2027186-9-noltari@gmail.com>
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

BCM63268 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v4: no changes.
 v3: add new path with BCM63268 reset controller support.

 arch/mips/boot/dts/brcm/bcm63268.dtsi      |  6 +++++
 include/dt-bindings/reset/bcm63268-reset.h | 26 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm63268-reset.h

diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index beec24145af7..0150da7e3905 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
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
 			reg = <0x10000020 0x20>,
diff --git a/include/dt-bindings/reset/bcm63268-reset.h b/include/dt-bindings/reset/bcm63268-reset.h
new file mode 100644
index 000000000000..6a6403a4c2d5
--- /dev/null
+++ b/include/dt-bindings/reset/bcm63268-reset.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM63268_H
+#define __DT_BINDINGS_RESET_BCM63268_H
+
+#define BCM63268_RST_SPI	0
+#define BCM63268_RST_IPSEC	1
+#define BCM63268_RST_EPHY	2
+#define BCM63268_RST_SAR	3
+#define BCM63268_RST_ENETSW	4
+#define BCM63268_RST_USBS	5
+#define BCM63268_RST_USBH	6
+#define BCM63268_RST_PCM	7
+#define BCM63268_RST_PCIE_CORE	8
+#define BCM63268_RST_PCIE	9
+#define BCM63268_RST_PCIE_EXT	10
+#define BCM63268_RST_WLAN_SHIM	11
+#define BCM63268_RST_DDR_PHY	12
+#define BCM63268_RST_FAP0	13
+#define BCM63268_RST_WLAN_UBUS	14
+#define BCM63268_RST_DECT	15
+#define BCM63268_RST_FAP1	16
+#define BCM63268_RST_PCIE_HARD	17
+#define BCM63268_RST_GPHY	18
+
+#endif /* __DT_BINDINGS_RESET_BCM63268_H */
-- 
2.27.0

