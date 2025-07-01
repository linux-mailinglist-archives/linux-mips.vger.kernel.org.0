Return-Path: <linux-mips+bounces-9591-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7729AEFEB8
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 17:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F094A745A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 15:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC9C27933C;
	Tue,  1 Jul 2025 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="U3xMhje8";
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="U3xMhje8"
X-Original-To: linux-mips@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020118.outbound.protection.outlook.com [52.101.69.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683A921FF35;
	Tue,  1 Jul 2025 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.118
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385427; cv=fail; b=Rl/OOXRt6WDy9voTRdcxB/JEJsKRZiZ2nxrx7EzwdiufwEkOBrwuSTxxIWx8cPymva2t1nECNsKGhr5CLrazZ5ltj2HDjMED7bOwHOudWlTjd0jQPkG5CkoP/tdl1pEXuAYc/1ZPYpMkGr78f2JAVO3MmX4h/Z+oZQKTAQEWXDQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385427; c=relaxed/simple;
	bh=XadPKbP4QZ6dxjUBIvB6L0XGBmuSlB14H9Besk6Snak=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nh8JY9BgVZ46dM1hEjKrKkTBzHswrYVMp3srLmz9nsGg1ubkNwSvNp+w8NqDVewH/i7u3asC0YM5CEeGOWbCXcSgHhrxH421MlK8ffwsMO7MTr6Av3hAhBaYq4VgBGCDADtevToPOAOxvSFjB9FNwbgIEfBRtk8nJAzzJ01xJmo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com; spf=pass smtp.mailfrom=seco.com; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=U3xMhje8; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=U3xMhje8; arc=fail smtp.client-ip=52.101.69.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seco.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UDogO8J5J6QWTusW7FDC1HDGBugT8v+yXTpV+a/hOX98ilDCHu46vCu5D5DOqBweVRmZ2EaTaOW16vxKEfKFlF+RwK5xh5eTARfxU8UrbL2WnC/FG1TWtk5WvTDgF/blz4huNODMGdJfDl3iuzborHtEN1EhveTRet8sSNP5qQn7Be0KH62jGX6IwsBLRsn7ExRdwYdtouhJM7GI4Hw0bBeRcNMMx4qi3zAx6JGVtvdHQtjSLzrVvDOIJMzvtReLBfLvgDnQ1hYPijnaWzhRerU2ukf9nMpbMrvV2eHSIKbqfGnM020hKOYPfLme6PSlYyuYOz++Q+CPt2/84w7hBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYZfDEV/ClJxJkOX+TBC/gdbn2sDp9gcrE9533turIc=;
 b=RwquSDLXPr1s+Per7/wUIlAwG4bjx9zGOY0Fa/gbz0sppaignFRKvTrDUdyJzsRWq1vvCBNz83IxC/mLl9eDQXVlEXlvShuAPWPgjNvhlJD6txbwLrny8AZB4ji0HM/S6ThP5DBuB/GNpu8X4VLZTFIMgY7bZkXPDfXoUd41PYQD+e9hf+IRYZD8MFEeY+kx7bGLmv3KHEX2tW4cL2DaTudNQtPXBmAy5l1BIZTAf5KAi2WrpKKS3wsDYqkdBuFXD68IBdgI2gc8FXr1BNXbqpAmIYQoofBhv3VRe8nBDoEXcopWVvZw+gmuYF4eIcPzTnmGXLg7wLW+WFD/4Y5Fig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.81) smtp.rcpttodomain=alpha.franken.de smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYZfDEV/ClJxJkOX+TBC/gdbn2sDp9gcrE9533turIc=;
 b=U3xMhje8xcqz71AxHe0LjWWpaOeV7ZP12wMKx+FJ+i45ojyA6eQCHo+f4oCarxX6c9P3F9DyjhAH2P1ToU0qYDnOblj/G64gT3HmO6UTH5eWMsm+HXbtbFEj/8AuO/NXNCtTujOQisNeBoZKpJJtXyxeaFMsa9YqGkG5wg8MQ/KnwlpEJQ+zEXqZglPKgMM19sIPHJC9RKrMIcxLVyKcxnydIRUpNJFkXpKWQk0FhBbjrgNEkkSLODy5/rNzrsaAVXUb1dV8bkfrIG0nWVOLXooB+J8TRL3xfq3zx2REXYV7NMlnK0lCPKiTBwzWnFpiaNeGATbhuup46M3aBrfvVA==
