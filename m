Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9325242575
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgHLGcZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgHLGbi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:38 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D61BC061787;
        Tue, 11 Aug 2020 23:31:37 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a14so928711wra.5;
        Tue, 11 Aug 2020 23:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qvgG81hCCayASn7++fbBybaRbwz/aRiFuxpMk+uHNx4=;
        b=T8uABufnPRqgrSPEf1GWM8So4J/qO4auXIWAaQ/Mnw3ic2wE0DwuG1rs+UqHfnZSK/
         5Skjbl6j3YDqgOVE01QkYpwX2DGzEeP2DKS4TlwbLANyafDqCmldUVdS4O342nFaaOkt
         d145fhQ8NXQhswoxeGZ3RKGb8IPE9oc7rimN9QqOzCyLrdpl3VSnQ24QOUveNh5MXbSK
         wH9JPlq5aMKPIj6nZQ/uw0Y3RFmw0h0qFcvwdpzVkQODptpenWvNW8SCJfwuXLmrw9wg
         htI0lFvHukP0BxgfvVIjXvxmevbDYmyafP888UxvNIeNYOEIp6x0cmeXcZ6ZFIAwxaL6
         s7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qvgG81hCCayASn7++fbBybaRbwz/aRiFuxpMk+uHNx4=;
        b=A5qAwLX/o4rQHfiZ72TseAWLVgyHLvxg3+yVXCFxrKcgSyWXX0PX0+tRZdMPsxhbs2
         4LmtPFyvdhYTZhHeBiTQzlVxc0FpmEVQGKAvXVrR0AymfAwcoto6PYKV3Dpj/n3/K3S3
         SeuHVBOQ7Do2jPmYpcDjwFwuYiggMuvG8JITFpcNxPsgjgIoLf62UgLYSt4InGP6AnqU
         qKhvnlCRbB4FY8e0ioeuqbXBjIgUEiwfwTcoHY8PQ1uKA+iMZjK3yPgNPIax0esRQmGg
         8JtMTPiTojB8saKYecDoj1LyXXGoJPID6V1fUSwYVWPrqnYR2cENK2YKS+8+R0BNLLu1
         19tw==
X-Gm-Message-State: AOAM533ZQ185bcI/94snST8QqHbw1Zjg0eJ1UsliTdSrlWw3SHAzDZVA
        WBXmNDa+NwkR+StbhznS/oQ=
X-Google-Smtp-Source: ABdhPJzwt6cmxHfcL85cJm2H+Xct2uRi9zXHaXEIAeSIkEox54MnIkzSg8iPBhA8LJHlavTq7I+LUg==
X-Received: by 2002:adf:9361:: with SMTP id 88mr35230681wro.403.1597213896167;
        Tue, 11 Aug 2020 23:31:36 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:35 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 03/14] mips: bmips: add BCM6318 irq definitions
Date:   Wed, 12 Aug 2020 08:31:18 +0200
Message-Id: <20200812063129.361862-4-noltari@gmail.com>
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

Add header with BCM6318 definitions in order to be able to include it from
device tree files.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../bcm6318-interrupt-controller.h            | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/bcm6318-interrupt-controller.h

