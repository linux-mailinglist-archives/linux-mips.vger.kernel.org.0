Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555C51F87D2
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 10:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbgFNI7D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 04:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgFNI7C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 04:59:02 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8D4C03E96F;
        Sun, 14 Jun 2020 01:59:02 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r9so11726786wmh.2;
        Sun, 14 Jun 2020 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mZksJndl7b4NjZyguiDmkMU/legdTy905l4/ia0M3kc=;
        b=tQ1G6ZvNpmx30c6QiDqyzPD78LY3ypFXdW3ZLggATeEfv5KvZYZ8Yo5UF9qHmwAlNe
         TICYw3HumdTnA//l85Eudv0YU43+3jb61QOOhj670Ab48A0mZZLulXxapwx2lzPiwxaG
         GH3vccF2Ebv42S1Cy5OisQeJKFc5WoCUFsDXRHEhF7juIkd8XTpZ6SBkueURNrkIfD4k
         GOsypguQLohisvVxmfJft5VbSr8pnEZMUDuALinTS3N5COmrEq/15z+aMjF2PD1QvJS9
         abekcl8/GMnJk40e7egddC7NPokiFVSHvNs/G0eLD7ArQrYtZt7TO00d3KDaLx+R7s/d
         z+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZksJndl7b4NjZyguiDmkMU/legdTy905l4/ia0M3kc=;
        b=WVxAvtXF/F+Ob6nVMsLRwYgwQzuWhlP/IylnCpJ6MDv9C8J679ktiLgP7nBjbq3V3i
         dMzNn5KW05Lacdy19h4fAXDtTqKRDdrAoiMHQoGWNslUct19//sN2FK64Tz9dvnfsyPq
         KfsO60/CVTicT5et3AT8nmU/GebAaGD9G8D67Dki3o9TWBmeUygpcY9S+hADZrlqhMDD
         LVFkr8Uf0tmNGh2Zu2Sui0xYuFiKRNfWYG0UumCrqEynsqSNIuRRtvbvxavT6wQ9+9zy
         yPFUtL1xr96YiUIG90Uk6Wl7dXovHeLJLi6P7/dXDRgC11ni2nqbPMQGas+qQuLHTNab
         cO5Q==
X-Gm-Message-State: AOAM530nA7CTi1KbBgEdQPD5z028M7x2VMOGaJwcpetbLWgQxg9hYj6e
        anYTDavYSHwdZWZKN/ooiSY=
X-Google-Smtp-Source: ABdhPJzWulGwNJjlI8lV00haVkqoY0f4WFdttGYFcdROY+JyVJzrBD2nGpTvqG2QtQGTFt/TNmJhcw==
X-Received: by 2002:a1c:a74d:: with SMTP id q74mr7387554wme.177.1592125140009;
        Sun, 14 Jun 2020 01:59:00 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id u4sm17174043wmb.48.2020.06.14.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 01:58:59 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v5 5/9] mips: bmips: dts: add BCM6358 reset controller support
Date:   Sun, 14 Jun 2020 10:58:48 +0200
Message-Id: <20200614085852.2130147-6-noltari@gmail.com>
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

BCM6358 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
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

