Return-Path: <linux-mips+bounces-9593-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04537AEFF57
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 18:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46EB24A38B1
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 16:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D068527990C;
	Tue,  1 Jul 2025 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="L76V835o";
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="L76V835o"
X-Original-To: linux-mips@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022137.outbound.protection.outlook.com [52.101.71.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28EF19FA8D;
	Tue,  1 Jul 2025 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.137
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386571; cv=fail; b=tvLiH13LJ2ZT5O2vkAwjt1EYZY9g15Y6ibP/xOrPm5l+mRPsRxTax7UblLrXKCdSC1MC2khD8ISkWm4G7biMk1zXXDq7WrFXJgEQBRHjM7IAFCuxK/K+ZZaKdzaViFj2zKVlI7ofc0Mo1DfKamfL8BRRtGFdK97p1PdXJCY8Kw0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386571; c=relaxed/simple;
	bh=wvGOG91MatwYsBxYVp2gtJtH9NcmIavAed1YfonG868=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ll0EzZ5IY29pyXycrH00kJqhfYk9G0pNuRO8vDtWOeMPcZ0ioFxeV5OnAFz6rJV9rRQKPNO9TYpjBIVvJ6vJ0W79998564+ctSek3rjdms9U+Uwk5zUdyw55dSocNN8X8U3S9uMBdpz8hiYT1AgF5ARED++C6CQHWMpSRSiG6lc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com; spf=pass smtp.mailfrom=seco.com; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=L76V835o; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=L76V835o; arc=fail smtp.client-ip=52.101.71.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seco.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HiwG//WiRRAxc54F89CCsCdk52KIKUSoKpDR3hMF0DK5h1/ykluYsGVDfqNVShDjwtwpE2q3SuTLPw4YEesi5ZMb0zy6VWgeD4WVzjnKQP/xtuHpcWD8TF07a0JLDsSEtnEpsB9K9uNsARuULQbZl/7P06QNb/vlFs5KuqSnfHB2J+lbvipGwEbts2e33a5LYF+mZnp0XG5qEBcTPqV+cuV2R1d0yLTezNbILaC6Mdpt0vlMjii4cNarRwZKw+0xXW2+mEN8Ivps1QzpShGg44eSb3uVYUxpxv0R2g0dkz7bdiRFoBIqDaGfKH8LTk7KhY+YXCEE4q7j4sRL1g6OFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+jTIleucttIfsityKQJpSJDkaWAhANOPKvSi4mMRPM=;
 b=Dp5qdhm/9+0cjtbhljcfVuUY2QFrVK9x994QOdMDVZ6gnr8PqepPZgHB1wR91xUUHdnCMyhjzoyGGTL5PeUQ57Q+tiSj3eoeL1GI92aIuvcClgqS/BkJPPGaC51v0P1qfqFEfUyyVlErX3MXRANdCYE9XpuPhK9qEsKgmiWsW44o9hIx/AUZzhIzXdGJhbALGI2OaLgVoy3nBuNE6ozgqFsPBeYz96LOojU7JNRg0joyVfsEj5g40hIV/B8u3+adG7cdpcXYcjPkzA1+Mxh/FTRf0SAa5CWaRL34JC7gPzQOo7OmD3L601g/a6Nmok8VH0sUiJdcQHWrSpkg4LXDWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.83) smtp.rcpttodomain=alpha.franken.de smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+jTIleucttIfsityKQJpSJDkaWAhANOPKvSi4mMRPM=;
 b=L76V835oea6Z6xZcYU+n119v4oGOOHtYRz4zkEPiSaGE533WtocXvcNbImk+xPYqsSXcbYb1m31ivLOpvX35dsJQ5llqbaZ7WnrVCIO9KDNLlBrtZzdi82PRCM2undnAl3UmEri+DtdRYEfEFD2LCTQJbL+vGyi3AaaElFgIN3peNTKI1lkZkW1NVem2RZgmlwzK4atRTRYDoSJDQ5FFUsGvcMQWWcM/AvNIabRx2sz6fisuVU2iIyi7WByc3NwIMW4YWfCRZFlTvVBJZso9bNILWCOM1M8WPvyp4Z5tlSB6VRxjxCSZutY7QCk8Rd4lTClXUW9flarmPJ9JHjUmOA==
