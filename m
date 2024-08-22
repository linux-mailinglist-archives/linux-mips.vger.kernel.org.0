Return-Path: <linux-mips+bounces-4997-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 749B395AC2F
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 05:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DBF428441C
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 03:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BAB23775;
	Thu, 22 Aug 2024 03:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="cLHV8t2E"
X-Original-To: linux-mips@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010051.outbound.protection.outlook.com [52.101.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE93BBC0;
	Thu, 22 Aug 2024 03:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724298122; cv=fail; b=IV/WpRtqTMVz7XrhyB3W+ovCHg/H4XoKJFnSKizISeO71ALEOoaodsx3lDn2phqxgdHVkaee3UIZ3CIYFRrZy/CyvwWoGsMI0AQ4EyT4H2w+xQcH6MWa+p9PrG8e0c5/UURBuNGVMpbrvuFVIs5RYN92xORjnGmb+/nYBEAdrEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724298122; c=relaxed/simple;
	bh=FE0BxfoZ1xHlA+SeTZ2BU3seMfNHpkv0m3D0XzgQ6rc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T1hXwZqcBNWzw22+BnSBGvO+Z5Vl6t4VxRdwrYr5maVgCifofwiTR74tkN8JW+9/kq3zdt5Xae1/LitXm4A0TM6QMYseO+o+PFlZhCee9lZF5YCWCchmDFbnohzjRAWYV4K8raKayPajPpeW9JDMU6GriNklTd65JWV70bioe68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=cLHV8t2E; arc=fail smtp.client-ip=52.101.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9mWNQkmUI0LVbteOZ9plxey1ngUcmWyDa6Sj+jWPYUNncK6I4K772S0P9Hh6qwR0fTbkyBAJzJtbMa/RPAfIiR3Vr953f9me3tZQ3X1BO0zDDSqdy0atzt5HQMco8cds95gnENCoyRHni+Jm9kCa2bTyj/xYI7Sq8gFXzN77ikWWVzYWIaGJonCzALzaQeJyKsT8c4YfimdXfwD6+tlouDVD2Z2I6kFcpsfP3+K7ik0WoRVX4kTBcZQnO0JljUzLJ1Abl/tlHxUKIyFlyeCLrrbN2mxzD2I9K7emn7c9XAAkDLi84PzxlIGNUp2JeB4nmj0Bhrz88R3ricsF6c02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCneuIT6Rq2rxHSyitUkMuaEIU4QSMLzF/kfR0v556c=;
 b=j6L6OOslpsMYq6SDyqdag2JD21tyjF8VhaophQzTbNa4dLh3rwZyKI0vIQqZ78eNy9hYoZYxGaRbZqn170XtYMtbk1zE0wc7JHQTlNSvVE7hUJnmaI6s1n6ifgmmeviyJD6TA0erPigNGxWN1SxWM8yrUvZ2GH0fTTVSM2rpdUPKl5VJ7cgOn/N+Q+XoocmDG8BjgupJwjTZmsY/7WhgW0kvO5XryHEA4fQ90zl8wfZyZ4p/zdUVGF2RgHzQ7Uuyd+YgV9ipXeX+Zn3e0qhfxDK5FEhM3zE8jVDBn2b2Ef9zvJwZH+IShEBZmcSrcxFFzfN26avXDxOnNocwgBSAOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCneuIT6Rq2rxHSyitUkMuaEIU4QSMLzF/kfR0v556c=;
 b=cLHV8t2EcDVR0YedssRXWAe7FaRtm/q+IlywdojjJtgdPxRhuTpSymmJeJCd6ivIczubYBG7W5+/fI+QmZM4q03JC3k+WeQbQh6a/qtQiWvpYnSb7U+pspMgld3ZS9dWDfLcILVZs7jk/0AZneHC6H3z3hSQQl+av9oOx+9twxiVF10lw6UFypah/77YBIKOyGQMs3tvg1rFRxGYWvpbBpvkFRngC8EnwN22g8Oh4uxcfnezax9oPnPMXHcGgUPzWQ48paxwqWkqJit3lRlH5qoF/nO635MunI4sylqwFPlb9loNXk7mPHe1Wa8mI2HeEhlCPJZZ9UIqbk11jdeLaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by SEYPR06MB5892.apcprd06.prod.outlook.com (2603:1096:101:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 03:41:57 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:41:57 +0000
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
	Lei Liu <liulei.rjpt@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
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
Subject: [PATCH 8/8] tty: stm32-usart: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 11:39:12 +0800
Message-Id: <20240822033924.32397-9-liulei.rjpt@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 700f359a-aafb-4e5f-3b73-08dcc25c5f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rzUc3M9XlvkWLMPt27YHNaosZznXUxIf4mfY9wcgda4Xy4NhC04Wb3eQhDSE?=
 =?us-ascii?Q?43mzBQxMewUGYGJIJKN8ChG/qLbwRHpeZyujlbYXvAMaj72mW7QFHE7KEEB7?=
 =?us-ascii?Q?rkuyK2PfwUT2QhDxrgD6B2hJeZKAW0u6of+cVxw+Wu2vYYWm3MLjDhPQQGGR?=
 =?us-ascii?Q?6GNPP6K0bIQYSUC1mqW+aHpkSGVkomNK8KfsyInnNVig735n6HfaZXd5Sjtk?=
 =?us-ascii?Q?yPSC4IFYbJaFB5kcM4TvNGmirKHYp6xgY6cBYHNj3XXNPH+kFHxBqBjny6Lo?=
 =?us-ascii?Q?PFAbGe1bNE++PPtczEDHeaTqWgyCka1aXGMxsd3AG+ZpVZR7zswlSWlVxnvM?=
 =?us-ascii?Q?F9tNu68SVaCbYnk791mgGSdCPxseiLy9VYyKFuI383O4HGHtqLa9pE/gL2He?=
 =?us-ascii?Q?0h1NGxSorTpx96Qf/dhsMi92cTukzjTyEDKI2dwc5+WdNkOaDqc8Ec5ZYYQL?=
 =?us-ascii?Q?DgiU06ZcGOdx2Mju8Nxqch0lLAzWkC3WIQWyR4TXFychUCN5A7glNmBTZLpk?=
 =?us-ascii?Q?wdg6fnG1yDwDMokVmWMUWI52B8Ftd1GZrNl6yYDUsOhwVNvD+Q4/97SUEs9l?=
 =?us-ascii?Q?BAqzccYb6HsrnGke8JiZT5MwG7CExGqI1GLoXDU2bNKe6Xn+OVW+0IIqdQ1m?=
 =?us-ascii?Q?yc54vBr4d7/KINtKakvtenN32OY6VTy/DLsErnbeMs19IWuXzZlb7QVcrUTi?=
 =?us-ascii?Q?iJpfVUc0n3hMua/GUDPvXJyjuuDfznyAPG1XJmk6y6xrMfTcsGPOtAWvZ21Y?=
 =?us-ascii?Q?tFzVCSeh6l2h/KGcWok02uf98nnXN4g8aSOW+ti6ogpo4zQrV6AL6s8/Ag2O?=
 =?us-ascii?Q?fXNOnC6aalAHOVu0gNutgJVZDCvqIrEncT1VT++yxsfqd1BVzoJYuPugvBdg?=
 =?us-ascii?Q?/ulaHbOR/TRHMQCtsWirdIShX+TICVnP9aAP5zCrm5C9/wjHBzu4kkN/6SD2?=
 =?us-ascii?Q?PIacb5L/o67VlOihNy71SDfnfCUZGFHbEl2MPgjb205ccgHpQ+sbXFw6kM27?=
 =?us-ascii?Q?02nAOqbZKqomxaG9Wk2d1kf3F9U5D44KnMiFvT/mSwGuzaaHEjP4e3THIkT8?=
 =?us-ascii?Q?W1ttfNV8EKSdzvbDGrb730bMZS9lYvivXq3L/Esft2uC1O4/i8aIzILlOUxI?=
 =?us-ascii?Q?3HDf7Q4EFs+o8gPi3T5p6nW30y1aafgWk+f3lbi+0hju2EbLaSkmUVZjlgCl?=
 =?us-ascii?Q?g8dypPebHTCXgI8NUV8GeZWc8lIRJwcCZuFA4NDwZqjsNtheNDeMvmSy3l+z?=
 =?us-ascii?Q?E8le4rR8NEvyGZ6jq5XT4yI7mtdWbYv3qA8Ad5m4V4wFzlT87udDR4csqgQT?=
 =?us-ascii?Q?hg+xdeM1Tm9Xyk4G7TWxgNTPlI0D+LKXS8/s+fFjMprlQB4wCuHfXsxZEtON?=
 =?us-ascii?Q?IB2RW+twVsVPBc+OAJBEhR9CAo8rcEc5biFkGXK/P9bderKanwkK+ToVePsl?=
 =?us-ascii?Q?yhECKced3ZY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5620.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yE+y/D5FQBq31sbVrqbrxZlDIWE9mOgmH8X683ABTMRrcvMAcecqW7LQDHGR?=
 =?us-ascii?Q?8nzoIu5puPB9BQP8XAPLqlTSqbu4Od7IsmBUTIGef6+kMGsNzTTcNkmkjJ4x?=
 =?us-ascii?Q?GqWlIk8HAtnA6npRlmn2mpxLgDAFf8RJKKowy4om+F0FEE5JSDnupBvNNoJi?=
 =?us-ascii?Q?v/N1XrsuYUKZkDgWBhtqF9hL9xXhsvMTiqpGrIWBm1P8HQBno9fpHBm2vxUG?=
 =?us-ascii?Q?G3C8IjZw/cq9dG5SfwSFYV4gB4xgb7OStanUGDu2cgc1fJrc6+L8R6KTXpGn?=
 =?us-ascii?Q?1VfT01ksUm88RL2fhwiEoE25wjBAbgwuYXNuybOEqCRvRMSI7dXwNzp9ctDd?=
 =?us-ascii?Q?rZaxAx/u/561UDQGI02zfrXD4x+OGHl5UVjV2MTuz/lFG18MjQw6CApiEztQ?=
 =?us-ascii?Q?F3H1m1x9CCWfmqujjzRV1ctj5z0jutnZtLd0VaId8NzAd7s3W3TXVPKeOImw?=
 =?us-ascii?Q?Cip6BDkYXvsbgZ+xuugE2LB4m3isFkaLUi6cEsSVX9Zv1y9IEHSytZ982jkP?=
 =?us-ascii?Q?NSOnOUjuY0sRgXK7CjqvGNud8SG9QLBHN5FQiW4/YXZiziZyE7JpgvONqM9s?=
 =?us-ascii?Q?+YN+ZdYr0Yy/k5zFGuRtVv5JLoRaBgEeYvj1H+P4U8JxlQkCh/X8UMzIAEtb?=
 =?us-ascii?Q?w5TkPlaChm+tXl8EAaR82yb5zLq78FRZP3edU91CbwFIS/P3lfGz8uL19bA0?=
 =?us-ascii?Q?HslPilNx7j0INcMIvaOldF7xnNw301zOTafaoWspbzZdgcUFxG6mz71MAdk4?=
 =?us-ascii?Q?jTFV6kKO1Xqf+C0X2TgXqMlPJdpgs48WXsrYTOnu5HStWLv9aBFNxImxws/7?=
 =?us-ascii?Q?otIbpdLR8hV9/MFqD8EEsdvocEGKXY7zCtgjamxJjiAGgqASGmmH2jsGNqmy?=
 =?us-ascii?Q?cxRGgQzx26g4EN0VxJLuux3CcR4PGaUUKPGned7YIoISe8Kn6LAKelBcgqVV?=
 =?us-ascii?Q?D+BfR5gevrH3BuB9WkaHrZ+lU+hsVpUjdICfhxfyJXOKfqc4Qth94pMavSKc?=
 =?us-ascii?Q?if4ar8rEaCcULDGiIkPZ62feY7jVO5bIooqvWKG3D5dWZqqzOEx6TllI5qO3?=
 =?us-ascii?Q?N410L3Ov9ZjBTobxql//nOwBQS2JGd1G4FA506SGjcAcWR/ESec2t6EQuEKT?=
 =?us-ascii?Q?wf7LrEgm0WFlyrQ2sg3YMHgaM0l7ZqjrThw3jZs+cwjvF43n76G6pAw8PnS5?=
 =?us-ascii?Q?ut1ePS6Qge6tdpEN6DD0RyqaQXEoeK7FNJeDU035sMcH5UoEwLMZ17t4fxOY?=
 =?us-ascii?Q?G7wgDUXPfe/GGmSK4XpRArq3XexFCCOD08LKzQ9iHROnSbjKPXrvILCAnaLi?=
 =?us-ascii?Q?e64P8E5kKjmtAVucOQ7O11ra9cpU8Fw+vq+O5SYLWEkS2JQbmk8aBRuXt09V?=
 =?us-ascii?Q?3krvdKlxxDBKSkD3YuZkTBDt0jp1sJafWkBURPKq2+O2fsa/ZQJ2wajUxmT/?=
 =?us-ascii?Q?JXM9NxlNeWQuYXIoo8oYzi2sMgPnFlqTj6ZEyQNECs+9r3w8DxyOOxPChMVl?=
 =?us-ascii?Q?vQxTba/Dcoa4Bn4LvB8BWhgfzVxUQjzODZDPDT1Y6Csk4xj6uIG+WCXj7Buy?=
 =?us-ascii?Q?9F7wpv+t8KZ2yGIcZmnUoGxbdIsSpT1v223gabJD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700f359a-aafb-4e5f-3b73-08dcc25c5f50
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:41:57.3446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruINW/oRR7brO+2/d3lL4uKUES2hNu1ENIn8SyXLK7rmqqY3Pd3KlnyN98vJsE4Jql33OreXv/bYREIYEzbRQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5892

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
---
 drivers/tty/serial/stm32-usart.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index e1e7bc04c579..9bce3159165a 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1550,11 +1550,6 @@ static int stm32_usart_get_ftcfg(struct platform_device *pdev, struct stm32_port
 	return fifo_size;
 }
 
-static void stm32_usart_deinit_port(struct stm32_port *stm32port)
-{
-	clk_disable_unprepare(stm32port->clk);
-}
-
 static const struct serial_rs485 stm32_rs485_supported = {
 	.flags = SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND | SER_RS485_RTS_AFTER_SEND |
 		 SER_RS485_RX_DURING_TX,
@@ -1599,15 +1594,10 @@ static int stm32_usart_init_port(struct stm32_port *stm32port,
 
 	spin_lock_init(&port->lock);
 
-	stm32port->clk = devm_clk_get(&pdev->dev, NULL);
+	stm32port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(stm32port->clk))
 		return PTR_ERR(stm32port->clk);
 
-	/* Ensure that clk rate is correct by enabling the clk */
-	ret = clk_prepare_enable(stm32port->clk);
-	if (ret)
-		return ret;
-
 	stm32port->port.uartclk = clk_get_rate(stm32port->clk);
 	if (!stm32port->port.uartclk) {
 		ret = -EINVAL;
@@ -1645,7 +1635,6 @@ static int stm32_usart_init_port(struct stm32_port *stm32port,
 	return ret;
 
 err_clk:
-	clk_disable_unprepare(stm32port->clk);
 
 	return ret;
 }
@@ -1853,8 +1842,6 @@ static int stm32_usart_serial_probe(struct platform_device *pdev)
 	if (stm32port->wakeup_src)
 		device_set_wakeup_capable(&pdev->dev, false);
 
-	stm32_usart_deinit_port(stm32port);
-
 err_dma_tx:
 	if (stm32port->tx_ch)
 		dma_release_channel(stm32port->tx_ch);
@@ -1904,7 +1891,6 @@ static void stm32_usart_serial_remove(struct platform_device *pdev)
 		device_init_wakeup(&pdev->dev, false);
 	}
 
-	stm32_usart_deinit_port(stm32_port);
 }
 
 static void __maybe_unused stm32_usart_console_putchar(struct uart_port *port, unsigned char ch)
-- 
2.34.1


