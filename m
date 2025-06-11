Return-Path: <linux-mips+bounces-9258-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B9BAD5CAA
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 18:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27EF5173CDB
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 16:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6B3204096;
	Wed, 11 Jun 2025 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WxVegemw"
X-Original-To: linux-mips@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0B11624E9;
	Wed, 11 Jun 2025 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749660503; cv=fail; b=KRBs72yePOle83Dl4LnYiWsPaCCcXWlk+Fibm0wzMWPYDaT37BPQZbDENsxUjnDGEiitlHvjFqjtURaMMckZoXnprPWXC/z0TpzsHpvOuNItEJcJH3yQ+FkYTATnCDj32jtnDqkHGClANEVXZCil43+N79aKG8izmWg8dAVmY3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749660503; c=relaxed/simple;
	bh=Lq/d/HBu1Rg+Hf8WBHdxthvseRQyrSpDFVFHkCST5n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sO3r073UiPe6c8UsfjkKENM4t6ka5DWBFHJDVxq0mnMXQACOH5Suz6tiUldn9TFC4bhb8oix4H5iWbdCiiCCcmLBPATRDhPg0TI8wf0t3chOYtY2UJxc05hywxsFWlz2CGfroqYBax0emSKR5XD0u+4enImW4W/l/isA7OXNbHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WxVegemw; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIlsOIeMsJ7MKvmShJ7BWfKPDaCUEH1WZbGmqYJWMr4JUN+Zrui2/9Wwo9j3bqtOleanhCqhdy5uBCMK+zR+QLzXqasYoj6yK5uznYvD2ug7Wqw2aN8ak8R4jiWS35u/+QLDXh14AzaLjMclruT6ScvBxn4P25y0Acx1eF36tiHTmxfGtVzcGptuFnlwQkhdpeFdyhOp6z3N7I1cv7bHIwV0/TNGJsIIE96cJPUI6L4pBC8PiwMzD/tendsZDlwwHrNZQTuy1VhLq87mg47xVn+5B8ejrHvrYlZ3z6c2t7gl7RNEZCJQv5w/Mitb/tPBshAUxjaIVad7PSpxBfaSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9LPL5Rtm0LlI8oHKH6UGML9y8Hp2hVPjFrT2VVydfg=;
 b=n2Un3tZ6tR0YRdM58x3Iq57GytSYOP3AHsuz7ik0UXvELtLBzTJZ3VOY7ZX3BvJ22Ynx9faYpexHA5BkwsauOetIBsiG6qt6phm9CfZkA3zuB3QOBRNUZ8C8TwJxDF9rUwPFb5hNJ2qphY6e/8Qi7TfuuS8gfz7DmGEtv2+pR4w5ba/lq5hr1sjsAAsWA1UPBE1tLySFdXXQBm7IzZ5esMBXxTRV32JypvoPFaFYC8FoaepNKJO2YRchn/DrtN1FtvhCIvUmfpENcALx3YHEFfiUAB4AezxtA7rwG3Ph6ERut6RsH+slHOe27q4B6KsfXWGSYaKZPDFZGaB6i1Y/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9LPL5Rtm0LlI8oHKH6UGML9y8Hp2hVPjFrT2VVydfg=;
 b=WxVegemw8zcVMuHA81x0CqACpzXlfHrEv4FFkGE4uTsppxTI2+/TErnkrHPdALKGbzSjAQE4ztArVvfvbFstFLA8kd+SKr89bvmcVXQH1/va4CPO8+jrCZ+w5e57C0LafOd4Hf/huVbdazBqrmcjLV1LDCOsGgCuuxV+yyHYUSiWPukDjfcK6YAs9jzQvncxva2kN2+v5dNA7GYTZ6hXIFEGm531u7Cjx7X6GEmUgun5wcBottH3TpjnutK2cVT22RF6B0wf2oHW/jMV3QfuVZ2IhWUx6lK+Ua6HLE9PHRRiNBHTIO9KbHCdLBrzpK0WS7yKNN+x1c+fmSWRLYR0Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9123.eurprd04.prod.outlook.com (2603:10a6:102:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 16:48:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 16:48:16 +0000
Date: Wed, 11 Jun 2025 12:48:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/4] clk: clk-imx8mp-audiomix: use the auxiliary device
 creation helper
