Return-Path: <linux-mips+bounces-9617-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D083AAF750A
	for <lists+linux-mips@lfdr.de>; Thu,  3 Jul 2025 15:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D99481BC4
	for <lists+linux-mips@lfdr.de>; Thu,  3 Jul 2025 13:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3282E6115;
	Thu,  3 Jul 2025 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qmHpa0b3"
X-Original-To: linux-mips@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011038.outbound.protection.outlook.com [52.103.43.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31562AF19;
	Thu,  3 Jul 2025 13:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751548034; cv=fail; b=f4qRGzb4K7fPaoPSWriWsYhYOs0/DRqSN0N/nMdxxbJI4VfWcPteS7oOn9Xfakvk9YlNFPiyruoqizNN1tNoP2OGU0xkGGJv8Gs/2/QSsNuiEtkUouYkW355INxuxGHl8k9lIyg7PlMZFMRfVEXkpK3yFR6nrxPl8vZBh1+wcdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751548034; c=relaxed/simple;
	bh=nz569cYgy9AZZfHVe2yssK2ONCJXdMKAFTfOjkS8Ljs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nX0BFqw911C3ev+ob+SC1Ocixzw0hv5toN/ocRBhDr7Ixe8VU7Fk03+abAmtXuczn1YRbI3bnYhN8FPdspih2oa4xW1h2tP16I1akabx0W9q+yqmaGlzOoiJHGrklJbMPmOWLsx/iT3UHv4wv9PmMx06IdheorcR0yruyh1MqvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qmHpa0b3; arc=fail smtp.client-ip=52.103.43.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibMgLbQRl8HktDsf7UCB2YyRDpq5Rfve0QjbhVgWhm5Ah9kWPzavOx0z5FwLSCIseUdvn8ejqGFrfsTBENLHhVG7mv3H4RWHygIG/2KNvqLqDIYoz5ylFy5AXEM2EWoDurS/mxhT4+7Eu6qFLmNYGdyA13cwixRGo3k3P7hv0CINnqWPNhz/hLimFsM2I/TD3FHJPtGdmS/w+RozioNbzm7aKjsy8HfJf3qMt/xlwX1a//xAxK9KVzwTDHyLPVhsvOsBm2/rbIE6Nj+0NbZVCZOyqKg3esQgcIHfddM+1UeV7nt0Zl2+Hml9TmK89/ho4s0JQTkxjrj8YIroJXXjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQmjaw6xgHJci010mty2pIdkTItSPQvQiaUh1amGMTY=;
 b=giGdlVqThOsQxyxI0o/+dC60UZ0WT0xnhciOmTOrrw5OVBUhUuSJojMvN4FsiSOIiXWGIEY2utfeUb9c1MhR4t/KCFlyk6e6U3xWq/19uvSzHJMgU2u1G3yg3dPzJYi/w0OhpRgI1IbnW99NIZtDmpX04UAxowPS7uCa6Ty8Iho10m8edtuBnLJtxIsGuuI8OFDfjq0xYbQNZ29zt5u5gtMH/o2r2V5/kdp/R3mLPAg9Y3UKuFfniVzTuxap7mm+5s6sr3ujDeYlZnEwvz7JPq/8f5oK1hfabZ4QhP3raj8RHA+wEqF53XwPBrveFCp6hSMUIlVZ1JCOIBJjP+RbWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQmjaw6xgHJci010mty2pIdkTItSPQvQiaUh1amGMTY=;
 b=qmHpa0b3p7X32OIU+fL7s1zenlImjv8DDCLjMNjofBJ458h8dhr35cN2FXAsYdeo6wEFs/VYnL4dgpdibhc42fgmcNYQ59GJYk5WTl8KzQRttHel9ahIM1nrsXN0Piqy6s5ub5JI+MDYl6Y26gelXq6b+etexC0jLe2Mgg0B/PAjGPpdeTe9by/pYlWYxj4XdpeihfQvaYFxoqwzTOn8a+x0DidEHBa2DO8g21Mpe6n296ybsqar75Mj3Ny2ufNDkaPYUVm6Tt1XKGRuIH1hKfVDfbrHShZWTWPYmHgXwr0WF6GigPxosm+nBVvYgImVeRMhzoBnzGFALFryZzI7rw==
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com (2603:1096:603:2::18)
 by OSCPR01MB16398.jpnprd01.prod.outlook.com (2603:1096:604:346::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 13:07:09 +0000
Received: from OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f]) by OSBPR01MB1670.jpnprd01.prod.outlook.com
 ([fe80::c00:ec4e:ee7e:9b7f%7]) with mapi id 15.20.8880.029; Thu, 3 Jul 2025
 13:07:09 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] MIPS: vpe-mt: add missing prototypes for vpe_{alloc,start,stop,free}
