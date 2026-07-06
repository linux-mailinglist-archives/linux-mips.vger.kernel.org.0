Return-Path: <linux-mips+bounces-15506-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /48JA+x7S2q/SAEAu9opvQ
	(envelope-from <linux-mips+bounces-15506-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 11:57:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FB670ED37
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 11:56:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=bMLqfAh3;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=Klk6VVJk;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15506-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15506-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95DAA3283DC2
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 09:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A7138552C;
	Mon,  6 Jul 2026 09:00:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038941D4D0;
	Mon,  6 Jul 2026 09:00:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328435; cv=fail; b=LulYqkGUI9KLT+HsDX/O7kp8z4zGcwchWR8fzmh3GdUE4D2UWk6QR2/8ilSjr4Ht8EmwPmgTyj6sn+Svrc64Yf6qU28JlkVhSb+qkObY+SSYShcAMpQO1/19g/7Iyi4cFFyf4bhzFtWK5NlVJswg4UFgwv7hmB1mjyng1UQYJb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328435; c=relaxed/simple;
	bh=RtYHqMgr0NU4OVLmUleG6248SRimyDyU4tWYfKq/dm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7Xf5zhQSu8cMf8Ft+4TVu7lqLAZ2MYXoyXjk9gMEFQYvCPYpTV/ysfbvhPYpsGD4RWsT+OzmWzuUGm1gDk+DNMhL8WeSHAZK0xUz2xfIJB3UGyMsbS1Erk4cS1AiYgNvuscpvkIymUHiKlh9OpBTYbqEuges9NgTKHyHAEUk04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bMLqfAh3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Klk6VVJk; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664tcK7949871;
	Mon, 6 Jul 2026 03:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=W7zTdAPH+TXAdRMtIP
	thOEcKQYB07fE8iVtuOy0v018=; b=bMLqfAh3NGmmr9WRKp2ZWhSmdWTNLnUAGt
	gzQrxTlKCl0mV2EaT2KFQAE/et6YTq5SA9by7/29Gy4BZgNTaN0444rqlusbSkgT
	6jg8tj9cdwzRkcxUOKL1KrHnNnKhHGTNSaPTmeUF3xuXVYD8pMtLdYq3EMvHzmSp
	vhycKS2FixKBCH+Mmi0nGLHty9Q22Qf4SZKG3bcKzPlX/ow7cXUvct+7oy3mu1qW
	JF04dn2/uSLweWAT/5vEjsoCi9etD6eEpkFNNBfZF8dvGq/P3Yku6AgybyhWd0Jc
	+4UgaoMsZ8CBum9pnGCRAOdIcPCho7NSII7oi816yQvxqe667y9Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020135.outbound.protection.outlook.com [52.101.61.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjj2x7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 03:59:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9MC4/iKv5zqKV6ZR7QrH7VzDWEeLByieWrqjYa5uxcASqIcaWbAe1LPPAUPOQ1y8gzvWHQafJVrrgGodyK4HaRHMhU5uaTFIOEv5jR/IQJaJyaJjCDzNdP+b5Q8ofFo5hbGx09EF0Mx3mDd0vCdm7xNACy/ASbAmZG8bD2XBoTJEuJKCvH5DgV5vrCm3McKOIcHOgvvczd1LhXehwgqEU9J6xTepfxSG1IHbMEBg/NxUqW49CEyPFJIst8NQZQDtjGYux/V++xsH6PGBNYjCJxOuQcVYnzJUjKrzRU31teas7avd3k3J1psFwgH3yfepnx6xX1kKPWlbZuow/5zQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7zTdAPH+TXAdRMtIPthOEcKQYB07fE8iVtuOy0v018=;
 b=HDWAoqueSymwRO3WB02Ymdx73WTeblygthAx5neAKSHTFSIJqhszNwi966BqGIt+CLbd/I7AQfEGfIj7OG3slax0sFh17OVd7AR/H66edZ5TFipgbP5gMljINcYua2Ce0+8jSBHt8G8dTK8xKd0NW/Ll3wUwME/pw5VXEAaEDQXN5qs8e6LX+TYmUhEJxKDQKR8PIJz4YAIsjPHpbQNm1+E3/agd5T2d+qs/XOZVHSlCRcp0JSkHGZ61VywdbN4MrSJPaKOiUwk3p07/yKzIkoiUM7TVG7Bg1XDZMkW1ufnms52vkq+PCEKZ3k8Pb2QMczeQJ06j8LVZvYcEXCNy1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alpha.franken.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7zTdAPH+TXAdRMtIPthOEcKQYB07fE8iVtuOy0v018=;
 b=Klk6VVJkFH80dtgDknsd2RyhlEGoN1sh4GNPODXZ5FzwuZQh1mhWxp5JoOlFTRak3NAtTQKFuVD0UvBjIfdqWkDkz6FCSZ4HTl/AAibRpuMTJ6+YOOcB5TTIe7M9ipyiosa2kCMuuQPePptcgGCj6GB83dx2pYDDus7FKELDpKk=
Received: from BN9PR03CA0634.namprd03.prod.outlook.com (2603:10b6:408:13b::9)
 by PH9PR19MB015533.namprd19.prod.outlook.com (2603:10b6:510:3f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 08:59:13 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::3a) by BN9PR03CA0634.outlook.office365.com
 (2603:10b6:408:13b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 6
 Jul 2026 08:59:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 08:59:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D0075406541;
	Mon,  6 Jul 2026 08:59:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B0054820244;
	Mon,  6 Jul 2026 08:59:09 +0000 (UTC)
Date: Mon, 6 Jul 2026 09:59:08 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 05/13] mfd: replace linux/gpio.h inclusions
Message-ID: <aktuXCpaALsRheb6@opensource.cirrus.com>
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-6-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629132633.1300009-6-arnd@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|PH9PR19MB015533:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e04cdb3-c894-4118-e436-08dedb3cd8b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|61400799027|82310400026|23010399003|11063799006|4143699003|56012099006|16102099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	E7EefTCcah0FnuBJTu3BFgcPoSrXou1um5pue+t5IVo0U2jvMIMnvLx02Ipfzz59YfgwEzG1uBUs87Aqpi65BWoynCtkz2olyEs0Rn9nXyPFmtAV8xeskLpF061dkmW20YejjTI5eEG7SPwDGCljBO332GzfSV3m8xJ6C7q9ClFSmwHn0ZHKX+EjbHizhJDUf8hx4ejeknrgKz1df9zRMo1Vxe+Tr7H0EbNqBrV3ioEDKO3U0dF/QTxrVg0xhHV3vIWmH76eTHu5Abgepe5kQvTnxjVWl+paPaN3unoRBQKl5nOIg0Uw+7QUCwCzjViSb/x4SgAfbBL8UUbOwTSpoAmNq2N/OxButDkBFcB+ytkJmblmDAIckKqfLEVK7wnQO6odfxRWx8NpdrVHHRInC92Yx1ygIFUO503rFks04JJQcrLXWWV7CBmc02lrYXc4ITuqAHv8jnO5QskZJ8X+sI+GT1uL49MIa6ti+ebEvAkYNN45g3dx2W9eqQOJOWDF5DyvqBVg1GMdpbf1JQh/NP9S8T5EpjA+ZOaD+7uCvIScXWRYn00b0GAlCkfeCAobyLezcNaNu9Tg1iZ/Cb/UD4PMpC4W1jQob9ZpssuV9aNCM1gFFKiNv9O/VTuEpDoK4SyMEaKmD205IIL6uFuPZpw1MroL8zTCLMFTGFLCVyUkbV3LtaxpA8AD3Jt7ubGQr5Y0Z15NrQE7UOZP3sjDB3Snhq5MjlNybjKyXLvI66u1CUnIAX5iT3Bp8BcgviQkP64qKckDzUqCb9IgeVy3IA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(61400799027)(82310400026)(23010399003)(11063799006)(4143699003)(56012099006)(16102099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DiyzAXyNfQGF6VbQhGkTwlCrxhKL9g403kU4ahVcQBL/KEsOSGh9qVjPxxzwla1qGooSdeo8Xd/z1YeZ4PuqeiBG+zcaK//fCSDdYmwUfgod+N907jTL0x3G2Codkon0qbJhj3nGLgpTxxVv65U3MWuOQUEGl86upDAzP6Ejtzb8slYXN2QsMZhvAB4a+IkbAmXCQJ7Jz+t8SjgUH2fc9Hn/IY6IG68g9bCGA91/E7MyFHS7AMKmScSwK6Fygc6Nx0rVxAR3+VKC6LKXDkXe/qV28ICznLcix+E8cRO2K8b9AXBvEjNo2f5VoEJyFne3LXI6ALWcIIhhz3jdj6qRbJOgQOoVQnUHmfqrGalpErN/7ekIUU3NBTMwmcf9nImko8BXv9xIAHqSqCaULM9iX6deLCWj2pxGLG7LF6xu8nygfv1VmD4MYv4HOnB/OOmf
X-Exchange-RoutingPolicyChecked:
	FRSD54SnQ1qI2gmVdSWq6RSzvcuctmLyUZHR5rXhavwYTKFsWb7SGJdETrTBiOtDS83sMfQwhlB9/JUnDiCmL+rzaYqFkgsw+ZBnF9fcY3jChnWJ1OfxRCxpaKwR69Wcbwus35MtkW6PVb2oT3kfUysaTqBwE8ipX+Ami6orheeopuUceRm/3sIzDsaCufK9wtNTeGS1XA+DuRKAVviePh+uoMpSsTVDZ2PBV+3HGc6tQ55dXEkkserUeJZjYnK3axPiY49AQckXRMsp7cFY62IdHDK42sgVtVSIu46FJ02ypePIyqCmdiPvAcDRjWvL4kKP7pKHiHlZh7IL3bI3ag==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:59:11.1660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e04cdb3-c894-4118-e436-08dedb3cd8b6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB015533
X-Proofpoint-ORIG-GUID: zFDT0csb4S-tm93ITy2SivemNmFAxJBd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXx1GZDdP24liE
 LIks8zvGjw9tLhWUDqxot634kbzQzuqF4b9uRINg8GOLB8E+Q9801e5VidLFO2I0XfCQZ5uq0Gv
 PIDWz1Nn/GVHEEKFMeCYTJ9+N725Myc=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4b6e64 cx=c_pps
 a=3NCrMMJo8uPYhFoENQJqcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=29hDNoCiTdFBKAxBKhsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX6z+sQEL7UD63
 yVaycn/q22MZhuAh1Gd8QkGdvY6yLNH5VxQx0HtmOlNHpXKzw0QAnuIXsydz+IchY0UuMoBis6V
 IwkyHoxKakFCJ+3erqmF/XxSoPMcd9/cQHsFHSuLXxu/krQeG1DdImt5UGUa+ntYkl7OlumwjQ5
 fOB4mMsM64ByeMwlQ2ELeHiXF67hsh4hWbFAKBnZkLY8LhvEGKV4DlVX+t1+bFN0k0zrQL98QDs
 K4qKh2lyfp33EEyi3zOY78qrqrm7CMyTc+fjIYDisEKF6Gs/NGw7C4z5LdjIDnsA3ilEY+UJHOW
 2jLhBavV0jlHXaAMF6fDRirxuWLeSgyCL+TUbouJXyTplW1xzkeZJ6dg2IG7n9db2I3rzLiKfiY
 d5yMZnKg/v6y1rsnqRcS7xmnerfO51OjeuYR0mUJwwYEyIWfpR25XEo+5gIxRWYm6tju73UaJbI
 5D8bIsPox0OQHdoOv6w==
X-Proofpoint-GUID: zFDT0csb4S-tm93ITy2SivemNmFAxJBd
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-15506-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytor
 okhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,cirrus.com:email,cirrus.com:dkim,arndb.de:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54FB670ED37

On Mon, Jun 29, 2026 at 03:26:25PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mfd/arizona-irq.c         | 2 +-
>  drivers/mfd/wm8994-irq.c          | 2 +-

For the wolfson bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

