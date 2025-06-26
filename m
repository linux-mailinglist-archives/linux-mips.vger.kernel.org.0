Return-Path: <linux-mips+bounces-9513-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D7AAEA33A
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 18:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 370771C455BD
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 16:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63A3203706;
	Thu, 26 Jun 2025 16:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eFpTD6Rb"
X-Original-To: linux-mips@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A31F4168;
	Thu, 26 Jun 2025 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954096; cv=fail; b=n2LjZneeadIuJ9pD68vorPGK8g60aNynD44ROKtOJY9+MRWKYWsoT2aR/Dfloy9F+X9C14NwTCTzL3iqUMKsQuy8DOCGzOR/M0/v1/rKeuU+d3L/4L5zdAqM2M3/SswX/a1TeIV8T65q8Hn3O4lShelMFZOLtrB7fJeRsXTareA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954096; c=relaxed/simple;
	bh=zZr31osxHTVs27ELIojtZj2dOI8lzc3WgPqa9CDMB40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mBWfYnPk6ukr0UMwRC7/3HjcHu12fCKudC8efqsyeH/bRuhZJf4KSiOPjyMFoG/aSsZExyTYi+pMnbQN6BXVN87dPd/p+CfnRMb1gMhk2KCVUDLUvh6L5L0iA2RxuXDGQHiPtDQRlxOf0ljTevHed6rvNPg99HZWOvkDiUGUInU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eFpTD6Rb; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb933NWPiFIlnrRcw79p0rSSZ3IlD6P4pe41nSlMLolJkAZp56fDArGQN2rI+kxqR/JK1ZXjBeafkfk0XVTguQVTr+VMRvCmISS5AJN1Jrxn5G5sgzXFvoCoXhr35xnpkYGDhbcTixvonD9mbrcMYg82U/ofppGZkRLkhHBQm0nOiGP0fD9FmuCT3uOeTIbOl0qhXoWOu07+SSvJmSJVTMGrFLFZRuhixk3H9lgYk2hMpmotSiiIlHrSDH+FDWulK+o9GNwcyG9hP0RqH07I2ObrZYb0T7EqCYGyAIyhOvpl8F54JxRbK5nLf6SJydslHtvvAQ+AvDjFnISUid4z2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocidI6mSs4/fgUZV2bAXSL1w9m+IV2ZnqPOX1xgW0FA=;
 b=wUTDGVVZ5vbgr5lgqr1VeUWQozKpV9rhz9ngkXUslCtxZ/9W6aBwVTadnlPjvk3a3/JW2rOtfs2HNRzG2rFIyIDWbOBW2YVnWOMwmKgDua1x2XyOAmrsoVO0NQAk2jImwRenWR1JfzCJzzUPBHNwwIfRySGplzDXjr9t+LQIxLS3VsCPEuboK1DpgfGN0ZzQqWpPrDg8PbSx3jKjqGhcRybx2AfqKeoN5hzCBJklKj+4PhKaRw7o8R95bIFxAWo0Rzch2z+QY0UqTknGHDMkBmKui6iMwIw9dqPZYk7oCUicexatsLh//h9snq1O2iOehZGe7kY5CJ0zzwywIXQBoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocidI6mSs4/fgUZV2bAXSL1w9m+IV2ZnqPOX1xgW0FA=;
 b=eFpTD6Rb2EUM99FW8sVNOISpaqlqy5DZGJG6vKqbr4PooM2QS8geAVBhxB4xXjqyel4k9/laBlpswhnf+keeP/1m0AzIXTe+lfJVPAl/CyBUKH9g3h3H7KxmnwEYLUVi2VRg1r26/8/NnYFy0JO0T+hS/HsEPhEcmf6rh3XwjpWGtNP/Og5X89JQZhq+Vmj5uODmmCfKdjbt8oyMC3h1adiJdW860/XV+urNQPoTOI4VuTPOA7RWDjNggJWVgZF11n+RG6slcNXgUFzbimq8bvc74/QCd8SYPjhH6xMKvOrm/NUoOe1hfUhATBvYcRuEgPxJu+Wyck0mpJHBXwUDyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8653.eurprd04.prod.outlook.com (2603:10a6:102:21c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 16:08:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 16:08:11 +0000
Date: Thu, 26 Jun 2025 12:08:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 04/12] irqchip/imx-mu-msi: Convert to
 msi_create_parent_irq_domain() helper
