Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7FD1F5923
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 18:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730695AbgFJQdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 12:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730689AbgFJQdI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 12:33:08 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9A0C03E96B;
        Wed, 10 Jun 2020 09:33:08 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id t18so3003246wru.6;
        Wed, 10 Jun 2020 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mgTl/QDxn4TQmCxa1B/g2WIYRwMAAuGhWmdBVwlNgB0=;
        b=OJA8GCOgm3W1T6mRWRrRuvk2UsIKp/aq80UWD815Q6ZWn14+pma3Rscmqr6+MHJ5Jt
         qBJhWZ8Hq2qmtzUHSBUAA7XSzcQD2IkVvXJRyYkbowAl+4jfDsSdEQt5MjZTDSjnl8J7
         z/oh+2P66Ld/PoDOmILlenK/i6sO/nbg2aanxeDJVJFd8Adg6efF1U2X+AUlkHSB8O4O
         T/luR9FTh09CI+sWOC3gYv/t0wRbMsNf4uUR/PSIk2ntp0HZssNFiJH2nIgAgpzSexR6
         VVM177a+md6mRQyUTwbovSl9aIcRSl4ctQutF+3u066KyAkI0LHdcayiYY6I1W15Y573
         FqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mgTl/QDxn4TQmCxa1B/g2WIYRwMAAuGhWmdBVwlNgB0=;
        b=SpoFiYx1szAxY6XRLpnuzwnVh7DRfMBjKDNa+aNXMkpJb3h9Ysu2rUnju5q6Ak8huz
         B53LQrtNCH+oxFj8/xtv0Sa1hh1jDpGJuvKt+jIgh798H9k37+8EBNhYCRHtKrW+omIS
         IKkxr2yiBsn8vXu25CBnNjEjxjDFPapi+DCu7EugC5TB4q9q2WZQ2mGpA7/0iOOaON11
         Vlh9RJezrE3+xCpOqXvd/Hc2Yrf/DJSj2k5/OxrvgHZZEDT9nXRHXtfiXPrnbGLTJUua
         ody/mHj36KY0COdRuRY+BJ4iUJo9WMKJRxTWL4Ce28/ZkliQgSaylPSMK/zwfl5fJE2c
         QMvA==
X-Gm-Message-State: AOAM531mmtSiqDCOtO+1poYsuYkGDFN5MvlpyQSFdBeBSOCqRgXpTiKZ
        IDVFPNp58ZZUBftHJ82vycA=
X-Google-Smtp-Source: ABdhPJyqjB6h1TfK5ilab4XOCrY+QpxKWAdqvFNqQCCEKtzYTj5baWJwDG77NOl0Ts3HMp9/GrKZ3Q==
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr4925299wrq.12.1591806786682;
        Wed, 10 Jun 2020 09:33:06 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id t7sm414430wrq.41.2020.06.10.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:33:06 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 3/6] mips: bmips: dts: add BCM6328 power domain support
Date:   Wed, 10 Jun 2020 18:32:58 +0200
Message-Id: <20200610163301.461160-4-noltari@gmail.com>
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

BCM6328 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v2: Add dt-bindings header files.

 arch/mips/boot/dts/brcm/bcm6328.dtsi |  6 ++++++
 include/dt-bindings/soc/bcm6328-pm.h | 17 +++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 include/dt-bindings/soc/bcm6328-pm.h

diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/brcm/bcm6328.dtsi
index af860d06def6..1f9edd710392 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -110,6 +110,12 @@ leds0: led-controller@10000800 {
 			status = "disabled";
 		};
 
+		periph_pwr: power-controller@10001848 {
+			compatible = "brcm,bcm6328-power-controller";
+			reg = <0x10001848 0x4>;
+			#power-domain-cells = <1>;
+		};
+
 		ehci: usb@10002500 {
 			compatible = "brcm,bcm6328-ehci", "generic-ehci";
 			reg = <0x10002500 0x100>;
diff --git a/include/dt-bindings/soc/bcm6328-pm.h b/include/dt-bindings/soc/bcm6328-pm.h
new file mode 100644
index 000000000000..557e1a69b7f7
--- /dev/null
+++ b/include/dt-bindings/soc/bcm6328-pm.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_BMIPS_BCM6328_PM_H
+#define __DT_BINDINGS_BMIPS_BCM6328_PM_H
+
+#define BCM6328_POWER_DOMAIN_ADSL2_MIPS	0
+#define BCM6328_POWER_DOMAIN_ADSL2_PHY	1
+#define BCM6328_POWER_DOMAIN_ADSL2_AFE	2
+#define BCM6328_POWER_DOMAIN_SAR	3
+#define BCM6328_POWER_DOMAIN_PCM	4
+#define BCM6328_POWER_DOMAIN_USBD	5
+#define BCM6328_POWER_DOMAIN_USBH	6
+#define BCM6328_POWER_DOMAIN_PCIE	7
+#define BCM6328_POWER_DOMAIN_ROBOSW	8
+#define BCM6328_POWER_DOMAIN_EPHY	9
+
+#endif /* __DT_BINDINGS_BMIPS_BCM6328_PM_H */
-- 
2.26.2