Date: Thu,  3 Jul 2025 21:06:32 +0800
Message-ID:
 <OSBPR01MB16706BF0ABF807E870C79A86BC43A@OSBPR01MB1670.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To OSBPR01MB1670.jpnprd01.prod.outlook.com
 (2603:1096:603:2::18)
X-Microsoft-Original-Message-ID:
 <20250703130632.15465-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSBPR01MB1670:EE_|OSCPR01MB16398:EE_
X-MS-Office365-Filtering-Correlation-Id: 73931917-a65f-459c-53c5-08ddba3283ec
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5062599005|5072599009|461199028|15080799009|8060799009|7092599006|19110799006|21061999006|52005399003|40105399003|440099028|3412199025|12091999003|11031999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qbccaZkhuuoP5rC3U381B4uxGL7uG+j2mg9VksXuUI32At0btyC6T/cxz4Va?=
 =?us-ascii?Q?niiu2aea2eA8q+LrFoYCWaEPKVMfJkNm1VvQ7UAzxGlpCpBBsq0JstOIewDT?=
 =?us-ascii?Q?Z3JZ6/qdAT7S2lHnXMfdjvdDFz4FreMUJlmj4ulU2E/fX9KbfcCsjhxfTRkT?=
 =?us-ascii?Q?nSnh/CmtIQORLYVcr1fTmp58ekghR/LSmaLxdrAOSnKJNRHa7JGxnCQ0bxz1?=
 =?us-ascii?Q?JVUul1xPhhhtFlsZ9Wh3YqTleuPbDyduQTPD8lLqfUwvdBh+vy3hfXBQEWn6?=
 =?us-ascii?Q?R2D5mDXuw9jxwqrxyyFJ8kikjXRGa3dS98baJnFuvsEeO0mOCE3HWNUqbdOM?=
 =?us-ascii?Q?gdpTY3dEIAa737PoG+IMyUktCHXRJLtgjpUfRcvineYbnRlgkk+xpJDyMNHo?=
 =?us-ascii?Q?i09UlcbeBlOjAQgrTv46lQlSaPnfCdTxCrDPTaF3lM1Tr/PqsqEXBUMOVSWW?=
 =?us-ascii?Q?2C2t7TJ5N8srxoDpQ070Xqs7p4xZpiUjF/oX51fRVatRGJvfzD5h193eukC+?=
 =?us-ascii?Q?Fyex+TnlhAYG9AJ8EkIUxMp0ZZU8Vbi62dWMe9nU8f0dnubw3+Hw+GT0eKE7?=
 =?us-ascii?Q?V/85jrq5Q3cEj+YC4wGpkZBtlMsTe49uUlQ383LS8IkAlbHhwUzZHovH8AQR?=
 =?us-ascii?Q?WT+LB6o7K+W5sh97amzhiIRe+zX7V9V4szUmpF+vH1b1Qjl+zii4GRw9yGD1?=
 =?us-ascii?Q?T7TpEMS4MjbhLM3pIEr89TMQVTK76uFYOmZeDLht3rOgpdR0qGR1rpLDU9jw?=
 =?us-ascii?Q?eyzEOC5dziV9A/Oegcjeya4uGGsvzlht8IBmKREIJiEmNaXxoJZjYfkm7AHr?=
 =?us-ascii?Q?nfSKjKZNnmI4o+djsh1iFv60L5WFlERsoUcjMZ0kbicZIkvkpWloPULDyLcY?=
 =?us-ascii?Q?PCjaESiTs2cfCv4elLjeauLLRR5Mf2zaVfXB6paeMg6SfbTYeRGiALwre4qb?=
 =?us-ascii?Q?ApC4fTE+SRwKdKUd85I6nezK9VN/xACdK+bxMSBrTcvVkWOJ/s//lwjYyybs?=
 =?us-ascii?Q?tRT0nVfXE3CmiJkuFvSfeiv8qLytiw4xU2BtBVu2MJJ8/bOwiOIrLAxtiVk1?=
 =?us-ascii?Q?cnwJYsGvgY6UaeaJR7U0q8To4E9Ns+lWKTrqYiZIbig247WvfeOB8+l2RtFc?=
 =?us-ascii?Q?9mmMfRTgxkyQtJ+y6FjDQm6Ali7qBLk1QlOaVc2T0Jm03Z0I2xRd+8yRkknX?=
 =?us-ascii?Q?thj7KMdCfVptMRnR17vUi+AVx8zyBWjm4L8oOiT/tjJ6tGPKDjKM/zjpIMGO?=
 =?us-ascii?Q?MFjqjk7zfcFTiF8ftiJQTvjBXe4ST0MY05zSjk43btqNco/Nhx/Y0oW2YerM?=
 =?us-ascii?Q?+FGF+DwY0Z0NGNjxFL2NYl1EawvuUR2cNQoohyCxuZ07pg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?osaf+1yeucLUsdsZ/MSJ6bA/Hf7Ah6EbbZqkZspw0WkXFQOwg8E9lVj0EaXp?=
 =?us-ascii?Q?RyWJIYLBtTT/iW862I9FiIrYEGXcFcMyCNWfY0RX5jtYXaRUN0OTxePXWGWU?=
 =?us-ascii?Q?n8hHQmwdsQ6ecJAVURK16gga0FtHOEjZ9Bij06H9yhFbIpHCI3f8FZaZPqd7?=
 =?us-ascii?Q?Z8eWiTuGHvqbeN3fq+kRrWN8PzkrpxV7I1X3X5ejde3sAj9SGm4rpa++vMYa?=
 =?us-ascii?Q?uQ+TruDtgzJy/LeOC3oNO4BOUdHAsK/ofShxphONUllZy6CrHr7AfvHJpZPZ?=
 =?us-ascii?Q?IbehK4ffiFUfudvW2Yq0A9cf/ppeldprG5lrT0dX3aRXMa9UIAXgd7MGSMku?=
 =?us-ascii?Q?pA4zl90NVegci5WYZo4di3JJ35udbQ/s4bQq5k/jUhtOdHGfkdMI9VjEgBxO?=
 =?us-ascii?Q?gZXjUGWDl+uAAqcxT6wiu9M5rvchyJOi7Peh89m4N1+4ZVrI+yjP6EOTAwYT?=
 =?us-ascii?Q?vvzZhiQQSqJ46oC7WoL7hCUFN07zb12wP+3/Gg1OBhan12LsjV6zwYMGMnwL?=
 =?us-ascii?Q?XUGTP5D0Xo/C4K3XaloiEgJvK8M4LmsDgqwdY4lOJZwVSli0qrKz3Z/unozK?=
 =?us-ascii?Q?eve8sWdMKVlINo59A7CuOKsfIwK87m1QjgSik8AwYxkXugC1hiYOtEz1Dg/q?=
 =?us-ascii?Q?eLIDzV0CEmKLiurVZBFDpPRiSx1lkb+kUszAfadaYENa2X4mVeOSO8wtbrIT?=
 =?us-ascii?Q?60L1loPjHXsVyyv+mjlIRYIo4CyitOVZ5ZwE3Cx0oT541ZcmXDhGW/e1ic8v?=
 =?us-ascii?Q?IId8Fu8gsCdtVXT3eLZdcdryYJYbhFJv0incMFUkoVEA9Z4OaIzhk9vh+4Ka?=
 =?us-ascii?Q?mrbwJeUm3fHkBzHYjleQVLY56iS0IHYMj7UccJk6zPN1tQ6tasVvGDV8mSv4?=
 =?us-ascii?Q?S68mNsaKPjb+NM+4miGxA9OhyOg1KoHXlfOtEA+AOToeTl2WvEnyLkjw+fdm?=
 =?us-ascii?Q?QBrzO1elJ+1HvrkPQsosg/pU7+D6lsV3AfGYKCda5UBaQSf/bHF0hrbpbyg6?=
 =?us-ascii?Q?ZlwdumG3M8lbHQNnWrTwXfaMAFu7cFz+kvXlP2Sg/6Y5C/Dq1uCRztOd8Vm1?=
 =?us-ascii?Q?01+Vvfijz75aIwIOvd2WOU7jCwLRBNbG9Jn/oKYw+cWkWVUMx7A19VSYNx4l?=
 =?us-ascii?Q?czPQO2Titv7Xc0JOJ8/WqhRqLzXsmPXj/KCxB3xpUrsodBrPIRD8GENpsKLl?=
 =?us-ascii?Q?abUSJYM753xel6V6CkB6Um8vQgFxFPl/rJ/NKn4qA3g0TYR3I065skgG6J9a?=
 =?us-ascii?Q?mJW5s6KzhtgMWBDFYjQ9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73931917-a65f-459c-53c5-08ddba3283ec
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1670.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 13:07:09.6461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16398