Message-ID: <aF1wZJV6U9c7bnX6@lizhi-Precision-Tower-5810>
References: <cover.1750860131.git.namcao@linutronix.de>
 <4f05fff99b6cc5875d2f4dadd31707e2dedaafc8.1750860131.git.namcao@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f05fff99b6cc5875d2f4dadd31707e2dedaafc8.1750860131.git.namcao@linutronix.de>
X-ClientProxiedBy: AM9P193CA0025.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 225d9d10-6d50-4c1a-00f0-08ddb4cba606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ehkxc60JgiScfZSNnqXMn1Rl7gk1UHzeThGmuAhwd8532LgOei/N6FqNVsFc?=
 =?us-ascii?Q?6qYaB2/iLzhVeown17vSF8K1f0W6Rc4OHSIBJggnq/ZjC+xObpda8Ar9cZYk?=
 =?us-ascii?Q?NKaamH6hExV5YUx0WZihMI52kIpR8TU5HACVP/9WfhnvCyspi1/IU8DafnVH?=
 =?us-ascii?Q?afiqXupUeVVpiRHGk3971LPmdqhrgMP07LyYcdC5Qomm4zJq6WLe27YNvqvs?=
 =?us-ascii?Q?XVjIzf+uwsoeBfGEccwaztgMVzXOOOlJJrUWWwtSNF3Sq1uA0Ce2b8Te9Um4?=
 =?us-ascii?Q?IdPyqgC65E5SIpX5mRAeDB6M83l+3jOiyqwbCzvtb2pWdyrJ3bqP/i/vRsn9?=
 =?us-ascii?Q?A8PmLSaW9C/ETx+cw+IuI8fuv1jrU1ZvJmbQvjEE28FN98ZGREQDdHsszkmU?=
 =?us-ascii?Q?LESMswSplIcKmai+N2TYnUN+dfx+s1EXiINKm5l85CS9nCXEVUUzZEwiGk8O?=
 =?us-ascii?Q?aTRsqjcFvffT6uZSELLR5yUDcoounrDrIRp8DmzmBdjTEaxjho7fiVFr+bGP?=
 =?us-ascii?Q?AnmRbIPWi6n1grSO3GeeOw40IgERKD/Pa43HDcqtqN5ZNE8HT7P1gePz9ilY?=
 =?us-ascii?Q?vTl+eYK3KR2mKt1uI1Fvs3YOq08OuerKgfjUhVsxKiRZY1JowYYmHd3QEaOV?=
 =?us-ascii?Q?VLi79K1W3ht0+MmTZx4UpniObmsDrFIPmVEo/hY5p5n2pk9FT5f6xwvMl2kk?=
 =?us-ascii?Q?Rj39BLqcLVuIkB2EKdawF8RAoI6VZCMwg2KvG5ZBoSHfHp3t1XhHKq/8Jf3a?=
 =?us-ascii?Q?P0izNA+ITmSgGy/k4p5Vh+LGopog7ZFnxh9V0Q3pOVdi1wKnPt4V6cut0X5N?=
 =?us-ascii?Q?KtD3A5NkIfH5eiS7n/M8MLbwtoQkVG0yHIir/KzXyW2LBCwHbW1XnOjpy6mY?=
 =?us-ascii?Q?3e+PSI6QWxQu6VBAWF8qsA0tFEagEobzSU9GolfpzGeT+W0plxGvUVDcak3X?=
 =?us-ascii?Q?QqGiEhkVwgHbwUHBLo+FxXhLChePJsLA4kOXzTsEUb+kcCXsTQSlqc98JiZu?=
 =?us-ascii?Q?uHfEShiMjR0ytJvL+5vNol8bLxpaJHKU6Iypv1C52OpFy8UhPSZO3pvy0tdc?=
 =?us-ascii?Q?9chko7cI3JZ2dpdPFEhRLcY6UcTCjQD4gpds8Mpd2hR+pVovP7w4nqK3Rn0M?=
 =?us-ascii?Q?gAXTgCZ0CcHIxdZAVw9/oFE2Ej/k2fbWBoKzb19BKxpF5gWmlTov6/2tsnzV?=
 =?us-ascii?Q?bLo4hBp6koAWBr3plCRxNFrZVGcgamyjQJdlUbatJZcHRFmRCkiSxAxsdbnH?=
 =?us-ascii?Q?+p7VGHDkx+hlflZThIualNLRKKC2qAg5VOwaww//XCS7XjfMD+xfHEv8QwnO?=
 =?us-ascii?Q?UYxLu1GQDvpg+N8nKWYlDCt7M1ePb5V9vwiN2+SPKWeuNvHwCRswAxsc4HO3?=
 =?us-ascii?Q?HoEgxczF7Wz2KDwM/+bVTxorFGdQ2J43CIitkAhHzWcv5rK0WAyA6s9rY70a?=
 =?us-ascii?Q?UYSNXL5IbLyFYUfbCWzru+Q/lsrjsu4xOa3XiSUo5Ikjx63r7Qrdnrqc/3Rd?=
 =?us-ascii?Q?FVD7BH0CiB8tFZg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CRDnPBzG4N42Oyfqda1V/w30Pkjh5VMUO+tVVc1kuZA69VUtLLncmBxPbZZ2?=
 =?us-ascii?Q?7PWJxYKf53J4eDbopOoJtEEBuxknBhl0jcNMhZAXsazrzIZO7Ybz362kjPyh?=
 =?us-ascii?Q?rp26N1m7Oh1AMZYA79jrWf+1xebVGMRdjzdt/RgYg9KKLbjuT1kCKdTe9aFt?=
 =?us-ascii?Q?9O0YBDQPvNS1FDIZ0vts6/gWIoAheN4VmmbprQzU3P0nr42nR4x2xzNxAbDF?=
 =?us-ascii?Q?ZweGlgoK6v1Axlhqi74RJiOND+NWf8FhWso2WIf5TofpTwrueOh9RtjKfG7b?=
 =?us-ascii?Q?/KXRZBWL33ohFUtd8l7dTUzHZ0TqgU3XAl6gkEjwaoJbqz7jdNzg0Z8RPqPk?=
 =?us-ascii?Q?O2jqjvxCVInbQfjN6JQ27rscJJ0WRz9pKVq3rwzz/+ipLRQvQhFtCrz1U95y?=
 =?us-ascii?Q?0KTJqi2GqzSbllDL+uNiO9Gamc7SC5glIf5YzqOOJyHI5V4BxMAFzJZwSx8S?=
 =?us-ascii?Q?XW7KPTgYyGeTzg/wJGbTgRD0F7bsuJbdKybeejxRJDkMPy3giWcUiU2IPPv8?=
 =?us-ascii?Q?G6AbaTbIEZYNYruLIQWcwM/Je68dtnS1A42Zktuz1GkeUhJgZszRI3P+aivu?=
 =?us-ascii?Q?zvIux8t6lwQGz9gn9d3vqbGZm7avie8BkTFe7FnDaOWS4v6pOF61H+5p95y2?=
 =?us-ascii?Q?AK8hmdWe03CNaU3CK3GvYUqVjLC+ykUgjX73YLmLXqMWXYPxZYUo5J53bHdv?=
 =?us-ascii?Q?5PIRWyz4873fhq2zMqlQnvS0CSxnrVAzaoIIT58BUxXRoz/spDL+lPdFcnKs?=
 =?us-ascii?Q?XSGKjp9+i56aGx5AiOcnBkoD9nDMxK0H5Adk9IqMSzd4OJXnArYSx1e0gLzx?=
 =?us-ascii?Q?pocc2sS0xyLT4C9Z1oXJ/Agk0jPFYbrSzEsVBypqeJJb1c3SfzSdhTCbtjMI?=
 =?us-ascii?Q?r2uuinEgtIz1N+BpEZU4cKdN4922aT+dRZGS58Rq31ScGpnRSUJj5GJsyiDB?=
 =?us-ascii?Q?K3O9QlCF2n6RAbBVFPER6/OUfai0Sopa53N3PRpgvIe8OeguYV5wGfqcdDaS?=
 =?us-ascii?Q?KmMseF2t0123nOL8WTiwh3z9fB9eh3EbNwAtBKutdRvFyL/HIf/A21lrBLnD?=
 =?us-ascii?Q?5GzTGe3gXyGGLAweXGOlCST9vpcjLycAVc2h17Bqrp1yURVLfjJ7nB/28AVk?=
 =?us-ascii?Q?p0M8R9Way24pcB/woXauz/321kQw0i8Rb0XldAWzj6t708Cvb9pKxJi8UJYO?=
 =?us-ascii?Q?1MLJ4T6bdr2LZK4juOlTZd3/Q3Ctg6tEDtdskDuOQR7Roa1njtUEqmqC9hCh?=
 =?us-ascii?Q?AHy2Tbq07eU6iXa2TbXVtc89vQ2CUx/ue9afv8nH69uxTOdr62XtpyQurqgz?=
 =?us-ascii?Q?3/848VkkCGIgGzppxsQ7Own5C9nTB5t2tGQhhLPch/9IT0hk2jq6HQXz4MAy?=
 =?us-ascii?Q?BxF+w3WsuC4SzJvuc6+T/+Iyb+Mmtnf0oMeciD5J+qQ4NiSvnAMTE/tvIkgL?=
 =?us-ascii?Q?mt3+REV84Ob1JI/wocrawyBkuF/D92RMbrvoS/+mcTDaveqKmFL3o+Kz2bwO?=
 =?us-ascii?Q?KPDgoicd7zi8ufVr7IEStnD5ZcXp5LWRGSOqIGtC8coF7RlfO7vLW57jtY5D?=
 =?us-ascii?Q?DmAkxXcg0Ua/O82MqT8K5X4Q53YDsqlXrvK505sx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225d9d10-6d50-4c1a-00f0-08ddb4cba606
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 16:08:11.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zurhkKxoq+ZRbGWhIwYrmDkuWT0FyZSwvDgbUL/gYLoZOfxdsqo28DOvDVlUOeFu1qQcgFjIBjtHpE1kJN9GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8653