Received: from AS4P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::11)
 by VI0PR03MB10759.eurprd03.prod.outlook.com (2603:10a6:800:26a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 15:56:57 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::14) by AS4P191CA0012.outlook.office365.com
 (2603:10a6:20b:5d5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 15:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.81) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 15:56:57 +0000
Received: from outmta (unknown [192.168.82.137])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 0F8F620083982;
	Tue,  1 Jul 2025 15:56:57 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (unknown [52.101.70.103])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 0997F20080078;
	Tue,  1 Jul 2025 15:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVdc90HDrz/nJTvkEx9yGL+KFyqBU2PUgtKFbxkogmMzSShlaCrb2NSqfXdJKSEWNH2vN/aMw5XjALi0VIyJpF4J+DLiQ8ZAzv/o9nW4ln9PcaLetfMjuUMXHc9ES5fEcfxEZi9ZT7mlVcsdycs39nGm7VNDjaAWIH7tEM2Bx+bss9xVg5nQ3LEar834D0Zm+xmyvCU1xqeXvz7D4A5pRTa1+Rho7wHY/nEF44DzeUI3bOW7GJVCFprr5dF1gFPf1vU1w2KOvtuT3GQf3rv/tj3hntaXakrt6AoSiTqKS0pMJsUnn+tjQ15pl0WJWqRAKHW9euahGQJtHIhE4p8lIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYZfDEV/ClJxJkOX+TBC/gdbn2sDp9gcrE9533turIc=;
 b=jfneY+wXs1SqPyIUKavaqK+mtNIfSn+t5bWJ/kfkT9t87cG3kT+TE+dELheWRTfj+coc2juQNkUY0dBjTfIeyqrw7IXmfcifHbl0udHNQgv8nQ8+Bu38pFhGS1ShZKW8kIz/gnE8zuYW6flDFjU7If7T9TtZK6mr1S7vKG1ihpves80+TxOVUc0QBP1MecHU9ubJqL1TOKAAq0X/94fgSWGueu/R6J9+XCyMfQiJ/EuxnKP6hSIP5dpyfE8E6p0XnqwDGIS/MsRzPKMMtwZOoWwFC5XRXiwOzMX4nBzVS5d6CJboYQoXFy18CIoePNGP4EshxiJTyiAf0OOciy+8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYZfDEV/ClJxJkOX+TBC/gdbn2sDp9gcrE9533turIc=;
 b=U3xMhje8xcqz71AxHe0LjWWpaOeV7ZP12wMKx+FJ+i45ojyA6eQCHo+f4oCarxX6c9P3F9DyjhAH2P1ToU0qYDnOblj/G64gT3HmO6UTH5eWMsm+HXbtbFEj/8AuO/NXNCtTujOQisNeBoZKpJJtXyxeaFMsa9YqGkG5wg8MQ/KnwlpEJQ+zEXqZglPKgMM19sIPHJC9RKrMIcxLVyKcxnydIRUpNJFkXpKWQk0FhBbjrgNEkkSLODy5/rNzrsaAVXUb1dV8bkfrIG0nWVOLXooB+J8TRL3xfq3zx2REXYV7NMlnK0lCPKiTBwzWnFpiaNeGATbhuup46M3aBrfvVA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by AS8PR03MB7656.eurprd03.prod.outlook.com (2603:10a6:20b:400::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 15:56:53 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 15:56:53 +0000
Message-ID: <d3d7d92a-7969-4838-941d-329f7333340c@seco.com>
Date: Tue, 1 Jul 2025 11:56:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 08/18] net: macb: introduce DMA descriptor
 helpers (is 64bit? is PTP?)
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
 <20250627-macb-v2-8-ff8207d0bb77@bootlin.com>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20250627-macb-v2-8-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::7) To PAVPR03MB9020.eurprd03.prod.outlook.com
 (2603:10a6:102:329::6)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR03MB9020:EE_|AS8PR03MB7656:EE_|AMS0EPF000001AA:EE_|VI0PR03MB10759:EE_
