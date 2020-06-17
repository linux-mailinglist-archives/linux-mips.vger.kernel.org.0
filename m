Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC35B1FCB5E
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 12:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgFQKvP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 06:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbgFQKuv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 06:50:51 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3658DC061755;
        Wed, 17 Jun 2020 03:50:51 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r7so1844963wro.1;
        Wed, 17 Jun 2020 03:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jj+NgUXyPVtjRlKAsLUW1Ywg7sxz/gprDC+dItpQr40=;
        b=Ig07ZXPfXkckFhtMZW6TsfFbMnr006DYVz8Tz8/sGE1WfzsUnJaVxgWUfgOZwY0Ipd
         zmuzViUZpSuzpCX+XkRT6XAzJ8q5+xbhQwKpAvovUZ2NJQllqUG0+0nViA1DbIVpRike
         hpFirA5gX5s5PFK0JM925zT3r3ntGwPHbACIIEKaSJzpmso5xHDHwuCrGCbDTXveemho
         Fzab+nOee8Dt8/0WAgby1o2jBpi1hKny8Fx0EgtibwZXGCJ+jP5tFd0vwV++pZYmzu1u
         28mlzDgbkhUnb46s3cNk2Co5oTT2CF6eTjSfBc0sbjXLrQsgfmNArOynmorhiP3tGoIy
         g7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jj+NgUXyPVtjRlKAsLUW1Ywg7sxz/gprDC+dItpQr40=;
        b=nf2dAa2DU0g9lxf/6aaD0rFWWK8NK2BxLRoHztd+1/udbLse8M+xF9A3RBGVJDSuWO
         8wdhvyCkiU92J/9/Kkt7noLGINlUsZsdIiKBy3xcBQJBLB2tCUe0XQiqsBWol0zGO/dL
         rBMckwjCtkd7C7tveAEt47kfEQ64Vd+jHmCzwnXrMQoA0J7F/T/NbYGaZTjZwpNdOIIx
         X33h9RhQE55UoLMnZB62oTGroTAtPkITSzFEzp9qdfEo8pS7wlT1Ux6dzUPh2P3wERuE
         mBO7unaffrjlMw14G38TzgXlk0I5QLcbxQHIYgsiWYs4Ud4hDqP8wJDJCUVlwQV6BNa7
         /qrw==
X-Gm-Message-State: AOAM531GPH3Y4k/A6tdpYzLwq45MrmNjF01gwg40FvBqg8heKj8eifcW
        HTvZIgbDff7HSv/pypTnBIw=
X-Google-Smtp-Source: ABdhPJybvjQGZWCKdAYA5oWW1ihs+kacZo9wJ0YMZ18w59iM/Avb811/OrAFsDOK8pDzYqayq6oufQ==
X-Received: by 2002:a5d:61c6:: with SMTP id q6mr6561938wrv.282.1592391049861;
        Wed, 17 Jun 2020 03:50:49 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id u12sm33331927wrq.90.2020.06.17.03.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:50:49 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v7 6/9] mips: bmips: dts: add BCM6362 reset controller support
Date:   Wed, 17 Jun 2020 12:50:38 +0200
Message-Id: <20200617105042.3824116-7-noltari@gmail.com>
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

BCM6362 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v7: no changes.
 v6: no changes.
 v5: no changes.
 v4: no changes.
 v3: add reset controller definitions header file.
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6362.dtsi      |  6 ++++++
 include/dt-bindings/reset/bcm6362-reset.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6362-reset.h

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index 8ae6981735b8..443af6b4c838 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
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
diff --git a/include/dt-bindings/reset/bcm6362-reset.h b/include/dt-bindings/reset/bcm6362-reset.h
new file mode 100644
index 000000000000..7ebb0546e0ab
--- /dev/null
+++ b/include/dt-bindings/reset/bcm6362-reset.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM6362_H
+#define __DT_BINDINGS_RESET_BCM6362_H
+
+#define BCM6362_RST_SPI		0
+#define BCM6362_RST_IPSEC	1
+#define BCM6362_RST_EPHY	2
+#define BCM6362_RST_SAR		3
+#define BCM6362_RST_ENETSW	4
+#define BCM6362_RST_USBD	5
+#define BCM6362_RST_USBH	6
+#define BCM6362_RST_PCM		7
+#define BCM6362_RST_PCIE_CORE	8
+#define BCM6362_RST_PCIE	9
+#define BCM6362_RST_PCIE_EXT	10
+#define BCM6362_RST_WLAN_SHIM	11
+#define BCM6362_RST_DDR_PHY	12
+#define BCM6362_RST_FAP		13
+#define BCM6362_RST_WLAN_UBUS	14
+
+#endif /* __DT_BINDINGS_RESET_BCM6362_H */
-- 
2.27.0

