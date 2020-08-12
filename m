Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A33242572
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgHLGcT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgHLGbl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:41 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8717C061788;
        Tue, 11 Aug 2020 23:31:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y3so938584wrl.4;
        Tue, 11 Aug 2020 23:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WOGPGL97PU4lMXtWSp6uZMuqLRJQnoS20hdr06UNMUk=;
        b=EtI9rPtjW2FkpVVU62AlsEdH+zCzeqj+sZgAsaTUwCzKy74rfhgYTdC3ddsF3VM5nF
         5hBykdxs2kZTVD9y66iLWRD0/ibG3mzeb0GgsGl5oKUwJ28fr/KBzQfQSdwU1VPNY68Y
         kXuU9jpPZq79wpXi9/TC4Npf4FeWaTiwkQmKNBsYhJQbiRbPHkokyvN8SrNrHhIJ5WLH
         JVdeEXid+QuoYmcNjkdoENHVoF+0TbiNnLPHiNZMZ2w9iH6hXOl56QeC/cTTjqPrS1KF
         srJXFapJC5nMVfbyKqMre2P43Zuk2sCx3iqM0rhYNxu40kNCyQn/5Qvox+0JRuHVabq2
         PW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WOGPGL97PU4lMXtWSp6uZMuqLRJQnoS20hdr06UNMUk=;
        b=OvSTGPhjuU/xK+29PnBpc3VtlDaVS1+cDTHAkZoYsi2QqPfdm2AwVwT8163Ldy5K8R
         vbToroEMn5sPXDCz1HSetq8kb+Xr+CXsm1OuNLqe1mGtrXYidVMS2AoljM746lJyPho3
         DQ0SzNbPN2F4q0bIYtkSfIsLNdbnutUGKw3w0RaccNln4C85Tk06h6kKxwkmo8dwKOpK
         zHZiBxJZRhbOBZJbietEvyyAo+fCj7v410JfSmMmDQ1IemHY+qXRzOHGts/bSZl6i04/
         iSPlQDHEYtdXdf6Bs8Q1w5/g9xKhSYzw7+aCLQKKcpXcRkQrU6Mt2m2bGMGQfZxSFlW9
         4Swg==
X-Gm-Message-State: AOAM530YRvaS1Brzx8N6xg6utheNd5VdMLTAVcM3gsFpnLEro/rp30nG
        Nuns3la60bheNtGWlImBIrI=
X-Google-Smtp-Source: ABdhPJzFpuktInQGt0crKDPXDVQAsE4QOndk2rZwuY/WAH+h4m3WrKPaMniHgjMaplTv6Go4MC7Wag==
X-Received: by 2002:a5d:4407:: with SMTP id z7mr31717760wrq.404.1597213899390;
        Tue, 11 Aug 2020 23:31:39 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:38 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 06/14] mips: bmips: add BCM6362 irq definitions
Date:   Wed, 12 Aug 2020 08:31:21 +0200
Message-Id: <20200812063129.361862-7-noltari@gmail.com>
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

Add header with BCM6362 definitions in order to be able to include it from
device tree files.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../bcm6362-interrupt-controller.h            | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/bcm6362-interrupt-controller.h

diff --git a/include/dt-bindings/interrupt-controller/bcm6362-interrupt-controller.h b/include/dt-bindings/interrupt-controller/bcm6362-interrupt-controller.h
new file mode 100644
index 000000000000..7a13046f0d81
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/bcm6362-interrupt-controller.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6362_H
+#define __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6362_H
+
+#define BCM6362_IRQ_TIMER		0
+#define BCM6362_IRQ_RING_OSC		1
+#define BCM6362_IRQ_LSSPI		2
+#define BCM6362_IRQ_UART0		3
+#define BCM6362_IRQ_UART1		4
+#define BCM6362_IRQ_HSSPI		5
+#define BCM6362_IRQ_WLAN_GPIO		6
+#define BCM6362_IRQ_WLAN		7
+#define BCM6362_IRQ_IPSEC		8
+#define BCM6362_IRQ_OHCI		9
+#define BCM6362_IRQ_EHCI		10
+#define BCM6362_IRQ_USBS		11
+#define BCM6362_IRQ_NAND		12
+#define BCM6362_IRQ_PCM			13
+#define BCM6362_IRQ_EPHY		14
+#define BCM6362_IRQ_DF			15
+#define BCM6362_IRQ_EPHY_EN0		16
+#define BCM6362_IRQ_EPHY_EN1		17
+#define BCM6362_IRQ_EPHY_EN2		18
+#define BCM6362_IRQ_EPHY_EN3		19
+#define BCM6362_IRQ_USB_CTL_RX_DMA	20
+#define BCM6362_IRQ_USB_CTL_TX_DMA	21
+#define BCM6362_IRQ_USB_BULK_RX_DMA	22
+#define BCM6362_IRQ_USB_BULK_TX_DMA	23
+#define BCM6362_IRQ_USB_ISO_RX_DMA	24
+#define BCM6362_IRQ_USB_ISO_TX_DMA	25
+#define BCM6362_IRQ_IPSEC_DMA0		26
+#define BCM6362_IRQ_IPSEC_DMA1		27
+#define BCM6362_IRQ_XDSL		28
+#define BCM6362_IRQ_FAP			29
+#define BCM6362_IRQ_PCIE_RC		30
+#define BCM6362_IRQ_PCIE_EP		31
+#define BCM6362_IRQ_ENETSW_RX_DMA0	32
+#define BCM6362_IRQ_ENETSW_RX_DMA1	33
+#define BCM6362_IRQ_ENETSW_RX_DMA2	34
+#define BCM6362_IRQ_ENETSW_RX_DMA3	35
+#define BCM6362_IRQ_PCM_DMA0		36
+#define BCM6362_IRQ_PCM_DMA1		37
+#define BCM6362_IRQ_DECT0		38
+#define BCM6362_IRQ_DECT1		39
+#define BCM6362_IRQ_EXT0		40
+#define BCM6362_IRQ_EXT1		41
+#define BCM6362_IRQ_EXT2		42
+#define BCM6362_IRQ_EXT3		43
+#define BCM6362_IRQ_ATM_DMA0		44
+#define BCM6362_IRQ_ATM_DMA1		45
+#define BCM6362_IRQ_ATM_DMA2		46
+#define BCM6362_IRQ_ATM_DMA3		47
+#define BCM6362_IRQ_ATM_DMA4		48
+#define BCM6362_IRQ_ATM_DMA5		49
+#define BCM6362_IRQ_ATM_DMA6		50
+#define BCM6362_IRQ_ATM_DMA7		51
+#define BCM6362_IRQ_ATM_DMA8		52
+#define BCM6362_IRQ_ATM_DMA9		53
+#define BCM6362_IRQ_ATM_DMA10		54
+#define BCM6362_IRQ_ATM_DMA11		55
+#define BCM6362_IRQ_ATM_DMA12		56
+#define BCM6362_IRQ_ATM_DMA13		57
+#define BCM6362_IRQ_ATM_DMA14		58
+#define BCM6362_IRQ_ATM_DMA15		59
+#define BCM6362_IRQ_ATM_DMA16		60
+#define BCM6362_IRQ_ATM_DMA17		61
+#define BCM6362_IRQ_ATM_DMA18		62		
+#define BCM6362_IRQ_ATM_DMA19		63
+
+#endif /* __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6362_H */
-- 
2.28.0

