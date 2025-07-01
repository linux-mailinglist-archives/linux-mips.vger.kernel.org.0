Return-Path: <linux-mips+bounces-9600-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED6AF00ED
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 18:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0568173034
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 16:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6966627F183;
	Tue,  1 Jul 2025 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="IK8P+Qla";
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="IK8P+Qla"
X-Original-To: linux-mips@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023096.outbound.protection.outlook.com [40.107.162.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AE927D770;
	Tue,  1 Jul 2025 16:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.96
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388836; cv=fail; b=lsXOIX+UeUdYQ1C8eSS8eeq7LAmA0Hg2ehsfuND1bX/9Qx89ou2wrje6xRKdceT70ZvLEpIqwVnOJNcYUP5LBv3J9a91cau4rZ5cHZC6FYfjeb7akzw7z/BDgDLZ70I9iwq5pua+YaFkFMvV09rwEE5nXYHz70ZizUHs/Z3Q9/Q=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388836; c=relaxed/simple;
	bh=GCykdNn1qFHZlf4IbFNKiVYByA+I3zDf2oh+Hio5sCU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ciTQbV4MAkzfq1K1fx96SssavOHbHJcy4T1ROdqniv2cnRj3LxhBeY4BEKWhr6ZuuXhAECWy+q+Za2u3Otnm9MG8SQ2hnRDLp9ievXrKJaSC8bMk4GNYTOPrBw4eG/MimV9YMqbqGboUtNVIbQRG9W/UZrwtmenHXzKJpeDFF5Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com; spf=pass smtp.mailfrom=seco.com; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=IK8P+Qla; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=IK8P+Qla; arc=fail smtp.client-ip=40.107.162.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seco.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jCn83X5/CFBf6ugyhjIJh2feeYzWpS/L0lRRE8elsA3LA6+/SFacEpsn13bsKjzZAa9HOEThcCKMPE8dMoTp6msE8IrqLk7psLrHwWm223Y6Y03J6odojnLC9BBnsyvLIBdTpUY1Gn2GtDFnFQiQz52+xKDccvcAmtvuNc0M5nEwREzDDFRMVd25ey3k2tMta7uXGK2Vubar1fT2pGbVp7uzNKrk9GtGlTSx9Yox3+K/DMWFOJFzNKJcdy4e3AXCcUcKefXmCQG6khfv+mn6XBpEWj76NErwEMWJ6pvkKFjh2Ys0wwxcBsUNSqlT/aD8zq71C/SYZXKU/QgUzMdQdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBiRGmDC+lhaQxS6YhR2eZjXV1Jh5P9dh7CMzsgfTfA=;
 b=In9T6x2OtiO9ApGRS9eN2YiWjq+bLYcupDuNUJzL22VHyyW6FHYU8wDXoxJhgppSZyj6rV2kerDYBdOWU1qXDLVe5VWT16QFg/4uMGJrStWW+p461o9Hyl2B3+KNdy+zKTb34FPFiP1VYwraUK0xg14gCY0iPZzbUgraJ0tNUa4F2ZQ7Ro5d8WkQYtlsHSplnO+3c4Xzdh+kdKkNdNK7izTNxIHYjGn8h6L9qi4yc9spvMKTVRqG7MPhGIP93azNaOKqAimOzwxxz4VyaDwWv64D/h5z3WS/t218N/9WVOgvp+SppQF8n403HNyT6B4CgVO6DxLlWaKjZWUqLuDSqg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.87) smtp.rcpttodomain=alpha.franken.de smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBiRGmDC+lhaQxS6YhR2eZjXV1Jh5P9dh7CMzsgfTfA=;
 b=IK8P+QlaiLXAzpJj99TFJwF4w6UqO55vLKYS1kHpi+2C8RmCTdZX4cuI4eroiaKeyx/94UDeYt+Ssk4X6eP4FLuhEFam9Y1PcmpDRmvm/vqTz/U4Q7emR7voND9wYJBN0liTZhyD/i0U9VV1vCNfzlZdqXMrZ8MZXPTXsnV2JtcVZgPCpDVbxt9kpKkqnEEufvw0C4aZiK3LLTbSxaG+eKJ7xl4Io3Ojro5vTlCsYbN0qLmgQsnn2C+W8pIOlGPy1dssw5JEVIiF9oCGpLUMr9sk++vJQkJioEAEIEGr8G/n3RUldqrM8YqDeJmItnIJvDPZQCmS/N9+Nx5fK35l5Q==
