Return-Path: <linux-mips+bounces-9375-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2824ADE1D4
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 05:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80BA77A5532
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 03:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5331EB182;
	Wed, 18 Jun 2025 03:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="X3vE6AmC"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010001.outbound.protection.outlook.com [52.103.43.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD2D1E766F;
	Wed, 18 Jun 2025 03:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218163; cv=fail; b=BIdF+XJ5AKKVXyWKnQqWvbI8ZqCAdCtZS9w6+cCIljjXYi97Dti/upZsyJB0rwT/J51lzf2sIpFMIwZ+uPRhBdE2/8ojGSxEA9tQcaW2q4k8RgsCXMJ2S3808riAEmXSc//ZY88g63CWLLzUiToU0T+kP0nKiXXd+MMu3OK/6EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218163; c=relaxed/simple;
	bh=nvHd9G9i0E+vz/mFk+e9pAGvCA0tKClG+DEXGuGul/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tvKNgNS0CP4Ayx0qN0tFfGHuiGcsBL/3yECJ1qgp8L0fjx58W2RSTxRMz2AAymI7Mm/7+hYjYV8EIx1w/Ok8XGtdzQgs9k3KPPlQhy3h6ZnWgir7iRf76Bt5Xw8UG7IxETSWoyUiTnBVJSOSLTtRu7pFNWXJnChquE4THkZQWa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=X3vE6AmC; arc=fail smtp.client-ip=52.103.43.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7R3YD9zj3Hd0qWwIgoHNcj15sN4HIJN3gzLmxXxX3FQp7TgghMs6cgWuYd6NAHdTQPfTjg1eqv2W/XR1dSxb9Q2i/WjThtDSxmlk+5EEaSkhKIta3R8mMT6YT+lmyiN75wey4qQ148kQP/TPtDDYq3voiQtwY6Nf93pHDDOEDeqRzyYnC3l4qrj7Jefiln7kz5fMHWrk4e9WrvN5fugl1WMWNWHKe4h96OwpvfWbziyKf5GHc+MoN10B3kK+OuJtA5cRjSsVHTGqJyc2V2KFEvBoG6fan5eseDzShnbxwG+NYvDOxiHx/fmQGAJwEKCBVSscVUtRK/dUKZuhdkYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rokVshMi1e+WUI84AXw9jthDKuCURgonhXhiHf/MDT0=;
 b=P3rNhxpPmpUwX2P8FzA6cl4xtcESCAGCkbxsCV9TyfrlZRHLQPqM6RQfnfHK1zKXbUGtm5qCLnwV91augBl2RXDr+3tXcl4zVV6Qu3JDfWQ1Z3YqKR+MZue5JzA8gCoa2Cnggugu7WO0g0e3AI/5rTISm/wiYgWJ2wQwfqSLmf59+1e8jS6FCJXhUFo/BrtFUlS+hiOnPTyXsh16dAU3vvasEorwO/TRKtzKrQsGykavES/ZaK01I4fFQlXLR7aZseA72JDL4wASz9wLs5eT4VnWGnneXTg3WIwN3vibngyfzZtdxPElAQ+MHVLcU9xlordYtVFqfFtFAhd/v50GyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rokVshMi1e+WUI84AXw9jthDKuCURgonhXhiHf/MDT0=;
 b=X3vE6AmCQUjAoYCIjINQCBCwqYrbKQWDJMn8v0MxqcEd3oyVR0ECgn/XFwyghS56LATiTlDTya28RUKC6DrZmMo3J2CEKpzXq77vJXjZqWoEkP6E4pzqadD7KLubkd2kfwHJcFJoqiTtDyHjbXyFjb97guoay4IN3m0UnKUqL5tgXpF8qU5zZQb5oxZegbaTauSkwFDIUUZO8/uInb1CTyheHMXE5Iv6vmX6eHGrvm59qpRw1nVTlksfncct3ub0Iqt5SkeCNE6ipKJ7kHRQ+4pCtWKTr6/8JoWAEr3LVHj6mXoJ1KFYFXO0RqA/VVaTH2wSZZB2O7aHvz6shdLOYw==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by TYCPR01MB6477.jpnprd01.prod.outlook.com (2603:1096:400:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 03:42:38 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%7]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 03:42:38 +0000
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
Subject: [PATCH 2/3] mips: pci-mt7620: add more register init values
Date: Wed, 18 Jun 2025 11:42:06 +0800
Message-ID:
 <OSBPR01MB167036A58FE6FB745311AF5FBC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
References: <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID:
 <20250618034207.22118-2-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|TYCPR01MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 038acbaa-b20f-44df-8cc4-08ddae1a2b76
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|19110799006|461199028|15080799009|41001999006|8060799009|7092599006|3412199025|440099028|40105399003|52005399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l/c3T5QnK+usfpQ84m6WedFp2Wt65tioFteDUaRAfh1gP2iXSGlyjp99R73W?=
 =?us-ascii?Q?oQuxwBh/btEV1ZoBFde4gVNziC2XRoxf3bA6PauuooVUk1p9P17vXl20aSBg?=
 =?us-ascii?Q?Ub2LxceooA+GaVum5JWidv7tyv80xqS5P7l9YTQahGRwib0OJ1KD4W347jbs?=
 =?us-ascii?Q?0/LZGyXmdzNVS/VrQZhKUBfu8l4uo+iwKe03ysPpx/gdYVZfWwS+Qg6Zs6cX?=
 =?us-ascii?Q?ciyaQvDEkW4lcNRKpxmmQZs2TjoO/a9Z9TD/b2Naw/a+6DUdZFmDzBzXTEN1?=
 =?us-ascii?Q?dPwhRrzaGSzMuH3oguXK0yPnOTCbnL+/aJFDIhi0d9+bLx+br4Fb5Q6YaMOJ?=
 =?us-ascii?Q?NpVJtPAgyMh5Vib0wy/J6BYQztm9R9ChINX94Q0yUmW1jiiYqBc/fHsu3lJj?=
 =?us-ascii?Q?OpZLGFZEBOEMHwT4bRpgtFyF/qlgkDGv199JmhihB7jcIa0k4t3pi1ug0g1H?=
 =?us-ascii?Q?aBK5JxCLzSjPGdoGZc6gRvOYMQ5sRAQONvkQeK+xl73GQcnzvjS0Fox6XezX?=
 =?us-ascii?Q?kXhInJ8pWB6kqN7CMvFOg5c/HKYdSagTwmtdM6gbmHYWBnZ6/Pb2NS130MZz?=
 =?us-ascii?Q?WgsFsELJcaG9Vxj1mRS1QvuHt+B368CkBedHxSMHUjD7SLVhbmJNWiV9P0ih?=
 =?us-ascii?Q?wMmQSawkEST3ha0LsCmGj0Ikylht/SzQKig9NdOKgmE9kTpoVneXbMBcs3lS?=
 =?us-ascii?Q?tn/CimzAPVYEQuMeQapHaxkF4Vv+Ngm9cMC2fdeC9vDiS++m8x0EEcCnngtw?=
 =?us-ascii?Q?VI7oTESwFv1Dib8Vd9M6ujLJNpW8s2jB68NlLup/max3PTtI3UdF/vW4nEi1?=
 =?us-ascii?Q?RvSyk1QAVyIlPgye98Af7dvL15Ul2yX+GQqWGRh7EgQBY9QJZE7CuWIP78cJ?=
 =?us-ascii?Q?lZUADOhciimqNWUk/e3V7euvipuZSLyEtENQgPd143zi38Irixm0bjrCwYnQ?=
 =?us-ascii?Q?bDJKDVkzgrgCfKHV0JhIRRja/Oj5AOxL/iMqD8ryRFKrR7HB9iriOvpKikWY?=
 =?us-ascii?Q?edjew7i6KSeU2SjgAoL+oSMdaErHeerOi1W1wCIjCrE2ZeZdQlqTC4IjEAng?=
 =?us-ascii?Q?yGFCxkwUciB4aUvIY7B9eQ7H8omLFEo+3dmSHhjSj2Ufi3g2TNomrWkZEsDp?=
 =?us-ascii?Q?3lt+PwXTWZjiMqMhcExaePgvhx0DLqJUoumWnH1jHd8yCkEKe4WzNAFKRJ1J?=
 =?us-ascii?Q?Qk2OrpcT35DgClpYPbslhEbqn99T1YVedPZguJFnfpB3IIsC+ibq5oIMC2A?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ReqzfZZ8oTztnvBP1CD3jLLkDz+528XXkmVMvIE+VnHhyJhuWE5oIbr4SPje?=
 =?us-ascii?Q?tOLcOiA7wZg6hVGooCBZxBkD1z6IFUhSkp81EmUL8zkvqHMozyRlcEoSzlt9?=
 =?us-ascii?Q?lDybLVtDWAYH0osneBdEEbjUsP07bKdoqgoxZQ+H5SoYLLzTxasKS+ubJPvl?=
 =?us-ascii?Q?pC0sNZ6Q3s0/HynBuLLxLpIFZa2RPyZP4Y7ozytjR9jDn4/Of2zEp57GpmQQ?=
 =?us-ascii?Q?akfy08dUmuJzVM90G0/EMpjUWZpj+SObODQFlZopSYIFypHfo/BhjTWH0FM4?=
 =?us-ascii?Q?mW/KKMV3sjwCznODwL8UjSuN7WZJT3wVoXefuOXoqobra1vFO3OQOOv3r/xQ?=
 =?us-ascii?Q?Lam9ruFnWIvHXDeOPiQ13M+c+mA+9JsSI8xMWk2KkccEfi95LlVrDFW72Rsu?=
 =?us-ascii?Q?h/ugjy2pEu2OCWUsQVTYGgJCUF0JAf3avzTitMmFBF8rpIvjyDhAVOI7gAeX?=
 =?us-ascii?Q?i8K5q9m8Melo5yBwc7sinp9g5hoGYnt8apjVDu+WqVYaAzoYU9294X1uZnMn?=
 =?us-ascii?Q?V0WS5g/oAofNWmkRcWRzhse39e1HcMIvLIo1upsSDVrBpOmUQgEpHpvuq7Gc?=
 =?us-ascii?Q?b+hlKiLLxtsyPynQhsRhCszvZF0lHW1K3HqixXDA+XHUJy7uIv6aMsrlQxGR?=
 =?us-ascii?Q?DebpY5XvVAj9gf1UEQG2CqMYcpjm0bC/EobkKipd5BCjq7ZCmDseAmdaa+6k?=
 =?us-ascii?Q?VijPrTHC17x9/MfQwWnHqkmQ8Y6FKsub4B2tlVuD+NyqBlQ5FOmZ1b37j2vh?=
 =?us-ascii?Q?PwNbNb++pA1E4wyJVme+GHXXF/VWmXUM5RcsyqNiosoqBwJ7CMzkIGwyPwBa?=
 =?us-ascii?Q?kJYmKZJ3DZJ+4qmRuYA+nZanF9BoF6cGaMIENzY5Hl3oo7yc3Py18u9WvL1g?=
 =?us-ascii?Q?QDRp5dyP4zs1eYSIXRvQeOVqethurpMV0VoicetZrxBrM60WExuNugt7Vyw4?=
 =?us-ascii?Q?wY/atPylkKuy5mpaEPkF+Ozm1aGL2WNoJlqvvHxXl+YA1+ymasZnAsciVLNa?=
 =?us-ascii?Q?mcxUqEqjAgIhn1z02K2mJDwt8C01LKOLSbMv+QroTYLZTm2bOGeDKIPLsabc?=
 =?us-ascii?Q?+p8W2ttnYWsMCZwQKzLFEeSIYkxBxKWjxC+TdlvtXOXmdxeDnm23Jg1+GL9y?=
 =?us-ascii?Q?U5rj2gaWoiQ/YE5136r/z4zrx7IJgCCP/duXuVkw/m45Cw1HK15j60unXee2?=
 =?us-ascii?Q?imx4THtHU8YqyexrdZmmFGf+G/Lkz5Fz1HpiOOBRd9IuhXhc2Wwy8cNhoJgo?=
 =?us-ascii?Q?ss9SAmNbY1ubNBXSMUGr?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 038acbaa-b20f-44df-8cc4-08ddae1a2b76
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 03:42:38.2826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6477

These missing register init values are ported from the vendor SDK.
It should have some stability enhancements. Tested on both MT7620
and MT7628.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 arch/mips/pci/pci-mt7620.c | 59 +++++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 13 deletions(-)

diff --git a/arch/mips/pci/pci-mt7620.c b/arch/mips/pci/pci-mt7620.c
index 94b3c96a1..81a49b05f 100644
--- a/arch/mips/pci/pci-mt7620.c
+++ b/arch/mips/pci/pci-mt7620.c
@@ -26,6 +26,8 @@
 
 #define RALINK_INT_PCIE0		4
 
+#define RALINK_SYSCFG0			0x10
+#define RALINK_SYSCFG0_XTAL40		BIT(6)
 #define RALINK_CLKCFG1			0x30
 #define RALINK_GPIOMODE			0x60
 
@@ -62,7 +64,7 @@
 
 #define PCIEPHY0_CFG			0x90
 
-#define RALINK_PCIEPHY_P0_CTL_OFFSET	0x7498
+#define RALINK_PCIEPHY_P0_CTL_OFFSET	0x7000
 #define RALINK_PCIE0_CLK_EN		BIT(26)
 
 #define BUSY				0x80000000
@@ -115,6 +117,14 @@ static inline void pcie_m32(u32 clr, u32 set, unsigned reg)
 	pcie_w32(val, reg);
 }
 
