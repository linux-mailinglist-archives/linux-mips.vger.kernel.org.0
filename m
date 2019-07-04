Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A84935F7F2
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2019 14:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbfGDMXp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Jul 2019 08:23:45 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40071 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbfGDMXp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Jul 2019 08:23:45 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so5929699wmj.5;
        Thu, 04 Jul 2019 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Au6/RZg4uG1yjTUrNE1TtFncQkGuc7/u4mr9IkIEock=;
        b=ppsqQ6341LXZFkotdqm7QLQNWGU2FguwpzLTyHWzKLkaCn5PELO/IIhDdbn1SsrBjO
         912lOfJ0OO17P2wGjRgxoecwR3uva40CC1Cdk0/STTlkp+S8HjqXHK8CumYyiMquyMxX
         72j5g8PS2UH9lBYnolqHokJXjRXtzqGiTT37xcxdZkxEi4xoy7ke8UspwBx3jdIjMfcq
         WMtkaL37U59ZMY2o6Ngzzi0NSwsA15D1AsQWp3VLD5R2D+7ZmYKR0JKWtY69w4f8ERal
         4m7YChnusYIUjWzvRilVAgH0NsSRt4DUCfbLqPSvU0ll6n/oHi16XacizVdJrefXbWaN
         5biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Au6/RZg4uG1yjTUrNE1TtFncQkGuc7/u4mr9IkIEock=;
        b=ZXq36EmgKJxJASwtJSUnebnDmpGFbNsdhTiWFU0SN0bYWUlHJPlEz8WqRm7PYW2jHJ
         P4rl9aXWgIlDhyq2ZrMQQ1N1LVgfQD0EP4UT8KySTlo2wfDfmGMaMHHYs4zo5DUoWA1P
         HKFbiQ4X0UlDyuAihZnChrOO+qJKtcyz3we30Xoh8C2/FGCnSaX+FVnGcXajLAkzTCYE
         79KA/7L0WA2PiFUksmSPYNBJsCWSuTgeMTzjY5lcypFpYDUpZTHuAv4BGx6wNusBMn6k
         s8c8dM/babt1ftN4pEyiyXSyW+wNBbtDIlSQT4DdOBJuNUEFr05OYPGbGxamroCFY5Pu
         w5zw==
X-Gm-Message-State: APjAAAX/MYxm9WtzY7HSgFq9Zmp48XXt5z0+c/uODPtMgidVoDe1qlig
        OzFmdaC0NeLpUUO/5rgaCV7y+uoo
X-Google-Smtp-Source: APXvYqy+OfXVBhg/qFCqUwLyU9WkJ4ZlxYbp/Uxs+PRCpc6bTufZkfPTrxjP/EXZ39T4H65hDNo7GA==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr13186879wma.90.1562243022349;
        Thu, 04 Jul 2019 05:23:42 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D6200090FB6F2A0C02D39B.dip0.t-ipconnect.de. [2003:f1:33d6:2000:90fb:6f2a:c02:d39b])
        by smtp.googlemail.com with ESMTPSA id w10sm5141825wru.76.2019.07.04.05.23.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 05:23:41 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        paul.burton@mips.com, ralf@linux-mips.org, mark.rutland@arm.com,
        ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 4/4] MIPS: lantiq: update the clock alias' for the mainline PCIe PHY driver
Date:   Thu,  4 Jul 2019 14:23:19 +0200
Message-Id: <20190704122319.8983-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
References: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The mainline PCIe PHY driver has it's own devicetree node. Update the
clock alias so the mainline driver finds the clocks.

The first PCIe PHY is located at 0x1f106800 and exists on VRX200, ARX300
and GRX390.
The second PCIe PHY is located at 0x1f700400 and exists on ARX300 and
GRX390.
The third PCIe PHY is located at 0x1f106a00 and exists onl on GRX390.
Lantiq's board support package (called "UGW") names these registers
"PDI".

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/mips/lantiq/xway/sysctrl.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index b4323b2214e2..156a95ac5c72 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -468,14 +468,14 @@ void __init ltq_soc_init(void)
 		clkdev_add_pmu("1f203018.usb2-phy", "phy", 1, 2, PMU_ANALOG_USB0_P);
 		clkdev_add_pmu("1f203034.usb2-phy", "phy", 1, 2, PMU_ANALOG_USB1_P);
 		/* rc 0 */
