Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E5E242556
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgHLGbm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbgHLGbm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:42 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFDAC06174A;
        Tue, 11 Aug 2020 23:31:41 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f18so3545448wmc.0;
        Tue, 11 Aug 2020 23:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O8v9EWlaL1+UpeG5UNZKoPzBhsEGCp3MJW71PEO+6Vw=;
        b=SRL8iJ7uN8g9bTyu0jzc3wqa/PO0SjIxNxl9bIrvo3ToLaHPeJyNrQVLEqIehUI8Md
         sfJdg5OhiR/ZUS9Gr2tcUzC4w121LW58Y46FZXIFQbe0SMve4PQGqVZIGvu/oHeIW8aB
         aeFa9NrcX/A+oZhcvd6lv1wba18LTyFifRHcHz8BhCxKih4JzW6xBnph1UaBAa977h6v
         aLgKsFSVUgMhpyhwDLRVC52pDYbcfQiB2cP9vdmLvRFdDOGtlpYdN07CAx+m9jPaGgGP
         vyt5fPy6VmSWmCu1ui0FbvKKomtDmzLz185YfGxxH0ELPsNu2ChbbW6zwiyK5f53IIeC
         GZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8v9EWlaL1+UpeG5UNZKoPzBhsEGCp3MJW71PEO+6Vw=;
        b=UJQDp73J6k5qxyuboi8JGZsvNlfT/vFf4h1YAckYC723arz3Vn1GaEvGifeM5S19N+
         zcF/UWzIn9hhKbIup9TULRUCMIcizIqLGm4LXrIX9BWmND7Vd9h5040CYxxCUiSB7DxZ
         aWWDeKpNWHcUpY5+Im0j8HlIOnK7lsOzJNwbUYXQLPTecNRcrwtn4SMP9+wzS5HyM/zn
         sGorKjIy8BlyaGYFYT5VdPHXpK6FRaaDk3g/NjGkYgMESNvg0qwKPrH3bJm14Cs6YSI3
         KbKFJvEMhAni8FUdWOZS0dWv/AlTHx8CK9dT9n8pPErHav7ThVuWmjB4M8TfYOY5G5fZ
         wo1g==
X-Gm-Message-State: AOAM532d6s2xpnHh7I3LvXZUbapD5XoVNjWzLnoZGHQXhnAhat6CSReQ
        pKNo/cduH8WBGW0L8YBNgh4=
X-Google-Smtp-Source: ABdhPJz5cqrzBUzVzJTErfGQvvQw0EiWxFKMP1uInrg0Ruyw1zHCphjiXGM6V77Xj5IXqyNjGsEl+w==
X-Received: by 2002:a05:600c:220b:: with SMTP id z11mr6932010wml.48.1597213900477;
        Tue, 11 Aug 2020 23:31:40 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:39 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 07/14] mips: bmips: add BCM6368 irq definitions
Date:   Wed, 12 Aug 2020 08:31:22 +0200
Message-Id: <20200812063129.361862-8-noltari@gmail.com>
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

Add header with BCM6368 definitions in order to be able to include it from
device tree files.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../bcm6368-interrupt-controller.h            | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/bcm6368-interrupt-controller.h

diff --git a/include/dt-bindings/interrupt-controller/bcm6368-interrupt-controller.h b/include/dt-bindings/interrupt-controller/bcm6368-interrupt-controller.h
new file mode 100644
index 000000000000..988e368cc156
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/bcm6368-interrupt-controller.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6368_H
+#define __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6368_H
+
+#define BCM6368_IRQ_TIMER		0
+#define BCM6368_IRQ_SPI			1
+#define BCM6368_IRQ_UART0		2
+#define BCM6368_IRQ_UART1		3
+#define BCM6368_IRQ_XDSL		4
+#define BCM6368_IRQ_OHCI		5
+#define BCM6368_IRQ_IPSEC		6
+#define BCM6368_IRQ_EHCI		7
+#define BCM6368_IRQ_USBS		8
+#define BCM6368_IRQ_RING_OSC		9
+#define BCM6368_IRQ_NAND		10
+#define BCM6368_IRQ_ATM			11
+#define BCM6368_IRQ_PCM			12
+#define BCM6368_IRQ_MPI			13
+#define BCM6368_IRQ_DG			14
+#define BCM6368_IRQ_EPHY		15
+#define BCM6368_IRQ_EPHY_EN0		16
+#define BCM6368_IRQ_EPHY_EN1		17
+#define BCM6368_IRQ_EPHY_EN2		18
+#define BCM6368_IRQ_EPHY_EN3		19
+#define BCM6368_IRQ_EXT0		20
+#define BCM6368_IRQ_EXT1		21
+#define BCM6368_IRQ_EXT2		22
+#define BCM6368_IRQ_EXT3		23
+#define BCM6368_IRQ_EXT4		24
+#define BCM6368_IRQ_EXT5		25
+#define BCM6368_IRQ_USB_CTL_RX_DMA	26
+#define BCM6368_IRQ_USB_CTL_TX_DMA	27
+#define BCM6368_IRQ_USB_BULK_RX_DMA	28
+#define BCM6368_IRQ_USB_BULK_TX_DMA	29
+#define BCM6368_IRQ_USB_ISO_RX_DMA	30
+#define BCM6368_IRQ_USB_ISO_TX_DMA	31
+#define BCM6368_IRQ_ENETSW_RX_DMA0	32	
+#define BCM6368_IRQ_ENETSW_RX_DMA1	33	
+#define BCM6368_IRQ_ENETSW_RX_DMA2	34	
+#define BCM6368_IRQ_ENETSW_RX_DMA3	35	
+#define BCM6368_IRQ_ENETSW_TX_DMA0	36	
+#define BCM6368_IRQ_ENETSW_TX_DMA1	37	
+#define BCM6368_IRQ_ENETSW_TX_DMA2	38	
+#define BCM6368_IRQ_ENETSW_TX_DMA3	39	
+#define BCM6368_IRQ_ATM_DMA0		40
+#define BCM6368_IRQ_ATM_DMA1		41
+#define BCM6368_IRQ_ATM_DMA2		42
+#define BCM6368_IRQ_ATM_DMA3		43
+#define BCM6368_IRQ_ATM_DMA4		44
+#define BCM6368_IRQ_ATM_DMA5		45
+#define BCM6368_IRQ_ATM_DMA6		46
+#define BCM6368_IRQ_ATM_DMA7		47
+#define BCM6368_IRQ_ATM_DMA8		48
+#define BCM6368_IRQ_ATM_DMA9		49
+#define BCM6368_IRQ_ATM_DMA10		50
+#define BCM6368_IRQ_ATM_DMA11		51
+#define BCM6368_IRQ_ATM_DMA12		52
+#define BCM6368_IRQ_ATM_DMA13		53
+#define BCM6368_IRQ_ATM_DMA14		54
+#define BCM6368_IRQ_ATM_DMA15		55
+#define BCM6368_IRQ_ATM_DMA16		56
+#define BCM6368_IRQ_ATM_DMA17		57
+#define BCM6368_IRQ_ATM_DMA18		58
+#define BCM6368_IRQ_ATM_DMA19		59
+#define BCM6368_IRQ_IPSEC_DMA0		60
+#define BCM6368_IRQ_IPSEC_DMA1		61
+#define BCM6368_IRQ_PCM_DMA0		62
+#define BCM6368_IRQ_PCM_DMA1		63
+
+#endif /* __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6368_H */
-- 
2.28.0

