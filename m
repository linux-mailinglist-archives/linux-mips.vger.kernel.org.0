Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1F91FC8C1
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 10:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgFQIc4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 04:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgFQIco (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 04:32:44 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985F1C061755;
        Wed, 17 Jun 2020 01:32:43 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r15so1039568wmh.5;
        Wed, 17 Jun 2020 01:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DnNVFdbCqTnwpanJ4HWRzhrkZVgC80q9Rd+7zsSzVpw=;
        b=vb+irDvwsGXf8e2yHm9E3rhFYXxAYjlpAq1LP+TWPUWS68+s443Cayo6cP7crT+LpB
         BV/3Wk1ZHbdKFt9QhWQ97K1lPvqpTKWGdd5psltQ75J7uE5uqJRe+QHE7e/NUEdty7Vq
         0RH/i+Jc+jGa8HPfIpF+eGnXIIKFtAz/CBSGUPeg6KXHiuA6Fi9uBjUdPK+3+FhT5P5r
         Om7+P0MdQd00yd+Iu8Eh4/EK60dLlMukRvSY9oPzz22Xg1vDiwgsBFZQ1eJjfaoeIAmQ
         eBecQlNdqW2gN+K3f60Sr6rwsK0Jw4C0oI87g55sVtt9X+lBGKuF5B1AOgYEN/2OssLk
         5S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DnNVFdbCqTnwpanJ4HWRzhrkZVgC80q9Rd+7zsSzVpw=;
        b=GJxUs3yPBK4i9e4RRrbgVFfc6yH5ADYa0ON2nCIoisZwduUakhUye18rQ7qoJbJnmK
         w/v7x4NeWtkpuGkdThraDoScrOrAbc6J24iDZew79kHpxYNq7834lorsVNMwPVo07arP
         OFdbHC8Of/XWHKzF7fh87shFCV5jGLXFgpVQq2xGiCCBZJNpyKF8P+SVTj/GlOkMpgSV
         TvpbUAe5JhBf1JWN0yZFAaXVI9WVJAGiNN33i4h/kUaTt27GkzFozSQSASPG4FvN7Mqc
         ywOo4PBQM7/7xj1LV2SvEr5rTm/tXmoiGkOmlN9995hh8tfwOd4Nb4J4PS4bm95sQnqD
         Phig==
X-Gm-Message-State: AOAM532nZYgsfJbdnEzyBCZwyXSHc5bTbh4lcyKkgkTwY/KHNIuM4szz
        YhYnZSmqqtdVbO6PLj/Z1UE=
X-Google-Smtp-Source: ABdhPJynCC83njgK0Oboz0aA03VvqgpWoh2gy0icuNiTl4CQ4vJs/DQk6eQcTAc/Xr5qXNMZmCbNXw==
X-Received: by 2002:a1c:2644:: with SMTP id m65mr7254161wmm.178.1592382762284;
        Wed, 17 Jun 2020 01:32:42 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id a16sm32596863wrx.8.2020.06.17.01.32.41
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
Subject: [PATCH v6 7/9] mips: bmips: dts: add BCM6368 reset controller support
Date:   Wed, 17 Jun 2020 10:32:29 +0200
Message-Id: <20200617083231.3699090-8-noltari@gmail.com>
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

BCM6368 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v6: no changes.
 v5: no changes.
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

