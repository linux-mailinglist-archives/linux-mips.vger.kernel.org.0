Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB53A242579
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgHLGcZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgHLGbi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:38 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948CBC06174A;
        Tue, 11 Aug 2020 23:31:38 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id a5so922977wrm.6;
        Tue, 11 Aug 2020 23:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2ocQ0Dfdu1TqhnT5730NcE0iw7HYz1C2r9pmFBtlMU=;
        b=WB3Du5gPMeYdbcIrtc30kJGEm8Q6FwlOLxvAbZQF6WWUaRFCWA80JskQ9aU+T2qh3e
         sM/2twroQb2YRWfR80lFXs55xJTeEDf57yM4loDRdneamPGr1w9b+uhHz2dMNsq08EM4
         jEZcxaTs3uT/463c8ieYdYihA8InEYhagObaIc6fNbOCArDU8CkgzFTi1aJPGGSHmmO+
         tY+6wmPrqjx5d8Bwo7agD0ZayS2fqDOxOyjJ9S+w+LzuBTJffC9b25IzUBfXbLkf/A4J
         44jurw+Zh06iBJcRg/mNuBZw6TTirbk6wsjdKomwsKYzMSW6OMirqNppxbChaZlpypcF
         g5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2ocQ0Dfdu1TqhnT5730NcE0iw7HYz1C2r9pmFBtlMU=;
        b=j8z8dJrPa2TVsvadIrgwf8s/mav+w43CuW+sr5oFiSlJ2LP4MRKBybxtNjg+MTbYlV
         e66bdl8tTcjmH0VVIrq3Xyw33ThTkEB0ZxwPz5TOVjRGs1x0csPM6zrMXzYCtBm8cyjV
         EwLXW8Gh2dsGoZX5b2euh0sXSodXXaQpMExcjqc2KOHJUrh8XhA2H2hTRaB50H8GDoae
         0r2QU/WBx2nGYS5FFEoBQ/cQe0VD+U9fdwY+mqRohqcqjkmBakPhZtGiOXhfjf8cx140
         lwZ3r5sjUrDh+ATXnjBIU/xPRdF9fnd4NQYOCSKtHJfxk/PCm+zjAbVc3MreVkUUdS02
         TMEg==
X-Gm-Message-State: AOAM5327v/Rpa5CgIDKhKA/TQ+tdqyHLnTs9SVAKXrHioxAvL/qquiZ7
        bx02eVdVB/ylBcJchTybGpo=
X-Google-Smtp-Source: ABdhPJwv2G86AmoRvQU1GfmJ+Q+bJIBE7oHrCwbILlOOFVouRK2gyKuuuiqSnYszN3al0VMaAASqyg==
X-Received: by 2002:a5d:4910:: with SMTP id x16mr8846427wrq.131.1597213897194;
        Tue, 11 Aug 2020 23:31:37 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:36 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 04/14] mips: bmips: add BCM6328 irq definitions
Date:   Wed, 12 Aug 2020 08:31:19 +0200
Message-Id: <20200812063129.361862-5-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063129.361862-1-noltari@gmail.com>
References: <20200812063129.361862-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add header with BCM6328 definitions in order to be able to include it from
device tree files.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../bcm6328-interrupt-controller.h            | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/bcm6328-interrupt-controller.h

diff --git a/include/dt-bindings/interrupt-controller/bcm6328-interrupt-controller.h b/include/dt-bindings/interrupt-controller/bcm6328-interrupt-controller.h
new file mode 100644
index 000000000000..def2a21efc77
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/bcm6328-interrupt-controller.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6328_H
+#define __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6328_H
+
+#define BCM6328_IRQ_NAND		0
+#define BCM6328_IRQ_PCM			1
+#define BCM6328_IRQ_PCM_DMA0		2
+#define BCM6328_IRQ_PCM_DMA1		3
+#define BCM6328_IRQ_USBS		4
+#define BCM6328_IRQ_USB_CTL_RX_DMA	5
+#define BCM6328_IRQ_USB_CTL_TX_DMA	6
+#define BCM6328_IRQ_USB_BULK_RX_DMA	7
+#define BCM6328_IRQ_USB_BULK_TX_DMA	8
+#define BCM6328_IRQ_USB_ISO_RX_DMA	9
+#define BCM6328_IRQ_USB_ISO_TX_DMA	10
+#define BCM6328_IRQ_DG			11
+#define BCM6328_IRQ_EPHY		12
+#define BCM6328_IRQ_EPHY_EN0N		13
+#define BCM6328_IRQ_EPHY_EN1N		14
+#define BCM6328_IRQ_EPHY_EN2N		15
+#define BCM6328_IRQ_EPHY_EN3N		16
+#define BCM6328_IRQ_EPHY_EN0		17
+#define BCM6328_IRQ_EPHY_EN1		18
+#define BCM6328_IRQ_EPHY_EN2		19
+#define BCM6328_IRQ_EPHY_EN3		20
+#define BCM6328_IRQ_XDSL		21
+#define BCM6328_IRQ_PCIE_EP		22
+#define BCM6328_IRQ_PCIE_RC		23
+#define BCM6328_IRQ_EXTO		24
+#define BCM6328_IRQ_EXT1		25
+#define BCM6328_IRQ_EXT2		26
+#define BCM6328_IRQ_EXT3		27
+#define BCM6328_IRQ_UART0		28
+#define BCM6328_IRQ_HSSPI		29
+#define BCM6328_IRQ_WAKE_ON_IRQ		30
+#define BCM6328_IRQ_TIMER		31
+#define BCM6328_IRQ_ENETSW_RX_DMA0	32
+#define BCM6328_IRQ_ENETSW_RX_DMA1	33
+#define BCM6328_IRQ_ENETSW_TX_DMA0	34
+#define BCM6328_IRQ_ENETSW_TX_DMA1	35
+#define BCM6328_IRQ_UART1		39
+#define BCM6328_IRQ_ENETSW		40
+#define BCM6328_IRQ_OHCI		41
+#define BCM6328_IRQ_EHCI		42
+#define BCM6328_IRQ_ATM_DMA0		43
+#define BCM6328_IRQ_ATM_DMA1		44
+#define BCM6328_IRQ_ATM_DMA2		45
+#define BCM6328_IRQ_ATM_DMA3		46
+#define BCM6328_IRQ_ATM_DMA4		47
+#define BCM6328_IRQ_ATM_DMA5		48
+#define BCM6328_IRQ_ATM_DMA6		49
+#define BCM6328_IRQ_ATM_DMA7		50
+#define BCM6328_IRQ_ATM_DMA8		51
+#define BCM6328_IRQ_ATM_DMA9		52
+#define BCM6328_IRQ_ATM_DMA10		53
+#define BCM6328_IRQ_ATM_DMA11		54
+#define BCM6328_IRQ_ATM_DMA12		55
+#define BCM6328_IRQ_ATM_DMA13		56
+#define BCM6328_IRQ_ATM_DMA14		57
+#define BCM6328_IRQ_ATM_DMA15		58
+#define BCM6328_IRQ_ATM_DMA16		59
+#define BCM6328_IRQ_ATM_DMA17		60
+#define BCM6328_IRQ_ATM_DMA18		61
+#define BCM6328_IRQ_ATM_DMA19		62
+#define BCM6328_IRQ_SAR			63
+
+#endif /* __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6328_H */
-- 
2.28.0