diff --git a/include/dt-bindings/interrupt-controller/bcm6318-interrupt-controller.h b/include/dt-bindings/interrupt-controller/bcm6318-interrupt-controller.h
new file mode 100644
index 000000000000..7882dcb279c4
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/bcm6318-interrupt-controller.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6318_H
+#define __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6318_H
+
+#define BCM6318_IRQ_TIMER0		0
+#define BCM6318_IRQ_TIMER1		1
+#define BCM6318_IRQ_TIMER2		2
+#define BCM6318_IRQ_TIMER3		3
+#define BCM6318_IRQ_USBS		4
+#define BCM6318_IRQ_USB_CTL_RX_DMA	5
+#define BCM6318_IRQ_USB_CTL_TX_DMA	6
+#define BCM6318_IRQ_USB_BULK_RX_DMA	7
+#define BCM6318_IRQ_USB_BULK_TX_DMA	8
+#define BCM6318_IRQ_USB_ISO_RX_DMA	9
+#define BCM6318_IRQ_USB_ISO_TX_DMA	10
+#define BCM6318_IRQ_DG			11
+#define BCM6318_IRQ_EPHY		12
+#define BCM6318_IRQ_EPHY_EN0N		13
+#define BCM6318_IRQ_EPHY_EN1N		14
+#define BCM6318_IRQ_EPHY_EN2N		15
+#define BCM6318_IRQ_EPHY_EN3N		16
+#define BCM6318_IRQ_EPHY_EN0		17
+#define BCM6318_IRQ_EPHY_EN1		18
+#define BCM6318_IRQ_EPHY_EN2		19
+#define BCM6318_IRQ_EPHY_EN3		20
+#define BCM6318_IRQ_XDSL		21
+#define BCM6318_IRQ_SDR			22
+#define BCM6318_IRQ_PCIE_RC		23
+#define BCM6318_IRQ_EXT0		24
+#define BCM6318_IRQ_EXT1		25
+#define BCM6318_IRQ_EXT2		26
+#define BCM6318_IRQ_EXT3		27
+#define BCM6318_IRQ_UART0		28
+#define BCM6318_IRQ_HSSPI		29
+#define BCM6318_IRQ_WAKE_ON_IRQ		30
+#define BCM6318_IRQ_TIMER		31
+#define BCM6318_IRQ_ENETSW_RX_DMA0	32
+#define BCM6318_IRQ_ENETSW_RX_DMA1	33
+#define BCM6318_IRQ_ENETSW_RX_DMA2	34
+#define BCM6318_IRQ_ENETSW_RX_DMA3	35
+#define BCM6318_IRQ_WDTIMER		37
+#define BCM6318_IRQ_ENETSW		40
+#define BCM6318_IRQ_OHCI		41
+#define BCM6318_IRQ_EHCI		42
+#define BCM6318_IRQ_ATM_DMA0		43
+#define BCM6318_IRQ_ATM_DMA1		44
+#define BCM6318_IRQ_ATM_DMA2		45
+#define BCM6318_IRQ_ATM_DMA3		46
+#define BCM6318_IRQ_ATM_DMA4		47
+#define BCM6318_IRQ_ATM_DMA5		48
+#define BCM6318_IRQ_ATM_DMA6		49
+#define BCM6318_IRQ_ATM_DMA7		50
+#define BCM6318_IRQ_ATM_DMA8		51
+#define BCM6318_IRQ_ATM_DMA9		52
+#define BCM6318_IRQ_ATM_DMA10		53
+#define BCM6318_IRQ_ATM_DMA11		54
+#define BCM6318_IRQ_ATM_DMA12		55
+#define BCM6318_IRQ_ATM_DMA13		56
+#define BCM6318_IRQ_ATM_DMA14		57
+#define BCM6318_IRQ_ATM_DMA15		58
+#define BCM6318_IRQ_ATM_DMA16		59
+#define BCM6318_IRQ_ATM_DMA17		60
+#define BCM6318_IRQ_ATM_DMA18		61
+#define BCM6318_IRQ_ATM_DMA19		62
+#define BCM6318_IRQ_SAR			63
+#define BCM6318_IRQ_ADSL_ENERGY		64
+#define BCM6318_IRQ_ADSL_ENERGY_N	65
+#define BCM6318_IRQ_USB_ENERGY_ON	66
+#define BCM6318_IRQ_USB_ENERGY_OFF	67
+#define BCM6318_IRQ_PVTMON_TEMP		68
+#define BCM6318_IRQ_SYSPLL_LOCK		69
+#define BCM6318_IRQ_LCPLL_LOCK		70
+#define BCM6318_IRQ_PMU_STABLE		71
+#define BCM6318_IRQ_ENETSW_TX_DMA0	72
+#define BCM6318_IRQ_ENETSW_TX_DMA1	73
+#define BCM6318_IRQ_ENETSW_TX_DMA2	74
+#define BCM6318_IRQ_ENETSW_TX_DMA3	75
+#define BCM6318_IRQ_EPHY0_IDDQ_ENERGY	76
+#define BCM6318_IRQ_EPHY1_IDDQ_ENERGY	77
+#define BCM6318_IRQ_EPHY2_IDDQ_ENERGY	78
+#define BCM6318_IRQ_EPHY3_IDDQ_ENERGY	79
+
+#endif /* __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6318_H */
-- 
2.28.0

