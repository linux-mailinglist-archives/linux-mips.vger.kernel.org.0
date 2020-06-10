Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8341F591B
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 18:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730708AbgFJQdL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 12:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730704AbgFJQdK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 12:33:10 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7C7C03E96F;
        Wed, 10 Jun 2020 09:33:10 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id x6so2969732wrm.13;
        Wed, 10 Jun 2020 09:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PdAC7nSmr9OcvsOrg8mrZI5Ne82Ui94dUn7AYElcx+A=;
        b=bZcNGl3VEEqJ3YNGmR+Nv9+88gyP4/H/paKxnh18Rrlj/66kxMouAyChn+kHPQONvc
         qd+Wi6/9zcUPBHINkgf8jukNJdL/2FTfdS4gBfiq9Q4d2vghjxyn4ZrYW2W5XSA0LjWI
         PfJzTLvNZC+Q0NVXAOxEz9oCubG+bF96wlnpAvCE3LA7tnc6uORuXVU4nkYczhxBJ9CY
         qK9zM/AJArWCULUocJeyfdf90WIk1r6wvbAjgiuBxW6PKFS9ugxRbBCvgI9UfguVnYX0
         9BBVaQz5XuU81RtnAGeD1eEf9vTa1Iw1I0viJh7DY1fzCYTMjuaAGbA1StiMt33Gtcu+
         xmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PdAC7nSmr9OcvsOrg8mrZI5Ne82Ui94dUn7AYElcx+A=;
        b=uXO/B3XhX5LygKuFti24uwft25ykGvjkeqCjpYS19KXah+bb1Zr9s94m5SMt6weU0C
         pxE+FyBsCrVDk30gVskEO0W3tBwsA/iqDbWdW/PG0TKvAQv5wqwyYuGsv9/2DGSEc3RR
         9xaCu/wkQqsxaS2UWT3tBkt/E/zF5b631EHcmXLqQLFZhoV3m6CaFt4eUvAYqO82gwXO
         zDTzNW2RRviubQp63lNw9aNkxgHhx4x4NWeO7CjYgawL5DJz3ZFnj+QyB864ha8iLHBZ
         K8c04iWMgBdFOxsY8snyjvvPSn1IcDERhcNogkhdF1LcBogSsf7u3I6gr4RJzDK/71BX
         DNZQ==
X-Gm-Message-State: AOAM530pslRcS3g0inM7D904ExjX7oM64zpW1bq1Ty0XlK8gAW13jGqE
        pk6kXVLFXkGdt23fqrsxYM8=
X-Google-Smtp-Source: ABdhPJz4wCusR0P+cPejtgrMS05sa8pvJxH+wOk9udLYOQpH3KEq84gS9fl7rpb016xQy3I4DhRxLQ==
X-Received: by 2002:adf:f988:: with SMTP id f8mr5035336wrr.81.1591806788834;
        Wed, 10 Jun 2020 09:33:08 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id t7sm414430wrq.41.2020.06.10.09.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:33:08 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 5/6] mips: bmips: dts: add BCM63268 power domain support
Date:   Wed, 10 Jun 2020 18:33:00 +0200
Message-Id: <20200610163301.461160-6-noltari@gmail.com>
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

BCM63268 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: Add support for BCM63268 too.

 arch/mips/boot/dts/brcm/bcm63268.dtsi |  6 ++++++
 include/dt-bindings/soc/bcm63268-pm.h | 21 +++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 include/dt-bindings/soc/bcm63268-pm.h

diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index beec24145af7..5acb49b61867 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -117,6 +117,12 @@ leds0: led-controller@10001900 {
 			status = "disabled";
 		};
 
+		periph_pwr: power-controller@1000184c {
+			compatible = "brcm,bcm6328-power-controller";
+			reg = <0x1000184c 0x4>;
+			#power-domain-cells = <1>;
+		};
+
 		ehci: usb@10002500 {
 			compatible = "brcm,bcm63268-ehci", "generic-ehci";
 			reg = <0x10002500 0x100>;
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