+static inline void
+pcie_phyctrl_set(unsigned offset, u32 b_start, u32 bits, u32 val)
+{
+	pcie_m32(GENMASK(b_start + bits - 1, b_start),
+		 val << b_start,
+		 RALINK_PCIEPHY_P0_CTL_OFFSET + offset);
+}
+
 static int wait_pciephy_busy(void)
 {
 	unsigned long reg_value = 0x0, retry = 0;
@@ -263,10 +273,8 @@ static int mt7620_pci_hw_init(struct platform_device *pdev)
 	return 0;
 }
 
-static int mt7628_pci_hw_init(struct platform_device *pdev)
+static void mt7628_pci_hw_init(struct platform_device *pdev)
 {
-	u32 val = 0;
-
 	/* bring the core out of reset */
 	rt_sysc_m32(BIT(16), 0, RALINK_GPIOMODE);
 	reset_control_deassert(rstpcie0);
@@ -276,14 +284,33 @@ static int mt7628_pci_hw_init(struct platform_device *pdev)
 	mdelay(100);
 
 	/* voodoo from the SDK driver */
-	pcie_m32(~0xff, 0x5, RALINK_PCIEPHY_P0_CTL_OFFSET);
-
-	pci_config_read(NULL, 0, 0x70c, 4, &val);
-	val &= ~(0xff) << 8;
-	val |= 0x50 << 8;
-	pci_config_write(NULL, 0, 0x70c, 4, val);
+	pcie_phyctrl_set(0x400, 8, 1, 0x1);
+	pcie_phyctrl_set(0x400, 9, 2, 0x0);
+	pcie_phyctrl_set(0x000, 4, 1, 0x1);
+	pcie_phyctrl_set(0x000, 5, 1, 0x0);
+	pcie_phyctrl_set(0x4ac, 16, 3, 0x3);
+
+	if (rt_sysc_r32(RALINK_SYSCFG0) & RALINK_SYSCFG0_XTAL40) {
+		pcie_phyctrl_set(0x4bc, 24,  8, 0x7d);
+		pcie_phyctrl_set(0x490, 12,  4, 0x08);
+		pcie_phyctrl_set(0x490,  6,  2, 0x01);
+		pcie_phyctrl_set(0x4c0,  0, 32, 0x1f400000);
+		pcie_phyctrl_set(0x4a4,  0, 16, 0x013d);
+		pcie_phyctrl_set(0x4a8, 16, 16, 0x74);
+		pcie_phyctrl_set(0x4a8,  0, 16, 0x74);
+	} else {
+		pcie_phyctrl_set(0x4bc, 24,  8, 0x64);
+		pcie_phyctrl_set(0x490, 12,  4, 0x0a);
+		pcie_phyctrl_set(0x490,  6,  2, 0x00);
+		pcie_phyctrl_set(0x4c0,  0, 32, 0x19000000);
+		pcie_phyctrl_set(0x4a4,  0, 16, 0x018d);
+		pcie_phyctrl_set(0x4a8, 16, 16, 0x4a);
+		pcie_phyctrl_set(0x4a8,  0, 16, 0x4a);
+	}
 
-	return 0;
+	pcie_phyctrl_set(0x498, 0, 8, 0x5);
+	pcie_phyctrl_set(0x000, 5, 1, 0x1);
+	pcie_phyctrl_set(0x000, 4, 1, 0x0);
 }
 
 static int mt7620_pci_probe(struct platform_device *pdev)
