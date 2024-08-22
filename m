Return-Path: <linux-mips+bounces-4991-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA5195AC17
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 05:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A12C51F229D6
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 03:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6ED22F1E;
	Thu, 22 Aug 2024 03:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="afglBshm"
X-Original-To: linux-mips@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2053.outbound.protection.outlook.com [40.107.117.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFD53AC01;
	Thu, 22 Aug 2024 03:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724298020; cv=fail; b=fDblEa3omZepOrYK+i7J6LsEf7djfF4+1RtPJf+ltgs70jAuOCbvl1eOzpEUJpzfpXntKjjHxEUFKIOmw+i2ZazvHKtuVIw/4dkBc2jfXKHZq0u5e+e1k+3YLkiQ1BF4/Wio2r7ZbCr+UChpSnYPrWcAfizkteN/Lom8PVQSJ/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724298020; c=relaxed/simple;
	bh=mLkCY4zNfx+hMu+/B9FfYyjYukjuGDUhJ/e3VEfAfuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S82Aw7rJNs7hoQJa9QUyjUgXIhTT1dA7HVtaWSAoezULUiN/wTU+PVBAvVzGaUs6KYVhwsNTpZrSUIp39qRCcWo+x/OWHSbwvKo9PnQtf8zuaFnuJnN7K6Yn1+qKxapv8XrSJx8pGlAK3sCt0YzJ+tOD1FiKAvu6o1aVp+xFQME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=afglBshm; arc=fail smtp.client-ip=40.107.117.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApIjj4xwrqe4fCIEc2buyqhsKEHyMc8Qc8ce7eG2PFjKHc/f0HG8SoP1Vjd5UDWIfcSR5RfcM4bkpD62Zj09cySE5jk6XvkI5OQuVT5W1hlhfPB/eUi90xU7shEInl/Wvw8TYCoIZUDI4mY2vN96HybELhSQ1Obk/w2+YJiVZctdYQf62ErKVFDtUz90QGxocRvujDBGKPGCfNsw9c5/rXeUA2mhDr5/0hVpa1ncei6eSyODLQo8726oN1waaDVGDVjMRdTCbdINoPH80PfsxvEA+uHusJWUu6ugpvkkd+icmOqsgpTrOdWwt19KCyTQu8pDXHQx6lxlHxJjxwhk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r3BMP1FBquX5ukAVmQnyy2vqTNUoSxsqb+JL74roAQ=;
 b=IoDlQE4TSnbvlFv7AFuAqlMIgG11sPjgakXQQgQfTIaJS2qXBg0UWgcbO4YHebHYZSigYHqnCqgtVfrkzmtjLEeN831umEYPblk1gQtY0J9jZe5FKgi8OZKIGKhgz2ah5dHVKuUDjyME9Yr4UMKp5cRTPdLD1xbehNU+HN0ZgwKR1+SpcTqYF7b6LmThSdtXyd6GuabBJ+LLawj45Y8G7S1qK1WN/IW4jCX3vmcjkpI95HbDJ13+6+qAGaKxXZnG5Xvm1IPbJzL5SUYza8l9NNdF1+SGY8tP1DP1JjqIJZeFaVUI+eGTEJgNHu4APIuzXrfEVCHua4//LRI5AMlSDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r3BMP1FBquX5ukAVmQnyy2vqTNUoSxsqb+JL74roAQ=;
 b=afglBshmBJLHeJa34Y1jwwRFG2mw3ztvrQq+BvicoWodb3gGtZBKKQ8CIs9+Cw8N8C18WJurdfwrex+Dkecqkf9+4Yt8IxylUNty4H6rVHDTYrq1udIV2vEIZyMpXBMoa9lWLkgdmHNFOjKSGXmkb4TmbVyf9MhzA9ujcMyvC4UitvptrbPw+TydxioAjpuKLFzoPjxngMp0UpiVNGRh7d37DszrBzuLVGCR6yTCXQaw4luGvcwACN19dpOr8pJb3U3Vsd7z/PUjADAxPrJ1/gsFvbN/SG4l09QfO1d9TjnyFJYeNXLZMAaW3IzNIeRHvaRWCLcxkNvXRkFH8jVT0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by TY0PR06MB4982.apcprd06.prod.outlook.com (2603:1096:400:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 03:40:16 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:40:16 +0000
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lei Liu <liulei.rjpt@vivo.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
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
Subject: [PATCH 2/8] tty: 8250_tegra: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 11:39:06 +0800
Message-Id: <20240822033924.32397-3-liulei.rjpt@vivo.com>
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
X-MS-TrafficTypeDiagnostic: PUZPR06MB5620:EE_|TY0PR06MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: c131b6cb-d370-4ce6-2def-08dcc25c22e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8BPbImClTiTfGKByfvMBUjdmwqGzTZephM3ILcfY9dOULHvihyLZWp2f9KNd?=
 =?us-ascii?Q?XrZlKW3mEJ1H9cllGbl+O2rL2U7EAp1ZV664tmQUhOB65ziCF8GzPP1ATztc?=
 =?us-ascii?Q?4KViGYcelVMo5PKblSj27NAbX7maDSocupt5cEJX8RDVJ6N4Sv5BnlhgJR0h?=
 =?us-ascii?Q?dSa13I1cCXVwClvT3dHcRh/VFdvmYmPX0OdRe6J7aGfcqTy/EuyNqFq5PXA+?=
 =?us-ascii?Q?NEX+Qc+3OMPMsj/+lJSmBP0Z5kdVu7puIpoGu01pxbf/r1LKnzd5kz6yzs4S?=
 =?us-ascii?Q?DX18Rn7w1PgTz0F6gF9+87fIWdCHflfoRNUSbfnIiNoxs2fCRZFi4yePMXLo?=
 =?us-ascii?Q?OLsWrN21oD6CtYNnwhLBwOcOAtDhnIfg+MK3Eu9UgurmrEdBWB6UZcLR6I56?=
 =?us-ascii?Q?zvXbJC2Xjl78vYo176NjiMZqCqdW/cKvcQUyVbxk3OuWj97LfsHp9DxjXssJ?=
 =?us-ascii?Q?C75mcVp2nD3sp82KDabCgqJvWWawZXvQ7ZUHVrSTjziBFVXH/Hhdv06yoECy?=
 =?us-ascii?Q?HUJnk1Qy4C66ovJPkTdU+MaiR/rKsFjBmlYtCBgKhlSO8siNBtcQoaBkSq3b?=
 =?us-ascii?Q?hv/P+FqFVORCDbWDNHJA6SZvGL/i1Bpmxr2w6PynkDmNgt4Jn/5LBs1GOMmc?=
 =?us-ascii?Q?RWQvEjwBo+ukrg7KviDyoax1fW1KVAoi+xauBuzIysc0oV3/b8Svfuq2FNKt?=
 =?us-ascii?Q?SG98pPGn0zX7py+mpFFy/kdI16I7AeekNI0tB6hDCzwe8qajlSpxHwB3mPHY?=
 =?us-ascii?Q?F2Nxhyvmb5afHspYvsgDWJbM4B3KT+1491MxjTyprX+yOkj0VteWtk0E0tUQ?=
 =?us-ascii?Q?IL/AY+NSrxRpgWZv66Criaq9C03lAiTsqdsHid7BaeE7sPPgb0lNBaoN8gQN?=
 =?us-ascii?Q?TbfRrKib9NNEEuJHcqcG6A2NONkHR4XG6pbjMyzvzEAcz/n9Kl/UT1TyvgFL?=
 =?us-ascii?Q?ffwkld6W/2AzUQg06m2UDFHT+LHXHJR4ovILtCAjtMOBtfBa5t8ytgEmJrQd?=
 =?us-ascii?Q?5igCGqyIMpK2bJTyTCr5JqHsriWresA8qoWvnMArT5ONaNuohSWN9yUCtBhe?=
 =?us-ascii?Q?Wz/3TLDgucwy0Lwi6qZ4e0IOVBTbVBfkR5N/h/bhPu9kvf+FPNz6HdcEPbeA?=
 =?us-ascii?Q?F0oquvzN1hblBozi7jT+qzCNbsONHxrclFHdvSkfmB1WAYqCYtlmPZ5hMnN5?=
 =?us-ascii?Q?oDwhU3iGCZlgM8RPqWfaJTUPwT9SnRCKgDrq6Xy+yN8OpR+toTGxRNa+04mx?=
 =?us-ascii?Q?b/t6FWMKUkly6j6BnDDDvK9+ZSW17qW0A663KtQZAtyGwqf92PQqtXxffJmJ?=
 =?us-ascii?Q?CsLCeoonOQqZ0sOKAWg+6WdgYZYEhXy4Iya8XqfAetKRSTMJe/DCfVZS7TZh?=
 =?us-ascii?Q?S7BKt4oh+Y4SKn7guBedQ/d8AwIO2ACR7V8lkmfccdowWs1ga4p2WWnl1r2g?=
 =?us-ascii?Q?F0G1vqm56Ds=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5620.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RoY9kpzTTbZqVktKwuKWn+8T3PbA98i9nkvRob9R8yaFQe1+h4oWs3uGOknf?=
 =?us-ascii?Q?NDRIPG+sKdhEoVBqdeIbqja0MTYJCQOEoJHfVPbUq8tsbzDcQ0AycTdx6mr8?=
 =?us-ascii?Q?HpYmyELDUgIEEJZYnzYMtKLhAnxAl+SxPMQ5nPt7oDkF6KpZPHPvwGUg+Mw2?=
 =?us-ascii?Q?s45gO8hbewg4ulmuAfnly4Xc7XnZoX4n5papGM9CcaxhsCpk1IvrzVh+cluX?=
 =?us-ascii?Q?ed/MCgXVFVmMPiJkQNAR5a7egxuBhLqFtL8VyXyKfcgZYOrfzphA3ySYTbhy?=
 =?us-ascii?Q?kjvs/A8LnEjt0saO5LlXc33/owCY/rZ5OErUlvnKzxvU6p8p8jKHRSX0LY90?=
 =?us-ascii?Q?YWEKHQrJppJU4lBKQpxOkqWLKlMwrpJ3kBq0ndPfuaaBuKB6vpLqCUVE6x+F?=
 =?us-ascii?Q?aSBXXymhCi4+/WikqfpXmtZuIL2Y0t4Oa4PrnQ0GjaE1Av+mfKHiLOlw0bht?=
 =?us-ascii?Q?2z7Uj4nntbEnYkNuZNaIN48jIw3s3cp6dwAYnx7GIY9BQFN9nidF/dWHtfJJ?=
 =?us-ascii?Q?IF8b/VFlQ1cwnLbWdQ3Ab8aKdsNBCOkbv0nb+zW0LX/sFeTpfDgcGNH69iPb?=
 =?us-ascii?Q?t1um0i/Gqe7eP/MCmG7HMbUJq2Wzmn/dAgu96SDWGmJlV1CD8nVFwjubuHrd?=
 =?us-ascii?Q?bwHQ4Q4yl+MX4832PhuYzyONPsVqIiD/BP34uFXfzO3yPdImwfgG9ah/P/Rc?=
 =?us-ascii?Q?ROXSsPoxsb5yeVTbxMZdWEdu8iAumLZSkPW80vHnHB/kczQ8ygBuchBW0JPM?=
 =?us-ascii?Q?h1ppjHTabBT4TeBCqNpMhlfyBkItY+4XfTTtanuirA/jJqu2TxX2xwf6k3bU?=
 =?us-ascii?Q?No/hiU40ZbG28WoLgxRr5W0+D4yIJRC+uiDnpZbO+JKqp9w6Js0hNGk4K48j?=
 =?us-ascii?Q?1Wp2elzpxl0h8hy172wb8NO8UOFjDtE6XUSu4Mb1PTAqyuqDWrrk5wHODojs?=
 =?us-ascii?Q?D2pxrYOe7G7plh5MhC33EK1erVgKI6M2CEoECti9zTWP+8bNmcQSjz0SJ8uc?=
 =?us-ascii?Q?04AzxJL9yZMnBfzZ8ss4qHzBQY2IGYZcxNzl/YjkY9YbrSkb06DyfPOYQI1z?=
 =?us-ascii?Q?EIBQqiVMmY6qnb9B2Dqkks4Tt9OmZrlNZwHGL6nVZQ33YfB9MPhfHMIMuJPC?=
 =?us-ascii?Q?4yqU1Hu9877jG7nrePXWpiYpWHeInOwj13Q3nDXCEF95FKssN6ycI/shEoFS?=
 =?us-ascii?Q?t85+rr4xQvpQHi+9UQTcE7eYVj7xLOH1zWAzDOz+fVSabZC4pOTuc6J2VaVv?=
 =?us-ascii?Q?wHqZhD7x+d4VMLh8P9loiZAT0ZdpFT03N6y5tWp89bWhuKFfHY2NzlydVbQg?=
 =?us-ascii?Q?KIWAl2PXYV7gJh02G3VByjPbYk/j/qmDcwt9bNESHHtr3zJeOixCrPmb9whu?=
 =?us-ascii?Q?6VCxgL1HDefonYSqJC36n8Ky52egucn9e13L/J35CtdNJeR+V8Nzb1nIkUhx?=
 =?us-ascii?Q?AvDdinj2pTuWCBlBrGNiw9wWoqHE3yUOG8lS8dYaEw3UWo8ZyBRxH347iM0q?=
 =?us-ascii?Q?oid896jLpkUa0XYYUv0nwS+b5Jjl6HUzIPbY6hMXISYFWvbO0hUq+gKy1Ooz?=
 =?us-ascii?Q?eT7s0mUkcaRFABzZLkDgZsvDpSrBd/MWFoRVdRvp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c131b6cb-d370-4ce6-2def-08dcc25c22e4
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:40:15.9677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLLQb96ugYAbmegAbSuPjryD6A1WTb7Zm6UQf2fEjCWVI7AQU3GooNbIBjsaib3D4EEos2Otdf99QcLFcbkz7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB4982

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
---
 drivers/tty/serial/8250/8250_tegra.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_tegra.c b/drivers/tty/serial/8250/8250_tegra.c
index 60a80d00d251..a38a4eb3235b 100644
--- a/drivers/tty/serial/8250/8250_tegra.c
+++ b/drivers/tty/serial/8250/8250_tegra.c
@@ -86,16 +86,12 @@ static int tegra_uart_probe(struct platform_device *pdev)
 		return PTR_ERR(uart->rst);
 
 	if (!port->uartclk) {
-		uart->clk = devm_clk_get(&pdev->dev, NULL);
+		uart->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 		if (IS_ERR(uart->clk)) {
 			dev_err(&pdev->dev, "failed to get clock!\n");
 			return -ENODEV;
 		}
 
-		ret = clk_prepare_enable(uart->clk);
-		if (ret < 0)
-			return ret;
-
 		port->uartclk = clk_get_rate(uart->clk);
 	}
 
@@ -115,7 +111,6 @@ static int tegra_uart_probe(struct platform_device *pdev)
 err_ctrl_assert:
 	reset_control_assert(uart->rst);
 err_clkdisable:
-	clk_disable_unprepare(uart->clk);
 
 	return ret;
 }
@@ -126,7 +121,6 @@ static void tegra_uart_remove(struct platform_device *pdev)
 
 	serial8250_unregister_port(uart->line);
 	reset_control_assert(uart->rst);
-	clk_disable_unprepare(uart->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.34.1