These functions are exported but their prototypes are not defined.
This patch adds the missing function prototypes to fix the following
compilation warnings:

arch/mips/kernel/vpe-mt.c:180:7: error: no previous prototype for 'vpe_alloc' [-Werror=missing-prototypes]
  180 | void *vpe_alloc(void)
      |       ^~~~~~~~~
arch/mips/kernel/vpe-mt.c:198:5: error: no previous prototype for 'vpe_start' [-Werror=missing-prototypes]
  198 | int vpe_start(void *vpe, unsigned long start)
      |     ^~~~~~~~~
arch/mips/kernel/vpe-mt.c:208:5: error: no previous prototype for 'vpe_stop' [-Werror=missing-prototypes]
  208 | int vpe_stop(void *vpe)
      |     ^~~~~~~~
arch/mips/kernel/vpe-mt.c:229:5: error: no previous prototype for 'vpe_free' [-Werror=missing-prototypes]
  229 | int vpe_free(void *vpe)
      |     ^~~~~~~~

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 arch/mips/include/asm/vpe.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/include/asm/vpe.h b/arch/mips/include/asm/vpe.h
index 61fd4d0ae..c0769dc4b 100644
--- a/arch/mips/include/asm/vpe.h
+++ b/arch/mips/include/asm/vpe.h
@@ -119,4 +119,12 @@ void cleanup_tc(struct tc *tc);
 
 int __init vpe_module_init(void);
 void __exit vpe_module_exit(void);
+
+#ifdef CONFIG_MIPS_VPE_LOADER_MT
+void *vpe_alloc(void);
+int vpe_start(void *vpe, unsigned long start);
+int vpe_stop(void *vpe);
+int vpe_free(void *vpe);
+#endif /* CONFIG_MIPS_VPE_LOADER_MT */
+
 #endif /* _ASM_VPE_H */
-- 
2.50.0


