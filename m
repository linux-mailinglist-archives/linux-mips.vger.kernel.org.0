Return-Path: <linux-mips+bounces-4995-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2995AC29
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 05:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1557AB23900
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 03:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35C523774;
	Thu, 22 Aug 2024 03:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="UMFiVX+x"
X-Original-To: linux-mips@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010065.outbound.protection.outlook.com [52.101.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6BD3B192;
	Thu, 22 Aug 2024 03:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724298088; cv=fail; b=MEjVrZtH/luvQ8wGj5JN0sQ/xKFdoyZGKZxD6zrSsNuXuXM9v8Ty8o2NYX9HeOfMj4fFMm29XR8vL5xVqozzeHYtLfnucgEkdFzZAxIEipRDrLpuUwpbRRA9QDnYGpFo/1Aff6Y37ykjzYaydbwJzqde+qwqT3vVfU3SbLHDaws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724298088; c=relaxed/simple;
	bh=BJMk//PgcY+sq5ULKL0IGjc4VwcV98wtRsSXxlYDCR8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hFIXwQCoe2L7gmL0BQZeADH8yGLiVYvWnFC4j//9C7YvRUnsPyAjWnayz4lzT7KQC8HT53OB7rZOW3U/6OYSWRHkv6yUyHLc10FZN3H7fbnqw2aWgVkwhnaqWK9sQnoDgixBExnM6eF4CtEq6CApggReAGXKdP/WSR0FVZMRMSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=UMFiVX+x; arc=fail smtp.client-ip=52.101.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ij9KEjG20TELXtoqSiCwL+6mQoih5ded4CZjX18UC6euAZ+LxPDE+ZzLT5T2UHau/czEUNc+v6lXlJm5H7OkR31so6be/FO1M+vx6TgoNMAFHgBDu/oXzXPF2roR7Ng+K1nhi4p08ZaLlziAzOi8VLmRtu1/+XZ87vfqh+1pr2Z8X3cU8/Izq9pgYAT6PFZ9Uz4XGhL6ZqOwhFEva1w5m0KC3Cev4a47Zb80UJsNcK2ykrm1d1v1JlBDIvjp/0oNHAfY5le1KbXL9mUg4BA+e1x43rCpaBHGSb5E/DWjQ99EgBR7uX8x1wwAQOTDH9REaU+hZrReUIxcFTZC5fPX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FduZwRbGFdsrTuhDrcO3YE1cb0Lmi2b0mP+4DyzV/g=;
 b=qgtM3ZjSMEeB+WsHFPu8PsfLTleAOAXNGPajd/153/Bzy/WZ/+aSarCdVTuJ9CwkYmIPArNP/HutnJUv6algthOkinZyAEuN5gsFpzfh35peVfdJzEf1tB74WAlS6NWeNpUQUFfDT54Kv+JT68d+g3jDx8Sibx8NIq37knbVL31dIHKmGYYFgXFU4HXF0EOsVfxPYJDu8b/XslfLJMmXOS+dKNMWf9Em8Q6xOcjUk5hJRKZCzhhEPSytn6pTRG7Frui67mJMuXwZ9D06P+SO1abnRcb23HPg49brzxb/hkd39CtGjbiq+qdMroZ07Wluu6WsCs+UDt778ToxEH0B0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FduZwRbGFdsrTuhDrcO3YE1cb0Lmi2b0mP+4DyzV/g=;
 b=UMFiVX+xSOeWBtiLz0U4o44M2C0e6IVTBnL0GyuJbhWWge8s6O/UBH3N3n3uHLSYvEp/REJUdVHhc14V8aqKMPCsdkFajN9wMm0DrQC9pGQL2ATWWNM7ddhMeXWJOQZiLNsNZ65ytNfyi/me10gLlxNOB3fjXVgUsHflf03eregnfe7/rkSVZbn2lXlGhCHvANmJEw0Z40JWkCdTBFI3OG+Hgj2FEDbQ+Rnmvjg20ntrbgL9bMBHz5OiNRy/0nhegjLWKBbDbZpYFekf8biBWi/ZUZ5O/3wrcoX5LMLodiLKBpi8csh50oMIyszH46o70SCdnoDMIYUHoxguP8h3pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by SEYPR06MB5892.apcprd06.prod.outlook.com (2603:1096:101:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 03:41:23 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:41:23 +0000
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
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lei Liu <liulei.rjpt@vivo.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: opensource.kernel@vivo.com
Subject: [PATCH 6/8] tty: owl-uart: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 11:39:10 +0800
Message-Id: <20240822033924.32397-7-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822033924.32397-1-liulei.rjpt@vivo.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
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
X-MS-TrafficTypeDiagnostic: PUZPR06MB5620:EE_|SEYPR06MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd5340a-ba8d-4bef-1ec9-08dcc25c4acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zVXKE4wSpkg7KMtKhuscWZkc5yCUeW2IV12GPgJ5i7sGuf8uJ7cfZVNIEJs1?=
 =?us-ascii?Q?itdHdJCB5sYpIZYPg2hRqJuktlu711CwVwry788DSWFirBbOwMs401QTa9Ms?=
 =?us-ascii?Q?UCRqdQnjEj8OFXBonVG7QUE4t7P5MKmLOFEGSp2gAFeLk+b4pNIaz6ztrIKi?=
 =?us-ascii?Q?5CpAXrxizwNPQVMlQa9937uO0PIvZE0ygUGLXmG6rCFUIu+9afDS2UACMh4j?=
 =?us-ascii?Q?VcbxBPetx9kzoI1Z3Dy3lcnpK/IobPcMgR2esW60fnUbAu0jaVN3zS5uSUsD?=
 =?us-ascii?Q?ue6WbdlqtZEO6BT54dkdqr5k0n8vRcM4gopNPoiaucg7eSYpTD2NWLpzBPOl?=
 =?us-ascii?Q?c+WeExFi+AlFCv6SIJZCQY1w3BzrL/EE5JEtOTBXkqFcIomvFWprEp6/dxia?=
 =?us-ascii?Q?rryzNivbIYECiHPedXcymEkEnSVHh7obbxmN5aeTkp+El3KHsASGKkd6wnnN?=
 =?us-ascii?Q?pIpzspwOg4Q2+TYf5k/piPKSxa9un+q0+sOd8ZHK4M8RoxecCg2BlVbtIxfK?=
 =?us-ascii?Q?11ceEKgvT2BtN4wmOyR7QX6moqwvNDYzse8uB4OJeCf78CfA4R3y5fOjZI+r?=
 =?us-ascii?Q?EnCPpDxhL3VKpCelrnK3b1q1I3AtumcMYNDPJzPyUK9i9Tq8c3ovVBlf6KBy?=
 =?us-ascii?Q?a8Z/qz1lebBgUIlTvJkzuG1YppLJXmt179UNC9b3k//xsd/NjwdHoF4x0K5C?=
 =?us-ascii?Q?lM1ZoyuIS4b8irdKNMEibKDdRv+81K8il28RhZZbDHXIuV3CRZo/E2F3RmtG?=
 =?us-ascii?Q?Hlla/0I9BKdbJQNULl45zDKliLgiSxEFRUuF6qvLhhNEX/jD5shPlL8+w1zU?=
 =?us-ascii?Q?PULgMtq9k6IAxQY98l7Ox0CYjx1WOcWl0FrfB9BZeNLdOZG8Ena9qSwGTW+b?=
 =?us-ascii?Q?no/v23iDFJjjoBO6UIgizLV4zOlZUknj/gkKfip6uEdYK+/Da2C7pFU3hKvS?=
 =?us-ascii?Q?kOR27tgCz2g+AhS5tsK7y2ud3cwDgHDNnRnKMA5mZFRKyneYH3513PjTrgGT?=
 =?us-ascii?Q?3COR2N17NVkPaQVGeFE3mqsE4B+Tzahy4zzkLnCnCJ9DlRhulyWRGXjSvSBJ?=
 =?us-ascii?Q?j6v6JCGLSnjCU/CWINjtb15WVIAOZJ9BrbWWg60c4IHiQbq7ZUNwwMT0lmUI?=
 =?us-ascii?Q?uvSsnGG5WfUeKvcMQMyVBvq/QQh40QJaCf6nYeBOaeBy1FiOmlVQuePHWGC0?=
 =?us-ascii?Q?KLDBIdWUD/gpPFaCmDe7ly0Lsas8oIvnJyO8U0lruC/+cEhyFNMZzuqcsKXR?=
 =?us-ascii?Q?rcCkp/pFd8hQfwAKmvBM83+PgNDRi7AIQQnQj03nbW21hxff6Ks5EnIPYK8Q?=
 =?us-ascii?Q?szuWwL4+k9XlyMZSqNeo5p/xgIdnl6koNzUalmaNvKex1yrEvUcUjbUb7cdl?=
 =?us-ascii?Q?4yZYASd3fm+VCO/RKwL8Vakx3+TVhT5RzGI+Do+CU7hO/EmUWSFZj5xGkkEd?=
 =?us-ascii?Q?eKzicQB+1ak=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5620.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+O0YOgWRN+2rIR5ezJpVmLFPLHTlmNMnJMGAkqFtYEf6BabfZQKJWDD8iETN?=
 =?us-ascii?Q?UGTZMmNy/YvFlDvr/s3YI0R+CGNciCjPYuFwQCkHHB0gV6rLym+YojnbuHMC?=
 =?us-ascii?Q?Dp0bVpZiuPqy/2+UXRp+rO4++F92mrhrODr+zr4TxZ9eUGj+ykki72w2mcxF?=
 =?us-ascii?Q?Zl6EJnV3Ofx2+y8cCqBeL8SoXMQbQgLqu1Gys3gRJAehL33HHw9SbPM6d7NC?=
 =?us-ascii?Q?crT9fFoHteo9+q5SNRYgMKzJfPG9OpeftKNOKtodP/xCzHAUc5pHKMBJ+qqE?=
 =?us-ascii?Q?+hxZIhPMOD7rAvAY+ihb87ZozMQQwJRF0oU4WvZdSxNtfcrcWJRUtVvXtCyv?=
 =?us-ascii?Q?St7IPzkenb+i2ewjwzR2pADo3M21f6gvKXU9PVRfB9V4GTPGcyBQWaqxSmHC?=
 =?us-ascii?Q?s6cmlnkHuEsdq9zjPzLcrniOJP10KGR1WJodDRjwZ7niNV8Zh6gnvQNVBwkq?=
 =?us-ascii?Q?iKi48I++/XR/3UqLMROUd+pe8f8dfH31/MrhkuLCL1Kg1b9PQ25f+AftDoeE?=
 =?us-ascii?Q?yQr6UPmTCJILJ/lH79x4w1V0docG3nm2SWjxncR0HPASdcm/m8KLshQhHDvV?=
 =?us-ascii?Q?IJzoIhrxl/aLt5uldsV0WclaiRUw2FaBYnQM8xA6zeqIE6icqDI1C7XqCJRK?=
 =?us-ascii?Q?/wljS/VzKscqD4WwUjSutJNFs5YWYqn/6tn/2wcdgaxwc+WfQy3dwDjVShqk?=
 =?us-ascii?Q?oJeu4++1Hz7lLDEOBwCrvwppV07SyvcoeXW6NG44pkDyeaE2BdBAHJkRlYYD?=
 =?us-ascii?Q?cwBEweRf759ZSRPPZhrQS5vi8QWWU3CcCjcaOb6v2TFSmXs11j61+dmAzQzU?=
 =?us-ascii?Q?Jsqqb1UC3d0v4zSodcluXWQl6vYpO9hObKhyS18rPiFPPkM7olGMbtUvSsuA?=
 =?us-ascii?Q?WLrtUr+BXhDagTvvK5NuNZFW5yr7ef15MP3uUI7BEPSmnfPNIKJx72FUoK+f?=
 =?us-ascii?Q?bYjBLo3TAZxHxCfj3WHlJVx9gFHH1wD+e/ubmLlkSDxyGV876DGn3I+Gx/UR?=
 =?us-ascii?Q?x08955gVvGu5BzWsbQuwryUDjnMhPk1Hn7ndiDd3/5L/rvtDO/fZXzsefF9P?=
 =?us-ascii?Q?V1thoA0rjBV+w9t9bZJVW/jZpKtRWkbzK8yYVddtEHy4B8n9/iuhacHsCx/u?=
 =?us-ascii?Q?YG3tsplq0fvIIdo/LGh8FOH566g1NVDvW7vfoHUbzd/uUI20LAxs5akLmDoX?=
 =?us-ascii?Q?nxegDYGu7YdKvuoRMnoD7ZlFHBonzfT08NuGShWwJRBA0zS8wUYq+X2FgHaH?=
 =?us-ascii?Q?CLeU71PIomJCh1xIQNq+cy056Is5Q2Y4JIIcGOgmwE5PNtyHCWnEh2BcY3Gx?=
 =?us-ascii?Q?leexm6uf3/OHqgLFNNDcom2PD0XUpNBy/5ReEDey3tPw0mKveiwcrZ7Nu+sW?=
 =?us-ascii?Q?9WMIcO6Fpk8V+y6HYXqwVerC/NiFMbgo2uHbbwQbvwHQ/1pIYdYVCKVM3sTi?=
 =?us-ascii?Q?YqrQ+tYmjFQVHsFrlwVTyuEOSAf3nH8z/Wsbae1wK89UqjlQ+VGLGGZL8hA/?=
 =?us-ascii?Q?MmbI0DXVdjVpk2N7wE0w7HJQW8Qi0SO4V9ieFDeuzkPP8vSNujNw0mcxuw+8?=
 =?us-ascii?Q?dq2thUUQT978VQvTmDpqnRctx/J80K9850m7eWpU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd5340a-ba8d-4bef-1ec9-08dcc25c4acc
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:41:22.9359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvxgUFeiHHfbtkN+XtafHuzf6clAsbFjLunFRLJtyy+T4yjQcPKJKgSNY9AB7yJZoBvX8wRsbzQGOGy4U3MMZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5892

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
---
 drivers/tty/serial/owl-uart.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/tty/serial/owl-uart.c b/drivers/tty/serial/owl-uart.c
index ecec483d4d59..28c33cea6b41 100644
--- a/drivers/tty/serial/owl-uart.c
+++ b/drivers/tty/serial/owl-uart.c
@@ -680,18 +680,12 @@ static int owl_uart_probe(struct platform_device *pdev)
 	if (!owl_port)
 		return -ENOMEM;
 
-	owl_port->clk = devm_clk_get(&pdev->dev, NULL);
+	owl_port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(owl_port->clk)) {
 		dev_err(&pdev->dev, "could not get clk\n");
 		return PTR_ERR(owl_port->clk);
 	}
 
-	ret = clk_prepare_enable(owl_port->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "could not enable clk\n");
-		return ret;
-	}
-
 	owl_port->port.dev = &pdev->dev;
 	owl_port->port.line = pdev->id;
 	owl_port->port.type = PORT_OWL;
@@ -701,7 +695,6 @@ static int owl_uart_probe(struct platform_device *pdev)
 	owl_port->port.uartclk = clk_get_rate(owl_port->clk);
 	if (owl_port->port.uartclk == 0) {
 		dev_err(&pdev->dev, "clock rate is zero\n");
-		clk_disable_unprepare(owl_port->clk);
 		return -EINVAL;
 	}
 	owl_port->port.flags = UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_LOW_LATENCY;
@@ -725,7 +718,6 @@ static void owl_uart_remove(struct platform_device *pdev)
 
 	uart_remove_one_port(&owl_uart_driver, &owl_port->port);
 	owl_uart_ports[pdev->id] = NULL;
-	clk_disable_unprepare(owl_port->clk);
 }
 
 static struct platform_driver owl_uart_platform_driver = {
-- 
2.34.1


