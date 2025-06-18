Return-Path: <linux-mips+bounces-9374-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E279BADE1D0
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 05:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B69C217C923
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 03:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59F51E3DE8;
	Wed, 18 Jun 2025 03:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="NfDho2Z6"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010003.outbound.protection.outlook.com [52.103.43.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042E11E1E0B;
	Wed, 18 Jun 2025 03:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218159; cv=fail; b=e0u4fxIU28f6ltyEssxIk+DT7hw+uELVXawXo2OrtIYsTFLrrja3U8Lng6tvYJH6GB3cj3c2wumC7tGOppT8XsM8UVeJulDRXean/4sItur4zVjETcVEg5f92ALBOv3Ks00GwqGJJJncaTvVKcNbQZDt2F85aL0qiOHkAZv+Fq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218159; c=relaxed/simple;
	bh=/N6YU4/FGOmzaphAw4SFpmJxSfkhD3tobUJfiI7jLiM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OSSdKGJgVzB5Dobw7/o+lnt4i23iEANi9ziMsG8GvqRfYiPmCntXUYlAn0rJ2jIJsP5/sRFZDGagndY8+Vt7pRgR1cOvZjhZVrz+KDoJKb/8nEnZ+BoDx9w9RJRiN2PZk/iVcMTNAn8Q95bvcQQAaLFC3YUn8Q3O642GR4RgXlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NfDho2Z6; arc=fail smtp.client-ip=52.103.43.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBn2KJNjTXOVXLk+EAHdb0iz/iV+cviETKZg1jqd3JUH3JOrrOC+XpDzzbPRJgLxy8AKjnpAQhp4tDgEqXo3ss7Cveo0jeo/XpAfGehhB/SmH3BUq4e2d853OK8KU9sx6gjK5Z1qkktVACxi2O+rA1IiVJrUdlrUsXAtp7MdXRJPkIfbKgYI3osrl2OlGc6mD4AJS6D2tv8Fu2UXAA3xQUn3XTm7VCHJ3a+fmK82btz9oJ4xQ+AYzma4ADIcSnWYUBpaaEuM4qk0OpNQq3qFml/rEzU8xvo79mIRF45rMW01K69Qpfjr688/YA7FHhg7ymhWgt+jyA0fhZp2LGT2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpzSRT/qcLuRfUQEkuRF9ffcbC534KSswQw3UDqANBk=;
 b=Zru0Xj4PRjF5F77JTUP82YQ8NtOQFEDftszXFf9V4ftqJRSarbKnu0GLZkEBK0QFxFwtMFNGCTe6bmATtuj2ZH4tw2m+3y5CvPa/1sXBS27FC3h0darWBlCePdHL3fzBpTWUD8lW9GhN0Mz7gQQuw79XZUJDsAk9YKGDUXmQc8xVMtDZw3a4qPh5BJZRGDEBIOCIG9pbp5xu+drjgNqGAu4wbjySI1XKvuvw4YiqzCnkP2U9RKhHHvYxRLcmATLv1opUYbP2VDPl8Dd4PG3JlyIHGMMVOcsP8owEAqbr1txVJW1K4FqF61Z9PYFz3ZXBl7KkAOyBN9OyFN9AWeNILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpzSRT/qcLuRfUQEkuRF9ffcbC534KSswQw3UDqANBk=;
 b=NfDho2Z6Xp7Yj8VFMM5+S4rj15OD2uKfmVzARIk06WgC6wUcBh5Q9uCUfPLbFTxd1KrMbbWZUXffqlefNLftnBH01RFtlPXXj8/0yKjWZjadbNc+4UTvtflD8kciirVPEa+bZVhTTL0NPaUBIgba3i+Xg2QqfT7/UdUAVpcA6vxsKahXzAXO8lUnIrOrbrcMetqq1YHDAraVgJrriZvzfnNs6ap4L6XhNuoTE3WIhn4hc6gwiF2zK+AyfPx1BALCWUEkWRRSiKdByCay/0bbX5MuoWM6jJE57maVfZAbWPdQFLixj8tspt0EupUhj1FQHpfuwCd6wBPxeecdvp1+Xg==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by TYCPR01MB6477.jpnprd01.prod.outlook.com (2603:1096:400:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 03:42:34 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%7]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 03:42:34 +0000
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
Subject: [PATCH 1/3] mips: pci-mt7620: fix bridge register access
Date: Wed, 18 Jun 2025 11:42:05 +0800
Message-ID:
 <OSBPR01MB1670555F549B69B9A5E7F133BC72A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID:
 <20250618034207.22118-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|TYCPR01MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ca9651-a88a-4179-8819-08ddae1a2914
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|19110799006|461199028|5062599005|15080799009|41001999006|8060799009|7092599006|3412199025|39105399003|440099028|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7iz0m+BTI4/b2vwf7rJZTnyybPL8wkTxCdlSfWuNxyFnHazZxITDz0KhERYT?=
 =?us-ascii?Q?wzk5jori7hjTTaFePoWIpEaQ5QXxth8QmKGtAYu27FlA59rPgk0xFK08crj0?=
 =?us-ascii?Q?SofRs6QYqZnBin/LOEiC18WUifmzYt26O8MQhxWTDAI280GNBpYsVOSOPXSJ?=
 =?us-ascii?Q?kzuXGnBZvEFyK49xKRCp5j5+/yP6Bp+ILSxcLRuByXE5dFU45/89SIEOAgZS?=
 =?us-ascii?Q?3A6JYwC70ovwurVx9jVMekDVAZkK4fQnprwBgf623d7C6XvQwIeW4bL3jz/w?=
 =?us-ascii?Q?oWph4M0UPN5LvGx/jm22nPcTD66FecvdykCP9DNLIRmS/noUxVjRh+2fVQOZ?=
 =?us-ascii?Q?pVycM1DU6BNOzdJDigiMFP6iTOXbU3TiMPNruGS0qeKareMXk1CQhRirQID7?=
 =?us-ascii?Q?gCL6JYFYVwowmFhKLlQREoUHxRi8m2QgicqEmElBFVFNIAPrrJsHI9KYfch/?=
 =?us-ascii?Q?/h1aoOCllokGCBL/jRDoDCKoreHFI6e1ATaECcqc0Vf1Ef+TkZF0VMsabbq3?=
 =?us-ascii?Q?yBSSg6YfiW6AEZ7kZp5gNCsN18+y8fTrz3h7r+W5SJt+Pf2kVw3uJv44BWor?=
 =?us-ascii?Q?3uP9wzJClsuLaE7peKAzvC8oAeukFZYu5/iSCIHpbq5N9DFSdKR4X4cEk2jO?=
 =?us-ascii?Q?Jh9ug3wTpYJgJG8+X4I38dwykQhqI3jGkz8AODPYM0qw1JUPGdlXuSdcsyUU?=
 =?us-ascii?Q?eUClghYulTX0Y7OQuI/evlTrkFhJF2OZ4EAksr3ZbTSmhOh+I6RRYFvti7EB?=
 =?us-ascii?Q?JlwCp1MLhA7PdIkcSUNSmjjjLiKlUQ4NkXXMP9a5L8tk0ExnYY/fP1ccNQrb?=
 =?us-ascii?Q?OMHJbx1pXjJVfrX3O4GjwiWpn9WHBqm/PlzAfGO4tKBiNq15XOF07U3zM/FJ?=
 =?us-ascii?Q?uErHMtF7IuC8BQknlPX8i/lInZSPB8NNe7ZDMwNaZcvGfD5zkZeW3uCVQK6P?=
 =?us-ascii?Q?v4whMYwVgvzkfS39Byzfh6+XfVAdsQfkIGceQjdLHzUx6xNZ+Z2EcQJJcs1a?=
 =?us-ascii?Q?q8yPNSmvUIXMW6w9w4pY3V1Ie0R+bDVIJemTYj1sC41BZbxq/zzSjf8RgY9n?=
 =?us-ascii?Q?b2VPfD55DBOBPrFWhgkLPf6jkMmdei0qU17fJ/pO2uxjoA7G3P/KO+ZsUAuP?=
 =?us-ascii?Q?4cRKwmYfR+fqCqnu4GOuDIeiz5SON44mGDDAt7XYsBiK5fCWEfkd8JYTiFfE?=
 =?us-ascii?Q?usRHwLrYiZYmRCF5tGPcbDMThFywno8u0j5Gn/o+VrHLUmYNqO/eJnMoxvgM?=
 =?us-ascii?Q?eL2qVVh6rnXlUBjI/O6KJBR1HBakFCc+NqkzvsGVSA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kb2aSAd3eOE5zpAgpRXVGCIUfb85kqne4/LXigDrALzMIRKhm2FIJUa8cguo?=
 =?us-ascii?Q?OHYTVPyzQ4Vzk0754koFusVoT1MK/pfSlpiLBj/Xkj5lSYCfl0lsEetKc4we?=
 =?us-ascii?Q?oCoUBF4COwv3T5m/EHbq+ObS3vmf8uUMz2i+PGs7yMiwwjPIAAJh1SVTCYrL?=
 =?us-ascii?Q?TtJaNDXOVqTx4YZeVPoBZphQao9ALGDBZd1Bu/hDeO0Ttm6UoF44MkhB72nf?=
 =?us-ascii?Q?I4EORVbhzr3Czlif0k/b5XYMhXgljFdnhyQCWyLmSmZylEHH+3f8rpBfbcMk?=
 =?us-ascii?Q?aWSskEEAlgUeZLtIhdNaWDEnJ6UpmjPM9DXEojALRTHk1rWmI40h49ADYQa4?=
 =?us-ascii?Q?gu1aNktBwDKumHEGJF/N3OUU+Yfd6/nBASogHIrwzbQwpWdn1kdjXslAUmGM?=
 =?us-ascii?Q?QQ/B7TYFZ1EU34finPBEPPQE7NH8E4zIJGMlDcD3JZ4CKn2XPh6idqS7wF3l?=
 =?us-ascii?Q?+r+DpRcz7RZ9V9QUfh8ZIj8uaDwvuqcUrmnlDod4/nECMKIl5cFaYbc5tZy6?=
 =?us-ascii?Q?noWHYIsqsc9bQuh0ej4VfGhLBkRBTsOcR5+NNsHNNmFnLFpSrONyod9Gxw8/?=
 =?us-ascii?Q?XpcdrekmRHBMBDDev7hzeIOvevtZ94kyzpCKC1znvx/grWFXQjj/zlzIOIex?=
 =?us-ascii?Q?OjlMSgWiUl3OeB185vZQS8TiEuIPlS/LADKY+eilq6psWPoqo1wXL0+syMan?=
 =?us-ascii?Q?IPwTirH7VnLqm1RP+LNx7ODkFfDrFRAO2MxLB1N3+L9wZirrNJ+1ZPyppLki?=
 =?us-ascii?Q?sJElIHFInObED9A/ouqxQ1CkvvrNf4zlfxG5OH+E2gS4L58i5Or53zTJfo2f?=
 =?us-ascii?Q?cqxUBYTVdy4BgRIILr1fRsmY/qb4aH0nFyBg2myKSng7qux9oU7Fpgboxtob?=
 =?us-ascii?Q?7aIX2h33y5Mq8gMSJNthU2ZBp7G4It5mZ1J7ycetNBhNwYLCLgjrHy8H+xq0?=
 =?us-ascii?Q?Men6YBblnssF2LzvgbyYz7I2vI3b2CDLDQ9oAIqb62bJZT6xZw9+9WiFen34?=
 =?us-ascii?Q?ptIWizHknU3cbOC3gzG8mJ0SBGxdNKT3NwXKKNpYQby3MSAZKBop0cnI+W4x?=
 =?us-ascii?Q?Trfl4biKkMsgtefUCaCcPCZEpVJMiPB1ou/k15EegPssx7muguS0kHM1KJEs?=
 =?us-ascii?Q?E5pTsHF+9AXPt6jig51/kHus/qI0Yv8R1QKs9lnAsXYwG1MF4UGhUpNX44He?=
 =?us-ascii?Q?7CgHpM6B8w4q+dwhqu6B7AguPi+Anpkr6gFU1MhyrKAQ9LNrPk0eN9LdiUao?=
 =?us-ascii?Q?QU1gLOXOQ7geW06LnYCD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ca9651-a88a-4179-8819-08ddae1a2914
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 03:42:34.3180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6477

Host bridge registers and PCI RC control registers have different
memory base. pcie_m32() is used to write the RC control registers
instead of bridge registers. This patch introduces bridge_m32()
and use it to operate bridge registers to fix the access issue.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 arch/mips/pci/pci-mt7620.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/mips/pci/pci-mt7620.c b/arch/mips/pci/pci-mt7620.c
index 5c4bdf691..94b3c96a1 100644
--- a/arch/mips/pci/pci-mt7620.c
+++ b/arch/mips/pci/pci-mt7620.c
@@ -87,6 +87,15 @@ static inline u32 bridge_r32(unsigned reg)
 	return ioread32(bridge_base + reg);
 }
 
