Return-Path: <linux-mips+bounces-3227-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE48C30B1
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D997F1F225B0
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A212D65191;
	Sat, 11 May 2024 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="YH6El/uF"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2117.outbound.protection.outlook.com [40.107.241.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC3760882;
	Sat, 11 May 2024 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424249; cv=fail; b=rlWbDIasfH3iDx/ZBRRPXoakSpT8WG/8vh7IExAA6v64X2X4k2M5I++I+FTBIMdBGT1o0dhlfzk9+gVOce/zNkOwfmi0BuzUdUGidiVyb8Arv2FmM5nfF2wJDSqmvsnWSe82wJxyhYsu1XYNiMZjbRmqRw+Z61eVgX76/AgyvII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424249; c=relaxed/simple;
	bh=7rhOw+6NYS/Ic4qRd9izx3OWP8tn8OvKYXtXccN4fOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GluPyeybQRoI+dsW39k5yaszK4YnfIIs2lpMsMkrzWsruHnysEXnNpHqPIxR6f9ghwN+7VKMDhgFqtxBts/QhPQt8uVqV/9O3cpXvZBxwAP1XeeXVQGUBAswpFu4cgPFOrPlSSMnvVCYxizINzLlR1vbRpkgeIjQmKIddZAR+ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=YH6El/uF; arc=fail smtp.client-ip=40.107.241.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEnddMI9M9vHIfB1gbmajmlylhU3hh7CitJFcCA683/fQoaofVkLbATQLrmM/0SCI+asd0HnloiZ8P9gtznUuYnBhTw4tNj/xA1Ie7N525uj0Xlkldvp2XqKjwHM75l2V+HP/X0Xy8qyI2rUXaIuqlCsPwBFPYv0S8DXITbTxF5NujSW+Ai2gTYyF0mwnA3uY9P0E8RmyfMoa77VPM61xW78pbRT/9p25+HAK8CqP62TAg5Mh0QFBLh77tFNefuPEsRfXXzLWLCEjIB6iWxSc87FPOIjNx3hUqSNK8iT1PcABZemwHCm22bcEOimPgaPcBOxHoZVyDd8n7r5bCa/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqsl0TELsJDeGTvbGSJviIvo7fQMdHpMDHtiZczHOfo=;
 b=honeZ77KA8WkqYD5LCejmMvGY5e1CECYpLSa+95QPyn+OUVSja1BM9e649Fz1teCqerBRtZ5rOaFlib+60AgkQcV4ANIJLRWZ5MPWiE04WIEVxDL/hBYpnFDmfmeTzGW8/tnEVZY1QF7pLnIrxbQAb9+WqoScBqlZup+fDybSHuqWkjACicyZl2eAZe5QmAAxGIbLSogujGUQATdVIZlxQFs4GhTJj9E3sJNN0FLyJTfT9HQ1V52P+qJYdMMnkaUgQxahAfgocZ5JBI5RqFi2NP+qbOEf2k3DWOigGpbrQqIeL/Ndj6CH7iWEQ3VfeaKt2Q4vkGc0uKIDhmrEspJwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqsl0TELsJDeGTvbGSJviIvo7fQMdHpMDHtiZczHOfo=;
 b=YH6El/uFtc6yUNfm5A7MELwabQm6CorSSxdma8wqiJ2FCMRH/75uAh+kfYSWorvbSGQt0h/OXoRTo47eEfE4c4EIw5SEtDekbEqW33XiTUDclQeS+rc4TrFadiMs9ePkTtMQeIZdK1X0Xc4huv+FqivexsP5ZHMkzKwA2Zp2hlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:44:00 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:44:00 +0000
From: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v4 12/14] mips: Enable FDC on MIPS R6 platforms.
Date: Sat, 11 May 2024 12:43:39 +0200
Message-Id: <20240511104341.151550-13-aleksandar.rikalo@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0235.eurprd07.prod.outlook.com
 (2603:10a6:802:58::38) To AM9PR03MB6916.eurprd03.prod.outlook.com
 (2603:10a6:20b:2d7::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB6916:EE_|GVXPR03MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaf5dc9-e844-4ff7-1a09-08dc71a74498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+fLYbYJgFEq9jJbCUBB0tIkqZ0beInT2fkyDVbcicPTGgj64htgXOFBGOv+F?=
 =?us-ascii?Q?3vkXnLWcLagZl9goqz9CwVAB1iUvJ7NgO4+/GugUIMEfEsSBWsebk0iNP3vJ?=
 =?us-ascii?Q?vl54TadN5pdSuFWD9G9w3Uu7hQ8OjySpfrKeINt9RtMsLaXUbAeUyJDmlvsf?=
 =?us-ascii?Q?YVwCiiFgoMBErVGPzomw/0s1wP7wq3epkBE4wIRirz6Fs2bTZ4Y/8+qz4+AJ?=
 =?us-ascii?Q?3hwFKhuyqojswel9tdKFCJPdzXaNz3Ew9DPvwCV2sq1jokWYcj/fF5X5X0KB?=
 =?us-ascii?Q?niiXhjJIJKTRl2ar9Qgpn/yCg/epmhwB0RqQhFHQVWNlE2NIyBynxxNdzJYs?=
 =?us-ascii?Q?CP7zAPyXahu9aFsA4Kn0c7guLhNKTlks0EVIg8pTtvtAvzPkqylVORGhnXNY?=
 =?us-ascii?Q?dHvXRK8gK06XCK1OHsQnp5eM5jRW2tifMTzD3bsDMgNxBEhzqWAb9lkLbAeP?=
 =?us-ascii?Q?rcKHCg5KpkTch8+fvpAXJTXqfNJ27U3VRDdxuwpUhg2DwySCgyYSK+y4UUw0?=
 =?us-ascii?Q?Q7amWf+D3P+F6y+Hr+W2ORKgs2L0bINRYkJRCuhFCaw3Q67CeBEDDeAy43aQ?=
 =?us-ascii?Q?SnkviLNAiffh1x6i5g4/AcbuA8cjPNWGiiEAu+tNyQffEB2ZYwIx6UNYxoKu?=
 =?us-ascii?Q?kWzdYbYCmaaJDAg6/1asAWvI7Ji1IFLdJ98Z3uXxaqZFQTfVhPy81U+QSLy4?=
 =?us-ascii?Q?3sr8c9MPoDc/Y1uK0xWZirmSW6oCWYIubW07kdFhfz5/vfc+gzdR82PeYtQY?=
 =?us-ascii?Q?SKTUF4uCEyRkOaPOtEgziZhLdQ1iCiQfUClAS5xHYjX/svmHC+8RM0q0V1iz?=
 =?us-ascii?Q?VaEI2Uxt3ABlFdYjn9mK5NrPjludDKdZ0/HORtbnIs2mgBn6t249YOfK0NVT?=
 =?us-ascii?Q?KpDJqQk/m1W+TNmss9rXljeHb2VZqbrQkk3o04BdWe7hzyghUxuYFSeEt6v/?=
 =?us-ascii?Q?z94dNdBCkT7/IFi2SxdYVgPw6+gWbtAyjHswY7Ddt7pkJQqlGnjQUm22G6Uu?=
 =?us-ascii?Q?VWXJ7TenbGbaOI7qdmJL+ljum8mNb1uUHYIMceyBv62TgUQG3NoZfnHeNh4h?=
 =?us-ascii?Q?KwNTiiKXPG0tAryK5eZeNGXgCNh5VlQX6eUrsRPPcjNHdK5bM7jzAZyaqmQQ?=
 =?us-ascii?Q?KdYWiINcATukhtt/udHcLFQz2y3HUjVMgUKLLS0AeJrvMu17/U5wOVjpSHZi?=
 =?us-ascii?Q?Shcg/ytKV7JpsUENWqhP1C2awj/f9Oab8jRC2xGuk1zPIHHDdSs/TGI9ieHk?=
 =?us-ascii?Q?FWGGTU81nFU0t/4X/lH70taGWeagRpB4n4yZ6VKoNXMfMwGXRTq0T40E8lj5?=
 =?us-ascii?Q?h+f9aAZveKwd6jecn0Pp3iD9YRsu5rgM4Tapr6FDah7Jyg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?raoKKXyWR48u9a+1v3C0bsVbVq3c5PRMUcCy280CIEDMzzoGK7jJTWdc8eVp?=
 =?us-ascii?Q?siqxLKRe1kLpWgOECSwL0qMjKxcvZMXB67vnuFHXK8/jdC73jhZ/SwZZN+hw?=
 =?us-ascii?Q?1+HxueZ/7STIp/5QLv2x6Id/9crBDDONiSp1/9LLym5Zr5lNbYmxOVwDFBZq?=
 =?us-ascii?Q?2OA1nzYzK2TXEeZA5Z1cSGSqD/xnEOb2zHEBrvwUzUQBulpOCLa8M5ZZVejY?=
 =?us-ascii?Q?bugtxtSsNXg9eESRESOslD2SPt8eDdc9J+wXkNF4716ILHoqMUA90kTGUAHX?=
 =?us-ascii?Q?nqB6MuMp4SCa2M3gUg9ZAiBUKyXppD7cW8MzxbeFvXQWidUV7kP0Crbi7XXo?=
 =?us-ascii?Q?MkWGL0ybcyzr2kttLjkiUiJJXrpfvj8odQh9owc2TJKk/n05/RuNWwlqvbGe?=
 =?us-ascii?Q?G+3pmWjNhoir9aeC3o3oo5+vs6rApC2Gyh0utghwnH3+jX6kLrjZeE/O1otx?=
 =?us-ascii?Q?KzHT005uoH/pGZXjg16i9u/DuPmvOcjaVMFHHlX6Jqms0F5j502vIYnXbN43?=
 =?us-ascii?Q?xb0kHcNEeoRKcILxwwi1QprlaHwkz6qxWu9a8hiTGC9KkggfFdGHJSFNwkJm?=
 =?us-ascii?Q?HTxHP8oDpFcNiM5BcX/CyepSFa17bAUgwU/4gDPR2Wj5HOS6ctvH11tvn7YX?=
 =?us-ascii?Q?UmjEZY3rKeaxjji2LqCizq62tQbMwbAP84q9cS0Gf4nfXAh61z0QXc0XJ2y6?=
 =?us-ascii?Q?6ElzwC57d829YPns1x/TnpQl5eMe1AgyWEsoIiOkLvxNh5+yaJcLHtzvzqZH?=
 =?us-ascii?Q?kOzj+m4mDGDMZcoGAN06mKwH959QSJM8837kvTeh4N6bRpEuf3DQn7BiXLVe?=
 =?us-ascii?Q?HnzvmBjKuZex0vJsTSUKj7tqwrsrDV/hLnNHEEz4EehixhosfslLg60QhCVQ?=
 =?us-ascii?Q?+34CaspwYrbxv5hrjyixehGmlsHB1tkF4FniXk2pdw5O3Dp+g5/wiATZZ7RQ?=
 =?us-ascii?Q?pjO5U8Hilky4iWpUpV9vAbRujOLIxwc/Cz27laCAiRmkyJNr3XC8S9xaiEwG?=
 =?us-ascii?Q?OAZUv/nn2WW2m8P4glI7yvxKm3a3UNMZsFPE4RWB8Xh1gSkoQehdxKmbnbpn?=
 =?us-ascii?Q?rpnr3CJpBe4I4+dyY24Peyx97FSQoPh/h8zi99o/GmfOpyxfAx+nCSfS3GDl?=
 =?us-ascii?Q?1m4yzoxR3vTlgnbjbzNmUA3F46nYSZURz3vAZ7PaRbhOzZJLVEHu53TDnkUB?=
 =?us-ascii?Q?w1MnFMr3DcCFcqerKB5gPUtVQBpDpr2JiD5ygiM9m1FmAMRTvk+9tzN4qr9a?=
 =?us-ascii?Q?DSE5YEV+ufCxMkVBm7bK9Vjk0QrCHIkGi8DFEl0cwrY7kG4at2ukEhH8o/ee?=
 =?us-ascii?Q?FaUDOWcx5LaNaLFMiTyuWqARDM+/OSzmsDohtyMwuSJ8NewbnZ5Fm5WrfYCc?=
 =?us-ascii?Q?KHebDpuQ//piDh95D/MeUCWaJE+y85xOqt3Q24DIWjNlGU1WGv3Zbhn+mx8n?=
 =?us-ascii?Q?nkCcE7rQEDzQe2O5l7KF9ZedZMCzN7Nbm7i7KQa9XcsaNqNFJMDT8/tHcvW6?=
 =?us-ascii?Q?Rabvh6lYdg3OaO+fGx0KX1uJxPYZGOJpZuwsmK6nOH1WQj+rsLDGrL0YBmy5?=
 =?us-ascii?Q?HmeXwWPRPq9W2anqDDTIYbubab4zalzFMuLRN7JhmJSQ1u1sl78P1BwXZeoe?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaf5dc9-e844-4ff7-1a09-08dc71a74498
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:44:00.5244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UDFU5llOBkPMbMFodyWvRsTSD25N9TEqtBCbyVgGFNSumYkSo7bz0cv2hl59uJS7ccUrMyRGZplpD8Z12ztWu9Vmeg6x9R6a1/nb3Zvo5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

Change of the configuration file to enable the build of the
FDC driver for MIPS R6 systems.

Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@syrmia.com>
---
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index d5e7fa9173a1..17b682f05915 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -108,7 +108,7 @@ config INTEL_IXP4XX_EB
 
 config MIPS_CDMM
 	bool "MIPS Common Device Memory Map (CDMM) Driver"
-	depends on CPU_MIPSR2 || CPU_MIPSR5
+	depends on CPU_MIPSR2 || CPU_MIPSR5 || CPU_MIPSR6
 	help
 	  Driver needed for the MIPS Common Device Memory Map bus in MIPS
 	  cores. This bus is for per-CPU tightly coupled devices such as the
-- 
2.25.1