On Thu, Jun 26, 2025 at 04:49:01PM +0200, Nam Cao wrote:
> From: Marc Zyngier <maz@kernel.org>
>
> Now that we have a concise helper to create an MSI parent domain,
> switch the IMX letter soup over to that.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Link: https://lore.kernel.org/all/20241204124549.607054-7-maz@kernel.org

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/irqchip/irq-imx-mu-msi.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
> index 137da1927d144..d2a4e8a61a42b 100644
> --- a/drivers/irqchip/irq-imx-mu-msi.c
> +++ b/drivers/irqchip/irq-imx-mu-msi.c
> @@ -223,21 +223,21 @@ static const struct msi_parent_ops imx_mu_msi_parent_ops = {
>
>  static int imx_mu_msi_domains_init(struct imx_mu_msi *msi_data, struct device *dev)
>  {
> -	struct fwnode_handle *fwnodes = dev_fwnode(dev);
> +	struct irq_domain_info info = {
> +		.ops		= &imx_mu_msi_domain_ops,
> +		.fwnode		= dev_fwnode(dev),
> +		.size		= IMX_MU_CHANS,
> +		.host_data	= msi_data,
> +	};
>  	struct irq_domain *parent;
>
>  	/* Initialize MSI domain parent */
> -	parent = irq_domain_create_linear(fwnodes, IMX_MU_CHANS,
> -					  &imx_mu_msi_domain_ops, msi_data);
> +	parent = msi_create_parent_irq_domain(&info, &imx_mu_msi_parent_ops);
>  	if (!parent) {
>  		dev_err(dev, "failed to create IRQ domain\n");
>  		return -ENOMEM;
>  	}
> -
> -	irq_domain_update_bus_token(parent, DOMAIN_BUS_NEXUS);
>  	parent->dev = parent->pm_dev = dev;
> -	parent->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
> -	parent->msi_parent_ops = &imx_mu_msi_parent_ops;
>  	return 0;
>  }
>
> --
> 2.39.5
>

