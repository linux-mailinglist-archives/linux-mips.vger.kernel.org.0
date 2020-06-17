Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C9F1FC8B1
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 10:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgFQIcm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 04:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgFQIcl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 04:32:41 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9A2C06174E;
        Wed, 17 Jun 2020 01:32:41 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t18so1361280wru.6;
        Wed, 17 Jun 2020 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o+CyA6BYq/HQqImFg0ca5z5Vq/Vwe+d3BBeO+H6RvzU=;
        b=gA+kxzGzFEov6covGJYyrJ3fremZfRegG0h1eQDYRBK8pvs1LIUvIqLvP3yDeqnevd
         vp6UxH7j6puEoY8O0RhRsmLScOW4xfiTnrl4859aAETgnIQTU8Ue0GlUokh7zvouruP+
         +BWkKK+TV2KQ/pmCLe/wj3NFwIbGewO5ik/GpDvIVEz7IiTMAkrpeBqH5vNIC9s3cPv9
         zuTtB//XqOhA3Kd2iHxjtcmXKUwklFlmpEqwB6qRpZyidOd7oIzTONM5YUKEBb4cUFdP
         jgZarU6oW2sfUElvdF1V024dDwYJctTCuEZBDzepRpLHIRdRjpBFuOI6AYflKDU/OjEe
         9R6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o+CyA6BYq/HQqImFg0ca5z5Vq/Vwe+d3BBeO+H6RvzU=;
        b=QpHu/JexIrmcknt9bmHqmkio4/FeautdFDrF3xPFdgNhjcOx0a+sQDtYLr5a7wj+XR
         VrSgqdcRpLdC4pSyTUIPVF5vxtC8Zxq3D1mnuDBwZtfB+3bRPTgUoeRlMk+djy6VG1Ev
         2TtcMi9MmIIbX9P7+WU7+aF57qjKZgzYzYeIoK7jwNYfVlSfhgBjuphZrFZbVXveQfSL
         tOfs6Pa160XCktyZ6kHuBwET963EP6gVKFK3AA6W/Hixlk9f7gcASlLSVmUYyarPj4H1
         WSNmB1YkAuvxxejtUSfAieEPzh4yQzO8XSTlHfXeT/iShNQ0Oy7lciKTv+8oPUmNNXb8
         FVAw==
X-Gm-Message-State: AOAM5316sQ6HHV/knWv/sCL768z49V9bKDeb6O89jQufqG4cIdrq0/QC
        V9tfq2DMZsJNCqfzFrtHZks=
X-Google-Smtp-Source: ABdhPJxf3YTZ3ncuXS3ZgsprXSt11oVMALJwy7GILUSQNVzKDo2tIeU2KP7yhGniWhMSiJ6pvUFUIQ==
X-Received: by 2002:a5d:49c4:: with SMTP id t4mr7094341wrs.127.1592382759759;
        Wed, 17 Jun 2020 01:32:39 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id a16sm32596863wrx.8.2020.06.17.01.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 01:32:39 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v6 4/9] mips: bmips: dts: add BCM6328 reset controller support
Date:   Wed, 17 Jun 2020 10:32:26 +0200
Message-Id: <20200617083231.3699090-5-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617083231.3699090-1-noltari@gmail.com>
References: <20200617083231.3699090-1-noltari@gmail.com>
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
 v6: no changes.
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

