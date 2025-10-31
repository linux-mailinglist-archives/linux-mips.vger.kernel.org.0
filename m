Return-Path: <linux-mips+bounces-11983-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A9C232FC
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 04:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8A0040065F
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 03:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFF226CE25;
	Fri, 31 Oct 2025 03:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W/hK4bWO"
X-Original-To: linux-mips@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A1B26B756;
	Fri, 31 Oct 2025 03:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761881810; cv=fail; b=CDZL75+u+gcCsQMRwKnqi4y8XsastNB9atQp3qJZSqTKEfPva3WL1mcAQADBHqvh3khqfROPs6PI1pyCoqLZEJ7rnklgPZns7KbAjtdd918+NkLooccqpmH4x8PBYC2+HcfwbQGX/6uGSjXTQxz9KPjA4ZsBlL+VEUpMOHQ3CFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761881810; c=relaxed/simple;
	bh=31ls1xSQXDt973KmzJjPMvcO1U1cnTeNUe44ag6WYBg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tmiJMDiKqFtDkhGXz1XiCPHT6z08uy169dp1lU/4osWViyhz90b1x9iDN+uMb40oTExl43drp9lnbG7PiuUU/LAFY5f2TJ9MnvBj8TWKf4sA6d9qvaZxmsVPnpD3IdxlCpFzAFvG39rGRUcAhCK4Qs+ai4Zmxhn3/C1ux+2DTfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W/hK4bWO; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUA9iLCTT8qZEXMJBq1b0YQ9lM1isKfAcczhVyR+PorjiWigq8K9PeuTKGhwFOTtm4U+Pggqrp7wDpZtXHxqL9TgRDW/O1CN4kFkV43bRfMYgnag4+5uttjvQoAORtrKaVGJO1J2aBIprDCWztM5rjckArLcMcJHYZlb+xbksWJHAzgWU8n5piMPK7CYf/0fZjI3qSM6wAYY1sk/+xInDioPgquYKA+t3fJVMXH0EgX2rixBROhpDn8npg4QFs09XIg7Y8n+xp5YfAQjhNoiEWzKpgAXBgGeqSazLN2uIfUlV/tBlXtkMtaioQWQ1HZOYbOKUwxoIRtT3KVbOdM2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31ls1xSQXDt973KmzJjPMvcO1U1cnTeNUe44ag6WYBg=;
 b=e0xGbGNEf+7dT3jbhPpnZzmoJ2y4ppvm9NfKul1kMzLBbUL2NCBzaPeFmL0PtQyh25Y6a8SKdTEzFKJZvZbcC50UgRCWzVax51x7Z0uRIjInFCvIj/wswRc/ImsIYvlzDCyeOnpMpcZXkSJPsYyGfg4Lb6lLjmJeUZ5R3gx/5oAwcxrXlsnLHfMyHyUyhLtZqWYQSg/Qss0Uib0ETCuwOJsWBKKFb6Jmge15jZ/YMh/PoBYD9xzxJPlCpkpodswzotgolKW9qN+zQ6F+EFS+2mqaEnuCEtxxTWIG03e+yWVgzj54uIzWnrECNBGIXysVxnGqhimbvDw3OgCXNz5E0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31ls1xSQXDt973KmzJjPMvcO1U1cnTeNUe44ag6WYBg=;
 b=W/hK4bWOoq9auPmBA3QaKdQilwWuvz2SNwlk28xM/2NG7JVASjIVmsTfgBXownpgJtzbYAXT6DuWYqZmZ0wUe1aQBIQPEpgKW7cAk6hCZ++m8jDlIIU2qeK7tLM0mQVBatdbtWBjk0Wu8PjWWKww3kMk8gtYr42r0zC/SqTfZlXc77uiQu/E/UBJOsRMT/SqJZrn3zDdnM0wQZdATqHUdyUzCSjxEpbGuENm4b0dlilA8gchGLsaD4ZESquQJOzi1p7rq7Yu64GP/zTdCS6Nc+eEpES1YMBaV49f2SBgeB3tdguMP5K+lPl6M3jYHUci837cDVJdNDlkIAdUKTNbcg==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GVXPR04MB10082.eurprd04.prod.outlook.com (2603:10a6:150:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Fri, 31 Oct
 2025 03:36:44 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 03:36:44 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Michael Chan <michael.chan@broadcom.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Russell King - ARM Linux <linux@armlinux.org.uk>, Andrew Lunn
	<andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Miller
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Subject: RE: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
Thread-Topic: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
Thread-Index: AQHcSeYW1q8Edcjtu0az2ZxkF4wyC7TbmOpQ
Date: Fri, 31 Oct 2025 03:36:43 +0000
Message-ID:
 <PAXPR04MB851024F31700200CC78CE60988F8A@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
 <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
In-Reply-To: <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|GVXPR04MB10082:EE_
x-ms-office365-filtering-correlation-id: d629d987-6135-440f-e0f0-08de182eb65e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cDBGb0JvWjlGcG0wN3IyaEJ6aHZ2UHE3Z01RSUpBWS9lM1FmZzFJN3hZUUpB?=
 =?utf-8?B?ekU2TVUwOEk5eDZ1Mk5ENDBONElRNW0ya2FlSTRIbklUQWlWTnQxbUJPYkJM?=
 =?utf-8?B?bHVKLytVQk9hYm5kdlZ4YzNtZTJoT2dNeTVoSWxYV01CZGxLeXFhbDJTdHZ5?=
 =?utf-8?B?RmgrUjdMWWhWaWVIb3h5TVNzNmIvOFMxazJySE5EREgxY2JqV1Z5eDg4VTJK?=
 =?utf-8?B?SlJQUVJJWGcwOE1PVmh0S2R4VFgrUXNjZTlNbXVLMXFTcU81KzBQbk4vbjlK?=
 =?utf-8?B?U0l4Skcxci8zZTB2aHpOL0Z2UCttRFFZTnR2dk14THdSc01tZjFpcHl2UXYv?=
 =?utf-8?B?bDFSdy9IaDQvcXpCR0J2VjJCQldUSDR2QmFGdFI0elBwK2tQbUJEQW51eG9W?=
 =?utf-8?B?dFdZcFVFcWlZcGQ2VnFqTjJQYlhyL2ZyVnc1akRreGdhMGY3aVFBOExCVEwz?=
 =?utf-8?B?blUrY1JqR1VzeS96OFg4YkU4elNNUGUvczVIVnpWVHVxdEZiVnhTSnllcGRQ?=
 =?utf-8?B?b1NjWFNjRmNnZWpZNHZlbUFiUVlFWWFlbjJzWTVsMUpRWkpLcmhoSEVsa1lH?=
 =?utf-8?B?YXhJVjR0aUx4ZG9ReWluYitaN2xMTWM0d2x2ck9BTGQ0cWlkSUgrM2IybGdD?=
 =?utf-8?B?Q0xUR1RMUVp2SjVEcWNUUHNncG5NMlo5V3RaTjFpT2k5MnFIOURKVzdMMkVG?=
 =?utf-8?B?Ni9Xd1d4RGlpOW5oTzVWcnpLUXpMdXE2QkNaR3NLckpkSVNtNi9BTWo4ODlo?=
 =?utf-8?B?aVczM2YrWG84WWpyQ2h6VmljN3RoU1VmTlVwZ2l1cndnN0MyUFZXVlh6Tzd3?=
 =?utf-8?B?YTFNaHVsKy9lSkRMSlB0bUtJTC9TRmwzV3JydVV1OEY4UlJ5OEdmSjN4SDBC?=
 =?utf-8?B?WUZyZDllZGZqNmdCODd0UCt4N2FTV2RPNU9oV1ZpbGNoNEYrdGlTSUkzSGo2?=
 =?utf-8?B?VVdsTU1JVjlJbnBDNlE0VkNiMVFZNTB6MVlDZVgwcy9OZ0twMWVsN1YvV3dN?=
 =?utf-8?B?Ri82QTVuT0RocG90UVQ1UVhUR3J4K1N4M1ZjK3BBVlQxR1NKRU9xYW81MDhk?=
 =?utf-8?B?dTQwMzJuRGhJbUtBbFU0VlkyK3p5Z3ZQWUJ1bVpuRXQ3S3lGemJBMkFwV0Z3?=
 =?utf-8?B?SHptSjB3QWNyL3p5SGFNLy9jM0ZsdWJpa05jbjloQVZKU2FBTUwzcGlOMVBw?=
 =?utf-8?B?Y0Q2c2NlOXFWdjNzWFhWODRJdDU2aS9SdHpnVERVQTh1N0xJdVRhQ25tZEcy?=
 =?utf-8?B?L3NvR2sxRXdqRkJBZndGUkdwbDJud1VTOGxrYk1TU0VpUHUrRTNxOWRtNFlz?=
 =?utf-8?B?enFVU0lGdncvejhiNm04WWRzUWdsQ3AwakJwZmdMMlZqZk1ub3MvNlJ1VnRH?=
 =?utf-8?B?ZlAzUU9aYzNDWXdsam8vYkh5YWFKMjJveGQxc0hSbnBzQjJZZHk1c1NvWXlO?=
 =?utf-8?B?MENZT2FoMzE5NnNETTlBampmR1lKZDZ1QUR0cVpJTS9LWnBkamtpVWhVT0R2?=
 =?utf-8?B?VUltZzVMTFlFZEFmZ3lSVUR5Z3I2cXkySWJ6cUlteW5qcGRxTGlZSHQ4dC9Y?=
 =?utf-8?B?L0hFM1hHREhXMW1EeW52MFR4Y1c1Qi9TVGNCVzRHWkxaYk12Sk93RTcyN0JS?=
 =?utf-8?B?VGpoWDlHY0FuNTMrUUtUSUNIYkpaSlBiN1llSm5URCtMaFUxWEU4SVBZbmhR?=
 =?utf-8?B?QXFPa1RrNnlKRkt0eGVYRHNtaGQ4OFdSWFViVHhieVdHWTR5NlQ3ellKdWtF?=
 =?utf-8?B?S0JLR045TzQwN25jeHllUmhqQkF6Y0dueDBDRUh2c0NnR1FLZFhhTkdXeE9r?=
 =?utf-8?B?aXB6NXBhYWw5YUhtQzlkR2lSSDZRRWxBUFpWY3VJc1drTjI0UTVCeS9vYVhj?=
 =?utf-8?B?OGhGbUwyM1paNGZtNWdMQ2ZhUWZOeG1PangrVzRqcXZsQzlKZC9lek9odTNL?=
 =?utf-8?B?cjVXWEMxa2xLanNSWm53dmNvZE5TOUE5ZmNnbnJTeHpyc2ljTWpieUZRd1Jj?=
 =?utf-8?B?R2YwQVpxdkJaM3l6QTVieU9hRmwxNVoyd2VpcVB4ajIwRi8yZ2JCSXVib0JG?=
 =?utf-8?Q?RBgXcX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R29oK3AxaDVzejd5MXIvaUdPaFFwT3F3N3lMK0lmNUZqMkVtaDRUUldQcXFV?=
 =?utf-8?B?Rm1LYWpLL05vU01OOXhkdHNPYTVPUVFtdGZELzF1M3RZcGxiOEdOdnBJYkFH?=
 =?utf-8?B?Vkh0TW5ZZ1AzcmI3ZGhXcFNPVCtyeFNGYTZtSkt3UzZCV1htQUdxYlIzY0tn?=
 =?utf-8?B?eUF5bjFveGpNVVQ0Z0VGZWxpSWZ0RXZjYjVJTEQ4ZVQ3M0d3bXU5Wm5ERnlX?=
 =?utf-8?B?T2x0VnhkTVhGT1U1QnYyZkhDN3E5aHc3L00rbjRNSFNjcTcxNTAzRXZBK3p2?=
 =?utf-8?B?TXJ0TXB2RGRzb1M3bTJXRXUyMUFNc0YxTlNneTUrVVdxeXIzbTNiN1U2QktK?=
 =?utf-8?B?Z0dWd0NId0UyUlVoZzl6OUhCSmNNT1VXQ2dKZzMyT1lIZmlOeHg0am5JYUFy?=
 =?utf-8?B?ZmUzMURVMWlQL2dhZ0E4bFRCSWlwKys2TDcwVlRSRHQvR3NnWDhyV3QvRjFO?=
 =?utf-8?B?OHU1U1RxUkNpSnBhaERHZlhZN05EMUlyaWdabVdrZ3MwMGpVS3krQkVyaEtD?=
 =?utf-8?B?OXQzTlRVUXRxVi9nWTMxbWJnQXZQUFY5ZllSVSt2OWh1eDdnZHlqVVQ3ZjRU?=
 =?utf-8?B?ckZEVmNzNWJrTlBQN2hLbUQxYVJOQmRMYU43b3hYMWFFQXNpL1lMSXJMSHRK?=
 =?utf-8?B?NEluaUhDbmUzMjhYdzErVmxueXdnQzZKQnNTMHlyZEowUmJFMkREUUdPKzBs?=
 =?utf-8?B?dzVpZTZVbHJMVUgwUlFPYmhpNmhqb0ZhVTgxaFU3eElmajNtQjNzNkR2MnpS?=
 =?utf-8?B?T2kyelFQRFh3b3lXTm5qOThtQWU3R3FqVFZxRFc4Z2lDVTJvZGlKaFlKcUYw?=
 =?utf-8?B?dEwvdmFrSC9hNkJ1by9YeWUwamx2WE9XRVhUL1N0NXNDa2NtWWlqeThEUlBR?=
 =?utf-8?B?Uzd6YjZ5ZzdyL2F6UnpoNmRPMzdnSnJtYy9DS0pqZFY4V1hJUlVidVRXWnhD?=
 =?utf-8?B?Y2JTWEhvcTlQVEl3eHl6ckhEQ3F4TXhWWUs4UmR0cUxsSFk5L3pPbVZwL0Zq?=
 =?utf-8?B?d2pVTVdOb2VPRS8rYXUzZk1JcWZlWm0rbU1XSUtoZk9WNWtvckxkL2ZNNFM1?=
 =?utf-8?B?aGVHeDBYd3JFV0g5Q0JqMHFzd25NdUZlcjVIQzhzVEJaVFlNakZxaFQ0UVl5?=
 =?utf-8?B?RGdvN0h1dXh2TjE4RFNBa2ZSY2c3eXVGdVpKRU54RjVPL0pRQytiOHFRallR?=
 =?utf-8?B?NHA5bDJmZlh5aWpHdVhQdFd4eFZEME9LWElQRmMzcnYzV3dScXJUNmlxWWdu?=
 =?utf-8?B?Y0k3dVMvSTgwNGI4MnlkUXZQMHhVV3owZDU4Z1pJZWoxcmZxVlV6c1JHZERv?=
 =?utf-8?B?Wmc0bEd3cStFL3ZocURmU1R0a1l2RlcxSXJBVHpFcTBuNGJMYTZybnFPV1Fk?=
 =?utf-8?B?WFpaYys4Q0haTXhuMklCWnZVeE5Xb25tZUtjRUtka1RmdW9CV0F1bWE0MTIz?=
 =?utf-8?B?R2h0NkQzTlMwcXIyQU5zQUpJRjhvRzhxWHk4OVorQnBtbWlvbFZhR2x4dGdZ?=
 =?utf-8?B?Uy9vOXZnY0VndU51MFdMMFd1TFNwNXY3bERuV25aeXgzcFJETmo3RmJPRGRL?=
 =?utf-8?B?MSs3K29lcmtrOU9iMkRCNi9aSkJTYTRhOWRsRlZGTjI5M0JVbTFKREFGSTFj?=
 =?utf-8?B?aU9zTitQM2ZRNG1ORmFFWUFHa1FpYmwwTnhFSVRjalQxTW5iMURsclBKME44?=
 =?utf-8?B?UENvdXZQcUM2RmRZdC94aHlCRGNKejNWNStya0U2Q0ZreXpZekxlTmpsS3NU?=
 =?utf-8?B?SlE3Q0Vldy9VWkM2NWlVUGxQSzVUL0M4eWs0NjhWUzR2N3ZIV25jRkZYeVJw?=
 =?utf-8?B?YTBWVzZLL1VKMFphL1FPYloyZ1hVMEhOanI0bHE2WkUxbDhaNG9QOG5LVlVO?=
 =?utf-8?B?MzRDWWp4YlJpTnAwN0tONkc0SUNzSzNCenZRMkUwRnBFTmVyZVVQYUZLM0Jq?=
 =?utf-8?B?eDIyMzJnQnhodThYR092dkJPUHZUbGtjZTdmN2wydkc5L2QzZjRQT3d2ODk0?=
 =?utf-8?B?d2JPYjJjOEE3UTdXMzVtMkRNK0N3aWRDN1pQeGhldHVpS0pwK3ZkSDhxbFRi?=
 =?utf-8?B?OVZrL2tOb0VRTjBSZ3ZxQ2pkZW5sV0NSZXhLZG14d3hPMUorZ2ZnL0tERDY1?=
 =?utf-8?Q?j4ag=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d629d987-6135-440f-e0f0-08de182eb65e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 03:36:43.9783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jh5evfmK1F1+/pUa32P2RDCqZHGimbtVQxNQKzgYjuRlB0sovtS8tPnSAhbU9L44G/ODRcQrEZdWeB1lYdf5ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10082

PiBOb3RlIDI6IFVzYWdlIG9mIHBoeV9maW5kX25leHQoKSBtYWtlcyB1c2Ugb2YgdGhlIGZhY3Qg
dGhhdCBkZXZfaWQgY2FuDQo+IG9ubHkgYmUgMCBvciAxLg0KPiANCkknbSBub3QgZmFtaWxpYXIg
d2l0aCB0aGUgQ29sZEZpcmUgcGxhdGZvcm1zLiBEbyB0aGVzZSBwbGF0Zm9ybXMgb25seSBoYXZl
DQphIG1heGltdW0gb2YgdHdvIEZFQyBwb3J0cz8NCg0KVGhlIGxvZ2ljIGJlbG93IGRvZXNuJ3Qg
c2hvdyBhIG1heGltdW0gb2YgdHdvIEZFQyBwb3J0cy4NCg0KZm9yIChwaHlfaWQgPSAwOyAocGh5
X2lkIDwgUEhZX01BWF9BRERSKTsgcGh5X2lkKyspIHsNCglpZiAoIW1kaW9idXNfaXNfcmVnaXN0
ZXJlZF9kZXZpY2UoZmVwLT5taWlfYnVzLCBwaHlfaWQpKQ0KCQljb250aW51ZTsNCglpZiAoZGV2
X2lkLS0pDQoJCWNvbnRpbnVlOw0KCXN0cnNjcHkobWRpb19idXNfaWQsIGZlcC0+bWlpX2J1cy0+
aWQsIE1JSV9CVVNfSURfU0laRSk7DQoJYnJlYWs7DQp9DQo=