@@ -316,8 +343,7 @@ static int mt7620_pci_probe(struct platform_device *pdev)
 
 	case MT762X_SOC_MT7628AN:
 	case MT762X_SOC_MT7688:
-		if (mt7628_pci_hw_init(pdev))
-			return -1;
+		mt7628_pci_hw_init(pdev);
 		break;
 
 	default:
@@ -336,6 +362,8 @@ static int mt7620_pci_probe(struct platform_device *pdev)
 		rt_sysc_m32(RALINK_PCIE0_CLK_EN, 0, RALINK_CLKCFG1);
 		if (ralink_soc == MT762X_SOC_MT7620A)
 			rt_sysc_m32(LC_CKDRVPD, PDRV_SW_SET, PPLL_DRV);
+		else
+			pcie_phyctrl_set(0x000, 0, 32, 0x10);
 		dev_info(&pdev->dev, "PCIE0 no card, disable it(RST&CLK)\n");
 		return -1;
 	}
@@ -355,6 +383,11 @@ static int mt7620_pci_probe(struct platform_device *pdev)
 	pci_config_read(NULL, 0, 4, 4, &val);
 	pci_config_write(NULL, 0, 4, 4, val | 0x7);
 
+	pci_config_read(NULL, 0, 0x70c, 4, &val);
+	val &= ~(0xff) << 8;
+	val |= 0x50 << 8;
+	pci_config_write(NULL, 0, 0x70c, 4, val);
+
 	pci_load_of_ranges(&mt7620_controller, pdev->dev.of_node);
 	register_pci_controller(&mt7620_controller);
 
-- 
2.39.5