Received: from AM9P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::23)
 by DBAPR03MB6535.eurprd03.prod.outlook.com (2603:10a6:10:17c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 16:16:05 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::d0) by AM9P195CA0018.outlook.office365.com
 (2603:10a6:20b:21f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 16:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.83) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 16:16:04 +0000
Received: from outmta (unknown [192.168.82.134])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id D42FA20083983;
	Tue,  1 Jul 2025 16:16:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (unknown [52.101.65.80])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 7037C20080076;
	Tue,  1 Jul 2025 16:16:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0RXommwIfJ1eU9vt1pgFcYy+xrp0R7IFerD31iRHjeikyrEsZFwZk1Je0tbMn7pQwRXE9HRJCjbEsmed69a5yCgRjlcZIeQG+Z2d4NXblFKc5Xe+62yAzQesstKqc6AxB0Weshlxe2mT2sG9tKBuDGppR6VduFqbDK76l1LTOIllKfybOzAJDfwPQdlFme5kaQLAZv7RfehprBTc5Tkucja8uJWjC1IHbyAH50XgzhSS0MK0wfOsUXRbXYV7epgh5jMG7YRg+aM1KUgnHwKLydDdx9i2K1vSpRhMMxrzYQkfsiPRXYcptD73AGj5asv8T0TUGuoxVoszrCJ69cTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+jTIleucttIfsityKQJpSJDkaWAhANOPKvSi4mMRPM=;
 b=wASw0IXGt9bHoDxCRRHX3F4WTYRjnrbZG/HDbLKFoWgPncraPDqS7usnuxKeQL4Gz0bxFhcS6zvPWnXjKTy4PqyKG2CYLCb5aKoLMkQHHSmyd3YtDcKVdSa1LMz/UpGl51Fhh1DIpeUXYGVQRgmm3FxGZLRVRuqyjlj0HErdsyB9D+N8lEXJaAs9Dn+76gxdY1wq0RylW2dnhdYlRoho0KV/cwIPIKcoFgD1s8GuZRzI8/f9GqUC4w8Fpptpm62Uvfg6loHcEeJ5ybf3QlMQA/T92xkxsnK4GyBg3l0JtqIcYcwxLLhuW7PLADbtJHutcnKxvZjYdbQygKOweWJZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+jTIleucttIfsityKQJpSJDkaWAhANOPKvSi4mMRPM=;
 b=L76V835oea6Z6xZcYU+n119v4oGOOHtYRz4zkEPiSaGE533WtocXvcNbImk+xPYqsSXcbYb1m31ivLOpvX35dsJQ5llqbaZ7WnrVCIO9KDNLlBrtZzdi82PRCM2undnAl3UmEri+DtdRYEfEFD2LCTQJbL+vGyi3AaaElFgIN3peNTKI1lkZkW1NVem2RZgmlwzK4atRTRYDoSJDQ5FFUsGvcMQWWcM/AvNIabRx2sz6fisuVU2iIyi7WByc3NwIMW4YWfCRZFlTvVBJZso9bNILWCOM1M8WPvyp4Z5tlSB6VRxjxCSZutY7QCk8Rd4lTClXUW9flarmPJ9JHjUmOA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by PAWPR03MB9858.eurprd03.prod.outlook.com (2603:10a6:102:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 1 Jul
 2025 16:15:59 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 16:15:59 +0000
Message-ID: <c0037d24-5e24-4682-bc51-889a854d409e@seco.com>
Date: Tue, 1 Jul 2025 12:15:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 10/18] net: macb: remove illusion about
 TBQPH/RBQPH being per-queue
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Rafal Ozieblo <rafalo@cadence.com>,
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-10-ff8207d0bb77@bootlin.com>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20250627-macb-v2-10-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:207:3c::47) To PAVPR03MB9020.eurprd03.prod.outlook.com
 (2603:10a6:102:329::6)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR03MB9020:EE_|PAWPR03MB9858:EE_|AMS0EPF000001AF:EE_|DBAPR03MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: a2205764-b992-43dd-5d60-08ddb8ba93e5
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VDcrem9kUDJtRTdtVHpXT0tRbm50WE15K1VJKzJ2UnhwZElidVljc21MMjRl?=
 =?utf-8?B?VGRmMGdCbitGMjNva0NuSTFpU1A0NCtOdUJLYmdXa0ozclp2ck5hMlhtTnE0?=
 =?utf-8?B?akpETmgyY1ZNTjBDbThWYXg2SkdBV0VlM0NaMUdNOVpaRXp6WWpmYXFNRjFQ?=
 =?utf-8?B?bWxueHBJRGlMMk5oSnBEK205YU5Cck82ck53U2I1R2pCdXlhK2NHY2NtYlVT?=
 =?utf-8?B?UUYyMy9ibTIvemJtZmltM05zUUFMc281Nk1TRU45NVNCQnpCVHVXTDhrSDlW?=
 =?utf-8?B?bWNyZlhWTEkvcks1Tnl1TzJHeXJENll2aU5zaWtaNy91dUhNWkFrMmtqaUJN?=
 =?utf-8?B?VEtlaEJrL2hIbEZQUU9LWXUyYXhYQUFjZHV6enhJeUcvVFYxeTBDQnhwemQ0?=
 =?utf-8?B?SEJOMnR4SlNneTRIMmkwR0JoNzVyc0o3RXMycWNWMStCN1BxbGVKUzZYWVZ4?=
 =?utf-8?B?eDRyWFZSR1Fmd2lHL1RhakZiWVBPK0o4bnQ5YXo4NEptdXU3UzkyUmVQZUFQ?=
 =?utf-8?B?dnBMM0tCVW1ySFFWeVhKb0NSd1laaS9zVGNRblRnaVJwOVhiMTRXRlBuejBO?=
 =?utf-8?B?SXNZV1liSElScnpXQnF3UmJkd1ZUL2RxRWVNZDZQZG9OK2NzdEh0NWxkeTY5?=
 =?utf-8?B?ajNZNTU2allqeU5rRFVsUUs4OUJnVFI1K0k4ck5WcXB0bWttMTBIMldEVUJv?=
 =?utf-8?B?dC9mVkpHQmNENnN4L0p3RENIdlVqUGlwN3BHNG52RFh3bytxZ1AzRDVvRmJa?=
 =?utf-8?B?L0kreUFucHBTaloxVEVwakg0aVArZHBSd1FlWkozQ1R6eGlnYXJtd3hBRUtV?=
 =?utf-8?B?OHd4ZE1MbCswVTM5bHNZM0RSWHY0ZG54RmxPK3piZzVuNlNRcEJVZ2ltS1lF?=
 =?utf-8?B?d054aVpCemZ3TWJ4TEZHUFYvRmxsL0FHaEYwV3BDZ3dJV3JoaG4zOXBJR1p6?=
 =?utf-8?B?bUkxR2MzVzUrR3BKc3dZaDRkWFRDUkp6YWdmbE1OcnJFZjlEaWRaaDVrK1hF?=
 =?utf-8?B?elVON1BvbUZNbkpCV0lqSUFrREdJb1cvZ2RXRGIwTk96NUtFQ0htdjhWenZ0?=
 =?utf-8?B?NFhpVUZGZWtDZmIvMGlhbTcwTjA4elBLYVdlNkx6cjlnc3RiZ2k5TkNPME4w?=
 =?utf-8?B?VjM1YjlZbUNoZnpEYnllTDQySXhrSGJocmt1cWk1UHNWRXR6cFlLU1ZPekFu?=
 =?utf-8?B?VFlLd1JLa1h6UkMzYmxHWFA4K2E3bHhpdE4vUzE5Ny9jOHhkZDV3R2NQSFV2?=
 =?utf-8?B?MWhGS3FrbTEvb0FiWjI1Wi9UMlUrQ1VwNkRuSCszVjQxOWJzVUk1UzRJbzJT?=
 =?utf-8?B?V2lYRHZZeDBEK0pEdGo3OCtzLzM0NlRVUTVVUXQwNkZoWjg5VlpMZENxZi8z?=
 =?utf-8?B?TWdsWHV6KzRhaVM4VzB1NUtRNTU2b2RTRzZjKzNIMTFXWTF2T2hWN1Rkblpi?=
 =?utf-8?B?dTAyZjQrWXRnOE00Zm9YdlhzeWswNlo4dWIrbTZ2VUhyc2pDblJ2d3llQUU2?=
 =?utf-8?B?Y01zeVZSOFBYZWs4MlpXa1EraUN6ekpuUURPcGZqa0E2VlRmakRDcE1uWldv?=
 =?utf-8?B?clBEZ0FZdUZQQnpFYnpTQ3ZVaytIMTg3QjFveTVMcjhDVVVPQlk4TmUvWkJs?=
 =?utf-8?B?dW9QdlVzVC9jam9XZHFQZDE2K2kxQm84THNYZ1N2b2d1UEgvaGNOYjBRdnJz?=
 =?utf-8?B?YXoyTW0rSGI4VC80alBwd3JyR1pPN3VZdnF2Y1JhZFFNQ1dRcHp6alVwVVRs?=
 =?utf-8?B?UDhpWU9OTGEwYm1Pdnh1Slk0VnNJSExpcXNHTEhvOWlvYVh3TW83TmFaVGlH?=
 =?utf-8?B?aEJuT1Nwbi9mUmxPMEFFekVvdW5iZDJqZHNJdFdGWU5YV3VQd0pNRjkrR1Jk?=
 =?utf-8?B?N29SM0JtWVRaMFZvRWlkV1N0cW1UN2lPaDliOFZVaUpYL2FiTmJEWDlsMXNC?=
 =?utf-8?B?SmdUZ1pXN3FJUFFnYUNyWHlIUXNvSDh4M0dsWGR2NTM0cWJkOGg1dk8ySGpQ?=
 =?utf-8?B?eU1zaE1oNkNBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9020.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9858
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	989aa8ce-a947-452c-b560-08ddb8ba9109
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|7416014|36860700013|35042699022|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDF0NEtwbXFFTHk4eHZXWXNxTG0rdXV4a29lTjRHeUdmRkdHNnZYOGtndmNy?=
 =?utf-8?B?VVBsbXVVbFpnUXMzWWxFY0VvdzdGcDBXanZtci9XaEN4aUNXOExyWlI0Vk5M?=
 =?utf-8?B?S3llWFlWY3UxV1M3clNIVHB3RGNYWXZOMHRBdmc1VXh4Ky9OdjNxWmo5c0lW?=
 =?utf-8?B?LzhDZUpORGxjMEZSVlY5ejRzWkZJQlowTG56ZW92ZmhPaWgwRGI3bnB3ZlRu?=
 =?utf-8?B?dHgwcGo5V2VPMU5ERUFFUmIremxpemIrVk1LcWxZa21sWkMwdXpWZ2RZczZx?=
 =?utf-8?B?aElxdmlDSS9Rc2RySDFHUlA3aHc1aHFLbStONmZiUjR3SkIxcGhmL1BZL0Zo?=
 =?utf-8?B?YktOSDVXNXRtSGU3eTdFaC91Zy9qSlVVcmhjU1B3T0pIb1dCY3gxNnUrZmRR?=
 =?utf-8?B?QnRRd0puaXZzT2lSbjljbVY4SzhMbGdRT1dycmNsZFNnVXdJVS9hQVI2TE93?=
 =?utf-8?B?VjM0NDMyL0Y0QUt5cTNETHVoWHNDbk91OHY3b1hub3dpQndGakpvK2l1bC9Q?=
 =?utf-8?B?UnBvdytLaWVubzA3UkVmampOVmdGb0x2d0NGSXhsYy8rOTVDeTl5TmVWb3pU?=
 =?utf-8?B?alRoSGdMYWxyMEFweUZKQndJNk80UzRTTDNLYmRIUFRmR25Ec1pSRXNpMUdL?=
 =?utf-8?B?YzdkQ0tUZVFJWHpPSnBaV3drVmpqcW1hWURKU1lUemVOZE1MQmpyWnRleSta?=
 =?utf-8?B?dXhGMlh1cVNMRlFqYTZaWGJsUE5TV0RESFNwWjVLTExGKzZHTWxVamJLYWxU?=
 =?utf-8?B?VXI1WlFCZXZyTmIwMlU3V3pEQk9xbmlMeHhMemg4TUtLSnVmY0dOSXk5ZUlS?=
 =?utf-8?B?bWVRaEhwN0RvNE1leFNReTZpa3lPdlY4bUROMWVrN2trYWZ2bUZVWnZyOTd1?=
 =?utf-8?B?ZmphdG9JUkV5cEtmUzZBOUttQ2JuN2RGRXJKVndoV0MwUy9zaEJYMVVoWFFC?=
 =?utf-8?B?cXNhc1k1RFVvRkxwTnA4b09DQTNLbnRidEJsL2NGaUhnT1ppaURrbWpjZTNY?=
 =?utf-8?B?ZUpGeFZUMmZxNWtwWjNWM0dFeStZdWxjKzU4U3pOMmoxQzNyaWIwQ0pIbFhP?=
 =?utf-8?B?ZFFTTUZVMFRIaXp6aHVMdjI3RWxPVUNVS3JQbGk0WmpTUkgwZnVYSkdqZmFu?=
 =?utf-8?B?dzYwUHFlakk5YVpSRldQNEk5S0U3dGpMSitibDY4WXFTOGh5alRNckJQYnJP?=
 =?utf-8?B?aHFNOCtzcmx1MEpLdkRRSk4vN09JaGd3ek5lb1BGWURKVXc4Tmw4TVAyMTds?=
 =?utf-8?B?TldqWExhQThoRTdtRWxCOFlqb0ZXSVB4NE5SdmtUdW5tN2RkTmxKRkVMWG9Y?=
 =?utf-8?B?MU1OeWQ5Nlpwc0tUVmc1eE9rVCt2OERvN1dPMGxCN2t4Nk42eFByN1p5QkRF?=
 =?utf-8?B?cm81ckp6Q0dtYXk3Z2k3V3BieS9vUU5VT0NheXFiZU1UWDlnUG5UaWhwcnVn?=
 =?utf-8?B?dzFFbkVLSms0ZUtoRHhjcUVmZWR4cVV3akRJbFhWRm1OeGRkQmRCSjdGOHUx?=
 =?utf-8?B?SkdWRWxvWTR5bCtpOWo4dHdvZE5PRW45LzFjSkF1K3ozWnkzMDB6dGFCTzl0?=
 =?utf-8?B?dVlOaXNZa2sxVmp0Nm1BRWZuUmIzYXh4R2F0YzVBb2YvTFRxYVB3Ri9zWjRo?=
 =?utf-8?B?QnlhNjZRNGVzWVNHcFM5MmZLNi9QOEZadXkyQmVIeVpkenRadWdZVjJEeVlh?=
 =?utf-8?B?TmRCeDNIaVlvWVkyYzFZQmV6SVBoMmkyTk5pZnM3WG82NTZKd0VaeDFHeUhQ?=
 =?utf-8?B?VGF5MmJISk9UQmRtRkQ2Qll5bWIzMnVHeXNtcmM5M2JmY3htMzlXN2tRNkc0?=
 =?utf-8?B?bXExa1JPOS9XOUxJekxoQVcxYkhFb3VHTlZHb3huN3BOeE9XMWNmK2FySURV?=
 =?utf-8?B?L0dUWXBKUWlQZU8zVjlLV2RyZXhZVk51RlJSQ0J6MHdnMTFNcC83NGx6Z2p3?=
 =?utf-8?B?bThPSUZYTVFla012RWJoWmNWMjdoc0FBZXNXeTJJbERQRlZWbFJwK3VDU1Zu?=
 =?utf-8?B?ZXdzSjJlVmRmVzhDQVZvYkg0aWJjWXF3OUZkNVJZbm1RRzVVVURFR0hxVWtG?=
 =?utf-8?B?bU8yaTljVnpKLzAyZE4vZldUcG0xRzd1L2dhUT09?=
