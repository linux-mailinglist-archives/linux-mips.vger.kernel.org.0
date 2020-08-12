Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E4524256E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgHLGcP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgHLGbn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:43 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E962AC06174A;
        Tue, 11 Aug 2020 23:31:42 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id c80so798452wme.0;
        Tue, 11 Aug 2020 23:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z7aFAGzID63PKHl2zxQfzTW1otlmHhI+sghOpzdt9NI=;
        b=dulBhd0z+C1SEVEqJc6VaFK1HicyzgTmZ9TH7D3LAeIeFdJU43sxP/i9nuBedkfkkv
         aGymDNr85RKuvgWpeAy2bxNkEtbg51+E5I0IZWc/qXBG66YPiXQE34Xy/vh/sNiXzsqX
         t05GFKdoWZiMVv/gA2RComgPedaSRI29kQSllTVgBLJDUQzMZ1XRfHzS4OUtu8uHyA+1
         JIamIAHMO/1Nii5QCtOpzwp5sXV0FZbRS7Q26DYGplHKA1sm7IqW7tlvT/qhN08DlSu7
         /vuo/B5k58OazOSPbKTyMRG5212diG4K3d3gdJ/BLIixI3bx88i1QP+ewIBUO8RKW3vE
         EeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z7aFAGzID63PKHl2zxQfzTW1otlmHhI+sghOpzdt9NI=;
        b=d27dW1Jh+Y0F2XU5gm6EL23x4u2pa7p8AW+IBzl0P2sk/QZi6nDHDRJ9fa0cfZ6ZXI
         dMFV0lHI5RPm0BORUTk0LON50wU5TxNDVwG4IcMTUtC/X1OkC6NMd5oRwsncG3IQuH1x
         9f6bNjh5P61fb/5DyizsPYc9uMmrRzw96JQMJKmZxEY3aPjibxFxYi8KvFDNXw9B90LA
         5CDlWLAKX02+WeRlRDpArZikAsnlJw9ZSK+Np5O7vO1Jajr0yBSByxdOY/vBUfitvC4M
         +Rsginjnc3G5GeEvof2GkjP2lNcs2hDr2ROqKZL/uBB8uLx7dnhCMYTlfMC8D0oe55/J
         RJkQ==
X-Gm-Message-State: AOAM533BXJAVPAOxFsWqLivEu6NJP5YOA8X4uUKE7LtyWqpopeij1nn8
        jl4vL2b9pnGUAHf3jzv6OCg=
X-Google-Smtp-Source: ABdhPJyD+NtSlebmAZhUcS0fpfRpNuNH+xwyNG/f+2zrnuQKjl/urWHf6UcXbXWm2kateft3MHi3MQ==
X-Received: by 2002:a7b:c054:: with SMTP id u20mr6829707wmc.2.1597213901509;
        Tue, 11 Aug 2020 23:31:41 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:40 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 08/14] mips: bmips: add BCM63268 irq definitions
Date:   Wed, 12 Aug 2020 08:31:23 +0200
Message-Id: <20200812063129.361862-9-noltari@gmail.com>
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

Add header with BCM63268 definitions in order to be able to include it from
device tree files.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../bcm63268-interrupt-controller.h           | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/bcm63268-interrupt-controller.h

