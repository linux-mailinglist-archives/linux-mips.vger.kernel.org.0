Return-Path: <linux-mips+bounces-9376-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63639ADE1D6
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 05:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E296D17BC69
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 03:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DF81F4191;
	Wed, 18 Jun 2025 03:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="jO2FWc+o"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010005.outbound.protection.outlook.com [52.103.43.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490B1F03FB;
	Wed, 18 Jun 2025 03:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218168; cv=fail; b=pEOqa4qoGKy+rAT4Q8VtG4XjuhEGUvo8ZCjsYGb2rc/WO7hqns048GuxnpaOmzk3P8KNT/RSrCOWSOJQQdDJxnc7Xy/0XL6tReiVzVLIEvfYeCQoVXGmrFgglBDDJYiVFEyfoeggJQ2O8qReCbCzKUr10xaoM/Oxt74W3txfutE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218168; c=relaxed/simple;
	bh=xMJluG6Ho/1SPUurWtTAHzTvG3ZG0NLfZEmQoknXQQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VRI7GHtXnHGoVY+KJCnbT06oBOdzLq42xpQy1whpbHB7S+3f+2K7ubiAlU4Nvu0l8DNWZu8G0L+io7tNdhmlb8GTpmJzaYHz3LV26jrQ9NqF327jgJV/9I+ag+ki47afuE52GPygXNQf+myaMKIEee+hhRYx204AhAdq5HX8uL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=jO2FWc+o; arc=fail smtp.client-ip=52.103.43.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbGBOcNhT+33I455QApJcTPFxhNcJtMxkOTUQDWXouUq9RLhbaaC1/xQNtHBXvyMBsvL1OZDYvs3rm/NNwP/Oc3NClCa+yzhZOqiALYEKyZOA1iu/cgpASCs5RtTDaxoNZbMVMgHf8SQ3VUAzPJHm0AikhZpVBNIb+mn0g2A1VpWL9ND753QrXx3I1jHY2pAw3pV72CqazxT/vAfGJOu9eFfOcVgrY3fvPzTStniWdRc2sWpXOL5RjFghl4vJjs9WQQQxDciIbDlWhm0HV0+bhpnUYcnsd5HFrPrm2w4HgWmP0U4rCRvdBx9O4B25LmTNECau7pyGPwJAofN54oF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NfL8198nX6cXejijimgTCUG9/Y2ODbkXwleJQUyYSw=;
 b=X8+ctqFxCLoZNhkaO8ElFRbyvdK89HAiP5W2PCGy9jNC47C2PjjBqi3E2Z59t8smDYruuC4Zs03QwEY0Dt+rCxiXgQnkjuwk+VF69Fe0sNBHZ5Hfvb+b6Y3qkLL5UTwIMIf4KpK1gu+3K51AFvvglnUcF1E3NStZogiz5co2CluAQPocYtb2cs96txpwCJn++hDnUFuSYYnd9GgEHTxCNkc8lzUJbDPVtqPJj2xhZRkaX32rbB0CUcnpV7Wp7FPtGMOEckGEqX6FWoifOHskMGIxWqRGKPE0T6ALOZz5EBkMkC3zoiWLGIDUcCbJgRXmoS7XpTsajJn68bjkRxfrBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NfL8198nX6cXejijimgTCUG9/Y2ODbkXwleJQUyYSw=;
 b=jO2FWc+o4DeGPwQNdV9nyI9ydOaFqlNxf3gWXAHE7ZXyAVl1pbO/stZI+PUuFQkhrQuUWJ0KUDW6Hf2Vuf1HM2cmKSXWbV+E3m4lQ5NS7xzYtVqU3935s+wj4RvJFDfzmTOf1DSfxhkrIQRtJE8g8MQx2aQUMOwEtKb3dg0g/HCu6rscKRXSZYwf7lOSXPQJfFNaWStEQ3oRAEBpSifP2deyhloBVV8MGfdI5M0NWocCi2n0rhVVT40T87sdc3seKlkMSBLqhGppx9sauZFMTrxNhn6z5N9fzMDcOppQ/5Fm9O6AH9flLwGZ+3BUOOiV1UPQeb5hJMFjWX1PpBm3NA==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by TYCPR01MB6477.jpnprd01.prod.outlook.com (2603:1096:400:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 03:42:41 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%7]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 03:42:41 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH 3/3] mips: pci-mt7620: rework initialization procedure
