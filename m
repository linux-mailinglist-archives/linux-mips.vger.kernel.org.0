Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186F9242571
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgHLGbj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgHLGbh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:37 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED7FC06174A;
        Tue, 11 Aug 2020 23:31:36 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id c15so902796wrs.11;
        Tue, 11 Aug 2020 23:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HfrH9XJIeIjW9MPHV3Q9JJJbPsSiUJeVFkAIIf3Fsl0=;
        b=thVm+vNxzQibJ15/FXNsGM8X8eAsckiCxhPM+D01ZbzoSAEU6JochS1YD8dCAnRbk2
         K4Wml/Y6OhlG537WBIM31z2Uxuu6X62FmkDJupDvnlNhvvkK59m+lG4yN2Ud7r0IMP3G
         H8s6MHwUtvCVYmvh3SR+l7dOa8LG40DVN5FbYeBXup8/T9Or9XpAbuhzlf22REw993Nq
         jMsjRxWYYs7UzUd3NO1dY+86IKQgOT0EC9LhxzfC/bL0p90E8za6K8aPtnaXUEHwX9wr
         Nrbzt3d5Wx1pCiePPeeWJm2ZFRhbu+OjRCNMeFZ+xvB6x1e3MAdr6yrT8cqxX+WA+Fdd
         aELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HfrH9XJIeIjW9MPHV3Q9JJJbPsSiUJeVFkAIIf3Fsl0=;
        b=gHTdBOSAiP+KCwaDUNEGPK/CpE9BSbO04GtocGTkCkzCP0vuakjysMp6pZXspALLhS
         W1SL8GKsJY6GfPaQdlOEEYohB7XC9eoMzVJDFghReS9D8CqxNsbBHqQdsFjDVlg8Ez7u
         RxfRkFcYZAl2A2xCl1hhi29zRUR5A+TtTrMFn6oMM4lzqOflK3dln79Hy4SqZpDhttdb
         wzZUCNUH7RKu/y91KbvstsHQKhBmSEKy6TfHmYRd6AxcEr/1Gb3LNpYO2Bzd8LYm/cGF
         RoitCndV1KD4q2U7W8QtLZaGL7nk+mKY46kIvvxJM5DxoRjdJNHv/AhU9QS7vGcUxO0r
         Gmuw==
X-Gm-Message-State: AOAM533VmakjvhUZscuSqO8dw4RPOU8F4Rxf+UOGZzRxG2IIftYunRmG
        wOIhdhaDK9d4ZxI5plfO+Xc=
X-Google-Smtp-Source: ABdhPJw0Ro33dnofz1oLki58VUcsfiqtSUoBceaHpJxFxJ3ZVcLcltk40vjvS/eULcEa5M5lxRV5Jw==
X-Received: by 2002:adf:9795:: with SMTP id s21mr31801505wrb.418.1597213895107;
        Tue, 11 Aug 2020 23:31:35 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:34 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 02/14] mips: bmips: add BCM3368 irq definitions
Date:   Wed, 12 Aug 2020 08:31:17 +0200
Message-Id: <20200812063129.361862-3-noltari@gmail.com>
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

Add header with BCM3368 definitions in order to be able to include it from
device tree files.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../bcm3368-interrupt-controller.h            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/bcm3368-interrupt-controller.h

diff --git a/include/dt-bindings/interrupt-controller/bcm3368-interrupt-controller.h b/include/dt-bindings/interrupt-controller/bcm3368-interrupt-controller.h
new file mode 100644
index 000000000000..e269c1bb93ea
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/bcm3368-interrupt-controller.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM3368_H
+#define __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM3368_H
+
+#define BCM3368_IRQ_TIMER		0
+#define BCM3368_IRQ_SPI			1
+#define BCM3368_IRQ_UART0		2
+#define BCM3368_IRQ_UART1		3
+#define BCM3368_IRQ_ENET1		6
+#define BCM3368_IRQ_ENET0		8
+#define BCM3368_IRQ_ENET_PHY		9
+#define BCM3368_IRQ_ENET0_RX_DMA	15
+#define BCM3368_IRQ_ENET0_TX_DMA	16
+#define BCM3368_IRQ_ENET1_RX_DMA	17
+#define BCM3368_IRQ_ENET1_TX_DMA	18
+#define BCM3368_IRQ_PCI			31
+
+#endif /* __DT_BINDINGS_INTERRUPT_CONTROLLER_BCM3368_H */
-- 
2.28.0

