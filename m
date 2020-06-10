Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F44F1F5A71
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgFJR3v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbgFJR3K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:29:10 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F7DC03E96B;
        Wed, 10 Jun 2020 10:29:09 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j10so3207011wrw.8;
        Wed, 10 Jun 2020 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDQnO/WRL6Oy9UYPQNfg6QcCKKXipYus9GuqMg/8PIs=;
        b=n67mPQGBoETm3y6Kz1mqE8Grxjy/YQwAQxewSouYnlGixejvCP5UiFlDfRsNW7tPuv
         WCAv7pwJAGOP34U0Srh8fKpQvaQLZmSJGjfLJvph6IwYiBrPEl5Kh278svVQBhUPbIgW
         QQzJJFTPRMetxeJkMIzt59YsxerOtCismBuNwqSMjDku76TRmU0zoBzqfF9YOx38xKOp
         +cMS3laddg3EG6JdpA0cU5H8Cn3H55FGq3C1zt8nDUJm00kQ7Kn0b32kDXSBLux7GKT2
         yuNW+DFHmDLcjSeMJPdyolEmbF9Ku/LE1jjzBtRPI6erloVBdo6VJBmtdNC/8UPc+efU
         uoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDQnO/WRL6Oy9UYPQNfg6QcCKKXipYus9GuqMg/8PIs=;
        b=JdLuBZxX6vxJ2t/VrIhRnmsCiG+QNRu5uhc21UL66ThWD3kAWvLqIiYNrAh5RJVqLF
         3231IaApEQWxVLd68IJd96GbM8nJwm4P58YdSNSo515gCkOrVwZiC85UZ/pXCggHiNGU
         TlFdttLx7n9rrGkuLKQ2c9Z1tb60lYrC40oB8A47tflHa/jeJaeGCTPFwd0nGX/Zako9
         uuJDWSL36jY2LLfuU7jIojhn8CIJHTP2BFZTHtZkkbwzBuxGHIFZcGdRhnCzGh14K4a5
         P5fQLDnrk8EjBph6yCCMken4qUaWUtrvVFpHMHEtBrxMDutqQxO6MKmkw6z0vmYXqcSe
         C2Pw==
X-Gm-Message-State: AOAM531tcetwv9a9ovHGtSxE2D4RKzYgNJH3rK6k499Q2quUhKeK0myA
        Gzrwc5X3NVQCqI2RpZHMj3I=
X-Google-Smtp-Source: ABdhPJwVD+RZFXeN2WWFr3aBPM05gocueCVguO/rWXaV8VO2q9jnnEvsf56fsrOCJXro9r/32vo/Rw==
X-Received: by 2002:adf:e588:: with SMTP id l8mr5210615wrm.255.1591810147910;
        Wed, 10 Jun 2020 10:29:07 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h188sm568551wmh.2.2020.06.10.10.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:29:07 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 5/9] mips: bmips: dts: add BCM6358 reset controller support
Date:   Wed, 10 Jun 2020 19:28:55 +0200
Message-Id: <20200610172859.466334-6-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610172859.466334-1-noltari@gmail.com>
References: <20200609160244.4139366-1-noltari@gmail.com>
 <20200610172859.466334-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6358 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v3: add reset controller definitions header file.
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6358.dtsi      |  6 ++++++
 include/dt-bindings/reset/bcm6358-reset.h | 15 +++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6358-reset.h

diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index f21176cac038..9d93e7f5e6fc 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -82,6 +82,12 @@ periph_intc: interrupt-controller@fffe000c {
 			interrupts = <2>, <3>;
 		};
 
+		periph_rst: reset-controller@fffe0034 {
+			compatible = "brcm,bcm6345-reset";
+			reg = <0xfffe0034 0x4>;
+			#reset-cells = <1>;
+		};
+
 		leds0: led-controller@fffe00d0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/include/dt-bindings/reset/bcm6358-reset.h b/include/dt-bindings/reset/bcm6358-reset.h
new file mode 100644
index 000000000000..bda62ef84f5a
--- /dev/null
+++ b/include/dt-bindings/reset/bcm6358-reset.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM6358_H
+#define __DT_BINDINGS_RESET_BCM6358_H
+
+#define BCM6358_RST_SPI		0
+#define BCM6358_RST_ENET	2
+#define BCM6358_RST_MPI		3
+#define BCM6358_RST_EPHY	6
+#define BCM6358_RST_SAR		7
+#define BCM6358_RST_USBH	12
+#define BCM6358_RST_PCM		13
+#define BCM6358_RST_ADSL	14
+
+#endif /* __DT_BINDINGS_RESET_BCM6358_H */
-- 
2.26.2