Message-ID: <aEmzRrhQC+olmywj@lizhi-Precision-Tower-5810>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
 <20250611-clk-aux-v1-3-fb6575ed86a7@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-clk-aux-v1-3-fb6575ed86a7@baylibre.com>
X-ClientProxiedBy: PH8PR22CA0016.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9123:EE_
X-MS-Office365-Filtering-Correlation-Id: 858bd856-254a-4332-d929-08dda907c320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wxKsovjro/lJzLr6jyK+XgldYyYVZh4Jv3gg4c8Pnu0zn4vomAxPN5ou8Z6o?=
 =?us-ascii?Q?recUIgKGX8RyJrLMA5Py3tn9+5o71hi6TC4p/dNWwqBlHqS2rs7p8YKs2L7J?=
 =?us-ascii?Q?ghxMzgbczgHrL3gIBY9IH0+cz0aipwrnhPlPrRZjpe1blyE/28UkS27bT8Qn?=
 =?us-ascii?Q?Yquj2kmrllTg6tYV2gncSyUevvHi587OCrbthxjZU9DMX4TawzxmzCx1xcXo?=
 =?us-ascii?Q?2T6Zprc9FP5G83MIMukf20H1xAXGnF56Lko+W8OFuP55hnhXc6YJ2QJoY8T8?=
 =?us-ascii?Q?pdhLd+7i3/eGcdEfDUUteUTv2DMWxA7U+LGLhOHkFjxbCcbPBzV+zvjT2umb?=
 =?us-ascii?Q?qX4PvbbezPziuXOxPf4om7dWSYpBjUvKI+wi0fnIFK/PEaNOCk9EnieDm3e1?=
 =?us-ascii?Q?eNbyBgtFxT4pwwsUYXBkhSKuidCdzk5Yw6CzTrGG2OArTL8HTZv+gyQKVY9T?=
 =?us-ascii?Q?AP0Q3UHboxA6KPTbED5evo09wqtzOpxjcs6/PLlTSLjjvRtZjAlFK2HVrCWQ?=
 =?us-ascii?Q?mo4hynDl+ZwXBO240eqoIv3tEYJeVAMrKgcTGDg5I4kmzcg5vSs6zrCxHIKX?=
 =?us-ascii?Q?TUEtJVq0te3jLYqaYB1HmTSkkdRaEbVwqWWw7A0FbDqUtD1Vhy1OMqrY8v94?=
 =?us-ascii?Q?ZIVIuYNpwNNEcSmXPBP4WA5s9oce7ZF31zCyqmM95fPo9oMx3WMzUJwBmkiv?=
 =?us-ascii?Q?OJANQF588jjr8rbdQNCIraIfgcUOxPpRA4O1PsEnS7WG2i9+RcqLi0Kg99yE?=
 =?us-ascii?Q?NRpkQM2pQ8tbu8slYSqM8UCcyyQPFFc8or/ajMfJZ0PPirhnEMFr0xj/a9IB?=
 =?us-ascii?Q?6pfJoAtVi+mZBIplcNmFqh9G47OiA8LhLV/mjERPSxyyBhz837Lwweb9fd9o?=
 =?us-ascii?Q?NaksHGWpjQGCnCH7KR8BWNhCD++zhB+FhlegS5giZMxwNP9PibF6uEJYzc1K?=
 =?us-ascii?Q?S0Dgp6I6A/+M1LQl6UQ+z6aPwere0MKKEVW5zNx681sQ+4M//e7Kai0Cji8W?=
 =?us-ascii?Q?7AKzFOWDIMWL6x6IWKNCFkPNL/Moo6x99D5KnOqYCBUdUqql6E+3q3Qso90e?=
 =?us-ascii?Q?6b3WP4tlju/PxoiBt87woXUNR1jOq0Y+iBpVY9+2I9wYr6i7HaHllf70kJsJ?=
 =?us-ascii?Q?UHF8+yFSGHJ7ehVcZ7Vb56XvSVqfGmTvlzzDfPzySylz5F9c6c08m5lP0ylL?=
 =?us-ascii?Q?WREHXMcHxq1O306JBelJyx938Dd6MwpMApvQI1mnm22DataxwEqpf764NNOs?=
 =?us-ascii?Q?Bm1X/jX9fKtBmgmS5gFes/cAysFnCJKUrePg/9ReV7o4jXFC5bG09ZOfGRAn?=
 =?us-ascii?Q?Xl5qYqU25hWmODdWKGhtFlokBA64THelyA+TTJfLATXkzrcInFETbWhhBUFc?=
 =?us-ascii?Q?Feh/v86drlakZ0Jgx8b/Nw9qhEuGrVYYl43+CuLz3QwCK4xOB3KBnNJ2GJwg?=
 =?us-ascii?Q?vxxmSQJMWaCEjMBX5RHfFLMsst7EqnC8IY0jINUvcrn1rhn+ijiIwA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SnwX/NfdWwoJWVwkAoqA0q3lLXah3ysD/+wpTO6Vv4upoS45NUpFBnNTk34G?=
 =?us-ascii?Q?PBUODReRf6SyKoTwd/PQhCi9SRCMu2CIgGuSSjhcTD21QHKQxMC6mpOwNyBB?=
 =?us-ascii?Q?MbKx/TZYNU0fCMnAmbOGcyJIwifRWgaZSfj5mRtdrZHAWhBXmOJSsZQNTjxI?=
 =?us-ascii?Q?rt8NFOwdFhgOgmMLiT1yws4bCpsgF9kCi+xvxuUTV2Z9Ksq2W6Jk+7D8QiTM?=
 =?us-ascii?Q?ZVhlLRhE2s5TU8/3L1qo1xjjw16XlCAgll/1mrPg4nlG5OmdttqfUxqBw1+i?=
 =?us-ascii?Q?UBCLcVo3mdgXzT87Mtp1jYtmDAGPOizjhuEwhn3/4NqYgemjm7261/0oZLD7?=
 =?us-ascii?Q?CKx2LimX1dwpeEJxunGvDZVdn90ctCUncZ3C0QK1jjOWSf19FIs1MCG0DrR+?=
 =?us-ascii?Q?AtpVVTzL1Av8i/THoy+v3D0mfyvk635DKVczImDPiW1gNz78/ZK9ctbpvVIn?=
 =?us-ascii?Q?MVVMgumGVFLrqWEnCMKeYdZc5E/DcxQdTzPenzR1kMJJAygLLAlLd/ONuHCz?=
 =?us-ascii?Q?tFg0CEIj5V2FavJ7Lw3u09WJiTRsuL1xyDeEf9RZi5jVeEBE6coAyrdnolFT?=
 =?us-ascii?Q?8WZR5DSf6+kXWKZlG7KZfRpJeqGDbXJiMuWXmHb/J+5RaaUAwpBH5fihL2Un?=
 =?us-ascii?Q?fO724dUndmD2E7kn4W3MK12au2yJ9+tY8rFwHBwJFqSqg5r8ZHfcKfPCQ+ot?=
 =?us-ascii?Q?V571nDE5U+2YSWrTRT3Q8xk/Gm5OxZVSjW6gkiXX9MB11fptV+rPslug5ASe?=
 =?us-ascii?Q?2UO0C8mBEcJvkljY2Hg3c4xSIczNWzHn0BN5WIKWpCsjV9BNXb4fgmhcsNN3?=
 =?us-ascii?Q?U3tIg5iQxj0RtQT/SS1DHqg9/WETITHvG1Ys8cPvhVNJZVlq5ECuQoAs5ANd?=
 =?us-ascii?Q?alR0uONs4u4a4+WpWlKlhhKLoalfkObQUzm4xRpMDl50In6BEtQVHPz/Dh7r?=
 =?us-ascii?Q?dl4y3FXsETY9FBfZVodNjcBImbC2QDR6CUPFt9BlE2PtdXU4ncyDWXH6xvLz?=
 =?us-ascii?Q?C0RTI/qxAOkwXmWnriFQCANtQby24OSnCMyXutcWDWNv53+josexqk4C4fRf?=
 =?us-ascii?Q?Royj1YOs7wwQNHiYeZXsBoORZGeluSVKQQfJwiNL3qHU7eQ9bj0ReXBiGwzp?=
 =?us-ascii?Q?5w5SVo5PVCQN2AzeUIW5C7V13swqLpl2+NtoR2mc5lv+LybSwjqdCMEov5iy?=
 =?us-ascii?Q?PZjdrwPKiwqO27vyktsdvKNykMKQ3bqZTCpHot1lJOGXDwTxHa77IvCAY+pg?=
 =?us-ascii?Q?fGNBC/fhuQ1XysJv54OX4OI6/VF7Pl+CaXl5qe1xAkQR6cg3O0xX1YHijyVi?=
 =?us-ascii?Q?YlCJ9mEkiWZ60mk1Jb69V1x5MKQrLx2Ma39rkVbeSBqM4m+ZDOh09aqwsCj3?=
 =?us-ascii?Q?Qyf5EO5309cIl4HSpmDAqCvVibrSOZh8/U72ojzmCFFgk6rPbDabDc1QPlVt?=
 =?us-ascii?Q?dW2ug0CuXFeARg8nq09NnEAu5cZG0eKkedIToJsq8SpHDhDBncBEQ3TLVZlK?=
 =?us-ascii?Q?YfNnKA58RJEnQ0OqhB/PS1V4OtYQzotev1HCTCAMqit9UDGmSQ47JfvI96MN?=
 =?us-ascii?Q?T8UBygdLZD/AXVCjOAE7WKgmgMckdC9YIy7Vo/3+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858bd856-254a-4332-d929-08dda907c320
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 16:48:16.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYGj4bIp2H+kGSsFoes5f29KBwG1B1h2woWhfiUjLjKB4uDZsk6m2ktfx29VaUQTxVscnuD+KS51q2PA421RyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9123

