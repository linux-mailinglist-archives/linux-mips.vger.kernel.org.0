Return-Path: <linux-mips+bounces-5016-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE2B95B6A9
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 15:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B30A6B278F5
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 13:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFA51CB150;
	Thu, 22 Aug 2024 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ZmKq2Z6c"
X-Original-To: linux-mips@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2088.outbound.protection.outlook.com [40.107.117.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A10181310;
	Thu, 22 Aug 2024 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333356; cv=fail; b=o0iB0tvXEGQFI7aqgbzHKlZnEN1EUnQ0hgQCWleGWGwC+Xmn7GQJ0MV5xAdCYD0FNd7dCcKkZllF/Z6sFnTKT1T2W0MrY7KjkSY52Pk3ZUY6fyJEGoxfBv21jdN5Tnsy2DnoPmp68i7iE5xGdzf/tFS8UkVzceNsraekIT4H0fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333356; c=relaxed/simple;
	bh=JECToVkFLlNiHaOQzW7xpBIW9NhWaVvTbzCs5S6AFTk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GRwW63UpjC7oSW+ctTIfrwcdcYmylPg1PdX2sMxfjcRrW5dgliMWW8TcKS/eO2e7lKcd5nvRPLrZpkBbFOH016jIEpcqbTxLq5iAo+i8/Ech3ERUns3DSD5kDfY9f124ADV2cohDZNgk5f7/Wg+Fu5cgFHpYhYiOhlHuXnKeST8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ZmKq2Z6c; arc=fail smtp.client-ip=40.107.117.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fia3i3TDCCOMkuoj0VlFonMQK4PtDQiJkPMPTd1PeHskCZ34B6UXisqOlfGCZzkd2H4jSjcS9lBGRb2wMz5xbn9hgV0JRiEYry4W5BR0oMaYf3tH3pOOxeJWJJDOLy9XeqDaF1r5U3vBqUZle8ClBM7qXsq3vTbTAe+foc6IEemju7Z5sqgV9LiF/aKa4Z61DdiH77xcX7Xf3yt4fzbJQwXEwVx+bD0Kaxs5eJsFkSBtxjb2BIKoF6ZgbaTdrWWz0GAfUZOMAyTF5QQH+XHjf57Uwef5NdKEQkedcBt/YGWqcrlCNjY+fgE41ePtO4FEMYtiAyoWV5dyEGEf2xKJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7xNVZ5yBcUMB2xnNisavoMT8sLO8Z40GDQIv3ICAlM=;
 b=cCQd4sPdKruCk1QPkMHihHWbui8dnZDa5d4ml7/j1cSEwJ+52wuGyC9+w62uYJVCv+/OvPq8qJntyM8VogD+8e8kZooEfmvR8CuK4tMpY/wnFm2TpoVWcvCl4f9kiBrThzZ//SukIYVStB2PwmU7dhbCDBLII7MYnYfPTtIscaAuN/m2OZtfgJ97jI1TeKkFngsDn2njbtGEBUPw7O6+qTjyxZegjMBVzJNJ9R9HseqfnqqGcFB75N7ntyHoC/OJ9EaAOVdx6UqObdEkM9X3vi+QXVsduhjT0eMFUbR0SyzJtdy0O6blqp/D7dtZML9YarJp+YRsQoSSp53iXUw7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7xNVZ5yBcUMB2xnNisavoMT8sLO8Z40GDQIv3ICAlM=;
 b=ZmKq2Z6cv/viUW1+GOI2ql1Hux1v3+c2N2sY2L05sYwni3w/ib0lN/a7BBpaUg7zsxCFT8ew1eC0wbRv9rvbpNJQEXtdVoiOCADYk+SEZmqjVuYVD1YyUY9CkVN/V3ZgpoMruR8GzNsb3PmUmQgZer+CqmwAmzpZdNzmZ3FJ6aRSKmkGCiaI4ZKoKnYWaT5BWYyNkOKFPzRQuRXZyluYKQeNzVROYa55lSCXyLAHoRYG+xPLt38KcIIOVUaerBaJsn9HhC78h8BT1bbw/SWhLg1KFRTvTLQaF90o7HYkg9t5j4ORsQIgSQ79PvMYg0275xPttWOWg9PTv6C7fIi3Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5624.apcprd06.prod.outlook.com (2603:1096:101:c8::14)
 by SEYPR06MB6507.apcprd06.prod.outlook.com (2603:1096:101:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Thu, 22 Aug
 2024 13:29:09 +0000
Received: from SEZPR06MB5624.apcprd06.prod.outlook.com
 ([fe80::e837:10e3:818e:bdfd]) by SEZPR06MB5624.apcprd06.prod.outlook.com
 ([fe80::e837:10e3:818e:bdfd%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 13:29:09 +0000
Message-ID: <bde84e3f-5f16-473a-9674-11bef0bb2c91@vivo.com>
Date: Thu, 22 Aug 2024 21:29:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] tty: mps2-uart: Use devm_clk_get_enabled() helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Liviu Dudau
 <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 John Ogness <john.ogness@linutronix.de>, Thomas Gleixner
 <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Valentin Caron <valentin.caron@foss.st.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 opensource.kernel@vivo.com
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-6-liulei.rjpt@vivo.com>
 <Zsc645l_nFK_Xp-t@smile.fi.intel.com>
From: Lei Liu <liulei.rjpt@vivo.com>
In-Reply-To: <Zsc645l_nFK_Xp-t@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0067.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::31) To SEZPR06MB5624.apcprd06.prod.outlook.com
 (2603:1096:101:c8::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5624:EE_|SEYPR06MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5ac6d6-e3ea-4a3f-9084-08dcc2ae674a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmhTdE5oUWVuZ1AwZlNodnkyMnZ1cWIvTUdxUFk1R3kyWDFheHRuemxDbGpK?=
 =?utf-8?B?TkV5MVNTdk40Wm1JMlAvZ1FDc3lIeEFpSE8rWTM2VXdNNjBHT3BsV1dMdGZ4?=
 =?utf-8?B?Z0JDZkRoUlIycjZFNkFRQkxwR3JpaHQzN0hseU9CcDB6cU5ORU52TnN0NkVW?=
 =?utf-8?B?SWJ5WHdPUGNHM1lkZUpXTzRLY3gwNnljYTE0b0RpWTlHZGk3S0o2dXg1Ry8w?=
 =?utf-8?B?aFZTOW1OU21KRTd0dkUxMnBhbHBtQkFvRko0NFVQWHhMUzZYOVMvUHF4bnp0?=
 =?utf-8?B?UU1qaStFa0xmM1NYYzNZUW1NNHI4WUpuSzhaQlRYUlBzMkpmMlhlSGxVU1ZP?=
 =?utf-8?B?SGRRZlhTcnJ5SlJVamRheHp3NjRnd0VvYW5tZ2M3d3MrMkpoa0tkQzhaSWJ3?=
 =?utf-8?B?M3p1QXpCTTlkR3hZVVliN1ZoU0pnVmJKYXpwRVFMU2lBOTF5bEtZQmFLQXJi?=
 =?utf-8?B?N2hoYmY5QlRLVkx4L2QwRnc5MHJWWkF6Nm1uYmRjOXFSU01CSjRubVRuTVVO?=
 =?utf-8?B?MmdnNjFjK2FpSVhQNDNySFQvbm85Q0Z0b24rR3B0ZHF3cjJOME9vNnY5M0JJ?=
 =?utf-8?B?bXJhdGZOYS9Pc29wVmRvQ091OWZycXZ5b3V5Y3N4NWgxZGpqbG92NE5QSlpz?=
 =?utf-8?B?RkJsdUxoNEs0V1EvOTVERjVEbHpSYkI2RWczZXpFUFJHbGx0OWdYRWhZVzlM?=
 =?utf-8?B?K3V0c1paWFNjY1p4TXVIQW9QamdOL0dzS3RkZ0lTMFVTbE5SUFNOYlhVMFhJ?=
 =?utf-8?B?bFVuTndmT1JRbzFHbG1DU3FMeUx3MVUrR2hQaWN3Sm10ZWU5UWdqN3oyTEhS?=
 =?utf-8?B?aUIzenlseE1NVUVyeWNGQjdlN0FleWFCeldWY0ljT21aTC9ta3o4SVkzMWhP?=
 =?utf-8?B?MytuVVFLaUxheEpNc3c2cG5vbDNTczBwV2ZKN1lBNDEwdnB3aDU3YzVBUVcr?=
 =?utf-8?B?OUxXdUtrY3JyOGJUWkdhMU9NUWdPMUxHR2dHclVDYk5XQ2JXL2lzQ3drUlBK?=
 =?utf-8?B?bEttaU9URkxDakxkUnNUM0dUWkZWYnRLc1gyYXVWVDk5SGtVVm9pMXlHKy8z?=
 =?utf-8?B?S3J6b1VuMXlSZXNtTlAyTHV4NC9ONGVFYlBVd2NCZGRFc0NmOU9rSDZsWndM?=
 =?utf-8?B?dEhLQ05pOXRoeXFKUG1YdmFBOTR2VDZCZnBPVkx3OUVFSVRLNkxuN3JCOHY4?=
 =?utf-8?B?YTJUNkRWWUtkb0tIcVJtWlB1WHZ5MkZHTDJDcUY2T1FoaFNpM3R2eEZmZHgw?=
 =?utf-8?B?bERTRmRtWUdESGRRVHNFOGhYckpMaEpqUWRKS3ZMUFdnUEhudFJqTmQzZ2tN?=
 =?utf-8?B?R0ZMQWhsSDEzZXFHc3NlMmtDb0pkRG1OMWVSSy8wT1dOWVlMcVRISmZBSEJ0?=
 =?utf-8?B?eWdVa3p4bGZJYTNiakg4ZzdleU5lWWNNQ214bFk5K20yQ3lRU3R5ZlpmZy9L?=
 =?utf-8?B?RFcyY2g4aDRrZG1Va25Ya3RNTy80eHQ0cVJIZnlvckljTkNoUTFZTnI1WWdN?=
 =?utf-8?B?VVZQalpaOGdiRG1hQ2pKMzNwY2tlQ3Znb3ZaNy9JZkdiYWRZRk13c0RLK0Mx?=
 =?utf-8?B?TEM4bUt5NkkzWkdwMXRBY1dhRDVhbzFvZi8xbW40RnZrdTJuMUl4WnYwOEI0?=
 =?utf-8?B?dWx4US9jV0tmM1NqUW12NjBINUJEVHlRcnBaa2NXTHZFb3FVTnk1MVJ0Zm9a?=
 =?utf-8?B?ZktyS2d1ZnVmV0RNWGtvUGNhRUFwMDE4cGs2SDE4Z2JRRXdvUjNQbTZyVzBq?=
 =?utf-8?B?VEc5S3VIT2pES0JuS2FmcS9lR1FBWlgxb1lubGNRVEwwellBVVMvd01XZE5p?=
 =?utf-8?B?MDVHNGxUbk16OWhKdDJTSWw5SzIzajNFcWhnY2xReGMzK3BnemY3c25ZRG1D?=
 =?utf-8?B?eGJUakxrWGdzdlY5NVZ6Zk1rbnlsRy9rRERsWm5ZbzFWakE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5624.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWU0ajNhNVo2V2dpRmRkVmZ1Y1V5WENnM2R1WlIrdkNlZU9RcGdYY2Q4S3Ix?=
 =?utf-8?B?MnNuNURmelpPeGwza21SYXFPT3Bsbm53aldveklnUzdUVEEwc2pUUVI1bEQ4?=
 =?utf-8?B?TFpXeUd3dFIybjVXbnN2UUtiV21VSVoxa3ZtV1NqRzVjbHkzTXp3NXY0bjJG?=
 =?utf-8?B?a3VoRUFUMndZNHdOUERzMDNMOXNRRXBoUlNFd1NBUWI4d3kwZ0tjNTF0UlFo?=
 =?utf-8?B?RVduRHNrTDZRejhQVUVsVzhvOWV0SkVIdkRPQ0xURTF4RHppR0lTUTJncWNU?=
 =?utf-8?B?ejlwdjVzSkRvdHRWbjhSSEM5ZHFoREZhMUdMazJxOFZNNGJEQmI5OW1DMFN2?=
 =?utf-8?B?Q24yUnB0bTFPaW82RVV6UndoL0hQYjErWjZpYWNmOXdlNmg5azZwNEZTVkRz?=
 =?utf-8?B?MFJ5ajFKYjZrbW9ESEs0ZmdneENOeDd3Q1cxMzhnbk5ibW5jVWtlNWI3VFdk?=
 =?utf-8?B?M3dKM1pNVWxLWnBjNWh5NWIrV0RUc2M5eldkYW5rOVo5bXFZaG8vOGptY0lk?=
 =?utf-8?B?UWZYcERwZmdKeTRzM2tGTi83c1RCeWlqOFpmR1p2REV1Ti9mL0VuV0NqKzcv?=
 =?utf-8?B?eEJaSjUwbVM5MDJQZGkwcFRhWFpZYmozSlZ3MDU3a3JOckE0ckNRcmhFb1Qv?=
 =?utf-8?B?N2pwZ1FFblVkVzN2Y0orbDhiQ0lnNnZ2T0FQK25PVEhGbWRiZzR5U2wyTVYr?=
 =?utf-8?B?cUZ0QTVPaVVMa2YzdGdPZm11N09Ed2prTytHU0d0ZjhtZlBYcWFXODFMSXFE?=
 =?utf-8?B?bFZCS2l6bjNWU3FrRWdNcmR5bnJ0ckx0ejNlVzNiK0ZRcWNTb1NsTXJTalRp?=
 =?utf-8?B?M1Z3UjRBU3UwL1V1SVV2b1I5aC9OOFk4OG15V3dlZ2N6N1c5R1E4a2VNc0dO?=
 =?utf-8?B?S05yYW52clpuWFNyL28zUmd1TGhaRTU2R0R1Vms0SHFwUS9uT2k4M3BYUHJk?=
 =?utf-8?B?emFlczBKOHlETUtTRFVKODR5YlBIVDhuazhpZlpOdk96ajAzL0RRZ1VPQjJt?=
 =?utf-8?B?OFplem9hMXdNcXBGcEtNM2xQOFdrbGVEUm9vQVFtYnl6a0hHZzY2Ympub1Q3?=
 =?utf-8?B?TlJ1eWZoNm55RXBOc05sVm43WThwQkxJMEZVVlpFVW9ERVJHMDdqT3dKbjUy?=
 =?utf-8?B?Um1xRnlLaEhKbjJJR0dFL0s5dk14UzZ0bGJDaGJoRXFhK1hIQlBZcVN0WXRX?=
 =?utf-8?B?ejJrZ3hQWGZUc2d1M2hVMHFCWUFBZnY0QlZKd3dwR2VVdzEwckFvM3pFZlBi?=
 =?utf-8?B?QkJoaDVjZ21LdzlBUkVHWjVzN24zaDh5REJQS2R3MnBNTHcvaHp1UXo4VkxX?=
 =?utf-8?B?MWt2eUhKamFyQXgyZGh4aEc1c2R5NGJqSmIzL1l2emVncXo2SlVrMGk3akg2?=
 =?utf-8?B?VlJRWGRoVXM3ejJyNjdhNW9KbnFOdkdNREdGa1ZVMGJ2UGt1OFVyVXU4ZGd3?=
 =?utf-8?B?ZXBlYUN6aTkrZzVQUENFWlNLYWxZV0VxWk5xcEM5dDc5UmM4TWFsNDkxM1hL?=
 =?utf-8?B?bEI2N3ZkN29ya0Y4YkFPLzFBdWxhc08ySEZEd0RsNGVHQkRkUENKZlJOck02?=
 =?utf-8?B?aTduZHVJNlhueFBBeVliaVRrTkdzRHp0OXk2U0pTNHJSWFpVa25NcGV0VHl0?=
 =?utf-8?B?dlk2Y1gxeGtYNWFhQkpLTnZzUmNEL09RcU9rUnY1anBTOU12ZUVHMXZYam5z?=
 =?utf-8?B?NEZtclA5a3ZCWE5aTGdFbDBmai9NWVdERGViUVZIakNrYlBQSzNLS0lWQWdp?=
 =?utf-8?B?K0xZZHVCenZra3VCMkdGelRrdm5XTlo1WGwyVE1QenlweTdadUV1RnM4YUl4?=
 =?utf-8?B?aDhzRWxiQllRdkhhTDRNTzRESmMrTmdGUHBFNlRuRHVoRHhRaEM0LzBqTDgz?=
 =?utf-8?B?bkg1WVVaMVJEUGtKUXBZMkdCeGFMeGdhc2JoWUc5NWZRdGlraGtiVFBmVGR4?=
 =?utf-8?B?ZkN3L21VOWVnUkxiNWxsclV2NjQxVE4zSkhmbkppMjRIY0pxUFViMzQ1NWtr?=
 =?utf-8?B?LzJldDRNOFphVnRlR1VsVy8xK1Y5b2w4ZWZ4MEJLcXNYVExUMXJpanFJMTli?=
 =?utf-8?B?V1ZCdFNZWUlYTFUrSmNmT2QwSHFTWkxiaWVtRzlNVjlLM1h4ZjU5M0luTkFk?=
 =?utf-8?Q?5zKLGp0Y3ow/IkDLxeWMndyj6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5ac6d6-e3ea-4a3f-9084-08dcc2ae674a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5624.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 13:29:09.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiRJMK/EspSaW9YGoIW3incObsAvULEGNRnlTOdGSu1ld9UpYKQMjAZbW1aydA09ngxF6PxO+W+X1f1PJipVkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6507


on 2024/8/22 21:19, Andy Shevchenko wrote:
> On Thu, Aug 22, 2024 at 11:39:09AM +0800, Lei Liu wrote:
>> The devm_clk_get_enabled() helpers:
>>      - call devm_clk_get()
>>      - call clk_prepare_enable() and register what is needed in order to
>>       call clk_disable_unprepare() when needed, as a managed resource.
>>
>> This simplifies the code and avoids calls to clk_disable_unprepare().
> ...
>
>> -	mps_port->clk = devm_clk_get(&pdev->dev, NULL);
>> +	mps_port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>>   	if (IS_ERR(mps_port->clk))
>>   		return PTR_ERR(mps_port->clk);
>>   
>> -	ret = clk_prepare_enable(mps_port->clk);
>> -	if (ret)
>> -		return ret;
>> -
>>   	mps_port->port.uartclk = clk_get_rate(mps_port->clk);
>>   
>> -	clk_disable_unprepare(mps_port->clk);
> Your change is not equivalent. In case this clock is shared this may lead to
> run-time issues. Hence I don't think this patch is needed in this case.
> Instead, you may add a comment on top of devm_clk_get() to explain that we only
> need it be enabled to get clock rate in the probe.

Thank you for your suggestion. I will adopt your advice in the second 
version of the patch and make no changes.

---
With Best Regards,

Lei Liu


