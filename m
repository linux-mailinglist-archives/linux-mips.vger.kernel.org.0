Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFB61FC8C7
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 10:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgFQIdF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 04:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbgFQIcn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 04:32:43 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28B2C06174E;
        Wed, 17 Jun 2020 01:32:42 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u26so3931854wmn.1;
        Wed, 17 Jun 2020 01:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b2eLOglr5wT6BtuBEPMCmeaLyIB9an6mAhu13j3ZiIQ=;
        b=RvRLet3in+m8wASu2yQA2GMSU5003FtENutnm1vt0mYT2Y4hmEmscxA+/XYg5FuVf3
         t0n05E9i0oLw5b/2s933gBP2j7bY5eq70QGcXRL1LtYfaO99R+QPRLgZM1czEofjH0Mk
         y3UFBNFsM0mww9KmjXZWlARoxiFhIixMOnMBwjyP3WCchyFFDHJTgb+sKbvkXLBznT82
         uBUraneu0zWjNgzCqiC7ZXNpQ0+PwEC6hxmaS1K06c8aob2Nu1IArKA00yDxGmoqMRap
         tJcNSaMW6rSMxK7DJDfCGuCFavkQZ7izwjY116QEbwza+8zFTXj6PftAfTk6dmwbaqep
         /dGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b2eLOglr5wT6BtuBEPMCmeaLyIB9an6mAhu13j3ZiIQ=;
        b=efKNd5oGsdfNHQBs29XgueQ8/TCW5q8LV72xKrhgtmtCMnX6BWvTymbCCLcsv69OlS
         7FpegJC3OXw+FmrjH4bxMDYqNcRKP5okRqHIyzDe/5+4uFW4C8WHE3V+GEuUwsT/JZpI
         xr6zLP61FmlO51oCZXRTzZcj9ROa14Xp+rrSQ10wB17sOFp6gB6LEDNL8Tvepuj6fK99
         +E4ZcbMFnAS1iwbydKD9YwOTV+c2f+ZSVj0vtZ1ADq1U/atxQ+ndLzgNRqnMe4gLe0Z1
         +5U8k+juCHYahW2bC4elZcKtkubW62ncV4pbadwRdl7kqoQf08SI4zQ3SzSv5XuwS6cG
         qyQQ==
X-Gm-Message-State: AOAM53361qW/aGpE5dN8BvPAhBmR0GRacNpM3NfOFpuPnTRFJrM7AQT0
        kY2efu9u84cTmzf7/hMYPnE=
X-Google-Smtp-Source: ABdhPJz25m45suqv5UlI75P/d7Ko5z5s1uacoGbEKSKuNxWPssOx+WU64o4rIzf0swy7WRvK+UqN9g==
X-Received: by 2002:a05:600c:2284:: with SMTP id 4mr7052517wmf.57.1592382761434;
        Wed, 17 Jun 2020 01:32:41 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id a16sm32596863wrx.8.2020.06.17.01.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 01:32:41 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v6 6/9] mips: bmips: dts: add BCM6362 reset controller support
Date:   Wed, 17 Jun 2020 10:32:28 +0200
Message-Id: <20200617083231.3699090-7-noltari@gmail.com>
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

BCM6362 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
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