X-MS-Office365-Filtering-Correlation-Id: ed709f2f-061a-4ed1-3156-08ddb8b7e858
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bWxyYncyNkh2WU5oMFFOLzdZR3NZb1pkanl2UG1iTlYybndYYy91MnRSblNW?=
 =?utf-8?B?c3ZPZEZrM0dHT21tSldFUUVHTmtJN3ZQRlltb3RlMUVNUG44Yzhva1RHVjRH?=
 =?utf-8?B?TlBJNmFrWE1nUWsvUG9QZkpsWHduUjViUDNJTkRjZ2tyUWRJbTY2MUNOZFlQ?=
 =?utf-8?B?UEhINlB1cEhVS2NrV1MrdkxkeXc2L3NzdHh4aUVSaWNRM1dqb3pHSllyeW95?=
 =?utf-8?B?Yzd4UW9pRnoyVjBtUXRJY3NGWTVjUTBLZmtFUy8vSCtuTXZ4ZVk2bjZLb1J2?=
 =?utf-8?B?OWdEV1Z6cFZJVGVZVG5wcy8ydm91d3B1TTFpYjJmZHkxQ0wrdUVPbnZIQ3lK?=
 =?utf-8?B?bWV4OGtZOEhORWN1aUhTNTFxbHM2N1BLUTZDNnByNUNpd0F2YWsvVkpscjFa?=
 =?utf-8?B?U28rSGZVbW9PNmphbXhtdDhKaEhaVnplY20yVER3Sys1bnB6d0dKWmJZUFRF?=
 =?utf-8?B?YzExcjB5SHJiQlJjalEzU2ZNditHY0VEdFBtWCtaWWZjNUtiMmtxRXZHYldw?=
 =?utf-8?B?c0FRdFdvWTg0WjhmZzMvVW1JZlpZSUw2T2FYZ1dQTERoWVNZM0E1REZlUFJB?=
 =?utf-8?B?OFVjeDZ4VTRrTGdRN2gzRnNyY2lrc293UUpLL0c3N3cxcExHSW43QWZlZHp6?=
 =?utf-8?B?MEpyc0NyNFA3enJCaUdGM1ZYblVxTzZkRXNQVythekRHcDVUU0JCTEhvaFlK?=
 =?utf-8?B?Sm5tZUJNT1Z1ekhLeVBhaFdsNEdDRG40NWpWb0FYek9QMkVQQ2tzL1k2TXN6?=
 =?utf-8?B?Y0tVcFpXaE1pRC9lbUxwSGZwV3M2L1kxSm5Ca0FwcEd5cGxZZkJTaFl3OThD?=
 =?utf-8?B?T0RkK05DNEUwU3NRZ1ZUdFJFVjdSejM3R1AwUEhZUXBpZUIrU0t1YThDajJS?=
 =?utf-8?B?SFlkVXpsL2dVVGJvRkd4SmFtNjdjSEJuSURYVGVzSkV2QnFIS3huelhZNE80?=
 =?utf-8?B?T01aaDV4NlZVWU15OE51eWZuVG5ZQkM5UFAzSW9ZdGFVS3oycUNhYWdocFpU?=
 =?utf-8?B?a1didFVvOWxiREdIMWEwQmZFTW52NTdhMVdHcHl0UTE3TTRhaTlPTlFiZzVC?=
 =?utf-8?B?UW4vYTRrbCthYVlONVFuNEZLb1hFUEhSVUxNYmJZaDRwaTJISitNNjJrdDQ0?=
 =?utf-8?B?UjFyYjhkVjlRTU1LeXdad0RydWszUytKQ3RMWnVuT2dYbzZ6L1cvUURUQzBt?=
 =?utf-8?B?Zi9RZTRNOG9JOU5PbURVQnpYY1prb1BxWWVwSGM1cGRJbVp4c1RhdTljUkdl?=
 =?utf-8?B?QlVUdW5IdVRFMVhpSnRtZ2RvcVNVd2hTVklJaUFlMUpVK0dyNFppa0I0ZkM0?=
 =?utf-8?B?Z2tkaTNIRzJHdXJtNDM4d2crMHpFVWlIOFdPZm94Y2x2TXlxa2VBSjd4dzdo?=
 =?utf-8?B?WkhSLzNTMUl5ZVVJSHpnUS82MmxRS0tzUlJwS2FjdUMzUjhscGNtS3NkR0p4?=
 =?utf-8?B?dHk5UWN4K1ZVeWFvRjBIVnJYYldUZHcrMVkzVFFsdnFMb2EwdkpBMzBJTWIx?=
 =?utf-8?B?M2oxSlR2azlIckpEaWM2TitSM21OQVViUHhSMEpYZE1QVm9ObXcwaEdqN05o?=
 =?utf-8?B?L1dQMlFONnZhSFpTUnJCTWIraitVNmUrSUdzU1pjNkh2bkVsNFhkak9ua2lF?=
 =?utf-8?B?N2FZTkdQK3h4Vld1STRialp4N2R3Mm5ERXowa3Q0T3hWdU1jVGFRQkpkRFNu?=
 =?utf-8?B?ajROWm00ZVhjN2FVWi8xWUphaGp6YU5VczZpWkJJVlBEZExUZE8ycFJiOGc0?=
 =?utf-8?B?UFEwYWpxcmRGZUd1L1BmSm9qcHNnWjl1NUlqK0FvSEEwbS84dk9BQ0s4NGRl?=
 =?utf-8?B?V1NaemV2Kzk0RTNCU0xKR1gwcmhjL3JyL3lsVjRkUXdFcHAwd05MUVZxb1Nl?=
 =?utf-8?B?SHFMcFU3TjFmN2lNQWlnNEZxMVhvWWc1dzZNYzBneURSYUkrYVpaYUp0VHRC?=
 =?utf-8?B?bUJOZlU1RDJUWWFkdTZMRDY2VFdOa0JLQ2RzblZkekt3OHF2VG1nc1hDeHk0?=
 =?utf-8?B?cmdJbTBPZU53PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9020.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7656
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	10bc3183-d1fd-4186-a358-08ddb8b7e594
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|7416014|376014|36860700013|35042699022|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXlNT0pVYVlRMGY3K0ZVMDJqK2s5TVc1RXE3ZWxGSzFuNE1EUHhMbDBUKytO?=
 =?utf-8?B?a2pjVktJbkdHYzZsS3RZTEduZ2NGVmo5VDQ1eHNseXVCaUtpU2Y0OFZabTlK?=
 =?utf-8?B?bUlBdTc5b2h3ZElORDBTZzd6bmVrZDJIL2dSWjZWT3krYjg5N1RKQ2k3UDNQ?=
 =?utf-8?B?YTJxVzNFTDdKK2tZcFl4QW5EOXF3cEV1MXcvRnZyVkwrT1VLOFRMMmFkMTZ0?=
 =?utf-8?B?VElQd2twZGtDRWRiK2UzVTF1dlRsS1hIT242NFZwMkNVSTJtRWxWRnhwOEFk?=
 =?utf-8?B?VkF5bWd6bFk4cFBUeGhVdDhBVVp0OWJhVHcvSi9hNWFhSTJyR1BKcDQvVjRx?=
 =?utf-8?B?TXJkLzY5Vk5TenRiWXpGcVNMeXpnNGF2UThDZ2tjNnNsQk1RZ1Q3SjRLZG1E?=
 =?utf-8?B?eXdsc1FwQXlMSTdVaC81OTBZaTRDZFkyS0JBcGdPU2FNTHplbmp4TjJpOSsx?=
 =?utf-8?B?OHJlRStEcGRBYmVpd3lOMnBtNGVvM2dDUnhZNmNGV0ZHWFhhdzIwNDhsMStO?=
 =?utf-8?B?SUVFQWt3T0M4bGZ5bUE1cWRrUEdaT21USlZPMHZWM1ZmZWkyVDg5Qk9ZYVps?=
 =?utf-8?B?WW80S1lJSEplaHpjU2RlYVNGcGNXbnphc0FLNWVzdWlrTU5rZGsxVHJpMzY0?=
 =?utf-8?B?bzVFOWVlZzVHRjFFdjg4bWovZ0lJNmdtdW5OYURGaVR1TGhUN0lJSi94Wmcx?=
 =?utf-8?B?cTlUaDVDa3BLeHJJWnorOGR3NGNxWjAzVFBQZnlNTW9hTTg2M0k3ZEFaaWpS?=
 =?utf-8?B?N2p3dVAyWlJGa0x0REJSVEdVU3VYRmxXdzdiek1aSkl2enNFd3RrZnNxWHc5?=
 =?utf-8?B?eUwxcytxRzZXSzdDZUNISWlCKzNqNWp1KzF0SnJGV1dWendzdi9GSitwdXpO?=
 =?utf-8?B?VGt4WGlhTCtGK0pnV0V6a0ZudWNRZzRkZ2E1bERkeDJQUnZKZ2xSRjMyWGhm?=
 =?utf-8?B?MVFMTXdMMXZnS3ZtNWJTdGprYXk2T0cyOCtXSVpoc3dYK2ZTbndOKzlCazU3?=
 =?utf-8?B?WjFjZXpWL2RwdHhSUE9EOFBaallaa2ZzemduOWcrQ1BOb0kwMUFIeXl3aVFY?=
 =?utf-8?B?UXQ4M3FVQzRPS1dlK3FYSGdNV3pGZUlaSzNLenZ2d0JvbmVTdTZ5UEdGeDN2?=
 =?utf-8?B?S0tEVnppYWd5ZkJpRGd6VmVya0tsa1o0aVhPTitZK3VEQldWZCtFNUN1Q1hH?=
 =?utf-8?B?OEJaanpBQWxvVzRCcmt1RTJlS1d1UlVvQ3FpbEVMQnNNVmVEbkZqMGlRUTdj?=
 =?utf-8?B?blRwNjJZY1FaVzkrWUpzNms3UkFHekRjRWFjZkRrQ01rTXNSQnhLWlB1dXJo?=
 =?utf-8?B?d3NoSXo5ZkdKZUo1Zit4Zjl6VkJUMnlzWWo1c3pPR0VHbk83RUtzcVNYK284?=
 =?utf-8?B?MDZQWi9jNjF6WDF3TEhuSzlRbzh5SnBwcmdXUEJWWC92Yk0rTSt6ZWVoNEc1?=
 =?utf-8?B?QWJIeEpYajIxYjFISFdVa0VFaStUSXpJWWxVUE1FWFl4NW1BZEhSWS82ODQy?=
 =?utf-8?B?TUZCMjB5MkF6U0ZGQ0paR1FRMTVFUmJybnQ0NFUweFU5WjJVVlE0ZlE4OG1S?=
 =?utf-8?B?QzBPWVg3VUFGWXBxZ2habzc0VWphYVo5ZTdHMzFzVFM4SDNPTWEyYURUaVg3?=
 =?utf-8?B?T3dBd0JtbXVwRmxUOWZIWm42OWRiSmxBUWcyT2N5N1BUZDl2K3F0SkhrNkxp?=
 =?utf-8?B?VUVjZlA5cmQrNjU5R3VPanMzT0lJYS9ma0txbWswY1lGc1ROWlhvK0NseHdw?=
 =?utf-8?B?c2cveERWamJrVm56ZG9ucXBGYzRxbnAyNncyMXZWWktrYWZYUVlHZU53UkZT?=
 =?utf-8?B?TzBXbDhHY0VWVXhzYXhqY2I3N1lIUkVpTUZCMDBRa0dDUENqVi82bCsvY1NM?=
 =?utf-8?B?UGx1bER4L0hROXlTc2h0c0dWQ2hLekJRUDNMdWpLK3lSMWFGWHZ1MFlRYjJ6?=
 =?utf-8?B?NzFaVmxsMEpuNVZaelJHWHpxcVhGZ3lPOTVWSGwrZFhsdVh0NEFNVVdNVGll?=
 =?utf-8?B?bGtjRERuTmREc1hNaVVEKzJGN0lLSURYVWg4Q1BzRHQzQlk4VFZmY29pbUZr?=
 =?utf-8?B?YjdpL0ZKRWNtUVZ4cnVsWEpra2VldDhrQkFSQT09?=
