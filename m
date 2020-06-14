Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA691F87D4
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 10:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgFNI7F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 04:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgFNI7E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 04:59:04 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B36C03E96F;
        Sun, 14 Jun 2020 01:59:04 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id y20so11860824wmi.2;
        Sun, 14 Jun 2020 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mscrfRheBqwi4NhM9/GlVUUXuK5F08x7HX7HV0LZ6qM=;
        b=k8TVBuD4UFMXOAYy8Wb/unlDdBY3WypeYEBkXChgL8zdZIidr+ivJGuxwqF1kbJ/8L
         GxrlNFJHbBIZCliX+Ova6TaP2bIz96qsUUkIAjPlkCgDM3W3t8ZzyLpk/4V9fJTqavwG
         TzKGHbiZ7Oj0phFZQoruIp0TToJhmgEe4LoV6070eoclwL9lsOrVDLRc4bQfc5nx4YBB
         ydyRVrlxQyS3vNYgZ8ObIwXfBVt/A3/zUAvuoAQjrvJMnV1dtyRG8tsHncCpU9143XPJ
         cBscQ8YyvMe11k7QA+8Tex1mR/ngvHvp2fcueJCgQ2lxsri0XLjSkkpG80nzQ2M0Hq8b
         zLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mscrfRheBqwi4NhM9/GlVUUXuK5F08x7HX7HV0LZ6qM=;
        b=NKwkIjYP5LIDwef/DC1nkPxbDrg9+3vsl2oQ+OkC/j/zXwan5+tuUAsg06Rxfsr42M
         ZR1oSqMnwq80IYF1pwRUROUfgSvwvSRM6ougH2CTFch1bml7BVIWKrCpL713m7vHCGLU
         ymrlYUHis4qvzNgAZ61XKRVVWF6tH46q86azw5AJj6G7qt707ay8mlygSpQ9SLucOavq
         YgwtH0RPlZ3tT7w5Vub+OA+IA9j3XlyZ3IPGrOPvFQwbOVnKHWSUa7P5Fxnr9XgH1OzJ
         G7UbpmrTA53N9YCP08u/Cb3b5DhY3llkl4CZgnbAKpwPAPqyhQqGch3rNtyp5guUj179
         hzkw==
X-Gm-Message-State: AOAM532CMSuR7RU//1rAn+53kXG25kCX1jLRBLeYcAhcYGOfzSbnz+A0
        jU7wNKuRI723jtR83VfKNek=
X-Google-Smtp-Source: ABdhPJzPX+5xD9W4HbBx+tvAad+rp+p7+pUAqpd0bYYrGKkfXXIfwp8IOoZIo7XSWF9HPZUJtfNSaw==
X-Received: by 2002:a05:600c:2945:: with SMTP id n5mr7992723wmd.189.1592125142835;
        Sun, 14 Jun 2020 01:59:02 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id u4sm17174043wmb.48.2020.06.14.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 01:59:02 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v5 8/9] mips: bmips: dts: add BCM63268 reset controller support
Date:   Sun, 14 Jun 2020 10:58:51 +0200
Message-Id: <20200614085852.2130147-9-noltari@gmail.com>
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

BCM63268 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v5: no changes.
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

