Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58981FCB62
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 12:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgFQKv2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 06:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbgFQKuu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 06:50:50 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667A2C06174E;
        Wed, 17 Jun 2020 03:50:50 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q25so1498272wmj.0;
        Wed, 17 Jun 2020 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lkwxNYc8+p5wlTPi+QbFvKZuq2LERGtqK/cmyvg1WyU=;
        b=mngr/72jBc/BYYoAmQIyE3RSfdIQ1RIU4J2Sawq9hUZzTjlXiL2QfJIEUWI8I+6It4
         ormCefBOJNJ5UT64mERy1cGz3vfWp2CPIk1zQkoWe/VbSWL/UtUv2Pc4nR7Ivzm+MwDy
         3vS/1TI75oA/YAVd5GAr73hoLETc0dfRthJODs9xqaRhJzaksbBXvb2PV4Nk4yzPznro
         eZ7736OJoXfAw8vxH2+Hr23w4DRdCTJ/+GVdMDXxwW6v5LhEZ7B7QPlawdWs7S7udp8D
         H+IYAOSBEy3FnivzC7uNsDsNqDF2SxG2haU66FqJ5gZQAFZV5fGQLDoNEAAXjsbFeg0d
         eVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lkwxNYc8+p5wlTPi+QbFvKZuq2LERGtqK/cmyvg1WyU=;
        b=MUFJWogh256Tc/+pd34w2vQEmUnpVfl/ogslbIza3H0j0ZSr563gxMxS+mKCNn9bqE
         ewdn3a1JcXKRSUsQb0h7tMS9RwaI2Nys2SfpHbH8oHMk+6Y43nn0RgKFDXDTOf8djLKB
         sk8OMOAE6l5XYOhwRUybsl05N6ngfRIkQ3m/E+Aoaly7IN/4rmMiNrzyoJNbPz/n/7za
         7Hon3BizxA9HX/25ju8Zu7Oxmk1neXRenxKBwwiPqGdU7tOYn9ycsUFQU5wVZgq0uMaA
         +mpOLlWyEm8Zr6RAAqyjlTuI9urbAbI/KVYgrWfb6q0IRty48Eaq7rIIo+XZS98jkwG9
         HT0g==
X-Gm-Message-State: AOAM5316MUOxBV4NCU3MGcOtNNfaqVbJNmbfq/tOo/IEio6rqsXX2m+t
        AdohsHUKG88P3lu755QkXXc=
X-Google-Smtp-Source: ABdhPJyzc1TgIozo4EoM0qqori3t224XG/EQKxX5qj0nl582gZVhkYh9F1FMiHd6vg9utSmJD1vw1A==
X-Received: by 2002:a1c:5445:: with SMTP id p5mr7557409wmi.115.1592391049055;
        Wed, 17 Jun 2020 03:50:49 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id u12sm33331927wrq.90.2020.06.17.03.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:50:48 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v7 5/9] mips: bmips: dts: add BCM6358 reset controller support
Date:   Wed, 17 Jun 2020 12:50:37 +0200
Message-Id: <20200617105042.3824116-6-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617105042.3824116-1-noltari@gmail.com>
References: <20200617105042.3824116-1-noltari@gmail.com>
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
 v7: no changes.
 v6: no changes.
 v5: no changes.
 v4: no changes.
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
2.27.0