X-Forefront-Antispam-Report:
	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(7416014)(376014)(36860700013)(35042699022)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:56:57.2468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed709f2f-061a-4ed1-3156-08ddb8b7e858
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10759

On 6/27/25 05:08, Théo Lebrun wrote:
> Introduce macb_dma_is_64b() and macb_dma_is_ptp() helper functions.
> Many codepaths are made simpler by dropping conditional compilation.
> 
> This implies three changes:
>  - Always compile related structure definitions inside <macb.h>.
>  - Make the field hw_dma_cap in struct macb always present.
>  - MACB_EXT_DESC can be dropped as it is useless now.
> 
> The common case is:
> 
> 	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> 		struct macb_dma_desc_64 *desc_64;
> 		if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> 			desc_64 = macb_64b_desc(bp, desc);
> 			// ...
> 		}
> 	#endif
> 
> And replaced by:
> 
> 	struct macb_dma_desc_64 *desc_64;
> 	if (macb_dma_is_64b(bp)) {
> 		desc_64 = macb_64b_desc(bp, desc);
> 		// ...
> 	}
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb.h      |   8 ---
>  drivers/net/ethernet/cadence/macb_main.c | 113 +++++++++++--------------------
>  2 files changed, 40 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index 3b43cb9468e3618754ff2bc6c5f360447bdeeed0..707b3286a6b8408a3bc4bbbcb1335ae8c3cd95ad 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -15,10 +15,6 @@
>  #include <linux/phy/phy.h>
>  #include <linux/workqueue.h>
>  
> -#if defined(CONFIG_ARCH_DMA_ADDR_T_64BIT) || defined(CONFIG_MACB_USE_HWSTAMP)
> -#define MACB_EXT_DESC
> -#endif
> -
>  #define MACB_GREGS_NBR 16
>  #define MACB_GREGS_VERSION 2
>  #define MACB_MAX_QUEUES 8
> @@ -823,7 +819,6 @@ struct macb_dma_desc {
>  	u32	ctrl;
>  };
>  
> -#ifdef MACB_EXT_DESC
>  #define HW_DMA_CAP_32B		0
>  #define HW_DMA_CAP_64B		(1 << 0)
>  #define HW_DMA_CAP_PTP		(1 << 1)
> @@ -838,7 +833,6 @@ struct macb_dma_desc_ptp {
>  	u32	ts_1;
>  	u32	ts_2;
>  };
> -#endif
>  
>  /* DMA descriptor bitfields */
>  #define MACB_RX_USED_OFFSET			0
> @@ -1316,9 +1310,7 @@ struct macb {
>  
>  	struct phy		*sgmii_phy;	/* for ZynqMP SGMII mode */
>  
> -#ifdef MACB_EXT_DESC
>  	uint8_t hw_dma_cap;
> -#endif

Should this member really be here? Seems like it would eat at least
7 bytes of padding. It probably makes sense to move this somewhere else
in the struct. Or maybe even fold this into MACB_CAPS? Not sure what
that does to text size.

>  	spinlock_t tsu_clk_lock; /* gem tsu clock locking */
>  	unsigned int tsu_rate;
>  	struct ptp_clock *ptp_clock;
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 6926ea11d71adae7a25d5ee329c148f5882d4184..be667cb5acce85a9d11aaea1f5081a3380b60ef2 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -95,6 +95,18 @@ struct sifive_fu540_macb_mgmt {
>  
>  #define MACB_MDIO_TIMEOUT	1000000 /* in usecs */
>  
> +static bool macb_dma_is_64b(struct macb *bp)

TBH I would prefer just `macb_dma64` and `macb_dma_ptp` since the "_is_"
isn't really adding much.

> +{
> +	return IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
> +	       bp->hw_dma_cap & HW_DMA_CAP_64B;
> +}
> +
> +static bool macb_dma_is_ptp(struct macb *bp)
> +{
> +	return IS_ENABLED(CONFIG_MACB_USE_HWSTAMP) &&
> +	       bp->hw_dma_cap & HW_DMA_CAP_PTP;
> +}
> +
>  /* DMA buffer descriptor might be different size
>   * depends on hardware configuration:
>   *
> @@ -124,56 +136,31 @@ struct sifive_fu540_macb_mgmt {
>   */
>  static unsigned int macb_dma_desc_get_size(struct macb *bp)
>  {
> -#ifdef MACB_EXT_DESC
> -	unsigned int desc_size;
> +	unsigned int desc_size = sizeof(struct macb_dma_desc);
> +
> +	if (macb_dma_is_64b(bp))
> +		desc_size += sizeof(struct macb_dma_desc_64);
> +	if (macb_dma_is_ptp(bp))
> +		desc_size += sizeof(struct macb_dma_desc_ptp);
>  
> -	switch (bp->hw_dma_cap) {
> -	case HW_DMA_CAP_64B:
> -		desc_size = sizeof(struct macb_dma_desc)
> -			+ sizeof(struct macb_dma_desc_64);
> -		break;
> -	case HW_DMA_CAP_PTP:
> -		desc_size = sizeof(struct macb_dma_desc)
> -			+ sizeof(struct macb_dma_desc_ptp);
> -		break;
> -	case HW_DMA_CAP_64B_PTP:
> -		desc_size = sizeof(struct macb_dma_desc)
> -			+ sizeof(struct macb_dma_desc_64)
> -			+ sizeof(struct macb_dma_desc_ptp);
> -		break;
> -	default:
> -		desc_size = sizeof(struct macb_dma_desc);
> -	}
>  	return desc_size;
> -#endif
> -	return sizeof(struct macb_dma_desc);
>  }
>  
>  static unsigned int macb_adj_dma_desc_idx(struct macb *bp, unsigned int desc_idx)
>  {
> -#ifdef MACB_EXT_DESC
> -	switch (bp->hw_dma_cap) {
> -	case HW_DMA_CAP_64B:
> -	case HW_DMA_CAP_PTP:
> -		desc_idx <<= 1;
> -		break;
> -	case HW_DMA_CAP_64B_PTP:
> -		desc_idx *= 3;
> -		break;
> -	default:
> -		break;
> -	}
> -#endif
> -	return desc_idx;
> +	if (macb_dma_is_64b(bp) && macb_dma_is_ptp(bp))
> +		return desc_idx * 3;
> +	else if (macb_dma_is_64b(bp) || macb_dma_is_ptp(bp))
> +		return desc_idx << 1;
> +	else
> +		return desc_idx;

Can this be

return desc_idx * (1 + 64() + ptp())

? Not sure what the assembly looks like.

>  }
>  
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>  static struct macb_dma_desc_64 *macb_64b_desc(struct macb *bp, struct macb_dma_desc *desc)
>  {
>  	return (struct macb_dma_desc_64 *)((void *)desc
>  		+ sizeof(struct macb_dma_desc));
>  }
> -#endif
>  
>  /* Ring buffer accessors */
>  static unsigned int macb_tx_ring_wrap(struct macb *bp, unsigned int index)
> @@ -497,17 +484,13 @@ static void macb_init_buffers(struct macb *bp)
>  
>  	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
>  		queue_writel(queue, RBQP, lower_32_bits(queue->rx_ring_dma));
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +		if (macb_dma_is_64b(bp))
>  			queue_writel(queue, RBQPH,
>  				     upper_32_bits(queue->rx_ring_dma));
> -#endif
>  		queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +		if (macb_dma_is_64b(bp))
>  			queue_writel(queue, TBQPH,
>  				     upper_32_bits(queue->tx_ring_dma));
> -#endif
>  	}
>  }
>  
> @@ -1028,10 +1011,9 @@ static void macb_tx_unmap(struct macb *bp, struct macb_tx_skb *tx_skb, int budge
>  
>  static void macb_set_addr(struct macb *bp, struct macb_dma_desc *desc, dma_addr_t addr)
>  {
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -	struct macb_dma_desc_64 *desc_64;
> +	if (macb_dma_is_64b(bp)) {
> +		struct macb_dma_desc_64 *desc_64;
>  
> -	if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
>  		desc_64 = macb_64b_desc(bp, desc);
>  		desc_64->addrh = upper_32_bits(addr);
>  		/* The low bits of RX address contain the RX_USED bit, clearing
> @@ -1040,26 +1022,23 @@ static void macb_set_addr(struct macb *bp, struct macb_dma_desc *desc, dma_addr_
>  		 */
>  		dma_wmb();
>  	}
> -#endif
> +
>  	desc->addr = lower_32_bits(addr);
>  }
>  
>  static dma_addr_t macb_get_addr(struct macb *bp, struct macb_dma_desc *desc)
>  {
>  	dma_addr_t addr = 0;
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -	struct macb_dma_desc_64 *desc_64;
>  
> -	if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> +	if (macb_dma_is_64b(bp)) {
> +		struct macb_dma_desc_64 *desc_64;
> +
>  		desc_64 = macb_64b_desc(bp, desc);
>  		addr = ((u64)(desc_64->addrh) << 32);
>  	}
> -#endif
>  	addr |= MACB_BF(RX_WADDR, MACB_BFEXT(RX_WADDR, desc->addr));
> -#ifdef CONFIG_MACB_USE_HWSTAMP
> -	if (bp->hw_dma_cap & HW_DMA_CAP_PTP)
> +	if (macb_dma_is_ptp(bp))
>  		addr &= ~GEM_BIT(DMA_RXVALID);
> -#endif
>  	return addr;
>  }
>  
> @@ -1166,10 +1145,8 @@ static void macb_tx_error_task(struct work_struct *work)
>  
>  	/* Reinitialize the TX desc queue */
>  	queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -	if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +	if (macb_dma_is_64b(bp))
>  		queue_writel(queue, TBQPH, upper_32_bits(queue->tx_ring_dma));
> -#endif
>  	/* Make TX ring reflect state of hardware */
>  	queue->tx_head = 0;
>  	queue->tx_tail = 0;
> @@ -2321,11 +2298,9 @@ static netdev_tx_t macb_start_xmit(struct sk_buff *skb, struct net_device *dev)
>  		return ret;
>  	}
>  
> -#ifdef CONFIG_MACB_USE_HWSTAMP
> -	if ((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
> -	    (bp->hw_dma_cap & HW_DMA_CAP_PTP))
> +	if (macb_dma_is_ptp(bp) &&
> +	    (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
>  		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
> -#endif
>  
>  	is_lso = (skb_shinfo(skb)->gso_size != 0);
>  
> @@ -2785,14 +2760,10 @@ static void macb_configure_dma(struct macb *bp)
>  			dmacfg &= ~GEM_BIT(TXCOEN);
>  
>  		dmacfg &= ~GEM_BIT(ADDR64);
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +		if (macb_dma_is_64b(bp))
>  			dmacfg |= GEM_BIT(ADDR64);
> -#endif
> -#ifdef CONFIG_MACB_USE_HWSTAMP
> -		if (bp->hw_dma_cap & HW_DMA_CAP_PTP)
> +		if (macb_dma_is_ptp(bp))
>  			dmacfg |= GEM_BIT(RXEXT) | GEM_BIT(TXEXT);
> -#endif
>  		netdev_dbg(bp->dev, "Cadence configure DMA with 0x%08x\n",
>  			   dmacfg);
>  		gem_writel(bp, DMACFG, dmacfg);
> @@ -4298,12 +4269,10 @@ static int macb_init(struct platform_device *pdev)
>  			queue->TBQP = GEM_TBQP(hw_q - 1);
>  			queue->RBQP = GEM_RBQP(hw_q - 1);
>  			queue->RBQS = GEM_RBQS(hw_q - 1);
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -			if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> +			if (macb_dma_is_64b(bp)) {
>  				queue->TBQPH = GEM_TBQPH(hw_q - 1);
>  				queue->RBQPH = GEM_RBQPH(hw_q - 1);
>  			}
> -#endif
>  		} else {
>  			/* queue0 uses legacy registers */
>  			queue->ISR  = MACB_ISR;
> @@ -4312,12 +4281,10 @@ static int macb_init(struct platform_device *pdev)
>  			queue->IMR  = MACB_IMR;
>  			queue->TBQP = MACB_TBQP;
>  			queue->RBQP = MACB_RBQP;
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -			if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> +			if (macb_dma_is_64b(bp)) {
>  				queue->TBQPH = MACB_TBQPH;
>  				queue->RBQPH = MACB_RBQPH;
>  			}
> -#endif
>  		}
>  
>  		/* get irq: here we use the linux queue index, not the hardware
> 

