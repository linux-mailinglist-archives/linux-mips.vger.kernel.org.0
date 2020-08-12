Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA51242552
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgHLGbl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgHLGbk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:40 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72A8C061787;
        Tue, 11 Aug 2020 23:31:39 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y3so938540wrl.4;
        Tue, 11 Aug 2020 23:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YqwGurqd5uK7QVmb7fPtpy/V1kBXzGsqFOzo+2XH/LE=;
        b=Ya4GpqyffcFtEdhtT4EwJFaQs1w1mR07dIWgvOunrPPtYrgJdgNWpSW4IVjb76dDG8
         BbpYwM7FIs2FZoR07mMWlaUdKK6ieJNujijdUtJ/8cjfJvMSIvXCtZqwuLgW/8nlbx+v
         VLBz0kGDs7t9GdgxhGL8T3bG4MMCR2wENqFk7GtbCJCk3Dl9cg/PGokcEUNrwnX4cum7
         HTAplB+cJP9Bfmg2JBCvwT7M2NFS4re4Lm29LIXdsRYodfjNzsd0dd3go+qToxM+xQQg
         +KEzUROhF9P0lTuHrOpbvYaww2YpBgeL8SqaBVdjj4PTojx7Rhm+hL15Wno8LMbZlY3P
         4PQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YqwGurqd5uK7QVmb7fPtpy/V1kBXzGsqFOzo+2XH/LE=;
        b=DjuOsasjCmaQrYsQVX2i3kst4+a3v+z+lavRkLvK2F8OPPeKM5ObypwLo3aDm+Cu20
         C2t5jpahJZj0tpDGFThxEzf56g0ohAW5+66o9bR5a3AlM0mi7OwE/qn6EXRCOT99GcCS
         J8PMSSR9Q1k/e2+t9Vt9cU27ZVziYHaBKsxDIMEBgaiZya6MM/qCi1rfLWqQCysENONT
         ObmUQvUdnZ+f18RdKV2s1dnMsTUdxYp8XjPHUMRvgJGiHXfx9vmKt5eiRDvbAYKYutfb
         srpkStPm0cRqDvGh/PSi6mpRxzPs0dO9mCJ8AlfPfCyhvwSUa2QGcLlonTkjaL1I6o8u
         A7nQ==
X-Gm-Message-State: AOAM530fazvwFby09QwQiJx1VqXsHNYoPJKJPKWk+3OZ10lHzO7934LO
        lAI1VlH9Ki2a7ex3wB4z8lI=
X-Google-Smtp-Source: ABdhPJwLeiwOnaE9laWkXf+yqDocujm7szRtXNwqPNogkrcqwSG691Unbt51woCcoPgHwF3ea5qbaA==
X-Received: by 2002:adf:90d1:: with SMTP id i75mr30932503wri.278.1597213898407;
        Tue, 11 Aug 2020 23:31:38 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:37 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 05/14] mips: bmips: add BCM6358 irq definitions
Date:   Wed, 12 Aug 2020 08:31:20 +0200
Message-Id: <20200812063129.361862-6-noltari@gmail.com>
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

Add header with BCM6358 definitions in order to be able to include it from
device tree files.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../bcm6358-interrupt-controller.h            | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/bcm6358-interrupt-controller.h

diff --git a/include/dt-bindings/interrupt-controller/bcm6358-interrupt-controller.h b/include/dt-bindings/interrupt-controller/bcm6358-interrupt-controller.h
new file mode 100644
index 000000000000..a098639dbe4e
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/bcm6358-interrupt-controller.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6358_H
+#define __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6358_H
+
+#define BCM6358_IRQ_TIMER		0
+#define BCM6358_IRQ_SPI			1
+#define BCM6358_IRQ_UART0		2
+#define BCM6358_IRQ_UART1		3
+#define BCM6358_IRQ_OHCI		5
+#define BCM6358_IRQ_EMAC1		6
+#define BCM6358_IRQ_USBS		7
+#define BCM6358_IRQ_EMAC0		8
+#define BCM6358_IRQ_EPHY		9
+#define BCM6358_IRQ_EHCI		10
+#define BCM6358_IRQ_USB_CTL_RX_DMA	11
+#define BCM6358_IRQ_USB_CTL_TX_DMA	12
+#define BCM6358_IRQ_USB_BULK_RX_DMA	13
+#define BCM6358_IRQ_USB_BULK_TX_DMA	14
+#define BCM6358_IRQ_EMAC0_RX_DMA	15
+#define BCM6358_IRQ_EMAC0_TX_DMA	16
+#define BCM6358_IRQ_EMAC1_RX_DMA	17
+#define BCM6358_IRQ_EMAC1_TX_DMA	18
+#define BCM6358_IRQ_ATM		        19
+#define BCM6358_IRQ_EXT4		20
+#define BCM6358_IRQ_EXT5		21
+#define BCM6358_IRQ_PCM			22
+#define BCM6358_IRQ_PCM_RX_DMA		23
+#define BCM6358_IRQ_PCM_TX_DMA		24
+#define BCM6358_IRQ_EXT0		25
+#define BCM6358_IRQ_EXT1		26
+#define BCM6358_IRQ_EXT2		27
+#define BCM6358_IRQ_EXT3		28
+#define BCM6358_IRQ_ADSL		29
+#define BCM6358_IRQ_DG			30
+#define BCM6358_IRQ_MPI			31
+
+#endif /* __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM6358_H */
-- 
2.28.0

