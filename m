Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56364240CB7
	for <lists+linux-mips@lfdr.de>; Mon, 10 Aug 2020 20:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgHJSLP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Aug 2020 14:11:15 -0400
Received: from mx4.wp.pl ([212.77.101.12]:50558 "EHLO mx4.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727972AbgHJSLO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 10 Aug 2020 14:11:14 -0400
Received: (wp-smtpd smtp.wp.pl 29906 invoked from network); 10 Aug 2020 20:11:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1597083071; bh=HfuULCunNFPxADFCyjuwN29OzHX3sIA/W2lm/NKQ9Yo=;
          h=From:To:Cc:Subject;
          b=O/jo93n9yX73nDy1HNZHocXlL3+7eK2WNQC52FlYDF9PBGCjWmknaxe/6zm6EMrko
           KmEXPsA6JOT6eq0nL3tjR0CcodqE4c4aUXL1Ds/8jPgm4cvVIZIT411fQ7UhfsbZLZ
           qlJc2LTAqkqbPQU32g5LDRDmzAwdmKHLWSt26v2g=
Received: from riviera.nat.student.pw.edu.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[194.29.137.1])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <olek2@wp.pl>; 10 Aug 2020 20:11:11 +0200
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     Aleksander Jan Bajkowski <olek2@wp.pl>, linux-mips@vger.kernel.org,
        john@phrozen.org, hauke@hauke-m.de, tsbogend@alpha.franken.de
Subject: MIPS: lantiq: add missing GPHY clock aliases for ar10 and grx390
Date:   Mon, 10 Aug 2020 20:09:46 +0200
Message-Id: <20200810180946.2766-1-olek2@wp.pl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: c8c0149a888ae31f530904078c36fdb3
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [UUOz]                               
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add missing GPHY clock aliases for ar10 (xrx300) and grx390 (xrx330).
PMU in ar10 and grx390 differs from vr9. Ar10 has 3 and grx390 has 4
built-in GPHY compared to vr9 which has 2.

Corespondings PMU bit:
GPHY0 -> bit 29
GPHY1 -> bit 30
GPHY2 -> bit 31
GPHY3 -> bit 26

Tested on D-Link DWR-966 with OpenWRT.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: linux-mips@vger.kernel.org
Cc: john@phrozen.org
Cc: hauke@hauke-m.de
Cc: tsbogend@alpha.franken.de
---
 arch/mips/lantiq/xway/sysctrl.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index b10342018d19..917fac1636b7 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -112,11 +112,15 @@ static u32 pmu_clk_cr_b[] = {
 #define PMU_PPE_DP	BIT(23)
 #define PMU_PPE_DPLUS	BIT(24)
 #define PMU_USB1_P	BIT(26)
+#define PMU_GPHY3	BIT(26) /* grx390 */
 #define PMU_USB1	BIT(27)
 #define PMU_SWITCH	BIT(28)
 #define PMU_PPE_TOP	BIT(29)
+#define PMU_GPHY0	BIT(29) /* ar10, xrx390 */
 #define PMU_GPHY	BIT(30)
+#define PMU_GPHY1	BIT(30) /* ar10, xrx390 */
 #define PMU_PCIE_CLK	BIT(31)
+#define PMU_GPHY2	BIT(31) /* ar10, xrx390 */
 
 #define PMU1_PCIE_PHY	BIT(0)	/* vr9-specific,moved in ar10/grx390 */
 #define PMU1_PCIE_CTL	BIT(1)
@@ -465,6 +469,9 @@ void __init ltq_soc_init(void)
 
 	if (of_machine_is_compatible("lantiq,grx390") ||
 	    of_machine_is_compatible("lantiq,ar10")) {
+		clkdev_add_pmu("1e108000.switch", "gphy0", 0, 0, PMU_GPHY0);
+		clkdev_add_pmu("1e108000.switch", "gphy1", 0, 0, PMU_GPHY1);
+		clkdev_add_pmu("1e108000.switch", "gphy2", 0, 0, PMU_GPHY2);
 		clkdev_add_pmu("1f203018.usb2-phy", "phy", 1, 2, PMU_ANALOG_USB0_P);
 		clkdev_add_pmu("1f203034.usb2-phy", "phy", 1, 2, PMU_ANALOG_USB1_P);
 		/* rc 0 */
@@ -496,6 +503,7 @@ void __init ltq_soc_init(void)
 	} else if (of_machine_is_compatible("lantiq,grx390")) {
 		clkdev_add_static(ltq_grx390_cpu_hz(), ltq_grx390_fpi_hz(),
 				  ltq_grx390_fpi_hz(), ltq_grx390_pp32_hz());
+		clkdev_add_pmu("1e108000.switch", "gphy3", 0, 0, PMU_GPHY3);
 		clkdev_add_pmu("1e101000.usb", "otg", 1, 0, PMU_USB0);
 		clkdev_add_pmu("1e106000.usb", "otg", 1, 0, PMU_USB1);
 		/* rc 2 */
@@ -514,8 +522,6 @@ void __init ltq_soc_init(void)
 		clkdev_add_pmu("1e10b308.eth", NULL, 0, 0, PMU_SWITCH |
 			       PMU_PPE_DP | PMU_PPE_TC);
 		clkdev_add_pmu("1da00000.usif", "NULL", 1, 0, PMU_USIF);
-		clkdev_add_pmu("1e108000.switch", "gphy0", 0, 0, PMU_GPHY);
-		clkdev_add_pmu("1e108000.switch", "gphy1", 0, 0, PMU_GPHY);
 		clkdev_add_pmu("1e103100.deu", NULL, 1, 0, PMU_DEU);
 		clkdev_add_pmu("1e116000.mei", "afe", 1, 2, PMU_ANALOG_DSL_AFE);
 		clkdev_add_pmu("1e116000.mei", "dfe", 1, 0, PMU_DFE);
-- 
2.20.1

