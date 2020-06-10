Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33541F59DD
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbgFJRQi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729556AbgFJRQi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:16:38 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CDAC08C5C1;
        Wed, 10 Jun 2020 10:16:37 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l10so3143700wrr.10;
        Wed, 10 Jun 2020 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pZ9UANk+nZchs0IApRkeYxkybXjNTy9EcUcgSkrSGAo=;
        b=brLP8TzS+YCKpHhK48N7K/eL5bF4ui8zGe71EVKaIaSNEsE/Z4yq2ClHnMZjrKt6Ig
         ubArUhO8v4mBnH6AHI0pDofcn6n++r68GaxE/GxJSje3EvcRki3dKyqtiZtv371ZOPcc
         bgCkqKTxJsz/nCwXmU8OPI5GBeG4gtVW5Dahq1NRd8Ix6avCIi69wdRFz8rqzHZeqdJP
         3JXFGzbJXz6qB6SxyZAjQNEXRGeT1szSBrqWQR24RqUohag9Q5Nq7FFytFerAGQCJwRU
         mPlph2plh8vD2IWtgoGpw4gxRhsw8fLlfbrSma5wyiAQyztwo4Y+ruAmJSIBkPiesWcN
         Em0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pZ9UANk+nZchs0IApRkeYxkybXjNTy9EcUcgSkrSGAo=;
        b=mQJ1KX1cG5DDlVYNM0Zm+90NKzB+Jz43IycBweOhIZTJLKAC8MWhdJ2peBMyyUP10c
         JWbquN6fM/u6wbx0MGm+xBOPBYK8cO9HdvCqc2KUQTgytPZwEG89A70I1xhnyWEjRdzo
         LR9ByFr/ulZ+aW+GYak7JB2Sr4DKH5PHej7Qpn1mDMdyGe7svYjT2ijn2t90nhgQEu36
         REUfKGm4PfIQKOn9v7qSTfgoGmEQutVLywtra7F/tuEPrfvxNEOL2w1vAZW7MgnYbUFs
         3VtiTQK+UHFoZUn3HCqB+a3+GKew3hDIzzEh6hpyJdLmUQyq7SfohT2wXTqmuMv+IYTs
         S2/g==
X-Gm-Message-State: AOAM531FUqI4ZQddMFW8YU6RflURxDeXvv0T2af44HUj2okmMJ+RS45N
        iMCoZ21wMu0K/7+QvilMFqA=
X-Google-Smtp-Source: ABdhPJx7TXMDE0x4q1tNS/lbVYNvY27QjJQI3cLcIsrX0fz+OC1zXQXw0Ho15UIXRiEctaOOIgW4gg==
X-Received: by 2002:adf:ec03:: with SMTP id x3mr4849006wrn.297.1591809396050;
        Wed, 10 Jun 2020 10:16:36 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id f11sm589048wrm.13.2020.06.10.10.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:16:35 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 3/9] mips: bmips: dts: add BCM6362 power domain definitions
Date:   Wed, 10 Jun 2020 19:16:24 +0200
Message-Id: <20200610171630.465579-4-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610171630.465579-1-noltari@gmail.com>
References: <20200610163301.461160-1-noltari@gmail.com>
 <20200610171630.465579-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6362 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v3: Separate dt-bindings definitions from power domain .dtsi support.

 include/dt-bindings/soc/bcm6362-pm.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/soc/bcm6362-pm.h

diff --git a/include/dt-bindings/soc/bcm6362-pm.h b/include/dt-bindings/soc/bcm6362-pm.h
new file mode 100644
index 000000000000..d087ba63c7a1
--- /dev/null
+++ b/include/dt-bindings/soc/bcm6362-pm.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_BMIPS_BCM6362_PM_H
+#define __DT_BINDINGS_BMIPS_BCM6362_PM_H
+
+#define BCM6362_POWER_DOMAIN_SAR	0
+#define BCM6362_POWER_DOMAIN_IPSEC	1
+#define BCM6362_POWER_DOMAIN_MIPS	2
+#define BCM6362_POWER_DOMAIN_DECT	3
+#define BCM6362_POWER_DOMAIN_USBH	4
+#define BCM6362_POWER_DOMAIN_USBD	5
+#define BCM6362_POWER_DOMAIN_ROBOSW	6
+#define BCM6362_POWER_DOMAIN_PCM	7
+#define BCM6362_POWER_DOMAIN_PERIPH	8
+#define BCM6362_POWER_DOMAIN_ADSL_PHY	9
+#define BCM6362_POWER_DOMAIN_GMII_PADS	10
+#define BCM6362_POWER_DOMAIN_FAP	11
+#define BCM6362_POWER_DOMAIN_PCIE	12
+#define BCM6362_POWER_DOMAIN_WLAN_PADS	13
+
+#endif /* __DT_BINDINGS_BMIPS_BCM6362_PM_H */
-- 
2.26.2