-		clkdev_add_pmu("1d900000.pcie", "phy", 1, 2, PMU_ANALOG_PCIE0_P);
+		clkdev_add_pmu("1f106800.phy", "phy", 1, 2, PMU_ANALOG_PCIE0_P);
 		clkdev_add_pmu("1d900000.pcie", "msi", 1, 1, PMU1_PCIE_MSI);
-		clkdev_add_pmu("1d900000.pcie", "pdi", 1, 1, PMU1_PCIE_PDI);
+		clkdev_add_pmu("1f106800.phy", "pdi", 1, 1, PMU1_PCIE_PDI);
 		clkdev_add_pmu("1d900000.pcie", "ctl", 1, 1, PMU1_PCIE_CTL);
 		/* rc 1 */
-		clkdev_add_pmu("19000000.pcie", "phy", 1, 2, PMU_ANALOG_PCIE1_P);
+		clkdev_add_pmu("1f700400.phy", "phy", 1, 2, PMU_ANALOG_PCIE1_P);
 		clkdev_add_pmu("19000000.pcie", "msi", 1, 1, PMU1_PCIE1_MSI);
-		clkdev_add_pmu("19000000.pcie", "pdi", 1, 1, PMU1_PCIE1_PDI);
+		clkdev_add_pmu("1f700400.phy", "pdi", 1, 1, PMU1_PCIE1_PDI);
 		clkdev_add_pmu("19000000.pcie", "ctl", 1, 1, PMU1_PCIE1_CTL);
 	}
 
@@ -499,9 +499,9 @@ void __init ltq_soc_init(void)
 		clkdev_add_pmu("1e101000.usb", "otg", 1, 0, PMU_USB0);
 		clkdev_add_pmu("1e106000.usb", "otg", 1, 0, PMU_USB1);
 		/* rc 2 */
-		clkdev_add_pmu("1a800000.pcie", "phy", 1, 2, PMU_ANALOG_PCIE2_P);
+		clkdev_add_pmu("1f106a00.pcie", "phy", 1, 2, PMU_ANALOG_PCIE2_P);
 		clkdev_add_pmu("1a800000.pcie", "msi", 1, 1, PMU1_PCIE2_MSI);
-		clkdev_add_pmu("1a800000.pcie", "pdi", 1, 1, PMU1_PCIE2_PDI);
+		clkdev_add_pmu("1f106a00.pcie", "pdi", 1, 1, PMU1_PCIE2_PDI);
 		clkdev_add_pmu("1a800000.pcie", "ctl", 1, 1, PMU1_PCIE2_CTL);
 		clkdev_add_pmu("1e10b308.eth", NULL, 0, 0, PMU_SWITCH | PMU_PPE_DP);
 		clkdev_add_pmu("1da00000.usif", "NULL", 1, 0, PMU_USIF);
@@ -526,10 +526,10 @@ void __init ltq_soc_init(void)
 		clkdev_add_pmu("1e101000.usb", "otg", 1, 0, PMU_USB0 | PMU_AHBM);
 		clkdev_add_pmu("1f203034.usb2-phy", "phy", 1, 0, PMU_USB1_P);
 		clkdev_add_pmu("1e106000.usb", "otg", 1, 0, PMU_USB1 | PMU_AHBM);
-		clkdev_add_pmu("1d900000.pcie", "phy", 1, 1, PMU1_PCIE_PHY);
+		clkdev_add_pmu("1f106800.phy", "phy", 1, 1, PMU1_PCIE_PHY);
 		clkdev_add_pmu("1d900000.pcie", "bus", 1, 0, PMU_PCIE_CLK);
 		clkdev_add_pmu("1d900000.pcie", "msi", 1, 1, PMU1_PCIE_MSI);
-		clkdev_add_pmu("1d900000.pcie", "pdi", 1, 1, PMU1_PCIE_PDI);
+		clkdev_add_pmu("1f106800.phy", "pdi", 1, 1, PMU1_PCIE_PDI);
 		clkdev_add_pmu("1d900000.pcie", "ctl", 1, 1, PMU1_PCIE_CTL);
 		clkdev_add_pmu(NULL, "ahb", 1, 0, PMU_AHBM | PMU_AHBS);
 
-- 
2.22.0

