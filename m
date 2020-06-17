Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DD11FC8C3
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 10:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgFQIc4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 04:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgFQIco (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 04:32:44 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73178C0613ED;
        Wed, 17 Jun 2020 01:32:44 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r15so1039620wmh.5;
        Wed, 17 Jun 2020 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kcMrYHCVvG7eb53VoYygpr7mXsS07RmyVaA+efRX7Ks=;
        b=n79SNjGu3unLxxnl318lnXDTSc0lzaxQzBrIGMZg7QidK7Et+lu6LAr9jwhPLjqYay
         9uzKw113riKO0jdAw9QXp29r0KxMJcESsJ2NSeoHvtgHyrLb5Xb60ZResEEOpWuqFzZT
         4dyCXFO8Dp+nvpKJj+29b97UMXSX7YodyMw1p+zysNiCJSEQNS1QLuEcQnoiQkTzwbVr
         dqR4QuI9Ps01ASxaKkZE8z+OmqEPoCHzLOxG4fql/iXQgqm2QAQnN78JB+BRbvJE2rkh
         2UOy5XfwDZFp8zT27As5x97EwztJtPDQ6cS6BqKv+mMZplAIAJk5kEW3/KnXkEG1EwS1
         qW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kcMrYHCVvG7eb53VoYygpr7mXsS07RmyVaA+efRX7Ks=;
        b=ZFcx4qjDNlP6PiTnmE0i6ed087DSPwTtd9Ev67xMmeJkjCkTItKzylw73EukX7yEro
         ksFkMnW3kTRxk3nABVM3dFkydJzmXyjNnahn/RAa1MJDOOPvb0tseRSDfma269AkmSja
         cKZIJLahC4DfJlHdVQ7K3phWOcs6rm0HrIzIkGTJUfAk9Je2kbwh8ZeAz7IkB8yqPlt6
         8VrIHaEHqN2Gme1XWUX4mROUGDOdfsClLOcd6D75kYFQPLZsxnwHhRzgYe0MWY/pYkj7
         CWUX4AaNh+j/vlz32ALfIP3bD3uWpZnUIkFIbLOSeC25XK6yXhUvtXe7gm4TMVSnNb7+
         v2cQ==
X-Gm-Message-State: AOAM530MP5PiXP7Xxn8GiTD7/GnnL/Ye7LECjhau8EBObH3q9dYhbaY9
        bJQQc6VS68QMsdDXwVYAZFM=
X-Google-Smtp-Source: ABdhPJwsQoMVZsfku+EjFZPWHyKFHSwjpACWg5i+fIlpLnu/hvP+V9egLWNIECmNZtaeKGmFWItrqw==
X-Received: by 2002:a1c:62d6:: with SMTP id w205mr6995408wmb.97.1592382763173;
        Wed, 17 Jun 2020 01:32:43 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id a16sm32596863wrx.8.2020.06.17.01.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 01:32:42 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v6 8/9] mips: bmips: dts: add BCM63268 reset controller support
Date:   Wed, 17 Jun 2020 10:32:30 +0200
Message-Id: <20200617083231.3699090-9-noltari@gmail.com>
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

BCM63268 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
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