diff --git a/include/dt-bindings/interrupt-controller/bcm63268-interrupt-controller.h b/include/dt-bindings/interrupt-controller/bcm63268-interrupt-controller.h
new file mode 100644
index 000000000000..8589e8686d60
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/bcm63268-interrupt-controller.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM63268_H
+#define __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM63268_H
+
+#define BCM63268_IRQ_TIMER		0
+#define BCM63268_IRQ_ENETSW_RX_DMA0	1
+#define BCM63268_IRQ_ENETSW_RX_DMA1	2
+#define BCM63268_IRQ_ENETSW_RX_DMA2	3
+#define BCM63268_IRQ_ENETSW_RX_DMA3	4
+#define BCM63268_IRQ_UART0		5
+#define BCM63268_IRQ_HSSPI		6
+#define BCM63268_IRQ_WLAN		7
+#define BCM63268_IRQ_IPSEC		8
+#define BCM63268_IRQ_OHCI		9
+#define BCM63268_IRQ_EHCI		10
+#define BCM63268_IRQ_USBS		11
+#define BCM63268_IRQ_PCM		12
+#define BCM63268_IRQ_EPHY		13
+#define BCM63268_IRQ_DG			14
+#define BCM63268_IRQ_EPHY0_EN		15
+#define BCM63268_IRQ_EPHY1_EN		16
+#define BCM63268_IRQ_EPHY2_EN		17
+#define BCM63268_IRQ_GPHY_EN		18
+#define BCM63268_IRQ_USB_CTL_RX_DMA	19
+#define BCM63268_IRQ_USB_BULK_RX_DMA	20
+#define BCM63268_IRQ_ISO_RX_DMA		21
+#define BCM63268_IRQ_IPSEC_DMA0		22
+#define BCM63268_IRQ_XDSL		23
+#define BCM63268_IRQ_FAP0		24
+#define BCM63268_IRQ_FAP1		25
+#define BCM63268_IRQ_ATM_DMA0		26
+#define BCM63268_IRQ_ATM_DMA1		27
+#define BCM63268_IRQ_ATM_DMA2		28
+#define BCM63268_IRQ_ATM_DMA3		29
+#define BCM63268_IRQ_WAKE_ON_IRQ	30
+#define BCM63268_IRQ_GPHY		31
+#define BCM63268_IRQ_DECT0              32		
+#define BCM63268_IRQ_DECT1		33
+#define BCM63268_IRQ_UART1              34		
+#define BCM63268_IRQ_WLAN_GPIO		35
+#define BCM63268_IRQ_USB_CTL_TX_DMA	36
+#define BCM63268_IRQ_USB_BULK_TX_DMA	37
+#define BCM63268_IRQ_ISO_TX_DMA		38
+#define BCM63268_IRQ_IPSEC_DMA1		39
+#define BCM63268_IRQ_PCIE_RC		40
+#define BCM63268_IRQ_PCIE_EP		41
+#define BCM63268_IRQ_PCM_DMA0		42
+#define BCM63268_IRQ_PCM_DMA1		43
+#define BCM63268_IRQ_EXT0		44
+#define BCM63268_IRQ_EXT1		45
+#define BCM63268_IRQ_EXT2		46
+#define BCM63268_IRQ_EXT3		47
+#define BCM63268_IRQ_ENETSW		48
+#define BCM63268_IRQ_SAR		49
+#define BCM63268_IRQ_NAND		50
+#define BCM63268_IRQ_RING_OSC		52
+#define BCM63268_IRQ_USB_CONNECT	53
+#define BCM63268_IRQ_USB_DISCONNECT	54
+#define BCM63268_IRQ_PER_MBOX0		55
+#define BCM63268_IRQ_PER_MBOX1		56
+#define BCM63268_IRQ_PER_MBOX2		57
+#define BCM63268_IRQ_PER_MBOX3		58
+#define BCM63268_IRQ_ATM_DMA4		59
+#define BCM63268_IRQ_ATM_DMA5		60
+#define BCM63268_IRQ_ATM_DMA6		61
+#define BCM63268_IRQ_ATM_DMA7		62
+#define BCM63268_IRQ_ENETSW_TX_DMA0	64
+#define BCM63268_IRQ_ENETSW_TX_DMA1	65
+#define BCM63268_IRQ_ENETSW_TX_DMA2	66
+#define BCM63268_IRQ_ENETSW_TX_DMA3	67
+#define BCM63268_IRQ_ATM_DMA8		68
+#define BCM63268_IRQ_ATM_DMA9		69
+#define BCM63268_IRQ_ATM_DMA10		70
+#define BCM63268_IRQ_ATM_DMA11		71
+#define BCM63268_IRQ_ATM_DMA12		72
+#define BCM63268_IRQ_ATM_DMA13		73
+#define BCM63268_IRQ_ATM_DMA14		74
+#define BCM63268_IRQ_ATM_DMA15		75
+#define BCM63268_IRQ_ATM_DMA16		76
+#define BCM63268_IRQ_ATM_DMA17		77
+#define BCM63268_IRQ_ATM_DMA18		78
+#define BCM63268_IRQ_ATM_DMA19		79
+#define BCM63268_IRQ_LSSPI		80
+
+#endif /* __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM63268_H */
-- 
2.28.0