Date: Wed, 18 Jun 2025 11:42:07 +0800
Message-ID:
 <OSBPR01MB167090804D80D1166900D7BCBC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
References: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID:
 <20250618034207.22118-3-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|TYCPR01MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 116036d4-96a2-40f1-368a-08ddae1a2d7f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|19110799006|461199028|15080799009|41001999006|8060799009|7092599006|3412199025|440099028|40105399003|52005399003|12091999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X/DYGqJkHK+FbE/NkoLS5ZLUoaVuAb3U+En6ZpUOVdHnTq/o5BRexzQDIvfy?=
 =?us-ascii?Q?clNH+p7InXUgWqq8YRnatWGhpN4ERRIm9ciUidn5Iq7W5cRedzyWwXBWgvlM?=
 =?us-ascii?Q?bUmrysC13/gPG+mr3nuEV5l/RMJvYLmjvZL13eFz3VCzl2J03iyZRrPLBLUz?=
 =?us-ascii?Q?1dIbx7q/cltilk0HCeTHxw4MFLUG9do1lrDiqkASuTL28vNZ7e/13FRxnoCL?=
 =?us-ascii?Q?NHH5WNXKRaP0QL3Rhfwqlku1Q6fpPd4CRwNxOHirYdIB4cYL5WgauwfZAA96?=
 =?us-ascii?Q?s6gUD8KIcJSG/o4UP2lPJT1ogXpU+WUat/Fe8bCn8GQadRFURvrkV2+IDvo2?=
 =?us-ascii?Q?Yw3vM/u9TQPMnNCXsA3TbhuKoPSsHAVZOwgsys5arMbq7rTYBosJY81A05S9?=
 =?us-ascii?Q?LdKUIFzu1B6gLAIpPvS/TzBFnkYG6ZoGJJ+Sry44qYNKdzVZSq9DdIHiGQnc?=
 =?us-ascii?Q?5+Rz2Tv8QzuvJO35wluc8lJ9n0o2OLUeWLX7q+whguSFTgZ9BUziZCgQDYPG?=
 =?us-ascii?Q?eQ2vKturMnMlME/uzXS4QUSx49VkKKPNoFxLPV9/qb4h3asUF7zHm3JjlmIQ?=
 =?us-ascii?Q?xZ60JyscmdwzqtBPfFwpd9RyfE54yzOvNmpuJwkJPGj5Ske+XUv7d7cntQ8T?=
 =?us-ascii?Q?QpGnTmFwiO2yudSPY14alHlgAqvT5qph9laFspQ8B3Gn0jwyRM3wExJS2084?=
 =?us-ascii?Q?YzJMTl4fcdH7QAs5KIl518Pr7OeaGnUODDOmmC4lcsgzEs+wyp1S4QP1/X2A?=
 =?us-ascii?Q?AoZpkV8Otlj6TVQpYNeSSXW4K706Zvxd6kuseO6fAqFY6p+9cbnR8on/IOgy?=
 =?us-ascii?Q?bi/xv2flt9K34DlZp31eG481nxWktmrxW2B//c4bqyU4HIF03tcjCwdeDAR9?=
 =?us-ascii?Q?RP4dGFtGDBH5uOkprsSINcp0RmkzixNhq2TQYgWh0HCPVUJr5ti/rAb8CXoO?=
 =?us-ascii?Q?1ZP84Yjze/IXl5J8geemubM6TswJefFzp2iJ6T21T2MwNePVizXa+ctZiWj0?=
 =?us-ascii?Q?i7qiMWUJcUcMWY6GAqEeqSk4wP+571rCbDx9oYqRcyhosC8qxIeN1FfAKjLu?=
 =?us-ascii?Q?YGlBW9gT4fuB2LH5FbcNKX/88rvYrsYYap7EYE6L8TRM2RY7/jdK5cHJ0uMK?=
 =?us-ascii?Q?rf1/gsYuE9612Kr0IInucUHpiP9qSeCnZ9cU9z0zzbpkRAft6mcuq/HS2ONk?=
 =?us-ascii?Q?Ywt21XdMPEB9SzJzcWTM8L/eNjbpiDhQlvFoCwRRv4Z5YkotiAfGHExVj75I?=
 =?us-ascii?Q?PT2Vs4x6lv0bsMc78N8WTeiigX6agNwIkgQyYB0KgA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MwNFglDB21HKxztxD6yXQIR52Xeq3e5Bq5GR7grGHi7UzwTo13wWZivjUMJ/?=
 =?us-ascii?Q?UpRKinghRuUDmiTtW+3PNYwAxq2wWbmGExxD7uwgagOFZAkDqxwvtjrStKxS?=
 =?us-ascii?Q?3EqXZWFIZK0wcd0PS/btGSfkaA7I2HAfgGtD+OpueEzxUsUJR5iTv3kvCXff?=
 =?us-ascii?Q?kEAEmpklXEVZdpGRe07b3feLPek7yI66SmXdEfumgUuNNlhGa4oIOZW2QADQ?=
 =?us-ascii?Q?Buz1rZZmgODd1+aTrBqKJcgf9ifm6CIXA2BfwM0GiF/sOqDM38i1GxB5Mhqq?=
 =?us-ascii?Q?i6FRvLsi9X/DU/T9SUZHno+LHJM2RAhRta8lk9f0+f+BvJVWO3TVUoKrVtfA?=
 =?us-ascii?Q?chkkCfcnwR2f4k0Pf55mJryBCUW4sVH2oNvxPXQcKsAbW/Y+sRx0UyyKPx/W?=
 =?us-ascii?Q?/L2QaHruvzSeTR7A4WGEGWD59lrqQ+DrWBh+HiqYBWuRoM7TfI4tRySfB4Tr?=
 =?us-ascii?Q?mt+HqOADwPKxC0LTnM02cLNMOhskJXt5JDEbci0YDzMExUOO2CUkFv1VHhte?=
 =?us-ascii?Q?FcTh6VUfWdud+pMtB/JtGBCMsrvr9pst/e8PDCCRtUVgQ4beGf/iG4EiZIPg?=
 =?us-ascii?Q?+cxwXZRhrDEcKN8Zc6uylb/nfWw5beyZhIcbYx6Jx0Ze6d2/3Nfr+SXLU9j5?=
 =?us-ascii?Q?1GmfmsMFAgAc/dv9AgVW1SHovE/Z8rlIZuC1aE65AvsJ+zBwYx3SZZ2MOqo3?=
 =?us-ascii?Q?6hPbFXOkaDFnWDmvMlMthLxyHRdEex/JiwhU5bJ6y/9k/fBqdFbU34e9CrKF?=
 =?us-ascii?Q?63MxoEvP+ie3Jyv8o+Dvq7cUvXas/eYDRPo8IifokLlUwGv/8cUDsirK8+zc?=
 =?us-ascii?Q?w446OSEVDqIRckzqlpGc+X+CAtj5ttEBu62gzh7cU+nSfR6XZuTmBdOGc1lw?=
 =?us-ascii?Q?9DwMnZeUHupGEufAWZ7a7NHur1d4+lojWr6Ll55f0olaGMmBNyKiYLd9PT+/?=
 =?us-ascii?Q?J6qHRlmAb4ny4QkRUtbtsOt935dySfJ2rHRpRc1Ow3XDZO7WyUfaVPsVqzNQ?=
 =?us-ascii?Q?IVk/zic/7cft5+CHvQ/chsq2+jswb0triwiuUX9snpo0uyMIETLVoupiGs9C?=
 =?us-ascii?Q?AigTN9aY6dDlI7r4z6lhkw88pPLcgrWBSwCmT03tI5OH85pOPPd30wcqrzbr?=
 =?us-ascii?Q?yccSbrg5W7X1D13e+/Mil5+EFnD1fqDCgp6v5FKrDoXnSlP3y1bYu4LiVou/?=
 =?us-ascii?Q?eK/uxadRjHU+2B0upAi51Nv0IkYvFLJmutIuevynfu7M0yDSIlVHARrLH/qJ?=
 =?us-ascii?Q?oYI8J8BRYP2KmxqUUJGb?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116036d4-96a2-40f1-368a-08ddae1a2d7f
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 03:42:41.5970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6477

