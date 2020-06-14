Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506C41F87E0
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 10:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgFNI7U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 04:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgFNI7C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 04:59:02 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A270AC03E969;
        Sun, 14 Jun 2020 01:59:00 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id r9so11726768wmh.2;
        Sun, 14 Jun 2020 01:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=neX6E8hntC9fT3Zj0KGtyILAtZYWImGCNunXFjoeSWw=;
        b=p6n7E5f6Xbo8BbxKNo+srasve4AEbgc7TE/KUb10qP4iIlYFazWt1f4skY9WWHlySC
         VrtYU/ieeyrcDY5fAMBnBvdACXz3qxrpXcDms8swD3KMYGexEUEmQeFW87TkozhPY1JN
         F1oDKSjEKUglgbB3gp2Bc9VFTtzR2f/pK32hWSUMw+1YXbOqMKGUDCrlaedWHT0iX7Ft
         lVio440UhF7CPk+oyoBetojE/z9F2ansuVj/iiK/kd7bSIz+BzMiDUKC0ql8Hsu2qssB
         yJha8UZIA4ZiimtN46Xo6IfYeFt3E6noeHC+QuwUtfgShfdgQFXX1YsGRb0hWxy26Uc+
         4IeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=neX6E8hntC9fT3Zj0KGtyILAtZYWImGCNunXFjoeSWw=;
        b=BsYQBpwki55R/Z6YLHC0AB4sHDAJaYsVSG6tLMM31/wyDcmPe/gkBvfeodN8aZJwfU
         YRSrl7oafZx5BwXJXo0dOGcTmo0oMRV0jp9wjjNDO20kp1lyCKxwGZSIj0UukRz6oK4q
         bOvH9vIelNyiBi7skiiWbYTDHt8o65hUSNPVBo71eyErTxcqaxyrN+9Xi21J08uw1GES
         DMMw58+0jD2KnHsp0fc2in3s/006bMTytTkjlMnPgNk7GBXB6b7+HiM291I2BCLgbO88
         df06376XzC+uscEW0koGWVsML9l7Q2MWC2PiBGdMs8WkOwWQUa6i5jWRquFRtwm5fOJX
         d8fg==
X-Gm-Message-State: AOAM531GzAdp+SOzh5eLSgn+pZM3BUA23hnoG9DuU60hWvhPtoePKiOH
        N4nqpGQqdTLTfb8l+YDl1gY=
X-Google-Smtp-Source: ABdhPJxQQaoZ8QCzWUqJWbPLWO7DKq2+qsuKVgIrFjCVMHTzYwjQQ9jpvTpAGbpKe2sTUHcrD2Em8g==
X-Received: by 2002:a7b:c201:: with SMTP id x1mr7357312wmi.58.1592125139013;
        Sun, 14 Jun 2020 01:58:59 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id u4sm17174043wmb.48.2020.06.14.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 01:58:58 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v5 4/9] mips: bmips: dts: add BCM6328 reset controller support
Date:   Sun, 14 Jun 2020 10:58:47 +0200
Message-Id: <20200614085852.2130147-5-noltari@gmail.com>
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

BCM6328 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v5: no changes.
 v4: no changes.
 v3: add reset controller definitions header file.
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6328.dtsi      |  6 ++++++
 include/dt-bindings/reset/bcm6328-reset.h | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6328-reset.h

diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/brcm/bcm6328.dtsi
index af860d06def6..590118cf5c12 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -57,6 +57,12 @@ clkctl: clock-controller@10000004 {
 			#clock-cells = <1>;
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
diff --git a/include/dt-bindings/reset/bcm6328-reset.h b/include/dt-bindings/reset/bcm6328-reset.h
new file mode 100644
index 000000000000..0f3df87d47af
--- /dev/null
+++ b/include/dt-bindings/reset/bcm6328-reset.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM6328_H
+#define __DT_BINDINGS_RESET_BCM6328_H
+
+#define BCM6328_RST_SPI		0
+#define BCM6328_RST_EPHY	1
+#define BCM6328_RST_SAR		2
+#define BCM6328_RST_ENETSW	3
+#define BCM6328_RST_USBS	4
+#define BCM6328_RST_USBH	5
+#define BCM6328_RST_PCM		6
+#define BCM6328_RST_PCIE_CORE	7
+#define BCM6328_RST_PCIE	8
+#define BCM6328_RST_PCIE_EXT	9
+#define BCM6328_RST_PCIE_HARD	10
+
+#endif /* __DT_BINDINGS_RESET_BCM6328_H */
-- 
2.27.0

