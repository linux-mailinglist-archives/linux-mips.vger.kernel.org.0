Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717BA1F5A69
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgFJR3S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgFJR3O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:29:14 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6F9C03E96B;
        Wed, 10 Jun 2020 10:29:13 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h5so3215884wrc.7;
        Wed, 10 Jun 2020 10:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G2Lr6SjiL6N0ciKI34TMGZiB3qI6dHWLVqvhZj6PhxI=;
        b=PD1+82Z4tDPQwSOSc/IePxxTIXJrUnsyFJAt/AaDorB+R4miIG9jF/N4h82yjjBwWj
         wMOO5dQxR3Y+UsLg8ww4kLBI0iVAJ6/YLhuhvgsv3RbQfbEBmqyyCpfrM4wfn+Q60n+G
         YoWKavAYPIgjdtY42jePdT8Sn6O75gL1OzZ0yRec6jilY0KCYJz9R5iVHx464qalpSlt
         2W8iOusNJnMeBU3eCIUoklmX16g/yMh2lFJ3gPRIGPVXDTAiYOD9xtD/MfINsI/B6Y7j
         DhDbg/Hx2YHzht0NXkbISFjtMyK7yRQ4xTwniRQDvgCLKRj335JZOeMG6eMOS5lBS4BR
         jcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G2Lr6SjiL6N0ciKI34TMGZiB3qI6dHWLVqvhZj6PhxI=;
        b=sADrL6ZMiinwBxUVPyRYpIAxvMXdE3w+bTwAAn3SR24C0iK4ehlm2fD30DOU/TqTcX
         X/F1o30gBI5B8r0qFBIWbSfA1eWs4r2/eIvk27rxeStt8YvBBU7esWQfPrkXYVWyy4q7
         tJw6TiAqP7IhPiQMxakanRujzF1CjxndK7fIih4DiArJlPyuvQ/DnmN3ZaY4HTNYIizW
         zlXyowBgkgJ1nreT0Zn8OQvoicuYwNLmI1lc33+2aKJ06tiB96Jk1giE2HTwu8pTJSzu
         piKiC+dsJYevDFUMGJE5IlD3lyCWUx9HifvqzpNyDuLKleVckkqtJJAYwUlwxfTzB2V1
         JakQ==
X-Gm-Message-State: AOAM5333qKQK8eYhrZP03ENIkAulQMr+7JHwJDLpcQBIbn+QONVRXb5S
        Ez4mLqdr0HYSph9bHIOO3HI=
X-Google-Smtp-Source: ABdhPJwKGmnFKEDZGI3VFkRXOZUzZxfFTSRveMERiV9+o4cUo6z6NAoaxP4cZxwBm42oLIEgtm2/CA==
X-Received: by 2002:adf:dec5:: with SMTP id i5mr5184502wrn.16.1591810152119;
        Wed, 10 Jun 2020 10:29:12 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h188sm568551wmh.2.2020.06.10.10.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:29:11 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 9/9] mips: bmips: add BCM6318 reset controller definitions
Date:   Wed, 10 Jun 2020 19:28:59 +0200
Message-Id: <20200610172859.466334-10-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610172859.466334-1-noltari@gmail.com>
References: <20200609160244.4139366-1-noltari@gmail.com>
 <20200610172859.466334-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v3: add new path with BCM6318 reset controller definitions.

 include/dt-bindings/reset/bcm6318-reset.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6318-reset.h

diff --git a/include/dt-bindings/reset/bcm6318-reset.h b/include/dt-bindings/reset/bcm6318-reset.h
new file mode 100644
index 000000000000..f4fef7bfb06d
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
+#define BCM6318_RST_HOSTMIPS	11
+
+#endif /* __DT_BINDINGS_RESET_BCM6318_H */
-- 
2.26.2

