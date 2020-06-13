Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8281F8206
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgFMIiv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgFMIiZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:38:25 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490AEC08C5C4;
        Sat, 13 Jun 2020 01:38:22 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l10so12141438wrr.10;
        Sat, 13 Jun 2020 01:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bwRH+WewBBOgjeSjhH56GmNfI8dMvNqDHN6W9LzpbZE=;
        b=qF4kJ7+LfhZMBG0mCibMo9k+UD50J8hjjmGfF554Lmv832Brqm1Owwmn9u/3k7b+i6
         nMG5ArxXCvw3fXyUU4oDuljVMkrFUrAQbPf8WWlKVcZuF3y/FOKkR1y/JjZfPaJ2nho6
         kZtSQvAV1ZUptqZ9qu2aKHaaggNCcva6tgL9bConAC++B2x6LH18TqGlSxrvsyE1BbrV
         Guvt/ZMacvI7DWLvGA5pwxJf+sjvKE/CGhORcWfnMPsEdsuuALrRoCD8N+nrTOD7gI4a
         Sum76L0ogA+1M6/MuQEfplCIlKLIIFDLEBq5fJ+omkIDY+gEw9TSOSbk8w27vD47HxG8
         0YhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bwRH+WewBBOgjeSjhH56GmNfI8dMvNqDHN6W9LzpbZE=;
        b=MuQybFff7lQGbsjhkZzsI5z1xCtStzZHSGQhhIIn5rcu+MzrwRhM+u/S0TJcD1e4K7
         vjxuOxU4nzImGWEDeY9/fNROPEmg9nWUgX6AnnHDPQ2XTjG6V2aXrkQGkl/+GgIHp+eb
         O88+JvF68+3BJKMtWmoG08h/SY9R2A2lit99ozZN44CNBbbXfNeEOHvjUmqT3oIqwiji
         1Gb3O/YrBQh2+m1Z/d6KzGymseTy9ZZpcj50MtOEmdR7V1ALEp4AeKAIglbqpAp/DlGN
         LV867xRYKANwqNARvrBsdBvrVsa408ZDdOVU3xRPE5RoqfbnVluASaJ0jaTuzsPAy5OK
         zoJw==
X-Gm-Message-State: AOAM530pt/A+ym/+RxxyHyxKlLzGcqaFoy4OxcOypORiEUF6VIHceMDk
        YSsGVI8PVsnvMeunJatYocA=
X-Google-Smtp-Source: ABdhPJzvf3nHWRQsMwb1wAeIlUVhjn70Wkp+4gJQ/K5DRHBkBc/IkGuO1WXYKMVVnw4RtGkHXfU9Sw==
X-Received: by 2002:a5d:4ec3:: with SMTP id s3mr20201335wrv.103.1592037500807;
        Sat, 13 Jun 2020 01:38:20 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id l17sm11622704wmi.3.2020.06.13.01.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:38:20 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 5/9] mips: bmips: dts: add BCM6358 reset controller support
Date:   Sat, 13 Jun 2020 10:38:09 +0200
Message-Id: <20200613083813.2027186-6-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200613083813.2027186-1-noltari@gmail.com>
References: <20200610172859.466334-1-noltari@gmail.com>
 <20200613083813.2027186-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6358 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v4: no changes.
 v3: add reset controller definitions header file.
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6358.dtsi      |  6 ++++++
 include/dt-bindings/reset/bcm6358-reset.h | 15 +++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6358-reset.h

diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index f21176cac038..9d93e7f5e6fc 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -82,6 +82,12 @@ periph_intc: interrupt-controller@fffe000c {
 			interrupts = <2>, <3>;
 		};
 
+		periph_rst: reset-controller@fffe0034 {
+			compatible = "brcm,bcm6345-reset";
+			reg = <0xfffe0034 0x4>;
+			#reset-cells = <1>;
+		};
+
 		leds0: led-controller@fffe00d0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/include/dt-bindings/reset/bcm6358-reset.h b/include/dt-bindings/reset/bcm6358-reset.h
new file mode 100644
index 000000000000..bda62ef84f5a
--- /dev/null
+++ b/include/dt-bindings/reset/bcm6358-reset.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM6358_H
+#define __DT_BINDINGS_RESET_BCM6358_H
+
+#define BCM6358_RST_SPI		0
+#define BCM6358_RST_ENET	2
+#define BCM6358_RST_MPI		3
+#define BCM6358_RST_EPHY	6
+#define BCM6358_RST_SAR		7
+#define BCM6358_RST_USBH	12
+#define BCM6358_RST_PCM		13
+#define BCM6358_RST_ADSL	14
+
+#endif /* __DT_BINDINGS_RESET_BCM6358_H */
-- 
2.27.0