+static inline void bridge_m32(u32 clr, u32 set, unsigned reg)
+{
+	u32 val = bridge_r32(reg);
+
+	val &= ~clr;
+	val |= set;
+	bridge_w32(val, reg);
+}
+
 static inline void pcie_w32(u32 val, unsigned reg)
 {
 	iowrite32(val, pcie_base + reg);
@@ -228,7 +237,7 @@ static int mt7620_pci_hw_init(struct platform_device *pdev)
 	pcie_phy(0x68, 0xB4);
 
 	/* put core into reset */
-	pcie_m32(0, PCIRST, RALINK_PCI_PCICFG_ADDR);
+	bridge_m32(PCIRST, PCIRST, RALINK_PCI_PCICFG_ADDR);
 	reset_control_assert(rstpcie0);
 
 	/* disable power and all clocks */
@@ -318,7 +327,7 @@ static int mt7620_pci_probe(struct platform_device *pdev)
 	mdelay(50);
 
 	/* enable write access */
-	pcie_m32(PCIRST, 0, RALINK_PCI_PCICFG_ADDR);
+	bridge_m32(PCIRST, 0, RALINK_PCI_PCICFG_ADDR);
 	mdelay(100);
 
 	/* check if there is a card present */
@@ -340,7 +349,7 @@ static int mt7620_pci_probe(struct platform_device *pdev)
 	pcie_w32(0x06040001, RALINK_PCI0_CLASS);
 
 	/* enable interrupts */
-	pcie_m32(0, PCIINT2, RALINK_PCI_PCIENA);
+	bridge_m32(PCIINT2, PCIINT2, RALINK_PCI_PCIENA);
 
 	/* voodoo from the SDK driver */
 	pci_config_read(NULL, 0, 4, 4, &val);
-- 
2.39.5


