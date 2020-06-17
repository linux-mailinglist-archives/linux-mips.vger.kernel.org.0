Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707771FCB50
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 12:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgFQKuv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 06:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgFQKuu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 06:50:50 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4DBFC061573;
        Wed, 17 Jun 2020 03:50:49 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r7so1844866wro.1;
        Wed, 17 Jun 2020 03:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z+9RWAx8eDY3BjryEj1kR82wcBWupAAqs97VDpee1Rk=;
        b=lNCu+YU6uIrD95Hz6WWcVsjxxNlbJC9KRjW4ukM1kwjf7nggvkY4nDzMuLW6QSv/rO
         WVrwD6xswaP7yyayXIYwDyfGYo72gw0P9cSKO8cwpSsDiYFAXfrGY/ZQ7hTTvjN9T8Sx
         xJonigszt/PwIcyz78OpjoLCjxkk23W5Vy/K4rrAHKjOSWIJjc9ojtbUnz4j88MRZdnn
         yvExRC3PT3xeUV2GzN6Cb7lRigJlHzu4PDW9XXzc+38PVOJAdFxmUd/DTkkTWjQpa02M
         E4ARlBzHuV4h92EOrP0nZMnvjUocqjP1JWCqv6mXxyOrfC4PuGmHqBF2xDySDel1Klt1
         YEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z+9RWAx8eDY3BjryEj1kR82wcBWupAAqs97VDpee1Rk=;
        b=csBiTjEXfB41/Vf/UZYLeMUU9LxIjlfPPEnDSW4wLzhDMSDquutfVm778UfXMkZK2x
         3L4XDwL4AAsmYLmguCVXvYwDOfqmORLY6T+Euaf6kt8hGIbMUmtLlu3KaKdC6yj+/OrL
         fCzVCGCpC1hdq7jwCJ6zEKWdK2r9jhaouKxwdHmsPy4nS3bkAqHTD6Dy2XxA/XXnVOBD
         LkTmdeWu+Ja6qtrK9axlosb2j861oOvlt16eJbiwWblC9S0balQxEFa0ATwnokroD4KC
         BAVW5qty76rUDiFsoB6XSaWroGki6ayakU8U6LHhJ1SLgNwKBMp7kHzxYTkV/9DDIoxU
         1UMg==
X-Gm-Message-State: AOAM533RbsWOJg4wxLAjSTtct8Yx+WrF/PrEntaameyWs3iTVT27Kb7f
        1GflHgbROOU+NRLQ4/rrkvo=
X-Google-Smtp-Source: ABdhPJwHz+uV/jJmlstvV+BagjqRxmpoPQUkexczyrAYbLUJdyfFXQPPkSBG+rMQFtRSd2JPMtnwMQ==
X-Received: by 2002:adf:ed87:: with SMTP id c7mr7821729wro.108.1592391048038;
        Wed, 17 Jun 2020 03:50:48 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id u12sm33331927wrq.90.2020.06.17.03.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:50:47 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v7 4/9] mips: bmips: dts: add BCM6328 reset controller support
Date:   Wed, 17 Jun 2020 12:50:36 +0200
Message-Id: <20200617105042.3824116-5-noltari@gmail.com>
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

BCM6328 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v7: no changes.
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

