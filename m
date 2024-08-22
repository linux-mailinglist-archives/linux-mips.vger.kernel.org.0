Return-Path: <linux-mips+bounces-4994-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3295AC23
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 05:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B717E1F22836
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 03:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98D724205;
	Thu, 22 Aug 2024 03:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ZYXB6hUH"
X-Original-To: linux-mips@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010053.outbound.protection.outlook.com [52.101.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693C23759;
	Thu, 22 Aug 2024 03:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724298075; cv=fail; b=T3VeB8BtdzY9kofnbjFmj/LEoUm42K0CzyQHsYOFc2zF+P+A/x2Kvp2lpayZwfAZJpBNgNmM9Wnoq4lxOfX4WjNu8StOFvgYntl32gKjalJINpUePMFG7kAzfLtnR0z56HpXGUufbfggDLFOtWktB4MBKWJD0fpwbQpi5SsapfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724298075; c=relaxed/simple;
	bh=A3S3+VFvXIrqb4f7ssUSn0u1KqtOkAI4u4l8HugL1qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N6+LrSNlniUu4K6efoJeP+p+ZIkVPsz1d9e0FbXBpSj6/PJ7LTiJf+9j6JbLLk20bqVsvGDRRM53I/6Lye8TvDAm1cDMzOhmPRB6nswYgx9r+7VqIn5GOCJCFM7r2xkthaWy6Jmpav6d4fVFT7Px7aHP1DtiozjcoEWMRBPjZ2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ZYXB6hUH; arc=fail smtp.client-ip=52.101.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5Q2P/rH5AjYvsT2uqRL1ZOHOvP4IRr9uV/r1jLkIdAsFighwPyB/pgcMx8CiLs/ufAwr2AjOyG6ptMJo+y9WxDg2NmHEy1OUqp1e/lqB3ERVpxvQDbb2ja9texL2fVq90FFPhYKT141/HZd0RhrpbGIZdnTar2bV/guL1xXXgesg2kS6jCsiSeDX32CmEHxWSIbCJyp/akZ2G5eXD5n2NWno7/hbnJVBfGtyIiAAV/rKt+U3N7+2J4BnRFapix+jG6PBHWthgFnPuy1in5pS13xoEzPpCUCW5OOKIjotl3fYcOD6cs6KQEY/1uFtNs0e32xEaWCLEpdb9Hx71eMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuVPlrCnGOACyppIwzEZUACeNu4uBImXg2pp/U8N9Us=;
 b=OKRUm8nmHqBMGp3qNVCdzxy1NuZSNNn/dYbnzOdlyW+qQ2XZb71tDtR1Q0dA/qDFeAjVau5hyoS7ouc5GWBSTAtFqp3YGfa7cQh3xYdUbwO1j+K0r6B7i73qv+lZn8PwjKqQCDVrc/Au/Eutgi5s7B7VHhNMdereakmdAr8uZbd5dBAisq2clKuG58ivGu22gXuGj223oIm4QIqj8heWPia55krPwECbNbp0u1c+Frc/Auf6XxvlFUmzGJ0tZCeDeriag8KkU4xBa1StDbCV87dd+PjEEx9A/TtmG0hpIXFSCAgamSL0tSiQMC7+V9nsl6VxTbnSPApIJOqMlUcaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuVPlrCnGOACyppIwzEZUACeNu4uBImXg2pp/U8N9Us=;
 b=ZYXB6hUHbnG5p5k1oMotEq5EeUBrSmmk5fYyxMXDJ6oMRY67myJHWuHgAErsc65B/eVlcSy5Utn3z7iq++ZUzS8zdo1LaaUpouQB7zULAFMZ5haeoCHws5y8jBxnROu++9PuQC/8QsV5gEsO3KUsBl0QpbPEbs6hA6dQbo30SQRelm+lMN6aDQBkdWJ97u/jKaLa+MV4SuKceAaUCz6ukPJbMCHsuDNF57mW/pg6B6ho9yYK9mlJgnamvU8+0EH2mqckI1l1O2Ds+zMkXG08UOgeO2VxvK3IGaK0AZcaGQLqT5wHNYfMHqT8xkiujKPdZif/P38anF8rYd7YiCqNYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by SEYPR06MB5892.apcprd06.prod.outlook.com (2603:1096:101:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 03:41:06 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:41:06 +0000
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
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
Subject: [PATCH 5/8] tty: mps2-uart: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 11:39:09 +0800
Message-Id: <20240822033924.32397-6-liulei.rjpt@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 552164c2-1af2-4950-022c-08dcc25c40a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iIFecgyzDXSXkOV3e4eGwobLGy99JhYYzbKFEzUf8ftlludx7AEO6o1pz35u?=
 =?us-ascii?Q?7BwV74oL9tdN3hgSOXjKVZ1BCeypbcPN81HqzX0TevPuEHgV4b0sz7T0xqx4?=
 =?us-ascii?Q?YIy6ie8X1tTB3kRkNDdy3B91fDwdr85k6o+6b/xibprtGbt2PjSsGhXn81q3?=
 =?us-ascii?Q?/Azeb63mAjMGzTbj93YP/DzvBGyj09xxZy0jGV46RuovdNqtWmCf8zgqmrcf?=
 =?us-ascii?Q?folCoqIErErFdOXNl3xusVF7Jff/VAkr3ukzACxIfUE4AkN5SAbv3X7P87DM?=
 =?us-ascii?Q?FpxxDfzo65oc6Tna+x5wnDlPlG9jPewCT7Bhx/9nuYqVLQBF8M+HVQt9W5HM?=
 =?us-ascii?Q?2MMMdiR7WU1PIxGbLmMzdKWjovJL4P0klNSAE5j2GJWtogVLpNwwWQ/488rE?=
 =?us-ascii?Q?ARL9BMNHXOVCzO85siOsI0gGMFXvHjHTu6mwDPueiNdD3Y+jdCcEmfgPr0Ll?=
 =?us-ascii?Q?SpQWAMJneJIOD60jZdqW0oHKVkR1Kvd/rHJE7lDpyn7Mu+IuphZYOww7uesA?=
 =?us-ascii?Q?WDTPpiMHmgZeBCgbs9WxShi4qCK/+GZZI3pKV6OqV3a+/JHXo3jfbni0QelT?=
 =?us-ascii?Q?DUILb6KyGd1w+oZUJXW5idwMZ9jji8PDwLhDVmXsnEi4uLGmEFr7Xw9rC5rJ?=
 =?us-ascii?Q?r5ufdS1AYPrkWTqH72ozIbFXTzt1MjuVtRJHKON8iqTcVcaePXYTsTDWwu90?=
 =?us-ascii?Q?+C33NX05sqLrUENCYIUrWEGrmnzWs6/4XJVsIzp7KBFUmIKFxv87pgQrS7yo?=
 =?us-ascii?Q?9FZTaxkyqRJGIdFyPsIMu5T4z12EFTSfFqCiMH8FR0bWzEES6MYW3xAS8PV3?=
 =?us-ascii?Q?X+jlseSWyv/nRhVRJ6c8KBFHkvRbVC38QQJHJ9ujwI0JCnU1apvJ/VZDWmWX?=
 =?us-ascii?Q?UiCvvXC0MCvaqjNTLBQnI8G1p6B6+wkiixfzxPDq1XwR2I3DFwlJ3NIfw0eN?=
 =?us-ascii?Q?7g5YOQ9ifU9MOgNxx+NFs0s3BE652vUcXjo6fmgJy1Sfpem3DW16ckZDWnzm?=
 =?us-ascii?Q?3mFsNx8CwZHIbGlue5qU/3rX3Z0s5PmZn+0RkK/Fzpu+kDH/iI+KclaKJNUq?=
 =?us-ascii?Q?Z6RolWCUVtD5gebYNJUHvhDSl79DEoMUE/KpPs4pfUbrU3fFi8YrXQh2oaTe?=
 =?us-ascii?Q?V2qPRBq30kMPk/WCqYcSkgvMqH6C8r1oiNk5DvfPTxdBF8YQGps+P/4YVj/H?=
 =?us-ascii?Q?WHt3P3+gY7ucPJztK2u9qFh8XWCQuIaxh0rBp7vzw3WJEoB+wjcK0uhigxBx?=
 =?us-ascii?Q?Vi//4a2J5p7p7A4pZuYCZ48TK88kY+dKjL5kQvDXO2LkWI2BRbbjL6vXUUSY?=
 =?us-ascii?Q?ZJoaLQG1Xk7+1JOK8cXzOEw/IUrf34WMLsq0Qbl+++La+bcOoSfLQ/lTcoV0?=
 =?us-ascii?Q?tdjvQC+1YwVy9ROqaaNPbTVKSCLmytCBdd4jH+uBtIUXmPaUfwMZ2KJezHpq?=
 =?us-ascii?Q?+edhCCjbztA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5620.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MFcSmUPqHCNMQgcPH/Pe/aQ9LoQWdeXuX0v3t6e2AOPbUmkS6DlWr0yFMqZx?=
 =?us-ascii?Q?W9ZEwQ4aUD/jrpw3lmiWx0AqvsAV7quuapuzb8to1ZZL0tu+iHtNgPsjBhZ8?=
 =?us-ascii?Q?y1AfknXsULlJ6p1Na/gEIabf+8X0ls9rVB/fEf66XeoCSnA3gzfUypFSuOLH?=
 =?us-ascii?Q?kGYnHwX3NM8RlGmeq+kvu+TGIPYKABpNr7czk3luCosxJ2uIdJGl10er5PLa?=
 =?us-ascii?Q?VQuvWQHWUKi1ria/IwYQFKi2fvEN1rsmLZJviEWpFYVwuOjWvyGbRQza9uii?=
 =?us-ascii?Q?HTEZeoahfl7UvatM7t5O10AqTkPcVun3zvLajKDRA1OrL16ftWpJbD5+4qZH?=
 =?us-ascii?Q?Rr9OXNP4MrgRvOR28IEr/rOF7BYq1Jm/rqtx9J/Zw0+WvD0lBWSxoJ3Uns9I?=
 =?us-ascii?Q?LT3zuLiUNem/NrQUlHZ7exI+I8AtJKfReQZ989jBXLU85ft0bNUf2slRog8T?=
 =?us-ascii?Q?F2YSyxkl/ZGjoIj8B7efuJ2iaNUMG51+CxXcl5vPLKEluc0sQXPRXPBaKIr+?=
 =?us-ascii?Q?35OHrYAxAusZVy15vZozcKd+AbHfhFTBsZy+snPKgdJ0qA6aJapODsp78GtH?=
 =?us-ascii?Q?ht3OmyFW5ubqSSkw0e+LPCqAb+TG/spcqFspQihtJdVKZq+U22wNWb1M0W2T?=
 =?us-ascii?Q?dsxs/nOsA5E4K2MucrumKjGBxFIZROlZh2c6zPJiQAHnj/e4VI1vm92q6WHq?=
 =?us-ascii?Q?8nXKH7a7+1XTljw9FMUMnI5Fl44PNjePMjI/d1CJrfOZ4RrOzEHGWSaYsJid?=
 =?us-ascii?Q?sa7aRx+xauj5Z4U3SM1N+LUZ3hoVRDreghMxRmBjpfUCq2aGmOSo1YR2+Nrd?=
 =?us-ascii?Q?0U8xyXjPF5Fq+1CYizZY0UZ56O1VURkPSaq7+qStdzjhPoRbJnoPBuG8g3yG?=
 =?us-ascii?Q?c2gwZKXJYOchQN7Ay/tZJsMDJhbeTZnE96UzQcxoNFSobrKFNd1sRdkgsP6H?=
 =?us-ascii?Q?lObRJNU+aSFAXkrraHOK9R1W8THf6iL7IQFcjok8JBlqOv4YRa0T6me7tpzR?=
 =?us-ascii?Q?blxcvwnkNExKqhu/UMAXoKVcbsLkVXIRUHX985uhwa1L8is4aTBlNjVyUWb/?=
 =?us-ascii?Q?ErYqhljDMwtoo/BRw/FaKrOUNRHeMSFy4Vy4SrCfmYY7fqIWC2ggUtvFqzNF?=
 =?us-ascii?Q?mZt9rDUMbDPPvxICg1czHqjvAuRyt9vBDVLK9W71hiV9k59H2LaUQV0e1tf2?=
 =?us-ascii?Q?b0AH2yhiOEPJplYMRzr6bIMwceL3/9xu/jcuxwrVFHYtlZvGAsoJs74vqfsV?=
 =?us-ascii?Q?sF3m38j7GDhAOxQ9hXHqu92PQxkNxEnZ8FL/T/S8FxJRTDCxjFd978j8H4b4?=
 =?us-ascii?Q?XkluWPx3zNE3KNtkGTmUjvsmkKRsbEtNE5UZwuV+N1MvuMKI2nLkVIt5m4DG?=
 =?us-ascii?Q?yU+Ky1CKnf8KB6/iaJaxlT1T/ZjEEF9r4+h/WcbtkSJ0gJIp2aZ/JTn6vQZ3?=
 =?us-ascii?Q?epxYV4Ro3Fgj1Cm2eNIP/gxamf/6SrltI+WdoxAKXtjre7OO/xoTqwvYNnQf?=
 =?us-ascii?Q?FjMFV7R+JSYrhuRa8fK2Z8rrg5WPNSebli0P2xUCs5vMpt4RqACWslCPBrOX?=
 =?us-ascii?Q?3TdAuUyIUiKbJWH1cZeTejHOswIKrq08JWgWMihf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552164c2-1af2-4950-022c-08dcc25c40a7
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:41:05.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vZGft7/0eMr3U3Q5bwnfpeg0mQE/FyoMvLYB7c31Ixzmrv2/Fnr9r5D71LBZSV95IH5TUOTOBqrBbOUPe9yEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5892

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
---
 drivers/tty/serial/mps2-uart.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/tty/serial/mps2-uart.c b/drivers/tty/serial/mps2-uart.c
index 2a4c09f3a834..e582fd6c4632 100644
--- a/drivers/tty/serial/mps2-uart.c
+++ b/drivers/tty/serial/mps2-uart.c
@@ -550,19 +550,12 @@ static int mps2_init_port(struct platform_device *pdev,
 	mps_port->port.ops = &mps2_uart_pops;
 	mps_port->port.dev = &pdev->dev;
 
-	mps_port->clk = devm_clk_get(&pdev->dev, NULL);
+	mps_port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(mps_port->clk))
 		return PTR_ERR(mps_port->clk);
 
-	ret = clk_prepare_enable(mps_port->clk);
-	if (ret)
-		return ret;
-
 	mps_port->port.uartclk = clk_get_rate(mps_port->clk);
 
-	clk_disable_unprepare(mps_port->clk);
-
-
 	if (mps_port->flags & UART_PORT_COMBINED_IRQ) {
 		mps_port->port.irq = platform_get_irq(pdev, 0);
 	} else {
-- 
2.34.1


