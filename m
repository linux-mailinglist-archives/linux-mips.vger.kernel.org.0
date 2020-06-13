Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96D71F81E1
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgFMIWR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbgFMIVr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:21:47 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13107C08C5C2;
        Sat, 13 Jun 2020 01:21:47 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x13so12143330wrv.4;
        Sat, 13 Jun 2020 01:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1xHqshvxVKt/Lif7hiknmlHxlW07FtmhilPxSVlIbzA=;
        b=hQeMubGl0U1kMD9APCucPsThjqmZErTgqMqpas/RXVrVuKik3XLu267jxm8+MFyp7i
         CxObj0oCpakzUlx30JZ1apyR5ezRwug9pH+/B/XrhK14bNf+HffCgsfIr9QX6bSN+h6A
         QkW9Mw4AQuM8AeYXWXuwI8RbtL4SmXg40XTciweYEYYIH4qYjJDethU72hXLVZvXlZPd
         7/3l550iXVDmRHP6vLtLkMKGmT3nDOEZ7ryXeZXb+9u4DawV6XWkh/lXOwd7VVB/MV0I
         J1lpvgNzEnhQfs8UwJeEjm3TDlCxm7W1X2eGjb5M3hioDrBnaatbok0dZNedkvltqLaP
         +FJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1xHqshvxVKt/Lif7hiknmlHxlW07FtmhilPxSVlIbzA=;
        b=PvelzqkgV7TAoIVEHeXEZWC5vtHiS9b7K2aiQbCS8KkX4TnADlVJkfGw50dow1yl2u
         x1GDNYf4GqqI4Vo4RIoe9QJsa9UZCfnm2EfhMA0IH7LqINJhg3j0sxL+5hZP6d5AIR4b
         c1xOco7aoHPTF9rv2uTEBaTbEgI/n5jYT8Eblk+eGq4vIkqz/XRQxHbYh7pH1p+FZdwt
         jivcKQyxaI500DFTy3U2LwPp9pyxYuduCyMgZ8JAVDhR37/1o/JrU/DUzzovDZZNjny5
         9vaxIEsFlgJ5dqPoZlpnU600uet6hHEzUqkcUiYDxubyB+IG128ro5UVo5HQsPB7wvgY
         ab8w==
X-Gm-Message-State: AOAM533Zwr+JxKqhwKsrm+HpAZEd9chirEXzD2ecsjzBnEVf1iBqpp4k
        JwIP6RkMlhJBYwm3ATULdeE=
X-Google-Smtp-Source: ABdhPJyoQ7Fl36M6toxK2SERExtYee+vDUqZWL7IQ4fImJNlfNCpjSb7bNaalRlw+jY7fWa03bWqbw==
X-Received: by 2002:adf:f611:: with SMTP id t17mr18253571wrp.69.1592036505707;
        Sat, 13 Jun 2020 01:21:45 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id n189sm12243603wmb.43.2020.06.13.01.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:21:45 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 2/9] mips: bmips: add BCM6328 power domain definitions
Date:   Sat, 13 Jun 2020 10:21:33 +0200
Message-Id: <20200613082140.2009461-3-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200613082140.2009461-1-noltari@gmail.com>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
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
 v4: Remove "dts: " from commit title.
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
2.27.0