X-Forefront-Antispam-Report:
	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(7416014)(36860700013)(35042699022)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:16:04.0957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2205764-b992-43dd-5d60-08ddb8ba93e5
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6535

On 6/27/25 05:08, Théo Lebrun wrote:
> The MACB driver acts as if TBQPH/RBQPH are configurable on a per queue
> basis; this is a lie. A single register configures the upper 32 bits of
> each DMA descriptor buffers for all queues.
> 
> Concrete actions:
> 
>  - Drop GEM_TBQPH/GEM_RBQPH macros which have a queue index argument.
>    Only use MACB_TBQPH/MACB_RBQPH constants.
> 
>  - Drop struct macb_queue->TBQPH/RBQPH fields.
> 
>  - In macb_init_buffers(): do a single write to TBQPH and RBQPH for all
>    queues instead of a write per queue.
> 
>  - In macb_tx_error_task(): drop the write to TBQPH.
> 
>  - In macb_alloc_consistent(): if allocations give different upper
>    32-bits, fail. Previously, it would have lead to silent memory
>    corruption as queues would have used the upper 32 bits of the alloc
>    from queue 0 and their own low 32 bits.

While better than silent memory corruption, this is not a good solution
since bringing the netdev up will now randomly fail. Can we allocate the
rings in one contiguous chunk instead?