Move the reset operation to the common part to reduce the code
redundancy. They are actually the same and needed for all SoCs.
Disabling power and clock are unnecessary for MT7620 and will be
removed. In vendor SDK, it's used to save the power when the PCI
driver is not selected. The MT7628 GPIO pinctrl has been removed
because this should be done in device-tree. Some delay intervals
have also been increased to follow the recommendations of the SoC
SDK and datasheet. Tested on both MT7620 and MT7628.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 arch/mips/pci/pci-mt7620.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/arch/mips/pci/pci-mt7620.c b/arch/mips/pci/pci-mt7620.c
index 81a49b05f..aae844f27 100644
--- a/arch/mips/pci/pci-mt7620.c
+++ b/arch/mips/pci/pci-mt7620.c
@@ -29,7 +29,6 @@
 #define RALINK_SYSCFG0			0x10
 #define RALINK_SYSCFG0_XTAL40		BIT(6)
 #define RALINK_CLKCFG1			0x30
-#define RALINK_GPIOMODE			0x60
 
 #define PPLL_CFG1			0x9c
 #define PPLL_LD				BIT(23)
@@ -246,19 +245,6 @@ static int mt7620_pci_hw_init(struct platform_device *pdev)
 	/* Elastic buffer control */
 	pcie_phy(0x68, 0xB4);
 
