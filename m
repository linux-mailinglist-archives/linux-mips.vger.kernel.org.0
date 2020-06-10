Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8971F5A61
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgFJR3T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbgFJR3N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:29:13 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80124C08C5C1;
        Wed, 10 Jun 2020 10:29:12 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r7so3239167wro.1;
        Wed, 10 Jun 2020 10:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9oO0hfi76QRWs5/BwNZEwLIi7p3DuEce/uh3f9mTzHk=;
        b=aeKvk9q2WaxdaRC1aQm4ulfvuYJ6Fav4EmKEUj4xXHfizYFYJSb/QgB57Lcz93bLP4
         EMBrqaOJa+HqMYWXBZBVM/7bREsUC82siU6QL51tDv0rPINTR6/LPYfo8+fItxxeRWc/
         ck7lw1/C4tlEasEpe9mw9AHVSwymFGRzGgAuy1+Qg2kXJ1Xfhj6kHkdvWa+tOH9h2AaM
         dVS2kGt7T9zc/eBtr7gOl0Vr283RqucAF0BwDheT2zU6me8Nz338w7ejBtxGCMw5I2lQ
         IR26keipxOdQBsL8FPRcyd0OVsY1j51aDhctq5p9sMA27UbolVGvVsmF2A7n6WY76ccv
         fisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9oO0hfi76QRWs5/BwNZEwLIi7p3DuEce/uh3f9mTzHk=;
        b=YFXh3nr8oD8LR4CIfXEYaozIJgkmV0EYlrk3igpJjAPIzoSDrVdjqYXgnPnTKfXAlE
         g482ciVgM3UfP4ZW0FHv5UL4fCJfp6ppntzr5ReHP5ahtRhCC/ejjaosRpEyAmvf63BE
         iBkRWKY6JFDEa8kPKXK68eQgSFAal9h9MiACl9WYlUGSKxELpyvvk1n/ib+XF2NoAimr
         ycQd5C9xv/vGOrRMVEMAo2/7wIjw2FQxyJopectvRHM0g2XOgBFnmqzRjycKfPBNKdA1
         tVY6Xf78lLFkJS6FKcHPSP7p6JHvnpnxPCMSsbSbc+vLmKy+ATK4DPAPFFnp5i6dsM1R
         N/Lw==
X-Gm-Message-State: AOAM531mBOzJy95rfiAFSQyBO5xwvTep9AT+9tVD6RxMSWaWbitDIgKk
        +MtzGv58u/Za401ScKpo6v0=
X-Google-Smtp-Source: ABdhPJy4ZyP+3ZB2fZw4MiVDvE7qqFRXUsLIhJNPAKKl4Z8hCPGpr7M3VmHAEN5UlsaoEbrh94iDcQ==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr5064624wrt.185.1591810151207;
        Wed, 10 Jun 2020 10:29:11 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h188sm568551wmh.2.2020.06.10.10.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:29:10 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 8/9] mips: bmips: dts: add BCM63268 reset controller support
Date:   Wed, 10 Jun 2020 19:28:58 +0200
Message-Id: <20200610172859.466334-9-noltari@gmail.com>
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

BCM63268 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
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
2.26.2

