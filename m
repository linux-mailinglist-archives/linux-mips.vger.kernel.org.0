Return-Path: <linux-mips+bounces-3215-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 461598C309A
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EF231C20ABF
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293744D9F6;
	Sat, 11 May 2024 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="yXab0w76"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2094.outbound.protection.outlook.com [40.107.241.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AC828F3;
	Sat, 11 May 2024 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424235; cv=fail; b=K+ydAQGxHARzRrtIf875IDc0HyQz7L+W3ZRBkEATTUDnayQshMxzWGBzkJ3C0FA9gJBE4Yr8vPmHbq5HnoGH7S8SVlLoEyuRPJ2lc6tPOcPihLOAMlR6ZXhgkDxOGYdUYrZo3xAE5W1mSQUlQzRUTVODR6L2lDZVCxsaUyZt8Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424235; c=relaxed/simple;
	bh=pgUexYEdCc/S8MrOO4Vfi9aA9LHSMydEuSaS7N1UTKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SAmPrBrSKcjSoaA78IkToNGnRWsp0QGphLbBn46abbY6EqWVXaJoEWAlWbhco6fG6Ya0y63pwzhagzfgLeMwU+xhFV8I9WVTrrXURBBaRpfz8d63iZFVthaLeYJNqKez1Qr3zy/yt1KoaZlV/9uWEvokr9D05iAmeNMflPGhUvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=yXab0w76; arc=fail smtp.client-ip=40.107.241.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIHbRjGWYfiPsQr/V8/j5qdUEj/uxQGQnfgUY+WDNUYVSBk7B1fQ+Jr1uqyl5aJHw/csi6rRnr/o9U7IYpXtIwbaa/O4MP+xXWCeAD/ZzrtXhdoZ9YODUS7h4xDMMjneckaIYyOHIdtgtQz56GEyBy97yDossZkafuGNIjibKfL5ade+HXUae+ExkEFDXntz6Iwd5sfyzacKlKfq2e2sDMCO5k7DsOF6KdESrT6qu1xA5CXmNpt68w5pFX/kH5/34il/+qvoVlFIbgrm4XJJnL6Blxs+aEx+7pDo4+iu5xofBWT2uzlj6N8+2Ei888pQxwEoAxxg1Ol8lurOs1+jMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bt/6KW/FjypkfnMGjZFo25lpX0HEMiyDlEHf70CsfoU=;
 b=Mdc6FQMvc5Q8eSwq/Chca98aomJWLkDfPbwlLeZMs7kjvSohm7HCaKE2EKqFHl+942Yr1LUEhuzUftv+e5VWH2ItOsoGkwiOUcmIzSM4uaGpA0FO6v2wltZ+NJCwbX8p/ZZvy9sljneTjUrHArl+8PIiq6sC/nUmpK6ipdwDdpiqCzM/mz7WavLkhaPoi1rou+c/sYEF6bnbzTl6cB9LfUJJfyuGF/VxlzyJxfmh1FdH8oSry1zZ9FjIB9wiIJ6TBBryK6pcxFrEuGD1UObwVcwY1ReKeM+dyDNCUzmOV0dEyMCLuUm2zebTeMIGOgSsSdrM8PZFgYSkcLRdSb1vJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bt/6KW/FjypkfnMGjZFo25lpX0HEMiyDlEHf70CsfoU=;
 b=yXab0w76Ax/LEu/S5v39uXZJr+YPFC3y9qgRRZzuPe3m06HHSGGKP7daZYml+Jf/r+pNYOKNjiCgF87VJNQoz9ZVwv2mL8yREuo8OB1U41ci1B6E7/SDoZC9IxzsgY5hTURIjSm44KnjhYaLGeziINIQh7eyd5OLhzUaB24rNBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:48 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:47 +0000
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
Subject: [PATCH v4 00/14] MIPS: Support I6500 multi-cluster configuration
Date: Sat, 11 May 2024 12:43:27 +0200
Message-Id: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: bebbf372-de0e-4cd4-8a4b-08dc71a73d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ny88mFyyvRWWx7Yey6ZYl1WDBgkQGkFWL7JoXEcDBo5mDg3oS+jSWrxcS8g6?=
 =?us-ascii?Q?i5qoy2F5OI8a23xLePQLrA7D1ON2nImr/Dr8gCM7SEp4jyfDxZ8J8iZ3uBI/?=
 =?us-ascii?Q?X2ZklFYZm5DhKkqHzqt9+hEINO+c8Zoon4Nu8d8Zlnv38N39/ddK3acZaF7Q?=
 =?us-ascii?Q?sgmZUZ4qRR0NxT/N+Cr/ervHKf5eU2nK4NetGn7Wa0ZLCnHzyv8v9nIiXqrl?=
 =?us-ascii?Q?icWxtRVWrucxMKohhvcA2V+wc0h0INyD1hxrG+F3mMHlcxY48oyq/NXETlIr?=
 =?us-ascii?Q?XrjtpXeweNBF/aNVnKg885hCoAqBhU4IN6unCKYLMMK7H0HUK72d/nO/8Qaz?=
 =?us-ascii?Q?YTEedCJyXF+RvexyDzt/1SFirFytK++Hr0jfbjgnAUsUQ+4J3CDL2F25gIA1?=
 =?us-ascii?Q?0HVrpkxIYuvPq7CKM83yS/EU6NC3LpEhYpXHX5GT6jjgTGnqKklW/tjQAvUm?=
 =?us-ascii?Q?NXDe0307LhfHsWxyHWFCXyRKQkxuz2UghMGL/qDI7vZ7h0bT0BTsU7XtVL06?=
 =?us-ascii?Q?zGdrZ7w9vM3XLOyGDdynEkh+GtW7yHBBr7Uex4u6htCrESq4tcxg1viVN8Wr?=
 =?us-ascii?Q?XR5NYdUKwKTBT6NjbV6nnP9NOvF0rkAM/Aq+QjDWrRbSs93aeXU6ga23/4Ut?=
 =?us-ascii?Q?FK8BwUBTax5AwRo44l9jMWqgxXqQyPR6N9YAvm1s6PPxgZSWmmIpc5s3WReU?=
 =?us-ascii?Q?QwvmQTjJ1QocJUbQsKcnigzmz9QHXjclK/Hky0ZHkxoYZYpPUbrOvUH7vC/w?=
 =?us-ascii?Q?7i2x1fBJC0LPNCV30Pxs829PtrVtfvfUMEL0iWPqHlQCf+Q5J4SybS23yH3r?=
 =?us-ascii?Q?E10cC8dnVeoaG1Xx/g96Lm1dUnCMT67ZaXL8rwVvOmTk3v7acfMFdFXhWO1j?=
 =?us-ascii?Q?JcbiC4rzGr9nw3NP3hMjGILbs+FlCOD78aottVbJeLuh9VYMaICf8BklnuKi?=
 =?us-ascii?Q?XKDWEBC3WNiKANi27oVkrX+6cWRxLdGTEr3MqkaOiKao2WNKtvubGUpLoM17?=
 =?us-ascii?Q?1ZU8X3ocamMEaxmm5Zp7fDzQNJlGFeG3zP+ORR4SWyYcjn9ojThBkk+saCvS?=
 =?us-ascii?Q?EdE9FVRr4ZIMkqltAClT6xXCc8kQlpwni/Pnh31UF2HS8WIOqxzCH3pY2Oap?=
 =?us-ascii?Q?6+WUQV6+AwBv6ejIajMWjI02L/BBMeWYUP4JcAimhxtFW5BvaIhtyEfIHGB/?=
 =?us-ascii?Q?M68rluUJnGM1FcRX6wXFnYkWEZEFMrvvmHbHnu42fIHe3kHGp7YTBwCeYU7L?=
 =?us-ascii?Q?z7lDxAnDV4mlH8K2jEosgUjD1p4ubm4ywjzTDmdrrWGo61sBWrcCCZnPkQeK?=
 =?us-ascii?Q?yd67JNncy3kR0jqNuCruXC3tTRGAqfWKjbMGzX2/8M8aww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Gflctzk98D87hBl0waGzBGUVUpuuo0OUu7mgYPSMHtxrhUK3sXL/h/Oq0nc?=
 =?us-ascii?Q?ULOthS9p4Frea4YtpkJ/MKwLkr5mu8s5H7+bQFZQNHH2m4vHGgxWPgOdMoUY?=
 =?us-ascii?Q?fhMrsIVPthpwNJMGMkefRYJb8YXIHO4BMooNkpTMoyOW40Arh+5k6XYCQ3Hy?=
 =?us-ascii?Q?MeidtusRi6xLp7L+M/MknjKZ1F/pMrvvExbW+H4fC9xZYy1b9EqIEVam155N?=
 =?us-ascii?Q?Vkur9zFt4OY+tDw4jY9pKo0TGA4To3YdqYEBWPM93AytanlfFi1uUTjmD/CH?=
 =?us-ascii?Q?3ofnm6JYhHdORT5oIvnypVtMz0RC6z9f10q7knJwAcRb6s+2wGNqIwk7f+e6?=
 =?us-ascii?Q?l6sWnkrf4ySY+IMrcG4w9YI+9jvTc+jj+nPKOTWTMgw+IO0eNutL2ml4mRC7?=
 =?us-ascii?Q?JSttFiExMMXF511t/coQjGHAX4tKSygsOAMBKorf+gmmo5u7uJYihWIrWFMq?=
 =?us-ascii?Q?m+c6RouEcB56u5JT9V5sBuiBui0mKydqyzCL8rkuJLyL/aBDqWgNgBeIIkk7?=
 =?us-ascii?Q?+ZXX5/z2aaG4mQhWnhvXg3BoYvG1n4N1MIbzVA6TyLsbhdayVI+jm5rnD/ix?=
 =?us-ascii?Q?bWgs0j3kOSyl3mX0KNIBqzzJPCE3Sq9IHoL+yKds3NwHJPuakS8sMVJVWuXX?=
 =?us-ascii?Q?hrvf2LCwcssQtMLzIGsV8eWUYMARm04vV8IyrgPuPd5Y0VTtyOCQBGOU5sFe?=
 =?us-ascii?Q?joN1qVPrXoo4v3dsfP0TB8Rb4dsaGa5gAIVRKwcBMA4lX8Kz126TlxwEvRbd?=
 =?us-ascii?Q?HA0YabhyGCJ6BQURbmK2+pY9iO4hNU6hRgcmJDZUtRBaJmI3fYiuysr8ztM/?=
 =?us-ascii?Q?gAEIPBcSp6HY/Ol94TRag9on9TsXMpuXLvkVwFggPV0TtUPvIiiJYi5kakTa?=
 =?us-ascii?Q?a82Kz02LhmV4UkF1QnknWUtKOaQSZRW+y61EVmNJL0PtP4J+gz9ghH6aWNs7?=
 =?us-ascii?Q?Sdva+sgXsoqnvj0/0y8LvFOtuGegUMZFarWBO1mBXq45MIr7O1AyeOc38VGp?=
 =?us-ascii?Q?2KdvJIpSkLCg5mokSXX3dvmpQjPfcNzFzNDRRv1tu2gGx2JaWqDJVbZudWvn?=
 =?us-ascii?Q?fL4H1EeDf0W3B9HNoWKQp50aTcmk8ufeF0eggEPextpuq5IaiwYJghcWbgCw?=
 =?us-ascii?Q?k11f9+8wemjv5aYnhGG/TX3TI89IHhXzfx3c9DHbFFeWVzg1/mdC5Gq8YYKf?=
 =?us-ascii?Q?JbE9UvU/A4tlw76ruy2AKCH3ThtzR0+X8J92hGScBGkzyZZbz1zNX7aUG18Q?=
 =?us-ascii?Q?oFthhkPeE/cwveF9SF6r59096ktZePU8vaN25UCw5UkaitX9ST3EODTGbUxQ?=
 =?us-ascii?Q?AUnBwVzsZhvcY5s0LPGb0Rc5tPMc4Bfprz/1Yhd/lfqhOt4SRiQogVvxD4bG?=
 =?us-ascii?Q?5lqiPPrGGR0uPA4jKwwgmFJ3EomWQFtseSBuHPPvG3CsY7fZzOpqdBiiwBL6?=
 =?us-ascii?Q?4ifaH0LIjHPoo1+bHyX9luoMMc8NuFqaqvn4zECtf8f2VSWB45zcfa8Pg53c?=
 =?us-ascii?Q?fyKnPs0bXS5mF79S3hD7swTGU1X5ZWJxs8RLxN52Moqkz7wqST33dqTpwzxQ?=
 =?us-ascii?Q?Ps0Dy9MmzYRmEz6SlWMIPuzCAB6QxWF+9nEpMQHIl3JsGHamRt1WIVarfpNy?=
 =?us-ascii?Q?Cg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bebbf372-de0e-4cd4-8a4b-08dc71a73d0c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:47.8244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aimFoV5sZ76mC2y6G3NFVGBgLzxCFiqyh4JlWJE6N+aUsqdPMC5M0KI/nh84lkITolQOf7vSRfn0EFwws4R4DO1IuvuI8xBZHmMITqQMODM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
1 cluster/4 VPU configurations.

v4:
 - Re-base onto the master branch, with no functionality impact.
 - Refactor MIPS FDC driver in the context of multicluster support.

v3:
 - Add Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com> for the patch 02/12.
 - Add the changes requested by Marc Zyngier for the 3/12 patch.
 - Remove the patch 11/12 (a consequence of a discussion between Jiaxun Yang
   and Marc Zyngier.
 - Re-base onto the master branch, with no functionality impact.

v2:
 - Apply correct Signed-off-by to avoid confusion.

Aleksandar Rikalo (3):
  mips: Enable FDC on MIPS R6 platforms.
  mips: Move FDC driver to a separate directory
  mips: FDC driver refactor

Chao-ying Fu (1):
  irqchip: mips-gic: Setup defaults in each cluster

Paul Burton (10):
  MIPS: CPS: Add a couple of multi-cluster utility functions
  MIPS: GIC: Generate redirect block accessors
  irqchip: mips-gic: Introduce for_each_online_cpu_gic()
  irqchip: mips-gic: Support multi-cluster in for_each_online_cpu_gic()
  irqchip: mips-gic: Multi-cluster support
  clocksource: mips-gic-timer: Always use cluster 0 counter as
    clocksource
  clocksource: mips-gic-timer: Enable counter when CPUs start
  MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
  MIPS: CPS: Introduce struct cluster_boot_config
  MIPS: CPS: Boot CPUs in secondary clusters

 arch/mips/include/asm/mips-cm.h               |  18 ++
 arch/mips/include/asm/mips-cps.h              |  38 +++
 arch/mips/include/asm/mips-gic.h              |  50 ++-
 arch/mips/include/asm/smp-cps.h               |   7 +-
 arch/mips/kernel/asm-offsets.c                |   3 +
 arch/mips/kernel/cps-vec.S                    |  19 +-
 arch/mips/kernel/mips-cm.c                    |  41 ++-
 arch/mips/kernel/pm-cps.c                     |  35 ++-
 arch/mips/kernel/smp-cps.c                    | 288 ++++++++++++++----
 drivers/bus/Kconfig                           |   2 +-
 drivers/clocksource/mips-gic-timer.c          |  45 ++-
 drivers/irqchip/Kconfig                       |   1 +
 drivers/irqchip/irq-mips-gic.c                | 276 ++++++++++++++---
 drivers/tty/Makefile                          |   2 +-
 drivers/tty/mips_fdc/Makefile                 |   4 +
 drivers/tty/mips_fdc/ejtag-fdc-mips.c         |  29 ++
 .../ejtag-fdc.c}                              |  66 +---
 drivers/tty/mips_fdc/ejtag-fdc.h              |  55 ++++
 18 files changed, 794 insertions(+), 185 deletions(-)
 create mode 100644 drivers/tty/mips_fdc/Makefile
 create mode 100644 drivers/tty/mips_fdc/ejtag-fdc-mips.c
 rename drivers/tty/{mips_ejtag_fdc.c => mips_fdc/ejtag-fdc.c} (92%)
 create mode 100644 drivers/tty/mips_fdc/ejtag-fdc.h

-- 
2.25.1


