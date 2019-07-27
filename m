Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1275F7788D
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 14:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387608AbfG0MEn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 08:04:43 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37311 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387566AbfG0MEm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Jul 2019 08:04:42 -0400
Received: by mail-wm1-f65.google.com with SMTP id f17so49681423wme.2;
        Sat, 27 Jul 2019 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Au6/RZg4uG1yjTUrNE1TtFncQkGuc7/u4mr9IkIEock=;
        b=bQf1bqXlGZAgCIUG5KVPwTyj/e2ta2sCmbq4RigEms3WHUYE+6DrbX+TQTgdex8KXF
         SSeOdd8634ONiC5yQX8mRA1m+WRNTvsfxPbxxq2EVDetarcoQpbO5hBz+wJKjSIsKXY7
         /q3+657Ka0YshwFKybxUP3g/9jR9mF92hM4cKsW4lh98z3rWsVocoDnfBFOaQgDmet2U
         bQXE0GqxLOoJ3w3plzdqMT1jjRFfbEnv5//Ej5gWiCncHgF2+arAA1uZVOoBe+VNKkFV
         DwRFo66bnk11qMIM6jiHWZkX77mfZgejXNJegPLkR/x9iR9IWZGUG44QUigzloY1xV/r
         fZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Au6/RZg4uG1yjTUrNE1TtFncQkGuc7/u4mr9IkIEock=;
        b=lmFPth62Rdi762oj85fds7RXU4yy41wkzg/VSauOQ0sVsHx7sxiaE3fF2IVCHJV/aq
         DLe3F+oJcwzl/vaKktsdq42LUbyRRiAwj3vmoYLDbQmhQkn+DqpjD0VuSNurcEN64ycY
         gONPl2iYjUUnM1V2XbmM05RjiGkJlwV51tjXQv//STZgHnwldDTleokPe8mULCrz6joo
         Q5UCzzaEjAiYAM28ne783RUwXILDo8/YqcJ01HfOU9DI0QUknsO2Xlq1Tp8V8B84ysaG
         snx77HjAyAkF6NTcxoMxVtYnpga23uX6mTKNe5c7w4i3tMoV3EtIiGw02lOmJ8VdFY2M
         5OCA==
X-Gm-Message-State: APjAAAU7FumEaTmr73ku0sVSQZIarUWmArnq1i+jRbtN61aMZMK6mzr8
        lY4xROvMnOP2t2LT0VMuE5SmruJQ
X-Google-Smtp-Source: APXvYqzU8VW52Y656rz/HojqVA9YkRLKJOeG/Dq909S2JfESbbf48qEPup4niHIfXStrWZrOCnk4Ww==
X-Received: by 2002:a1c:b146:: with SMTP id a67mr88076976wmf.124.1564229080440;
        Sat, 27 Jul 2019 05:04:40 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de. [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
        by smtp.googlemail.com with ESMTPSA id r5sm58596219wmh.35.2019.07.27.05.04.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 05:04:39 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, paul.burton@mips.com,
        ralf@linux-mips.org
Cc:     robh+dt@kernel.org, linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        mark.rutland@arm.com, ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 4/4] MIPS: lantiq: update the clock alias' for the mainline PCIe PHY driver
Date:   Sat, 27 Jul 2019 14:04:15 +0200
Message-Id: <20190727120415.15859-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
References: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
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