Received: from DU2PR04CA0086.eurprd04.prod.outlook.com (2603:10a6:10:232::31)
 by AS8PR03MB6856.eurprd03.prod.outlook.com (2603:10a6:20b:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Tue, 1 Jul
 2025 16:53:47 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::cd) by DU2PR04CA0086.outlook.office365.com
 (2603:10a6:10:232::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 16:53:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.87) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 16:53:47 +0000
Received: from outmta (unknown [192.168.82.136])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id AE82A20083980;
	Tue,  1 Jul 2025 16:53:46 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (unknown [52.101.65.83])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id D203F2008006E;
	Tue,  1 Jul 2025 16:53:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbkwE0j2Bdt5zarGCe68e8BuI+JuESLCO7f96lESGrL4s3Ak8JvcMmM7Xk446zlBM4ohSdVcVrYw8n466V3+EZW7qzn5KNCtKlT0lcTaX0RXetGvVg0X9GaZJ8Pe3m9AL9c4/Ov8DWk/IzWrqf3eappgYFEF3dKO73v6PZHz7AKD81YeJnR7wai+Xnmx2s3qtShEenkbxYymecm6IrJGUhB/wRvv7dMyhcbSoVS2kaTS2Md3pB54TfJoRkTBmhBQowTfVz/UM7UzF+bnu5VqI0bH3ZBsbQx0ubF07AyLYg8tz3pcB9vr28JMPaEsR/ROy9qADso4p23l1vEJg8RAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBiRGmDC+lhaQxS6YhR2eZjXV1Jh5P9dh7CMzsgfTfA=;
 b=b13K6IN78Vptd0fafu7OBJDfYbt6sC7dMgK0+ZoAzGuFaVTyg1z+QDldeAOboPBpHrGfF5GRBl/bd6qvMWxhf4a+JxuARm0pu4zJa3CELjD+wxRBQniTYnIIL8uL1Fn8bgk07m4QonKbo7z5AUQqWT69H6l6sKAvzVYQxPzTDtHgHmQs/78b20CqiYrRzGf5nY0vQRxyqT+ZMnfazYLeBQTpJZ5aXYlN3GiosNaGEh/MnJdfP6k5k4vXHTJRL1zzr9j/+ZiOTaUVxvYFPb0ygqc2tSj5XyoEs8HXRuezO+FFNcdvokM+wXzx4tE6bpUNp6jRzbAUn7gCxtwIh1nzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBiRGmDC+lhaQxS6YhR2eZjXV1Jh5P9dh7CMzsgfTfA=;
 b=IK8P+QlaiLXAzpJj99TFJwF4w6UqO55vLKYS1kHpi+2C8RmCTdZX4cuI4eroiaKeyx/94UDeYt+Ssk4X6eP4FLuhEFam9Y1PcmpDRmvm/vqTz/U4Q7emR7voND9wYJBN0liTZhyD/i0U9VV1vCNfzlZdqXMrZ8MZXPTXsnV2JtcVZgPCpDVbxt9kpKkqnEEufvw0C4aZiK3LLTbSxaG+eKJ7xl4Io3Ojro5vTlCsYbN0qLmgQsnn2C+W8pIOlGPy1dssw5JEVIiF9oCGpLUMr9sk++vJQkJioEAEIEGr8G/n3RUldqrM8YqDeJmItnIJvDPZQCmS/N9+Nx5fK35l5Q==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DU0PR03MB9005.eurprd03.prod.outlook.com (2603:10a6:10:478::7)
 by AM9PR03MB8025.eurprd03.prod.outlook.com (2603:10a6:20b:43c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 16:53:42 +0000
Received: from DU0PR03MB9005.eurprd03.prod.outlook.com
 ([fe80::ed7c:3f8:4f86:40dd]) by DU0PR03MB9005.eurprd03.prod.outlook.com
 ([fe80::ed7c:3f8:4f86:40dd%2]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 16:53:42 +0000
Message-ID: <7e409619-0e36-4cb5-9db9-b7bf1effc920@seco.com>
Date: Tue, 1 Jul 2025 12:53:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/18] Support the Cadence MACB/GEM instances
 on Mobileye EyeQ5 SoCs
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
 Harini Katakam <harini.katakam@xilinx.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Andrew Lunn <andrew@lunn.ch>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0037.prod.exchangelabs.com (2603:10b6:208:23f::6)
 To DU0PR03MB9005.eurprd03.prod.outlook.com (2603:10a6:10:478::7)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR03MB9005:EE_|AM9PR03MB8025:EE_|DU6PEPF0000B620:EE_|AS8PR03MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: a58bea0b-4daa-463a-0460-08ddb8bfd8c9
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RG56QVVqTmtVWXYwdEpZWXcrKzhaSXhNbXFJRkk1YXVRUGw4U3gzTm9RT1Zi?=
 =?utf-8?B?bmNYSnd3eThWRHZFTWRzS0IxcU81SFRVVHRkSHJpVWJpYk5wUUhzVVVkZGh2?=
 =?utf-8?B?bU8yeUtxSnpQQ2NXRVMwRTgrUmQvdFhuU2F4ZmJ1eHFrYW9BKzRwY0lUZnUx?=
 =?utf-8?B?SUFqUWRSM3BWVE41a1BXaWN4UkYwV1NFNmRmQjQvY1dxNzZoYURuRVltTGxh?=
 =?utf-8?B?bzkvL0cvcEw4Kzl0STIybkhYY1Z4MjE1RnlLZkZKUkhLSENLbEpCb3VsWnVo?=
 =?utf-8?B?UHRiM0tlQzJUbHVzRU9ja0ljVkkyN0NXOXFDN1hINmhkTC9PK3lTUXIvRUtn?=
 =?utf-8?B?RjFwWVB4RWxMLzdnWDR2SWhjNHJIQ25xMjRYeHVKMFVkR0dzS1orb1dsSkd5?=
 =?utf-8?B?blVMZlcxTUk4dys3ZTJmRE5VNm1UWlR4OTdVY3NLTDF2OUhiQ1NFMWpaV20v?=
 =?utf-8?B?dGFCeE8yNm1JRUcrNkpnWnVDSFFIY3Jra3hIK051dlNmYSs1UHNuT0tmN2FQ?=
 =?utf-8?B?ZG53eThXcHdvVWpuZys2S01oSWw3cFpkREpPWHJ3UUxvdGVKcjREbU1GNmF0?=
 =?utf-8?B?ZjBBR3pvRWxSTnBBanFZb0tKdEJ0VWJHQnNUQngvUkJjQ1BXKzJzQk9MVTdF?=
 =?utf-8?B?WVpld0x4RnlNbXNodE1TekpjaC9ORmQwQnJ3SjZrSWZkS0lleEJ2VjBPYytS?=
 =?utf-8?B?VHlnWTJEM2YzRjlBYzBwQ2xxbXFxcXI3ZE1GdG9WbnlYK3I4bnFoNHMwaEEz?=
 =?utf-8?B?NUUrWjg2QmxvQ3ZxbkhpcGNnUDlWRTl0VlV1WEhac2MxUmxaUmthSUlSMG9M?=
 =?utf-8?B?UXNqUmdZTTFWbUtHMU1kTkt1OVkvTVhxUnZKV3hnU0xvNlNkaVJpVjFZSVd3?=
 =?utf-8?B?VENZUHV2ZlNWTFlZZWNhVXJaWVlXOVk5TjI3SkJKZW81U01ybExScUE0UkN2?=
 =?utf-8?B?M3g1SmtxY0dBa2RsK29QWldxcmdaOU1PNVRFbGRMZXlOVWNmTGQwU08zUWVi?=
 =?utf-8?B?dU4yTTNlNW5MVWliN2NuTHQwWkJESGU5VWdVbU5oSGlKcm9OVE9LeU5FVW9C?=
 =?utf-8?B?enljMjVQN0ZQMHdBcXVPbElWZmt1TXczSnpsWjBVcHFLUHJNVklkS1hpVHZz?=
 =?utf-8?B?UHVXajkram93K3NHNzJuTWxrL1ovTlNjeFNnZFR6V1pUU2JoSUdpRGJKZnhR?=
 =?utf-8?B?Z1kzam1maUxDMEYwRzFidzNoV3ozQUdoUzNFYXpUem56MmRYQkxDdlE2SnNM?=
 =?utf-8?B?OHdOclU5Mm1vQjNIeVRId2M0OFdIcEJlT3RGN0IySTF1UGRKZnpuYXBXWEQr?=
 =?utf-8?B?Z2o0RUorUGdWYlV5MDJqS0hKdkdtY0hOKys4eVovYldBK3E3MVJVdncxNTg1?=
 =?utf-8?B?Kzdva0pCVXVHcUw3M2tTeHl0SHRhQUZBT2djQ1U0a1lGOHhibE1MQzY4N1ov?=
 =?utf-8?B?eXVpZFpWOUdPZTVycXB2NWdwT1NqL2JUanVUMVJ1aG9ZOEY5UTQzQWI1dllW?=
 =?utf-8?B?eXFoa281eFE4RlhpcUo0aXNSS09pWm5SMFpMNUVpR0hlWmFDZWc2TjdwRFF3?=
 =?utf-8?B?UEZuTU9jREkvYmErbWVhU0FZNlRBei9leWJ3RjN0dkZ5VEhPWFlDaEkxKzFj?=
 =?utf-8?B?d3V6aUd3OGtQMmt1ajhJUUlVNWRPaEhRb0R6aHVuWm9lN05CTFNFd1JaN1Bz?=
 =?utf-8?B?ZUVCT0QvZjR0Z3l0YTVvWEUrTjdCUk1qMTRnMkhlQTBaMVcyZVZQdHl2eFhC?=
 =?utf-8?B?eGQ2R2N4ZjUrb09UajUzSkxVYTUyQlVNdWNkZ1l1ZklxSVV4Tmh2YW52bmE1?=
 =?utf-8?B?ODVnMnlWWkw0TFovT2lVR0pGZk5FVUN2ZjF6L1RzeEZwcXNpQTVwM3J3VFRB?=
 =?utf-8?B?N1NEajZqK1d6UUExVEluWUNka3ZIZE9GYS9uTXphM3YyN1hwWlJ6SERkNDBY?=
 =?utf-8?Q?Kiq/wwwW+Aj/AOsBeTa1Me0cLpMgfJZt?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB9005.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8025
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7aea2fc3-bd29-4c70-0dba-08ddb8bfd5b2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|14060799003|1800799024|82310400026|35042699022|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVk2bmZwUXpDYXQ1Um5yNTNjcUVSSTlTL0RtNm5NclRrTitibmJHWmx5Mmgx?=
 =?utf-8?B?QnQrejU3bjFsSFVBU0ljTE5JSnMwbnZRemNGUUFEYS82QkxVU25mcjNiVENN?=
 =?utf-8?B?bVJJaC9MT2dFai9tS3ZQMjNXbnZGVHJhVERHTDF1c3lZS2I5RnpVTklkaTl4?=
 =?utf-8?B?eVlENlFOVk1zdmlTbmNLMDlyMEErdmVmUEFiMU1ZcWwreVFvMGk4ZEJVeVpQ?=
 =?utf-8?B?OG51bWVnSmZhcVFMTWoyQnVPWC9YdFM0aVJLemtEcVhvZHJTVkgvdTU4UDN4?=
 =?utf-8?B?dU9ZMGZtaHhMYmFFUGpvd0hVbXVPR1JDSzdjcTYyandYNEFQTHBubWNyck5S?=
 =?utf-8?B?SXZMcVFseGttSmZsemJONkZQVS9ueFJoMmRMak9PQVkxSmQ1RHVBRGlDcC8x?=
 =?utf-8?B?UWQ0NE41UUEwdjZyVXk3bGhBYUhpbGt2bUt0d0RCK1JlaUNYZi94K0dIdDkx?=
 =?utf-8?B?bk9UU25NcWgzTVpFMUFzTW1qZ0tMS0d2SFB2SVZWTyt3NzZrUXdsUWtEM3VW?=
 =?utf-8?B?QVN6QXRCWEJCWGFyMUpVSGVQcitpbnhvZENCck5EUG5Nb3VQUXJhdjJ3RlFJ?=
 =?utf-8?B?OGtGeUJ6UzArRmlHS1AwYVhWd3RnWVljbWM5MDJ6U1VDVUE3R2g2dHR6TTdt?=
 =?utf-8?B?QnBZU0xtdnowQzVSREFDTXhmYnZXbE5Ea1BCbVpPTE43d0xLZDNFZE90QnZR?=
 =?utf-8?B?bjF2Q3FFeU0zcWxVemEyWkExQml3TkdnLy9kRHlIRlhDVTJPN1VVUVU2UzB4?=
 =?utf-8?B?eXQ5dGdqQUFaL0xJSkdDUC9QUFJPbDd3azF2dnZTVkZ4RFk5Q0dWQlVVd1Ry?=
 =?utf-8?B?UVhIQzJ4TmhWMldLZHBEN204NFJQR0JCSHU4LzR5ZDM2QUdJU0hwZTRyQ0c1?=
 =?utf-8?B?eUpiL1JmdEg5UHdNdk1ZWGp6cWFCYUVkRXYzS2NyempVN0NQcExUZUdFNlRQ?=
 =?utf-8?B?NS9tSW1iNDRlMUVZdklMaGVkblViSVdUbHViL3NCb04vdUhaU2lxa3RHOFVK?=
 =?utf-8?B?ajU1aHZKb3Q4Skd4ZkYyNE9XWmJkbFU4MndNa2xONDJra1pBRzhBK2lyczVJ?=
 =?utf-8?B?ZlYvSEV6QUNhbEwyNmErSm5NV2ljb1g1aVF1eHhydzVWa1hweDA4QTJ6SlRy?=
 =?utf-8?B?a0F6RHlkS0lkRUpSMUZZKzhKZi9YcHVsM2Zxci9TRkhldTY4SFNlSVBydkRI?=
 =?utf-8?B?TklyaXRNSWtwNW9BekxkMmk4bUtrRm81bHRJSnZUWEJ5M1l3eENIMyswc1JO?=
 =?utf-8?B?QXRIQXp1cElLcGw5ZkI3UkNYRGFzaFdQTHMzMHhTYkVXSzhqbFZ2QlFJMm9a?=
 =?utf-8?B?d0NEWjBLWkptc0NUUURYbEE1d1l4d2JnYXRMWWlSVzRxczlwRkxxbWxNWTJk?=
 =?utf-8?B?bDlrZ3BDY1ZzRVpYVVlUVlEyQXFzMDZCVHJ1Wnk4WDhUU1IwVW9rNDgxemRD?=
 =?utf-8?B?Vy9tcFM3NVFsa2d3S1UrZ1hvOXlIZUM4ZWNJaFhVV3ZaT01sTHFrZlROY3Vr?=
 =?utf-8?B?RG12eFpub0xuOHduQUNDSi9GeXE2U2ZnaFExL1FOWjJhZ0tRSi9RbmJMNmRU?=
 =?utf-8?B?aG0wQXloTTBYVllockpzSk00dXdwTHVER3dBZkRXTnVTTGpuTFEzbGRxOFRn?=
 =?utf-8?B?akM5RFRzNWtrUXg1S1NMcTAwUklLOXFVcUhuOWpRYy9pcUVnZHM1L3lZeEMy?=
 =?utf-8?B?dS9pSmowWFUrZnNvaHFkRU0rWTh6VGdjRU9SYUlhZndBNCs0QW5DT0lLQzZ0?=
 =?utf-8?B?OE8xSGhIMWVlSkx6TDFudHE1VEh0eVBud2YwWEx4Qm1GMEhGSURDTzV4MEts?=
 =?utf-8?B?WUZqMllVWkNZdWFpNEp2UDVWU3lzaG5JMEZVZG12SS9HQWtDZHlUODNhb2U3?=
 =?utf-8?B?TVhsa2YrZE1NNTZ4alBEUUEwNmFYUjgzcDJ0RFcvUjBTS2Q2dW93MDczMWYv?=
 =?utf-8?B?eEc5M05JTHdWenZwWGkwMmtYTnZHUHNwblpjNlUydUQySE1qRDl0LzdGMDVh?=
 =?utf-8?B?Tjk4VlRUNjFwRSt0bGx3UUhEd1B0aWlKeHh0M3hSZHNyclRISVJxRHBNN3M1?=
 =?utf-8?B?elRIeDdDTHNPQXlJTVEwQ0Y0U0VhcHVzK2F0QT09?=
X-Forefront-Antispam-Report:
	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(14060799003)(1800799024)(82310400026)(35042699022)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:53:47.1325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a58bea0b-4daa-463a-0460-08ddb8bfd8c9
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6856

Hi Theo,

Please remember to take the following recipients off CC for next patch:

<cyrille.pitchen@atmel.com>: host mx1.microchip.iphmx.com[68.232.147.91] said:
    550 #5.1.0 Address rejected. (in reply to RCPT TO command)

<rafalo@cadence.com>: host mxa-0014ca01.gslb.pphosted.com[208.86.201.193] said:
    550 5.1.1 User Unknown (in reply to DATA command)

<hskinnemoen@atmel.com>: host mx1.microchip.iphmx.com[68.232.147.91] said: 550
    #5.1.0 Address rejected. (in reply to RCPT TO command)

Thanks.

--Sean