On Wed, Jun 11, 2025 at 02:53:58PM +0200, Jerome Brunet wrote:
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.

Actaully, you also remove unused struct clk_imx8mp_audiomix_priv *priv
at clk_imx8mp_audiomix_reset_controller_register().

Please add it into comments.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 49 ++++++-----------------------------
>  1 file changed, 8 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
> index 775f62dddb11d8cfd17a4ebf7a677ef399c5e617..765fb1f5bd4fa2b039d7414abd89471438ee41dd 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -230,61 +230,28 @@ struct clk_imx8mp_audiomix_priv {
>
>  #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
>
> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>  {
> -	struct auxiliary_device *adev = _adev;
> -
> -	auxiliary_device_delete(adev);
> -	auxiliary_device_uninit(adev);
> -}
> -
> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
> -{
> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> -
> -	kfree(adev);
> -}
> -
> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
> -							 struct clk_imx8mp_audiomix_priv *priv)
> -{
> -	struct auxiliary_device *adev __free(kfree) = NULL;
> -	int ret;
> +	struct auxiliary_device *adev;
>
>  	if (!of_property_present(dev->of_node, "#reset-cells"))
>  		return 0;
>
> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +	adev = devm_auxiliary_device_create(dev, "reset", NULL);
>  	if (!adev)
> -		return -ENOMEM;
> -
> -	adev->name = "reset";
> -	adev->dev.parent = dev;
> -	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
> -
> -	ret = auxiliary_device_init(adev);
> -	if (ret)
> -		return ret;
> +		return -ENODEV;
>
> -	ret = auxiliary_device_add(adev);
> -	if (ret) {
> -		auxiliary_device_uninit(adev);
> -		return ret;
> -	}
> -
> -	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
> -					no_free_ptr(adev));
> +	return 0;
>  }
>
>  #else /* !CONFIG_RESET_CONTROLLER */
>
> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
> -							 struct clk_imx8mp_audiomix_priv *priv)
> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>  {
>  	return 0;
>  }
>
> -#endif /* !CONFIG_RESET_CONTROLLER */
> +#endif
>
>  static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
>  {
> @@ -408,7 +375,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_clk_register;
>
> -	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
> +	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
>  	if (ret)
>  		goto err_clk_register;
>
>
> --
> 2.47.2
>

