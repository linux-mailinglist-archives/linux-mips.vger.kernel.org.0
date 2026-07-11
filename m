Return-Path: <linux-mips+bounces-15770-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iK2hFvY9UmpBNgMAu9opvQ
	(envelope-from <linux-mips+bounces-15770-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 14:58:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B03BB74194F
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 14:58:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=pioVt5ZH;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=Q2yJK+Wc;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15770-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15770-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A989302F4D8
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 12:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E1B3C8728;
	Sat, 11 Jul 2026 12:58:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1803612F4;
	Sat, 11 Jul 2026 12:58:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774683; cv=fail; b=O+aOUnZpPexbMta9BuawAZjcCyYixX7lLQ2ITwmpPbPV1Rx1hHGkeEYzM71yD/xh7mQKN9WvaOgbaCOIBn7WQhnmUIZiAGarHfXelwVQItsucexp73NfqzJCWMX13pBRnWH4n/C2xAKikDIFOTJM2UGVELMig+7aI9S9LBW87L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774683; c=relaxed/simple;
	bh=EaU/4WdJTrU0V4zfX53KbNl7PmF7qitymL/Q/1kUk8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2kOJgNp1P0vXAsTtJicXjjyFO5ttrh/3HeEtZ5jLSvW30NNHMmHqYyCz4VpKolB/ZjhYfdsqJJIo5tPCX8o2CAC6Ghky4J1jk4mcZzhFwpRGgMVB/d6sO3wtX/2yr40ETQML9bD9cTPJqEf/ZY2tWz/LytADLlEwkD+HafzdSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pioVt5ZH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Q2yJK+Wc; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BCuMkd1377900;
	Sat, 11 Jul 2026 07:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=49D6XNPAUi5Tqarvm9
	boPEWG3tQSYsy6F9sPaoWHaBc=; b=pioVt5ZHtahlf0HDUsmmZrCWXIC1KbCPog
	hipCE7n+us41lPDTZNTm3x0U7kJw+KPf81pzEyz53aJHMuYAWje7BJQ/bgqhMeNH
	TTzyhNXvZzUX4JllKStPBYvwhkDb76aqeTNQ/qJ1fTeBEv2qmICT+GdyZ64Jt3JC
	NKHx8UrUa6IwsNu3S6idSshOUXkvfjBh9tuV7wskuD+0YA20fJukTPUQ9XXHsTb4
	O3FPvPKKR1BEF3Y6tj/iDdQ5RpewEDpzEo0Y+5uMzBesHdOIwpA6GEPUlyjgD1W3
	c4YXX0oyIxfd2kwmj3sdrkWXelJoRMbHnrga8pyRHSHkNlDWCktA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022097.outbound.protection.outlook.com [40.93.195.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fg5fk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 11 Jul 2026 07:57:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqwYqGSlbirdz8kxCwjLWp132TLQmcnzHXSC1UyufX4uxjuwWHOIaK7V1zw18bMZD0DL1ulLY4bmeeWBU7FsOUyVNEuYpEfGjHHaFRwwLYvjUQk+FD+fWlDPBFhL76Jsj3LsatR7b1hbOsQBn0f+XKfimWtgET/ACnkbyLub0xiQwN84/K/VWHbKLE/xXyTs2XgAfXuzvqBncRCH3EK0yzwKMcOnUgMBILp/diIF1cja4T7AyrnM9Ph7M8vy3TLa3q/leS7uU1REdRXxu8uOw1XOsRUjRS9sSfMxZllnArLDRLSjVuofbsKkWZEMClEge/GWfpEuhdLG9jSsW4mdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49D6XNPAUi5Tqarvm9boPEWG3tQSYsy6F9sPaoWHaBc=;
 b=eUQAffbi9yzJZonjB83XJoZQ0fIcKub/M0bV4qWocpYW5K0A+vFAb2HADy0ujqXz3N6BKdZRAbQrI0i4OBR+JCHs1mOnTAVuUpI6/j/JYWirvQj3dd/fmvG7DFGkXYmwX87c1bHf/Q46Fg19KNKQNksBzWHF3RUfPIbcIOqivJwhl1+qq2HtoIfNnkigrTouJ2ns7qSFZ0wxs7ZJuDx9bwa92tYgmbysiGPKXGur+x06UcZ/AJz98fJ3wZ70KuzUzi1zUy0ThDd1sPUzbPV00ITBHEI5Tnj0cUEPvY6rYjMdMAh/TnDgW/6JkP6eOKRNdFAlwhjdlkt+FpzUiIZjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alpha.franken.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49D6XNPAUi5Tqarvm9boPEWG3tQSYsy6F9sPaoWHaBc=;
 b=Q2yJK+WcRtHDN2eppQY215qsuadF31tTkmM4/C7pDbJGljDnDHNHAqXamJmxB62Cl+UzBG5zOULWUzrrsQKfSc+n/0ilBeLetpCU1epZxVMg8UNdtnQS3xZqmd+l3BGDbeivHLRmDn/eQqrSP7gqyHpBC0P3K6QBgr/z7sHihVk=
Received: from PH8PR22CA0014.namprd22.prod.outlook.com (2603:10b6:510:2d1::29)
 by IA1PR19MB6276.namprd19.prod.outlook.com (2603:10b6:208:3e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Sat, 11 Jul
 2026 12:56:57 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::a5) by PH8PR22CA0014.outlook.office365.com
 (2603:10b6:510:2d1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.16 via Frontend Transport; Sat,
 11 Jul 2026 12:56:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Sat, 11 Jul 2026 12:56:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E74C3406541;
	Sat, 11 Jul 2026 12:56:53 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C9EC582025A;
	Sat, 11 Jul 2026 12:56:53 +0000 (UTC)
Date: Sat, 11 Jul 2026 13:56:52 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Lunn <andrew@lunn.ch>,
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
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/10] mfd: replace linux/gpio.h inclusions
Message-ID: <alI9lIsY8CBU7NDa@opensource.cirrus.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-6-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710211954.1373336-6-arnd@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|IA1PR19MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: afc0fa70-b544-400f-fef6-08dedf4be304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|61400799027|376014|7416014|82310400026|4143699003|11063799006|56012099006|18002099003|22082099003|16102099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	YX75cL18NrsLvwRysUJa/j2jwIwyq3twu0i4shtiUsTNo6sczvY7EVgvXV3zwTh30gMLUYKHS2D/OLJ0CDDhmkZWL6AnsJ/pYPKHKRFJ5Byr7LETJSI5tLKVJiklTc0CWEEiAkV3hM11QNStZV4HLcGpdXu4mobcTlbisCyfxkOhKLuo0m3Jcgj94ISC/8LU3dRkXqrUlfWKfeEmQ05cUFm1tO/pMncnSmssRMn2baLr5774IpBUPAWR9zx0P3zS+PvMKLJ3M2GbdhaFhrWVcdbJ5tPS0YW4xFO8JL1eGsATmTeHScS9+3lfDyj9skwTDMQZ/y5Ir6j0rgWo7KCc5Gr/uj53M1g3r5QzW2q0hHWzwCwapwnzpb9+42iuWSu1x5u8ejwd6bzxdpY52A7f+n8d0lWg2dLm00T26DONFGQxZi2kPu1OqRqmYL1nq0RUvd/EmHFI19HeZy9zxPzDDbRmJ6s2Nt8/XTaFCZBOgSdV4AdGIZSgfX6mRULBHjNpxyHKQbpF6RfoisipCCIJWdrlYwXQRfehLY5hiby8tLolqQ1RiS0ww13n75qpHrkyYgi3KLdXp2oP7hFQT/YGoVzrF0uXwJiG++Fwn1yEQSrAR4pWVdz0KkBf2W1RYlyoqQ0bM4XMy7bG+28z0PVI76fup+3o/PYvgc02sWnarGC56kPG0exzdfMRDWRyFIrSox+qewLxTqHikN/rT8VbKJ3X3ckb99flQIABAjIyp/yS7q5AFHRsb32eUtyQafmHFv824ZHKnGJ1TlShEPCLFg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(61400799027)(376014)(7416014)(82310400026)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(16102099003)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GSbhbhBgGQTip0uehdE+T/m7anyrXDxtnSGV7Ug270AXzhHeI77xB7Ht0LIBAz8j+quI90gZQOlH4/Og4XQfUONkHuphFhgTg139V6DwD1kCHNq/h8UPLJrtu6OlxN//hAkEdmMVHVWYflp67fF1WmagMMsg46Xn2xJGdremfAsg9NQTzJHrvtlTqT6VylRqwSbyZQw5mNVtivXk1EQW82l+sDiVRaGCt5aNH0j/vFR3aE6yTJVX08xYPvUwERmx32SDMYyj/j3JyK9hS/5nC7vjKfYsV2ZsTu3r9CUI9JKQnwDBacQSRzNLL14zhNKV1+hr2GSYjH0/Zb/9aGeXgfs3G/1B5SRWgO3LbR79knlMvslDQE3mgpOLJBvcFCfyLvZPeBEUH9pHsgczYP+POpnMDtk/J/Tkvh/xIsj6L8GOThYI5ev0h8gMw+44GGJz
X-Exchange-RoutingPolicyChecked:
	c3tA3MYaevRrWSk9oNR77dmI2yM4FrTtx3Mz2dtLQXGmv+H0KhZh/pyiggTW8MiXF212eAJ08kJzPqZHek+Y+CmyS1NMW+/8yLxkv/kgW4yWrDt9EJ5CATJPrb7Ta4JWgcKPYDzY+Xr69dGqpBXak7rEjAKbJq/N2mpZjAiNdeRF71Vk4hj6GCix2ZY2jK13N7YZ1PbwLRMyKzl3otqZ61flMCNCaEV9O7uu36HwyJga9+6XGJAOBtuIod2Zg7ycSLk8xKY6dsxwJWBOHDlQYyxLKvk7RniSdxNZ985GENb1dhq+lbI5huXnnS9sWyLAvRAosdjcXx1MtVhi1S5++Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2026 12:56:55.4997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afc0fa70-b544-400f-fef6-08dedf4be304
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6276
X-Proofpoint-GUID: XiA6Qj1-ykwgcYYEFBK4Evn5KxVSWDGG
X-Proofpoint-ORIG-GUID: XiA6Qj1-ykwgcYYEFBK4Evn5KxVSWDGG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX/8QGLWmSTrEt
 IRMoV8JKEm0fL43FlWs16fzctSSEkmgG2uyH2aIGWyvZNHCXFFuNupIy5oh5l1JnvXHB+84pUFX
 Ye3xr7/sorygpaKu9TdIaUb6xbdWMBI=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a523d9d cx=c_pps
 a=YnstAiVElcvMFu1aLrgWsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=HfRVZU4pgTnqLkcF7okA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX4CGKaNCIdNl0
 R7vdRWpV3066RQ7oS/n+DCAAaEIeQp/TukCxSefDsKft4rs7fSsqrACiWCnQdYO1HLBMDZq3gBY
 bTATJAZLeX3uyKtQMp2bA8FEFiVdo/c96CrvzTbGEckPa1lauWsBPDZZiSZUStQ4lf0JdB/04Zr
 GEl7B9SaeMQDFooA5HslBDweS3CjS2a+uyL7011s5ZoXrNwGlQKRHaz0sCn5SU2MTp2RDzVTCPQ
 vv5gpvvYWqlPoFp9qptmqIcqZbACZ175eNxsql53HqMUWKOf5SK6cCDFToG7H2KGfHFx89jss0u
 VoJpjIoXbSW87eBVlgGyWTH9eeaR3vmrZvvlW/TKsI5RYonIC7QwsNCRdfTGMaoeTUbDxmjcRWd
 NJWSL8Qnm855evd5MiKGzwVfq7ME5puqQlNag/nvEVWr6X0BQoIOf9I09T+FdCY9tFlWpy7+kks
 2Io6Ia0fuAh3PG/gyRQ==
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[bounces-15770-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:dmitry.torokhov@gmail.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,arndb.de,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,dominikbrodowski.net,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cirrus4.onmicrosoft.com:dkim,arndb.de:email,cirrus.com:email,cirrus.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B03BB74194F

On Fri, Jul 10, 2026 at 11:19:50PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mfd/arizona-irq.c         | 2 +-
>  drivers/mfd/wm8994-irq.c          | 2 +-

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