>  - In macb_suspend(): if we use the tie off descriptor for suspend, do
>    the write once for all queues instead of once per queue.
> 
> Fixes: fff8019a08b6 ("net: macb: Add 64 bit addressing support for GEM")
> Fixes: ae1f2a56d273 ("net: macb: Added support for many RX queues")
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

As this is a bugfix, can you move it before your cleanup patches? This
will make it easier to backport to stable kernels.

> ---
>  drivers/net/ethernet/cadence/macb.h      |  4 ----
>  drivers/net/ethernet/cadence/macb_main.c | 36 +++++++++++++-------------------
>  2 files changed, 14 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index 707b3286a6b8408a3bc4bbbcb1335ae8c3cd95ad..adc70b6efd52b0b11e436c2c95bb5108c40f3490 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -209,10 +209,8 @@
>  
>  #define GEM_ISR(hw_q)		(0x0400 + ((hw_q) << 2))
>  #define GEM_TBQP(hw_q)		(0x0440 + ((hw_q) << 2))
> -#define GEM_TBQPH(hw_q)		(0x04C8)
>  #define GEM_RBQP(hw_q)		(0x0480 + ((hw_q) << 2))
>  #define GEM_RBQS(hw_q)		(0x04A0 + ((hw_q) << 2))
> -#define GEM_RBQPH(hw_q)		(0x04D4)
>  #define GEM_IER(hw_q)		(0x0600 + ((hw_q) << 2))
>  #define GEM_IDR(hw_q)		(0x0620 + ((hw_q) << 2))
>  #define GEM_IMR(hw_q)		(0x0640 + ((hw_q) << 2))
> @@ -1208,10 +1206,8 @@ struct macb_queue {
>  	unsigned int		IDR;
>  	unsigned int		IMR;
>  	unsigned int		TBQP;
> -	unsigned int		TBQPH;
>  	unsigned int		RBQS;
>  	unsigned int		RBQP;
> -	unsigned int		RBQPH;
>  
>  	/* Lock to protect tx_head and tx_tail */
>  	spinlock_t		tx_ptr_lock;
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index a6633e076644089c796453f856a766299bae2ec6..d3b3635998cad095246edf8a75faebbcf7115355 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -482,15 +482,15 @@ static void macb_init_buffers(struct macb *bp)
>  	struct macb_queue *queue;
>  	unsigned int q;
>  
> +	if (macb_dma_is_64b(bp)) {
> +		/* Single register for all queues' high 32 bits. */
> +		macb_writel(bp, RBQPH, upper_32_bits(bp->queues->rx_ring_dma));
> +		macb_writel(bp, TBQPH, upper_32_bits(bp->queues->tx_ring_dma));
> +	}
> +
>  	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
>  		queue_writel(queue, RBQP, lower_32_bits(queue->rx_ring_dma));
> -		if (macb_dma_is_64b(bp))
> -			queue_writel(queue, RBQPH,
> -				     upper_32_bits(queue->rx_ring_dma));
>  		queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
> -		if (macb_dma_is_64b(bp))
> -			queue_writel(queue, TBQPH,
> -				     upper_32_bits(queue->tx_ring_dma));
>  	}
>  }
>  
> @@ -1145,8 +1145,6 @@ static void macb_tx_error_task(struct work_struct *work)
>  
>  	/* Reinitialize the TX desc queue */
>  	queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
> -	if (macb_dma_is_64b(bp))
> -		queue_writel(queue, TBQPH, upper_32_bits(queue->tx_ring_dma));
>  	/* Make TX ring reflect state of hardware */
>  	queue->tx_head = 0;
>  	queue->tx_tail = 0;
> @@ -2524,7 +2522,8 @@ static int macb_alloc_consistent(struct macb *bp)
>  		queue->tx_ring = dma_alloc_coherent(&bp->pdev->dev, size,
>  						    &queue->tx_ring_dma,
>  						    GFP_KERNEL);
> -		if (!queue->tx_ring)
> +		if (!queue->tx_ring ||
> +		    upper_32_bits(queue->tx_ring_dma) != upper_32_bits(bp->queues->tx_ring_dma))
>  			goto out_err;
>  		netdev_dbg(bp->dev,
>  			   "Allocated TX ring for queue %u of %d bytes at %08lx (mapped %p)\n",
> @@ -2539,7 +2538,8 @@ static int macb_alloc_consistent(struct macb *bp)
>  		size = RX_RING_BYTES(bp) + bp->rx_bd_rd_prefetch;
>  		queue->rx_ring = dma_alloc_coherent(&bp->pdev->dev, size,
>  						 &queue->rx_ring_dma, GFP_KERNEL);
> -		if (!queue->rx_ring)
> +		if (!queue->rx_ring ||
> +		    upper_32_bits(queue->rx_ring_dma) != upper_32_bits(bp->queues->rx_ring_dma))

Can you write this as bp->queues[0].rx_ring_dma for clarity?

>  			goto out_err;
>  		netdev_dbg(bp->dev,
>  			   "Allocated RX ring of %d bytes at %08lx (mapped %p)\n",
> @@ -4269,10 +4269,6 @@ static int macb_init(struct platform_device *pdev)
>  			queue->TBQP = GEM_TBQP(hw_q - 1);
>  			queue->RBQP = GEM_RBQP(hw_q - 1);
>  			queue->RBQS = GEM_RBQS(hw_q - 1);
> -			if (macb_dma_is_64b(bp)) {
> -				queue->TBQPH = GEM_TBQPH(hw_q - 1);
> -				queue->RBQPH = GEM_RBQPH(hw_q - 1);
> -			}
>  		} else {
>  			/* queue0 uses legacy registers */
>  			queue->ISR  = MACB_ISR;
> @@ -4281,10 +4277,6 @@ static int macb_init(struct platform_device *pdev)
>  			queue->IMR  = MACB_IMR;
>  			queue->TBQP = MACB_TBQP;
>  			queue->RBQP = MACB_RBQP;
> -			if (macb_dma_is_64b(bp)) {
> -				queue->TBQPH = MACB_TBQPH;
> -				queue->RBQPH = MACB_RBQPH;
> -			}
>  		}
>  
>  		/* get irq: here we use the linux queue index, not the hardware
> @@ -5401,6 +5393,10 @@ static int __maybe_unused macb_suspend(struct device *dev)
>  		 */
>  		tmp = macb_readl(bp, NCR);
>  		macb_writel(bp, NCR, tmp & ~(MACB_BIT(TE) | MACB_BIT(RE)));
> +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> +		if (!(bp->caps & MACB_CAPS_QUEUE_DISABLE))
> +			macb_writel(bp, RBQPH, upper_32_bits(bp->rx_ring_tieoff_dma));
> +#endif
>  		for (q = 0, queue = bp->queues; q < bp->num_queues;
>  		     ++q, ++queue) {
>  			/* Disable RX queues */
> @@ -5410,10 +5406,6 @@ static int __maybe_unused macb_suspend(struct device *dev)
>  				/* Tie off RX queues */
>  				queue_writel(queue, RBQP,
>  					     lower_32_bits(bp->rx_ring_tieoff_dma));
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -				queue_writel(queue, RBQPH,
> -					     upper_32_bits(bp->rx_ring_tieoff_dma));
> -#endif
>  			}
>  			/* Disable all interrupts */
>  			queue_writel(queue, IDR, -1);
> 

