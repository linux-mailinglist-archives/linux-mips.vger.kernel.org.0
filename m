Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310D91FCB56
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 12:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgFQKu5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 06:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgFQKuy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 06:50:54 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E514DC06174E;
        Wed, 17 Jun 2020 03:50:52 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t18so1822557wru.6;
        Wed, 17 Jun 2020 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VPzTGDK9IokIsGvMPuu4MwOewjqv0Dg1ngD5vhIfqUA=;
        b=En9Qn96DRgSurAb2aoZPJWsbMCeu+e1K5a9imF7R+gxHOYg48u5R546rneTkTh22o6
         slnP1zFlRCp5OVNAYpLQE5W4iIvF0y2SHbqyMIa67FAYxBO/ZYdSXU0GFhc1BKC/qfKY
         pfKHCPaAytzoRNvHgvFslkyUnLH8O1Ritt+PFR8oSgZ42fRq6LotQoOiWHSPrC7Tl46Y
         TDGzDMF9a5K29R+oFInclEjAmjfwNGypyCTPPTmVNBMyfCCgICv9n7974rKGQTJohZMm
         CS37z4PMb8VHA/zqHvpR44RWh1GhubmKZdgGT7FQTr/kWcvGH9+R1hJf2FFLz4AFCo3A
         ofOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VPzTGDK9IokIsGvMPuu4MwOewjqv0Dg1ngD5vhIfqUA=;
        b=fgCxA378z3OrHpHAvkoZThNJDD5E11GSyhQOVl6lsHCmAH7VEJgjeH1Q4Dp83YhLkv
         iQ87BBjXAirBeeus3jYVpgnEnZAO4bh67IXTVnhoVSl6e++lOwKtEePpHanm3siAlj2i
         cz/i1W8gkHnNeLqLV3r++847mXyLlT2Su66gd8IP+DRtsq26FLf5dyPVzw5N4QXGeCW4
         Tf5Xzb8xkELZWs+AKE2H1YeIC8R6mWAD06E4A7aJ5sdYLhVq+9FZVHoTZbG/9wta2cZR
         fIUkijQZZvnaOPvXAv+spfrEc+oTsAgCFt85TBJkJVqRtEpjFm2tC2hmzTGt2m6q7kMz
         9e9w==
X-Gm-Message-State: AOAM532mnpSjX+yYQd4nvl04HMoZ+J7A+VOjKAwvIQmGx54oGC60CnmK
        U5qH5MC3eKYVOrzMNL08cgI=
X-Google-Smtp-Source: ABdhPJzBlEvwI6RKd/GJkmjY2zB2MQkRcbeTNkGMLvX53kYKmsvrJ2NuyeH9gIooKM+8Qfs7QzbqaQ==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr7903298wrs.356.1592391051612;
        Wed, 17 Jun 2020 03:50:51 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id u12sm33331927wrq.90.2020.06.17.03.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:50:51 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v7 8/9] mips: bmips: dts: add BCM63268 reset controller support
Date:   Wed, 17 Jun 2020 12:50:40 +0200
Message-Id: <20200617105042.3824116-9-noltari@gmail.com>
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

BCM63268 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v7: no changes.
 v6: no changes.
 v5: no changes.
 v4: no changes.
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
2.27.0