-	/* put core into reset */
-	bridge_m32(PCIRST, PCIRST, RALINK_PCI_PCICFG_ADDR);
-	reset_control_assert(rstpcie0);
-
-	/* disable power and all clocks */
-	rt_sysc_m32(RALINK_PCIE0_CLK_EN, 0, RALINK_CLKCFG1);
-	rt_sysc_m32(LC_CKDRVPD, PDRV_SW_SET, PPLL_DRV);
-
-	/* bring core out of reset */
-	reset_control_deassert(rstpcie0);
-	rt_sysc_m32(0, RALINK_PCIE0_CLK_EN, RALINK_CLKCFG1);
-	mdelay(100);
-
 	if (!(rt_sysc_r32(PPLL_CFG1) & PPLL_LD)) {
 		dev_err(&pdev->dev, "pcie PLL not locked, aborting init\n");
 		reset_control_assert(rstpcie0);
@@ -275,14 +261,6 @@ static int mt7620_pci_hw_init(struct platform_device *pdev)
 
 static void mt7628_pci_hw_init(struct platform_device *pdev)
 {
-	/* bring the core out of reset */
-	rt_sysc_m32(BIT(16), 0, RALINK_GPIOMODE);
-	reset_control_deassert(rstpcie0);
-
-	/* enable the pci clk */
-	rt_sysc_m32(0, RALINK_PCIE0_CLK_EN, RALINK_CLKCFG1);
-	mdelay(100);
-
 	/* voodoo from the SDK driver */
 	pcie_phyctrl_set(0x400, 8, 1, 0x1);
 	pcie_phyctrl_set(0x400, 9, 2, 0x0);
@@ -334,6 +312,16 @@ static int mt7620_pci_probe(struct platform_device *pdev)
 	ioport_resource.start = 0;
 	ioport_resource.end = ~0;
 
+	/* reset PCIe controller */
+	reset_control_assert(rstpcie0);
+	msleep(100);
+	reset_control_deassert(rstpcie0);
+	rt_sysc_m32(0, RALINK_PCIE0_CLK_EN, RALINK_CLKCFG1);
+	msleep(100);
+
+	/* assert PERST_N pin */
+	bridge_m32(PCIRST, PCIRST, RALINK_PCI_PCICFG_ADDR);
+
 	/* bring up the pci core */
 	switch (ralink_soc) {
 	case MT762X_SOC_MT7620A:
@@ -350,11 +338,11 @@ static int mt7620_pci_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "pcie is not supported on this hardware\n");
 		return -1;
 	}
-	mdelay(50);
+	msleep(500);
 
-	/* enable write access */
+	/* deassert PERST_N pin and wait PCIe peripheral init */
 	bridge_m32(PCIRST, 0, RALINK_PCI_PCICFG_ADDR);
-	mdelay(100);
+	msleep(1000);
 
 	/* check if there is a card present */
 	if ((pcie_r32(RALINK_PCI0_STATUS) & PCIE_LINK_UP_ST) == 0) {
-- 
2.39.5


