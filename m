Return-Path: <linux-mips+bounces-15309-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tr+AHDZ+Qmob8gkAu9opvQ
	(envelope-from <linux-mips+bounces-15309-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 16:16:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D03186DBE3F
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 16:16:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=e84TYlzk;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15309-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15309-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2755530730DC
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 14:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D083A36894B;
	Mon, 29 Jun 2026 14:08:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2913737475B;
	Mon, 29 Jun 2026 14:08:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742133; cv=fail; b=nJ67RrbCe/p/MvPe0mST9S3vMgAGGCXJorSgiko0VEEFqgHvjc/GLYIvhRVbR+QfQ7SsxfDXpdf9IA+qAZYxFX5Uk7SH4VRjrF2j3yb0BsB/cqqcbILHSUpFQgWmYvXCBQm2sNbt1lEhJv2AFwpzqyehsLo8NInw06OtTbzTBtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742133; c=relaxed/simple;
	bh=S0AZqMpzvVsp/FNTSEmwe6U12QNpPK6HmOfKhVoAQiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sI7o0tCcb8voUduMm/ULFLE2NWAvwEBttTKHlolzqB0m6gJ77rRDsKuuXfnBzl5wd0s5d5EuK/A3DmzQjWhZQCJLU++JBPZL6RgQfirzO5UQ4sp51bd2uhFKCu9Wg7dpI1lmds0/GF/siE1qeFAmMgiGpVT6yh7RYtKYhJs6BoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e84TYlzk; arc=fail smtp.client-ip=52.101.70.55
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEnBdvWsh0XR+FbiWFsCNDST5EdwRkh/QzPdzpTQpYEq1ZKtcoVHO7Xne9skudoSBOo+QuaPgXwMXM0blISBMaIuoIYXqih1b91OuRVnkJ85e+QYHrRvsLA0jDffMUVjHvPMz13+iFhooWjFc7C3iuUfu7uej0lYIW2Oqh1hAukh+heA7uio8kFTYnpQckO7pcPx5u1U7D0YzoY2UnR+vE7e+MbtKBZjFK+/F1FULcgKUIGJWPLEwT3XIQZM3GdMlSJsOtVVvHmOmoIKriWeYDXn5n1GkQFtn+uN5UZXI6Jp22qvrTw6vaATgw8jSJr3437jt1vUfjx7Aur8Gba5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGkHZmi7vUG5yrrKmcJyWTBhTM1/o8UcugETmhubcKw=;
 b=IEPCQc7eBQU/8SRJYnVF3usUBU8ujmvH7dfreyVq1pT2gWzAJkDkQoue4ERSJgcQa3Vb+xmvjZ1UX0wD8RpVHOByKu+6DYBV9hookunNtpJ/ON0uV9h53YFBz/UKaPdniPRf3VOOu+0SX7oGxIlRa2K0nzWmq1R9tLw+l/zoRX1VulzBGfTzR2hXsV2Vefz5+v0V7yOjCS5J65C7B3Cqjj3DXQuHGb1cmHuvdMDJvITKB6A8B8eaubC+hJR5yosrRyu60RfkFlYb41saDcuPvsqZAXuTVR4cJ64rRXtEbpfy0D62j0ahmMgtnH9/l+fjI6inMFp/VFpPIcXMvNFEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGkHZmi7vUG5yrrKmcJyWTBhTM1/o8UcugETmhubcKw=;
 b=e84TYlzkgshWjRCyYLNKpCb4DcSsGA13xMCUPcmLRKi1mWBAoJHUuV9WsbAaaPqIY+BbRIqRmMq7svq+QZJNAzsno8SikVkcFd3tgBDSCFr9uAUdmJ5g08UckjYeCbx9KhuAVzRVHOcTlD97o5/dMzqLvKcZBNaGjyFMKLfQ68IAtBu8ggUqZ0cbeHxU7PDNeQ5f2IMaKADs7M7CpuIAdLvOa9EsWEDgAXOE5kNfIIWfpglvSrbsawGbWaAnkckc1RePuFxlbQ+10WxJEwvaZ50vt7u9T2JlZf8HQljgsh7XWOWn6wlZMba7l92opbdpUx/WwBl/3yIW/mj9AzIXjw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS4PR04MB9265.eurprd04.prod.outlook.com (2603:10a6:20b:4e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:08:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 14:08:46 +0000
Date: Mon, 29 Jun 2026 09:08:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	Thierry Reding <thierry.reding@avionic-design.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Peter Chen <peter.chen@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	driver-core@lists.linux.dev, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 08/19] iommu/fsl: use platform_device_set_of_node()
Message-ID: <akJ8WOFadekww2Ye@SMW015318>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
 <20260629-pdev-fwnode-ref-v2-8-8abe2513f96e@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-pdev-fwnode-ref-v2-8-8abe2513f96e@oss.qualcomm.com>
X-ClientProxiedBy: PH8P221CA0035.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS4PR04MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2af774-7afd-492e-d760-08ded5e7eefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|23010399003|3023799007|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	UYy4i62EHwPpsDxL3M03C7pPoR+CUIzJ+QZPNqwbxczlPyOzQO3s+pDcSo5yo4OrGxTyfMrHpsZiu5BGeB+/B3LaTMGdKfFFcDFDHJwwo22cbArwaJcaWUTVGySahS1zUGSLc6M/iIB7US/dqr9YT+/Ub7BBl38oSie7iPkkGYdbMAjiPO+2wcBRgQlmoPIwyvemAfyqGjE+EJ9Q8BwxHCraX12T9rw9GNZ7Dg+L635+MeFrflaWkJF500rTOqJ3dYRgq8zkcC/OqMewfaj52LllyZOF8CUaGMIGJuEea0Acqsp1CVQi3WHci94D5UniHGKbWl+hpjz8dYm0sEqyAK/G9EcEj3t7WZSbNHGMbzB5Z+seRJubGkv/H7TuTmoG2N/H+uE1CtKPeASlJ4IwL5v6UeuDD3Yo2E9UhN/AB/+s+jcEkn+RbjHvCtpyiNuwMfrPuG3vVD4vSrXoQgHhMSPU2NkwnT8O/VLkyVhYz0mB9lWf6tLmR0GR6EdI7yf6XWeHQkjQlk6OaFEnPv0r7qMpKih+eflteG9sCoUWc38wBpnknF9yUTsGv/jMFSJD4ohu17gBtDr0nR4e/E+iGZ5m7O1UzMJj76jYe79s1z11zvro0gE2okoWaGIzWnsIBtiyFoCIMPxaVccM1lyWYekZTCCnH8wfVCPYtTrn48Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(23010399003)(3023799007)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kDTBGJOmwuuu5VuvAWiMwRC1BM/7B24x1Ve0ujInuqGmplnllUqug0qQy+qh?=
 =?us-ascii?Q?NJs9gQ5QsneTyl2KgRz4J4tFSLqSROqxYX3HedM4H5AghUcHaGyIOOwUjIU+?=
 =?us-ascii?Q?yoixwRZu/ogZqybhdJ5KJEnhHOEkp36lII1wvNGAN8DCSqueXBwnFvcX8EuD?=
 =?us-ascii?Q?3gLY+jrmCeFZDH9RvW0FaDJzbjLbJzeKTV9x5shtP5tLN3urxWc4hpLFcXVa?=
 =?us-ascii?Q?3smy6ZRs7mmq9z2Gbv43BL41+4cl5l0oQOJNViasw6RfhLcIvMQOPoSOYKq9?=
 =?us-ascii?Q?W1e39RgRxAb5Ck0ZR7m2xnCfVZ3F835MpCJdSx4Gpk5zcuDgXW4WnJ3UEw29?=
 =?us-ascii?Q?aii7Tlh/Ocm6i0BSpdkwoC//EXC0J3CXDlhP0XyTETyhy4aC3FcY7XqSAFyQ?=
 =?us-ascii?Q?1wemrkhuUpWI86H3fJEG5l/8dZ84R7mVz3QRNwY1lUIpwH0H+rq8RtKAlZ0u?=
 =?us-ascii?Q?GlVEkq1YEJXemTBhV06kMrS/0yVwg6H/9jII92/1ixJxQKOpJHV+yID3p/2o?=
 =?us-ascii?Q?0fSTkHv6uRiE0d3saxtqrdGIYEDJYCyUWHSQsAXCOFiBuisQEvA9v2ODcS8K?=
 =?us-ascii?Q?ezKwC7oZMOEbW037b/5CEYU0JhSnolScmwHExgvV8BfySy102i7kQNc2jh+a?=
 =?us-ascii?Q?r+KR+YH6jH/KiRtVWj2hgIuc1shbAJWaLc9dUeV+8N8js9rl+rK94g8WAhwU?=
 =?us-ascii?Q?JGQ39xUdwYNKmWWQUndgbkXJB3ue6/pZ/qRQQn0Do3ZQV+N+ObzYN5sUs4ED?=
 =?us-ascii?Q?wRM1ZEOSm4yTrH16mOq2Eo9XCawuhXh31ykU+4ICPH9c97riVBVHxTltnDyH?=
 =?us-ascii?Q?HQ86EPwa2LQJSmS1yYkzSTAgQZKBLdDxI17qSuckfj9RlUHMfdoldHJwysQ5?=
 =?us-ascii?Q?0k1gDGver1FcCyPyW3h/h0jXj3hTsmwhBhXiAluhQNbMFt42Oy0KmUsq5Qse?=
 =?us-ascii?Q?QuWaEsjjS3uEYdOLESQJ3vUTuk46PR1m719uzPlWMAiLqWGrdBGHwtTBlh8I?=
 =?us-ascii?Q?XgcJSz4CeJ+nZECC3nrFT5nDRwGFHi90zYDPt/9qTOhepZh88ZpYQo58StNx?=
 =?us-ascii?Q?X/LR9fcm9kHbJYx5JabbQjkgCLHLI24IvVPN+R95sQa/HBdRo67yoIFt0rhf?=
 =?us-ascii?Q?89Fo8eevYQFe/olIzalr4HHyiJLVSbhl68EY90q88d0XOC0qThGIiA35EkVl?=
 =?us-ascii?Q?YUHFQ/FihDTalXUhjODDiNCMj4i8VhKZBpgOzKBQGKWFb7F7fc0LmyR2hLMQ?=
 =?us-ascii?Q?BNyUuLdewKXOqhJo5O/h2uTql+NJMoW9EZU1tUheEUUQPN6Y0VHKlXC9nW8x?=
 =?us-ascii?Q?Uly2brppEBGNJfkdB9hU/eJn6y95sbXy6iUTLpxLlr8Uf4hz+6S0Sk+/kuFt?=
 =?us-ascii?Q?o6rz3UBiKaj9PX697t0mmfHy5Gpm+p3M0YrV4HwXS3AipV8Mhq6QucjJP/3X?=
 =?us-ascii?Q?ux6dBaxAmm6WjeMA/BCHLhhUq3nk6zKX/cLlrfotS2mpamWQJZ7URTfBV0a8?=
 =?us-ascii?Q?Npz+ePbQn1amP+6ybAjNkhGFbCTbL1SFZKfqkreLoZNhPS4Qse9B0XoZlaDw?=
 =?us-ascii?Q?3/ovmE9+ZbehjnLZ3rjkNF/k+TxwnsW6B51Yyd75pdECc04q2Bl4vJjt7DUe?=
 =?us-ascii?Q?/nTqC2o3BwkILtj7lN9MnG8NmRmx8YvdjHgOCI4MfTh3VbuvyhU2cEBkxNI+?=
 =?us-ascii?Q?ritBogCWKAuui/i8Zby0HHPH3/5lYRUKzv01Pzw33wvPR0s12BFC0FOOebAd?=
 =?us-ascii?Q?Z3gJ4CXUJOxTMHzz8AF8Pkjo94w6iQ3tPLBHESzf7nUiZXk7UvU9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2af774-7afd-492e-d760-08ded5e7eefc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:08:46.0964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbEzC5shI94/h5UvHFft/MVfEwJZZsbh+AI6yEocLaBpBPPrKkGnLbMH4mccbXmyyirPzjH/RKwFnr9kTec1LKA8gN+zPU698NL5EzUZh8LWMcHB7e4XtI4rdqpIUD4k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9265
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15309-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@c
 rapouillou.net,m:b-liu@ti.com,m:p.zabel@pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[66];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-mips@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arm.com:email,qualcomm.com:email,aka.ms:url,vger.kernel.org:from_smtp,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D03186DBE3F

On Mon, Jun 29, 2026 at 11:12:31AM +0200, Bartosz Golaszewski wrote:
> [You don't often get email from bartosz.golaszewski@oss.qualcomm.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node for dynamically allocated
> platform devices with the provided helper.
>
> Acked-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/iommu/fsl_pamu.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
> index 25aa477a95a95cb4fa4e132727cde0a936750ee2..012839fa0d8a27cafc6a441373f4f6da794388c1 100644
> --- a/drivers/iommu/fsl_pamu.c
> +++ b/drivers/iommu/fsl_pamu.c
> @@ -973,7 +973,8 @@ static __init int fsl_pamu_init(void)
>                 ret = -ENOMEM;
>                 goto error_device_alloc;
>         }
> -       pdev->dev.of_node = of_node_get(np);
> +
> +       platform_device_set_of_node(pdev, np);
>
>         ret = pamu_domain_init();
>         if (ret)
> @@ -985,12 +986,10 @@ static __init int fsl_pamu_init(void)
>                 goto error_device_add;
>         }
>
> +       of_node_put(np);

there are other place miss of_node_put() at error pass.

Can you use auto cleanup

struct device_node *np __free(device_node) = of_find_compatible_node().

Frank
>         return 0;
>
>  error_device_add:
> -       of_node_put(pdev->dev.of_node);
> -       pdev->dev.of_node = NULL;
> -
>         platform_device_put(pdev);
>
>  error_device_alloc:
>
> --
> 2.47.3
>
>

