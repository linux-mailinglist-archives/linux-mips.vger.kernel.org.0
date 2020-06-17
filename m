Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E511C1FCB5C
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 12:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgFQKvO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 06:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgFQKux (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 06:50:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDEBC061573;
        Wed, 17 Jun 2020 03:50:52 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t18so1822495wru.6;
        Wed, 17 Jun 2020 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1CwmoCVnTINSQnAbLAfkmEGV50yYwRbUo3wBwxU/aZg=;
        b=aPaPmobH6FAjDsYeVouJT5wVWCYi6vLtR5hRSPZnysEgC6TL0t5WDpMRg4BjCbpy6m
         1bZJMwqsDgczeEOIqv845C2qJcUJhjMdaGgBr0GbAfLBC30Eod2EzI7DymHOTXSd5NZE
         Z2RmXfwObOtOpeo7y7L0fN18GkE3qrAnLIp2b1zlV0LHVaC0KN47EW/eubSk8FDWk/1t
         oYrP7V0G/0XDBi5LDhlRDEzyJPeuXyOWf5S1Kp1qUDzR6/dLmTeKFwuBLvDS4Ll1Ejdf
         /NtGdhuvWZf4+3E3d9EPg6xnYB7z/qro+1P0xtbhBsPvqTVxFP6Tlk7w4djiTxMxhN9Y
         A14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1CwmoCVnTINSQnAbLAfkmEGV50yYwRbUo3wBwxU/aZg=;
        b=oFsAejqlIPS2Ioyuk3LX4ZKNen3/MFl113WaBoRyrGaOhEgG2OOWJGO/WpDOSVjPrv
         hIXxEykkYiBEax4KAdSbRT4HAPtXm8XbZMf9061owMnqA4OAz/IP68T/IzwXgMkCh1Ps
         FhRXT4EzzWj+mq41iFmcD5juuXvLg/1z+argrviBhmk5zlLN2TcKT33Ea0/m3LsWJYCG
         rPhwnW2db+Kq1jisIGPsVOVZZ2v/f9gsXR1QiUizSg1AxiNnEtfvNGUmUiNbTbVXSGeR
         yAKbL3NZoLL24NkxLLZqtBXM8qku5o9EcVwzzNPEJc0oec+RvDZKoxBmRM41mhmo5XTK
         kGVg==
X-Gm-Message-State: AOAM532rzLrsOcliyooKsApKRddg3NxlRtbhfAeo7puD+xiiycP92aVu
        rlunU9nabns9p9Xc9KOowPw=
X-Google-Smtp-Source: ABdhPJz9anm2OpTkq5YzL7Ca6Q0ZmEpcJIZ9cZ6FT7KPA35qytxQX4qeDqj2aVMrBCcib1HRhS7ooQ==
X-Received: by 2002:adf:f149:: with SMTP id y9mr7981277wro.208.1592391050798;
        Wed, 17 Jun 2020 03:50:50 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id u12sm33331927wrq.90.2020.06.17.03.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:50:50 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v7 7/9] mips: bmips: dts: add BCM6368 reset controller support
Date:   Wed, 17 Jun 2020 12:50:39 +0200
Message-Id: <20200617105042.3824116-8-noltari@gmail.com>
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

BCM6368 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v7: no changes.
 v6: no changes.
 v5: no changes.
 v4: no changes.
 v3: add reset controller definitions header file.
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6368.dtsi      |  6 ++++++
 include/dt-bindings/reset/bcm6368-reset.h | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6368-reset.h

diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/brcm/bcm6368.dtsi
index 449c167dd892..52c19f40b9cc 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
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
diff --git a/include/dt-bindings/reset/bcm6368-reset.h b/include/dt-bindings/reset/bcm6368-reset.h
new file mode 100644
index 000000000000..c81d8eb6d173
--- /dev/null
+++ b/include/dt-bindings/reset/bcm6368-reset.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM6368_H
+#define __DT_BINDINGS_RESET_BCM6368_H
+
+#define BCM6368_RST_SPI		0
+#define BCM6368_RST_MPI		3
+#define BCM6368_RST_IPSEC	4
+#define BCM6368_RST_EPHY	6
+#define BCM6368_RST_SAR		7
+#define BCM6368_RST_SWITCH	10
+#define BCM6368_RST_USBD	11
+#define BCM6368_RST_USBH	12
+#define BCM6368_RST_PCM		13
+
+#endif /* __DT_BINDINGS_RESET_BCM6368_H */
-- 
2.27.0

