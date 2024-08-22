Return-Path: <linux-mips+bounces-4989-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C31995AC0D
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 05:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC416283362
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 03:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9F12262B;
	Thu, 22 Aug 2024 03:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="RIoe0z7j"
X-Original-To: linux-mips@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2089.outbound.protection.outlook.com [40.107.215.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2457237143;
	Thu, 22 Aug 2024 03:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724297990; cv=fail; b=LhjIy23ZhFv5KnFrrQf9aWbNx/Z7VTk+p9XMYUt3h5JUYVBEbWO4mmGGcRX76VHuTlXUBrI1JhhXovOnr76VoI+pjxll2nwPIyHiEFHbFwVGHb4WU6eTb6kTW8xT77KESYDM5WI27SPZsKo45pB7VxDgu+QJRtqfqr6fWqCwncw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724297990; c=relaxed/simple;
	bh=56w+zfJ9N9i+GwSw7Wb76ZmKhBOLn65DGoIrTq8XQKw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MaSrvME8uHpvb9Fa8VbidnhnxMmGHCWDN/WKAv8HjGtY9G3eY9Dbm4X3LBALimHKj7FlHZZAmMrhv/weEa6jvSkrNcvTRMao0n3AuoTEOlP6duzwQfZ8x9NF0Hy+aSFpYuHW4p0e9XekOBCaehiQ6GnE+83Jre/flhPcSZrIpvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=RIoe0z7j; arc=fail smtp.client-ip=40.107.215.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=porvbAV4FAc4xx04BKrPAYAMw0TYFdtSCG34XtcKTj5bFiUESJQPrRURQ3HAeASyVhLGVXP0GvzmKVlNoOiAzhVWJqi1EQLaJciWHJRPe6HlB9kdSSTrX8upwkgh1C5JCQ7unk1vU/nnnHL6UXHXzpJp5E9ZTKBiB8xQV8ZtoSPXU6UX9CJCWFb9AFfY0sOrpK2uNvghc8ybU73tgpgCwxGtpEpn0xiuaVYjZ1WCKlg/bto42aQmQJzOdKcxevxh6GfMt6TcraDalrYvBJQHcC5cNYnBpFmNsMuvmgIKOxkSkcig5Z1lcGkO4LPtkWm7ZeN0u8ZC+5vK4mtpcRDNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwPp5ko+y3nOqsWjMO5Hdf0/qefGYggoJkxaihb2mNg=;
 b=UHv7b1pC4hSSrHo0OWmFqnARF5feIHq+MCEkHH/vT6fd7tXAVRhI++uP9i6KM7F8fZq/02GmIlaOZ7rOpGpo2ujbelJ5XWXpgzIBfUJA8aVr25iBHU94dvnlhX6cAiiXjsSnk0lKph7BGmBA6nEgOrDHrNIvhVYSjIsRsgmKBeUrpeCvk+mWq/oGuYojuHW6bdR61f2EeoXBLMyZ3McsAaXbR6qlFxEvXE7FLiOBbxeKv/ZL8Re2Em3SPFM45CxS6MQOiGJsqLyebmFn38+WaW/sbfxkfAHoeWYwToMGMA6p0bG8bbi9oI1SV1UULN4imKslNvomLPmXHI92ODTkJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwPp5ko+y3nOqsWjMO5Hdf0/qefGYggoJkxaihb2mNg=;
 b=RIoe0z7jmEMcjGtOVgvAExAYogeF6vmky+3gQohdEkZqthIULXNEd3ULZTHSfTfgGulPO2Equo6FiM3CTUTGVlFqsph3sxiRv9XfyYaqXoyq732Vtll3Ss9zLkMPf7g0vCczru6xbVk2ELEdJFzEjjKtdqUOHkcoVSj8IMM0uyUPu7a6AxSIphRwNfAK1Uj55lYnVrhaj8xKaBvwSeLPZs3cwy6SZmrDJeAiN4dq+C7BUI1UNevk12wy6FS7UMTWjL0v50fTAJSIFnQuW3TAqz87HHYOjFB5zKnIrkU2n/HPKgRvkyULUy4hLnB/adnubSkBh7ShRL2/Y524OGVVog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by TY0PR06MB4982.apcprd06.prod.outlook.com (2603:1096:400:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 03:39:42 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:39:42 +0000
From: Lei Liu <liulei.rjpt@vivo.com>
To: Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lei Liu <liulei.rjpt@vivo.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Erwan Le Ray <erwan.leray@foss.st.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: opensource.kernel@vivo.com
Subject: [PATCH 0/8] tty serial drivers use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 11:39:04 +0800
Message-Id: <20240822033924.32397-1-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::24) To PUZPR06MB5620.apcprd06.prod.outlook.com
 (2603:1096:301:ee::9)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5620:EE_|TY0PR06MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: dc41a8fe-14f0-4c15-7c9e-08dcc25c0f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jEqJ1uJkv64KpPHIghWpWqZl1LXWT1gVEicognAs3LiFkNwDMY1B1/nMdyL0?=
 =?us-ascii?Q?Pi623yqnSpnznUEzQtIWbXZfvtnIMlF2zf31ecMkKgGKnodSToBG0/D1ZjWE?=
 =?us-ascii?Q?e6ahEBcJQestzZBiNf2mG91xZFj6crU/VLhuSj68sU0hdQdwjkYRT2mEx1K2?=
 =?us-ascii?Q?rt1UunT0ifkoUcwxGesahWSbcPUlBWB71CUmYK35I8cxtS8P17z9dkOeVbNz?=
 =?us-ascii?Q?zWc/9ot5kmnJDfS4cuApWr2SlQmBPDCJJI5Ms7MhxDtPrw1sYgppgHiyKTEk?=
 =?us-ascii?Q?V3ws7Or/fYh94PAOWizvEQmfc3nfeRHM8k8L+4ra/17GG84yK4kPj+UtphCk?=
 =?us-ascii?Q?OKBwEDe22qirHD0b1yKkMbltNEdDgZk1phnInb8CouJ4wmVjyHO2NUUC+KSC?=
 =?us-ascii?Q?9Eum4gWygBwmL8GNnOWwEVg8t9LmtVDXBTHcM1M6289Ox/wYk1NY7sH2jKC1?=
 =?us-ascii?Q?RebXuntcRd62W4z9/hvWejdMC5PGqjhr7/x/MR21Idno2nBNlBBAjt2faiUO?=
 =?us-ascii?Q?3wP2w6qt1qv54ZRuuKPfXX4EEJYqptzHuzCF1ox3FoC+9J2ayNJyMaHcJMMz?=
 =?us-ascii?Q?sbw97zTYd6St9pFFRXpy2y1tG72xenpv1vQ60iXg/zF/gFD96P4o5A+j8WhT?=
 =?us-ascii?Q?pby8o60ssa/K9Q2ZwVifQvqyk4BwkWSvdClYnJFCbet5fESLGWxW0W2akNwA?=
 =?us-ascii?Q?BKVJhlSZlLcBRoO1dfen1p3H109FvXe5bmkQFz3E/wjdsUUSjvZSg+22XuTe?=
 =?us-ascii?Q?p2HLd/HEteVY3b55o0na+2f8bCyqDA8EPmrdJBaEfvt+UxfSaGIPajsIPxZV?=
 =?us-ascii?Q?6iBCgcioBoej5jZgPhoW7i4rpnhSfUex1KXYlRF+hrH/n8Ybe0LIfJeNYYyL?=
 =?us-ascii?Q?rARZdA+Ov3HQX7AK/zoIbSNy3iM4z+uRd7EsMSy4ZXi582m7frlEh2HMA+xI?=
 =?us-ascii?Q?oxLZU3Ze3g6+YCA9J8VAXR9zjPCMUE8AYyrpJTJuqMS9Nnw1NRtAGbfUC9It?=
 =?us-ascii?Q?p6RCaoBgM+Dt4ZN5H1TKP+IM2baV7ALXN/iAqY0Bvsv7JKUKHe8+qkyLSXYx?=
 =?us-ascii?Q?2tg4IF4KI3Tgkl77Jl6wbTFPBrfOUZnR/z2mwAuhPTp0ertJtDWAaC6w94tS?=
 =?us-ascii?Q?QkEIANn0iM+ZqaoUsCdA0zUDQC+ejnw9IwAxL5CZ13TsdOv3ZgsnR0beELCQ?=
 =?us-ascii?Q?Av6X+V0mpbKEK1vjXKpN1DJXV7lQuNOi9nCC69c/XLflnldNSoVsDOVB3HLk?=
 =?us-ascii?Q?UwVa5+VkHHYyJwjrqkJ73A83kQJdAQQfGxChC+VziZ4kE6LCY8DSf6dvleLV?=
 =?us-ascii?Q?ueXReVSToLkhl0sHf02JqIsizSYWNowwTG933TPq0kgEf6NaALj/uQ1wIt9H?=
 =?us-ascii?Q?Ec0TBswYK+/CJ4aVyk+XcWfujWwz+t/pHmu7D6ucQ7lWtBPuF/yPYnyt6Ai9?=
 =?us-ascii?Q?2+gzbBcDFhI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5620.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PafmwJ3PnBNK3PNyyN+qg/oQXbHNGeR4ywvbIAXnp8TjszHIvbOMc30whVKw?=
 =?us-ascii?Q?0Xrt0lBcxdiZqJloIwUv68BlkM9kPCbksS+yX207lCvfOmC9p8BXWZbkL8W1?=
 =?us-ascii?Q?TSEuyYgEdlyxYXbxGfR//BdMsVc10ebHGmotp9n7WENH4NBegyE/PC8q0Ot/?=
 =?us-ascii?Q?pG9lJFIk5f78hx24CEnB4k3dbTQQRogivurZnOnxOuVZiR3VvFAPQcfARYO8?=
 =?us-ascii?Q?iEkn9BlQy0qT/Lw8+aB9O5hpwW69qPMzYbPHczW4nIyEHQgLhlK8jqiaCit8?=
 =?us-ascii?Q?oy1rjb8sgxocoAsgLW6H5L3KHg7eoC8rs2l0SDrhXrBdvqoTnHWWKCETiHwS?=
 =?us-ascii?Q?jTnyxnA/lWaGQANfEVLyfuSBdIdkqvPOZkDiJeSnJdvnb4QDjTFt5hTYKIM6?=
 =?us-ascii?Q?I8cXLlUd6dYfcF4YcJRcwDqjNcy7sDzkW4Ria1kP/a9yaJb6dfzOIKT1OdyU?=
 =?us-ascii?Q?I85wTi84ktB9RwYEI9cu5bgL1Bxi+GB1hPAxAhLKlHgSburLpNaWMCfpQ8Nc?=
 =?us-ascii?Q?HsXoWZ7yEXDqp/kLXtcrq8JEGzvpeozbQghtiO+I7Qv/qzbIMJS0n1NEtfmu?=
 =?us-ascii?Q?0hV7lus/hTQcOUKqs2x9NgokNJqTFrXnqmIQTa86IHBhU5veWuWBmEQVbB+Z?=
 =?us-ascii?Q?+jGxyqOpJlF6YZDZQcY9MphGz2Mg6FfDb/O76zmBzGFihXfVRPKFN+UY7jC4?=
 =?us-ascii?Q?H7pnA4k0GNjF5ZcQShYowmsK6/6GHFnHeQuRHJRJlJFSdmStTekRVjTQwnI4?=
 =?us-ascii?Q?1kaD/DiPVdz/odUyRnNA8rX3yKMVV7V9Pp0ODfSdao8IIJqtI2dPA64dgK8J?=
 =?us-ascii?Q?1QdXH2uDAFyZ/tdjoFVXyqMvEYXUUT1x/7+2iUE6EtgoRAOrrKQJRqeAcVK/?=
 =?us-ascii?Q?h+XQ/gYTC2yPD0WmkpUr9Mk1Siuom7ajIRo5CwewMvRX2IgW5/e6CNG3OfPA?=
 =?us-ascii?Q?kklldlWB+IgeD1mc0bmx16RuyULJseLJdp8y8Tw7CBLb33b1mrZvTzgTpOtF?=
 =?us-ascii?Q?ak3N2U+P3Q8dAw8sYGLufSd57HyJ8Jrz25Dd2z43HKCUm+mK36HTe9/Eh9A+?=
 =?us-ascii?Q?GY09Ejhd6pZ+EdCDfISVXtrWgO1yVtVC48NOMe888mdnzPQXP6K8mw7xuOr7?=
 =?us-ascii?Q?500X2i3DcedBxIN0JVHisWX3w/BgMJ0lXjOguhai8hQGXYOqAANTolxGqWnm?=
 =?us-ascii?Q?WhTgo9V4i5gV7T9wYLFqtSxZoMmClN5gaD70WSTtRHcVUqDFCPAgDkGlqiml?=
 =?us-ascii?Q?GePUTLUDK/1LE+Fe7k+FqdRLEqAmTlYDWxJcyB83fyCBEWhlrERv0mQggCYL?=
 =?us-ascii?Q?4rr1mqg9fdPO51UgPh0Ibk971gMFfD1sEymNwf/sNM17Z2lWPzu2Ky/3Kdo/?=
 =?us-ascii?Q?oBjam/du7b//TAqXZUK2rMY4jml5qxcl8lhod5Rcb5UDZvxnRpxN9EhUN66G?=
 =?us-ascii?Q?fhG35QBFlRCRkxhGwIUgt09MtpahV/1LXhuZqsAiMJbnIdg+/Oj8QlaFkmf+?=
 =?us-ascii?Q?lVfcenSm4aexl4ZWfViP0fE8t3pAxPNk5yCyroYn4oDLoEzRG8QMAt/qxdxE?=
 =?us-ascii?Q?ObW/eS01WlKer8Spsw+1xLDKMmVDsUb1hpkRrBY9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc41a8fe-14f0-4c15-7c9e-08dcc25c0f1b
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:39:42.7783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9Z+/ZBotvoEoTqJHJ2F9sV+wiL7Sez6BrJ+ooOOJPovQUQCxC3TjLdlVyeuB7ZtFLvK9jkomDTk9FiV2SDfTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB4982

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

Lei Liu (8):
  tty: 8250_ingenic: Use devm_clk_get_enabled() helpers
  tty: 8250_tegra: Use devm_clk_get_enabled() helpers
  tty: 8250_uniphier: Use devm_clk_get_enabled() helpers
  tty: atmel_serial: Use devm_clk_get_enabled() helpers
  tty: mps2-uart: Use devm_clk_get_enabled() helpers
  tty: owl-uart: Use devm_clk_get_enabled() helpers
  tty: st-asc: Use devm_clk_get_enabled() helpers
  tty: stm32-usart: Use devm_clk_get_enabled() helpers

 drivers/tty/serial/8250/8250_ingenic.c  | 26 +++----------------------
 drivers/tty/serial/8250/8250_tegra.c    |  8 +-------
 drivers/tty/serial/8250/8250_uniphier.c |  8 +-------
 drivers/tty/serial/atmel_serial.c       |  8 +-------
 drivers/tty/serial/mps2-uart.c          |  9 +--------
 drivers/tty/serial/owl-uart.c           | 10 +---------
 drivers/tty/serial/st-asc.c             |  8 ++------
 drivers/tty/serial/stm32-usart.c        | 16 +--------------
 8 files changed, 11 insertions(+), 82 deletions(-)

-- 
2.34.1


