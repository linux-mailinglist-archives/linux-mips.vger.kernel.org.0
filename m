Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B431FC8C6
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 10:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgFQIdF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 04:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgFQIcm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 04:32:42 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBD2C061573;
        Wed, 17 Jun 2020 01:32:41 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l26so982572wme.3;
        Wed, 17 Jun 2020 01:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HTprp5tkUiLKXv62OtyCP/WtOXxq6WXg3hrFpaW11ho=;
        b=Kf6usvRtWgllCtE3Ixe8aZTRHMjSaHcQM4X8zZSuohw7ZLtyCWrQ/+2AMbSu6WDqr3
         95Gbq4FdQD5hWsNCIUB8L/M//wowuwpa7ySdg3el4p9ATRVMSodUfqcU8K/ufvynJjMN
         kEFieU8N9j0ZVVV07/foV7aFfOwPM3a6KAbVXWa9JRBf0+TOelvK37jBOLyO61WrYVEX
         0D1OqcjJNYCkkmmrVXGJ5HiX3lQMFO+iA6XrMUiNvN6FoonhtRrhaAnHLTdbDwqbW1rf
         YePAU4QUnl/7L07XkfFw0BK9ycuO78g7hokX/pPVz9ONxbYQVMnlu92Ji4m7s30cbXDm
         x6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HTprp5tkUiLKXv62OtyCP/WtOXxq6WXg3hrFpaW11ho=;
        b=gvBZ1hzr7lSEkSMC865omkApN73LT5ss94jXjshyRuyJskcYNNPu+JUOsmVKTglKAP
         E4zrXzi7eZ7qKZFOHNUSSSWWAq6N00W/aon+FBE+6wMAhAjt8NXrHzrA5diPVfRwze1y
         TaB6bs5T+ofb2W/zOjrDCOSm2uGM9rT8b1qRAjD6okJ3uLDS+Ta6pT6DdFb+CzL6m01u
         Dbpz4hwXvgTVAfOcvVQWKAuuBWGSapmNNY0l68ShJ3or9bl6y9u/Bxg9Zt6WZGudkaEa
         CCnYC5xAT+UcOJHyuE7EsYEpAinK+gZMRizmM7xXIle6d3ht/6XcEquty+8d6RmW9K2G
         CCpw==
X-Gm-Message-State: AOAM533fj+7J26NlFAigzQu2TBB+f2whCcquKtY8cciWBT+mJTTss4It
        LF5MMcW35ECYXNpzZO3ut+Q=
X-Google-Smtp-Source: ABdhPJxWT3m0oLqNgveAr2sxw/WJ6HU1zCN+IymDdradYjv2VYMjVM/zCWIQpFcpOfxAk1XySTdDew==
X-Received: by 2002:a1c:e355:: with SMTP id a82mr7274599wmh.1.1592382760612;
        Wed, 17 Jun 2020 01:32:40 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id a16sm32596863wrx.8.2020.06.17.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 01:32:40 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v6 5/9] mips: bmips: dts: add BCM6358 reset controller support
Date:   Wed, 17 Jun 2020 10:32:27 +0200
Message-Id: <20200617083231.3699090-6-noltari@gmail.com>
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

BCM6358 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v6: no changes.
 v5: no changes.
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

