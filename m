Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408591F592A
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 18:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730745AbgFJQdb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 12:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730697AbgFJQdJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 12:33:09 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497DEC03E96B;
        Wed, 10 Jun 2020 09:33:09 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id x13so3010469wrv.4;
        Wed, 10 Jun 2020 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jah2m/tEOh9h0lymAwcC6WmsIFSaB8GDDwM5FtbgkHw=;
        b=N4VymObgfYu2zZKNYXEI88esUcP9IhzhU3xqsVmB9hjQ8OBsso8lc7kJ89e1KOp9ja
         xvyMMgEzZWKm14PmAlkivRoQdxIPdig2cplPPYQrD7nBnPklXw8SXw+EmkM4Yj9khTDK
         BDg9hPx9MYQa4tVKzrttuXCTTjVgkd+yMc98sQeDqM4fzJHWovsnpfnPHPb6M4aUo7Jo
         0RQargXjtvYF86ViSkoEytVIKAguMC12g8ntsHOswAZdGEGf+ejPeeuTd7kS9SyotoZY
         6hwYsN7YYec6yudTlcKtJGwu4AwO0VF2H5R+yTx3iH+XjZ4wpoGoGR4k+pizlt8iE2c0
         62Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jah2m/tEOh9h0lymAwcC6WmsIFSaB8GDDwM5FtbgkHw=;
        b=txjIVoeJC7K2jAco+HCpHnJ3a5jKq3TsjS3uWYc2IHjn31H/uGQB+BdElMpzbJuXq/
         PHVYP6dCpwbm0kEAoga4YjSR04UzAXYT/xlCHh2sCDlpMDdBuiWoRVEVsEmdtG9eaAqR
         TkPbNVVLxSkJmvUoAVd+Rstnt12MSCnUuYXWI1WCvGKoHzzO3iFAQmU24fHG4ZXnDwZX
         jsTE0VoqepnkCwf6Q3n/gxK+jBPzUtTmfV3Bel6F3WMUCadxG2o4hhAGkK21Q+uEWq8Z
         rhG6PfPa2pCzgoU4mwIQCNFXtGxW/9kAHCAVkxtv0o2GcwbP3uMYmqJ0aDtlvgV4O0d3
         bhlw==
X-Gm-Message-State: AOAM533VHMmcL6BpoIF3AwtMhiEwtTgarCNMdGcKJ7+cpZo62fS9RnpO
        hUbVAPC1GajJeJ1hPTNsWxA=
X-Google-Smtp-Source: ABdhPJzSLEhfPNTqRJ0JaCbauvlFPsvfjLp4AGNeB5lQTlHyUvPC6crt280vKGWhpZvvRWmXIsFdIQ==
X-Received: by 2002:a05:6000:4c:: with SMTP id k12mr4580024wrx.215.1591806787731;
        Wed, 10 Jun 2020 09:33:07 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id t7sm414430wrq.41.2020.06.10.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:33:07 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 4/6] mips: bmips: dts: add BCM6362 power domain support
Date:   Wed, 10 Jun 2020 18:32:59 +0200
Message-Id: <20200610163301.461160-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610163301.461160-1-noltari@gmail.com>
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200610163301.461160-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6362 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v2: Add dt-bindings header files.

 arch/mips/boot/dts/brcm/bcm6362.dtsi |  6 ++++++
 include/dt-bindings/soc/bcm6362-pm.h | 21 +++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 include/dt-bindings/soc/bcm6362-pm.h

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index 8ae6981735b8..c98f9111e3c8 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -108,6 +108,12 @@ uart1: serial@10000120 {
 			status = "disabled";
 		};
 
+		periph_pwr: power-controller@10001848 {
+			compatible = "brcm,bcm6362-power-controller";
+			reg = <0x10001848 0x4>;
+			#power-domain-cells = <1>;
+		};
+
 		leds0: led-controller@10001900 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/include/dt-bindings/soc/bcm6362-pm.h b/include/dt-bindings/soc/bcm6362-pm.h
new file mode 100644
index 000000000000..d087ba63c7a1
--- /dev/null
+++ b/include/dt-bindings/soc/bcm6362-pm.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_BMIPS_BCM6362_PM_H
+#define __DT_BINDINGS_BMIPS_BCM6362_PM_H
+
+#define BCM6362_POWER_DOMAIN_SAR	0
+#define BCM6362_POWER_DOMAIN_IPSEC	1
+#define BCM6362_POWER_DOMAIN_MIPS	2
+#define BCM6362_POWER_DOMAIN_DECT	3
+#define BCM6362_POWER_DOMAIN_USBH	4
+#define BCM6362_POWER_DOMAIN_USBD	5
+#define BCM6362_POWER_DOMAIN_ROBOSW	6
+#define BCM6362_POWER_DOMAIN_PCM	7
+#define BCM6362_POWER_DOMAIN_PERIPH	8
+#define BCM6362_POWER_DOMAIN_ADSL_PHY	9
+#define BCM6362_POWER_DOMAIN_GMII_PADS	10
+#define BCM6362_POWER_DOMAIN_FAP	11
+#define BCM6362_POWER_DOMAIN_PCIE	12
+#define BCM6362_POWER_DOMAIN_WLAN_PADS	13
+
+#endif /* __DT_BINDINGS_BMIPS_BCM6362_PM_H */
-- 
2.26.2

