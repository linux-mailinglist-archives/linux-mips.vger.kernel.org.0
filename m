Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A36C1F59FE
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbgFJRR0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729547AbgFJRQg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:16:36 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4571BC03E96B;
        Wed, 10 Jun 2020 10:16:36 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h5so3170415wrc.7;
        Wed, 10 Jun 2020 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i0mKAgNccMa2ZBBdbrYs78yyCyApQWezbV22kysTj+4=;
        b=S8ZQtrdKGhYX3L2Zf22Ow4awZjHpM4Kr++6M2lV76Fip7fynDjKe7uz9EaSjHTWIy/
         +mKoYFWpbONpsoPJqFlTZM7TY0EAS0UB1mKWrWvOCM9tvFaMSVxTQElAJQDflbPupB9l
         Sbs5HAqjnXVjUANb1/ZHiWMO12/TtAEiJXtnKMpeUbDxm1dhPfPO0FNTgM2EqllGRMPi
         Si5yodapyvYHVe2/bOiaiP9hhxz85l8835Bdpf4MzXF9Y5iqMOeme5FsuUktBbg0O7pA
         1vt+witBIwa8K0wq1TL9TyUCJzuuPBCSk5CjpAOYhUXE4Rf1pf523euUWa91izJSS11E
         JgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i0mKAgNccMa2ZBBdbrYs78yyCyApQWezbV22kysTj+4=;
        b=JzjMcwKhImF0TqAvhYUzSxqH2S0sFFquVzLIQ7iVqEEPL1ZCb1dEbtvEFLZEZjI45a
         XS1ywCty4wLSmLlncnJQZzRXIMtZTLAKBUYTMlOF9AYOpc+Sso1QpPPidXqlGlWPH9Dz
         JhDvhcssh572x9sI34iR5JwWw5MctRKY6Flllt5K4krcJYBu1o5RaDM4xcfTObo9xa+H
         czfh0vgdTFypn405EXfYU65p4AeXJAQ036iC9DdZeyzaNd7gZcPtsjxgXDU7OdSyFn4X
         JkAfNOGU45UH9GOSW9DxSes9KGShYbzAmPgYMxEA/XXl283TX+jq31YqdKginfXLho6u
         rVJg==
X-Gm-Message-State: AOAM531zyTdgL51UQD9aMHMMAo42Eh+Kwpn4hMzuPKQSsPFy3ub2Yq86
        uSpCXankzssnTKcwZaA0t4A=
X-Google-Smtp-Source: ABdhPJzJ7qXk08Ze91v6soC5e7h24A+Rehyc86Q9DWOOtanBtdgbF2FKsrQugY1rykVEtwnV/dzsxQ==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr4738012wrp.369.1591809394898;
        Wed, 10 Jun 2020 10:16:34 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id f11sm589048wrm.13.2020.06.10.10.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:16:34 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 2/9] mips: bmips: dts: add BCM6328 power domain definitions
Date:   Wed, 10 Jun 2020 19:16:23 +0200
Message-Id: <20200610171630.465579-3-noltari@gmail.com>
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

BCM6328 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v3: Separate dt-bindings definitions from power domain .dtsi support.

 include/dt-bindings/soc/bcm6328-pm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/soc/bcm6328-pm.h

diff --git a/include/dt-bindings/soc/bcm6328-pm.h b/include/dt-bindings/soc/bcm6328-pm.h
new file mode 100644
index 000000000000..557e1a69b7f7
--- /dev/null
+++ b/include/dt-bindings/soc/bcm6328-pm.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_BMIPS_BCM6328_PM_H
+#define __DT_BINDINGS_BMIPS_BCM6328_PM_H
+
+#define BCM6328_POWER_DOMAIN_ADSL2_MIPS	0
+#define BCM6328_POWER_DOMAIN_ADSL2_PHY	1
+#define BCM6328_POWER_DOMAIN_ADSL2_AFE	2
+#define BCM6328_POWER_DOMAIN_SAR	3
+#define BCM6328_POWER_DOMAIN_PCM	4
+#define BCM6328_POWER_DOMAIN_USBD	5
+#define BCM6328_POWER_DOMAIN_USBH	6
+#define BCM6328_POWER_DOMAIN_PCIE	7
+#define BCM6328_POWER_DOMAIN_ROBOSW	8
+#define BCM6328_POWER_DOMAIN_EPHY	9
+
+#endif /* __DT_BINDINGS_BMIPS_BCM6328_PM_H */
-- 
2.26.2

