Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B941F8202
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgFMIif (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgFMIi0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:38:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AEEC03E96F;
        Sat, 13 Jun 2020 01:38:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id p5so12140304wrw.9;
        Sat, 13 Jun 2020 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yIcnaA2Be+ha33Bm41qIm56ItaMQsBiond6OOoKoOVI=;
        b=D6WEl9vJQBr1BP2V2AE6tOOg7FwYY+dewsN15o7pAQsSsvNezW2QNWUe+ntGxyR+pq
         jP8baFSVoYuM0JXbOMMUjea/Cap0c7aJXc1MnwzH4XvbRVuqzoBZLblldcfsyW9TZ0vg
         xnEm0F0rhErRzfsymy2f1KT28St2/te9srGfJ8uO7CXlD6/EC9PUYrNnLTXWIc6p/AdI
         IXS47Oh+VuRvgnPoRtFqmxqzBIVQwKgdDmpYt+aDATFqL31f/hc8W+gQBqxKXILOabFf
         +1Cj3dFNL2M4Vh7Gzekj8Hp+iVs24ZJoaBoZfGineCdwD3Oo7mZKmb7eIk8JZJbSdJXr
         ewHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yIcnaA2Be+ha33Bm41qIm56ItaMQsBiond6OOoKoOVI=;
        b=kve+ZXHaa1PrV9rqZ42EdpnPu/dMoOBGPB8XcLIR3kNrycIyGwkMiWbw5JVkReoS8q
         SmywwqDdFlQbjaRXa1ahs71+XUxuCLgN3nMLE2ugtwiq5zy6SAlrkKJj3T1isNePz8+m
         GJtf99HOTBcxekWkDIDoffxnAxOo7T8FaF+BDNu3Eyffa+MYUJg6CDu0sX4cc5fGelIq
         sKh9ZvU2VKEutC0Ebg/8Ncqhhn7tDkbK2P1QCAkXXaoNIQN8TY15hvkEfRZeOI+lV5vD
         vIQOxa60duZehcUcu3uDLJPnlApw2ipwyoySSD/9brIuAy4em9qPD4wI4yqevwmkTtM7
         GRLg==
X-Gm-Message-State: AOAM532ZVbddp7elqetRZ1peeH8mYdsK3EEmbn2crmNteFCQrZWO86fm
        ueBRLrAQ2xb7YmmZhFeVWfk=
X-Google-Smtp-Source: ABdhPJwtdCUUrZuHdxAJ2iQBBj7mtUIuFFiC5ahs9x6bUpZvN/pZtYGc7Oz1iHYi6iLBUaeZGk441A==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr20039712wrw.277.1592037502961;
        Sat, 13 Jun 2020 01:38:22 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id l17sm11622704wmi.3.2020.06.13.01.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:38:22 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 7/9] mips: bmips: dts: add BCM6368 reset controller support
Date:   Sat, 13 Jun 2020 10:38:11 +0200
Message-Id: <20200613083813.2027186-8-noltari@gmail.com>
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

BCM6368 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
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

