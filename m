Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD79F1F5A76
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgFJR34 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgFJR3I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:29:08 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3875AC08C5C1;
        Wed, 10 Jun 2020 10:29:08 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x14so3225332wrp.2;
        Wed, 10 Jun 2020 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x+hvC3ZW30ns0eeIUeQCGr4PKw/Uzw5EHnwdcBTud6U=;
        b=Kg6JL7tBeWlE/LOJUa92Qu2Kh3iU1VT9W869npbS8IcQQfGzcQAJo3ZqM0x8RVNGxG
         DAqBh/YeXIBqM4Yb1vzJ+LRgRGfNIiXIvTNA/lRav5p2TRM2OG01gsSRXmiX81THR9hm
         SQ10iw7COc+rg3/v8nTB2JgJ1P2BAG8wgXXyvO9YOJLGsVl2vt1XriSGEFJpaLGU+FNI
         S2Je2+xeh/f9IZXUId7tx5lcCBdAyR6zHzDKr9KaV7JiQFqqmSXJ0mZRyAgpWfLCl7ZN
         h00eJpyMNdB7C0UaRgM3S/bwKZ71d5N8pN33FGJziVFj/KvVfpvFPMnA2Lbv6m/yJxlu
         5+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x+hvC3ZW30ns0eeIUeQCGr4PKw/Uzw5EHnwdcBTud6U=;
        b=ehReI4gfK3Edvb0Q9AHYYd3/P7PcKsgxk9n9aalYOVg56snnHS81kwbtZn7HsWE3vG
         MW3B9s+GgKa+mYN7u7oCOs5cp49MIIsVdRoO9nop6zJ6dGlubC++Cfm1c1omZJ5pW8ws
         tMB9pp2B70yB3hVCiPOYy89i1IW0uTU9d3MJTc1DYdCEAclMsKNe1Ku1XacgUWbsude2
         diMp0qhRLRB6x4S9AU9ZC3VgL2sVq5+w0gVJSu987xLHl2t8YbdQZ2Gs1kRfsv1SjUri
         3+FfVouw0go7G8HYESlO5Ptz7OwqSrHfRgLA7OSiQO2YITpX8fJP5FBP985v9CDzU/rl
         8q9g==
X-Gm-Message-State: AOAM531Agw1dIaQgvnkAZaHQ3afIO27DpjuhDY8+GXhjSA1340tKSBLH
        fvPrNi1veRyUKRFHWfpES3FG/zwcCp4=
X-Google-Smtp-Source: ABdhPJzzzJ7QbY/s//lkvWEv1JdEE8mPBTXzXVgLq5YHFBA0Ru9Mgwq+7emjEvCXQNpRc11xTSOF9Q==
X-Received: by 2002:a5d:518b:: with SMTP id k11mr5272384wrv.58.1591810145435;
        Wed, 10 Jun 2020 10:29:05 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h188sm568551wmh.2.2020.06.10.10.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:29:04 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 4/9] mips: bmips: dts: add BCM6328 reset controller support
Date:   Wed, 10 Jun 2020 19:28:54 +0200
Message-Id: <20200610172859.466334-5-noltari@gmail.com>
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

BCM6328 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
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
2.26.2

