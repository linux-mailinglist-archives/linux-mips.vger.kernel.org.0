Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C851F87DD
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 10:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgFNI7P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 04:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbgFNI7D (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 04:59:03 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81522C03E969;
        Sun, 14 Jun 2020 01:59:03 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g10so11700184wmh.4;
        Sun, 14 Jun 2020 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kn0NVt6P8lYdaPREvJzoKLF7rCFsQVMFb0wqvAqQb9s=;
        b=U8uDAwcTTKfghPvWcwphJ+GZV2+YMpJQNZ3C61Y3z8MjCGBYFrKml+GkxdxPJYdGdE
         R3rt3mr4g1gogm15ug0TdiculxqhvqdjNetboUafWI04MU/hEOlqjbj/qv36KiZOFYDo
         RycMu1APgY5fJp3GkE0Rqb7zY0eOP9CMJQ+RSdK8OQXpnVo5pT4b+Hhw41P42PWEApJL
         pM5W2/j8ll/kfDoIFM9BmLVT641z+wvy1KyDOquYvIRPOFWL1O6hPImvHvFwlhsxXjWr
         IDnNQKMTyxRQ/qiFBcjt8sbzuV/VCVbq7MSHjEYi+bUAT/gd6mrOoM0Ccxx0E9z1EN5l
         q4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kn0NVt6P8lYdaPREvJzoKLF7rCFsQVMFb0wqvAqQb9s=;
        b=VIrESA/WPftI3WPkXkihoQl4HvQuKl9aZ7iZqtXO0ILKoi7oBNT9dwzEyvAjFt6GmM
         TsecRqwnfhTS9R237Wt4BOMYKO22RWuE73XFIaZxI+6Xp4o6f6qnVU+1ckcjrjmA8iLE
         83i+zbt2QPwdVhTdwau+hwS37zGeKSb9Dw8QKpfmNvXv1D2j9a33r+WuHco/DtM5HO7k
         LZrQ9Tq93mfHXfmU9CtCmZSggdvKqSScdrcNgT3wr36IlRar4VPMMqSWqHS1Nx6sWmTB
         TOIkQUqxk+ef1cOSrfiCCRQkPL4DD/N+0rVe07Lg6Qp2C+3VJge7VWMGvdpwGiGESF3H
         2f7g==
X-Gm-Message-State: AOAM530T88AXIw4SGuDd9mQBU2HjyTIsFA0OZny8XlZ7mCa2Ol5U1zhZ
        Zl5XwkT3knr0alFoaA8HNj6+6qQHdnZ2PA==
X-Google-Smtp-Source: ABdhPJx/Lk6zPXYz3a/Hq82H3zYhbnrUdKdDqp5t4+LfZiLtD9TBYc9Bl9YEmUFdI+u6tou/5KRzWQ==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr7396477wmh.6.1592125141941;
        Sun, 14 Jun 2020 01:59:01 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id u4sm17174043wmb.48.2020.06.14.01.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 01:59:01 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v5 7/9] mips: bmips: dts: add BCM6368 reset controller support
Date:   Sun, 14 Jun 2020 10:58:50 +0200
Message-Id: <20200614085852.2130147-8-noltari@gmail.com>
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

BCM6368 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
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

