Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF65F1FCB53
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 12:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgFQKu4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 06:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgFQKuz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 06:50:55 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97DDC061755;
        Wed, 17 Jun 2020 03:50:54 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l11so1851337wru.0;
        Wed, 17 Jun 2020 03:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q32jAFtYDGTd7ehWi2GSlZRUAUiNhVpvNu8v0nFr12M=;
        b=mkBUbRo4unyaF1QFGNtUiXARCSxOZ7YVOI8T6RO5PyY0F0M8fuaTnhOuf86mnWdMVH
         3Zkdh5odX0zsx24/FFK7pH3rimS/J0e7MIgWMPpcsQJgMXyJSXlfj+3vr9kcIkxjjmvA
         EHcvdt94qRwnFhXFNLLKcb06Ejyzyvy67xB/Z351JE9Y+qE+o9vgnWlAmSFHN+L7VhLB
         Zq/RvPYcdxLAZGPDSQ/LY6XwzQpbZVmtzmzSbNggYEdnwP1lfdk9zWdouEUs8dhbhFdT
         D30ljuOZNx9ZmElSTm+op3xiAGkWeNqiE0U1RPJCXdgcYoHbaPLYTjL4ACv1JKpR1ebE
         +1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q32jAFtYDGTd7ehWi2GSlZRUAUiNhVpvNu8v0nFr12M=;
        b=QEzl0utFUpcLcPcyt2OnqMKoU6G7FR+VvhVR7Bpzkyc0QL8E5u77ULj468nGnl/KiG
         8WmDGefpApVmUq4yOriPqec23a3cc9EE4lto7RtKxnxSr8sVbNl6xA+nEmi+SjgRZafu
         87WuqqHR8ZT3l89XNAxiT9L/Ns50JHaxaOd42EFtjptxdNibP/r2wx9sO7qJ97cHoQV0
         TFuWeUwvILyQ+QaKXZ/23YFSzP1Cv5qnQJeLLGODq7yy3ql5AGbqQFSyPAwCk976NGZm
         aytUX2xOua9oaGy81boHJsE3zTKlrqAM6bSEMph+Ad1J5QsyVhIIjONhCFj11ejUUDRA
         O15g==
X-Gm-Message-State: AOAM533vdt5SLNJFciawodXbrznn340HW0X8eORrqMPKeZy/xaSv7ERD
        FlEUS50v9xO0O8dGR+E69HY3S+3sG7og+g==
X-Google-Smtp-Source: ABdhPJyttkMj/wWuPtlLnPcfiFv18cRqA8UWh01OFGYr3vE+IydWYwQuwzIsNibREUR6/jZ2492rbQ==
X-Received: by 2002:adf:f5d0:: with SMTP id k16mr8280025wrp.288.1592391052614;
        Wed, 17 Jun 2020 03:50:52 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id u12sm33331927wrq.90.2020.06.17.03.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:50:52 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Florian Fainelli <F.fainelli@gmail.com>
Subject: [PATCH v7 9/9] mips: bmips: add BCM6318 reset controller definitions
Date:   Wed, 17 Jun 2020 12:50:41 +0200
Message-Id: <20200617105042.3824116-10-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617105042.3824116-1-noltari@gmail.com>
References: <20200617105042.3824116-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <F.fainelli@gmail.com>
---
 v7: no changes.
 v6: fix BCM6318_RST_HOSTMIPS value (12 vs 11).
 v5: no changes.
 v4: no changes.
 v3: add new path with BCM6318 reset controller definitions.

 include/dt-bindings/reset/bcm6318-reset.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6318-reset.h

diff --git a/include/dt-bindings/reset/bcm6318-reset.h b/include/dt-bindings/reset/bcm6318-reset.h
new file mode 100644
index 000000000000..f882662505ea
--- /dev/null
+++ b/include/dt-bindings/reset/bcm6318-reset.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM6318_H
+#define __DT_BINDINGS_RESET_BCM6318_H
+
+#define BCM6318_RST_SPI		0
+#define BCM6318_RST_EPHY	1
+#define BCM6318_RST_SAR		2
+#define BCM6318_RST_ENETSW	3
+#define BCM6318_RST_USBD	4
+#define BCM6318_RST_USBH	5
+#define BCM6318_RST_PCIE_CORE	6
+#define BCM6318_RST_PCIE	7
+#define BCM6318_RST_PCIE_EXT	8
+#define BCM6318_RST_PCIE_HARD	9
+#define BCM6318_RST_ADSL	10
+#define BCM6318_RST_PHYMIPS	11
+#define BCM6318_RST_HOSTMIPS	12
+
+#endif /* __DT_BINDINGS_RESET_BCM6318_H */
-- 
2.27.0

