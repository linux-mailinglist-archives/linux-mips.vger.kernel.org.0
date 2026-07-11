Return-Path: <linux-mips+bounces-15771-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 17yGBAc+UmpKNgMAu9opvQ
	(envelope-from <linux-mips+bounces-15771-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 14:58:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C017741966
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 14:58:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=KsS8Y6Ji;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=Th6q99x8;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15771-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15771-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49A4A3014132
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 12:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18DB3C6A57;
	Sat, 11 Jul 2026 12:58:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA833C09F7;
	Sat, 11 Jul 2026 12:58:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774723; cv=fail; b=cDr/F0VR5NtWyMA97IpafuyixBbJUnP4OQjVJ8XSpl9MiXxvTqfg3HX0tnC4YXpUeI8aazW362ZAMKPO9Imp1z11ka0pWu8OR7bltu4crhvrJtOCOD8ofJFNwO+CxTs2d5RaEws214nVgz1YT1w25t2RnY5EZad6mxYhMLSLKaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774723; c=relaxed/simple;
	bh=rBnL4ctTz9tv0TTHEC5HVGxv2Wr38Pqqrezxc/x1a58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQJWuc9CzE/ybXCV4LrPwGvbSi4WV7aBf9ReLWpnPjvEphIY0blwFKpj3CZTqvebW46oeCUqwUTuKbOODLE1Sl2yHBnC14dUmqg9ZS+wlLHxmLR1TD9f3UWA+/5qnVeGOmhZGCuq/cc+LbF8YOLjIY1vW95UdpTGmF3gbO9Vdh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KsS8Y6Ji; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Th6q99x8; arc=fail smtp.client-ip=67.231.149.25
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BCn95Z122595;
	Sat, 11 Jul 2026 07:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=eyq4HGKyVzkOAZNP09
	6slr8mvKGFS76zs3XVChvtyHw=; b=KsS8Y6JihtSG+pjT3GKvmMP93GLC/L+2Bd
	RGzfKgLUeQMdVwfjuWS2F4elqUG0H0xgHr7YOqxDIKKjpkVPjNJor4jqR77cYlQb
	AVGiW5NWkcXmkcZ+HBPhY8wjW9+sa+Oh4LiDrhTSK8nUB08FPwnAPJdXR88onkc8
	QYYdzthPMy/dSdKH7U4t1VlYrv9QFE3HL7/FZrLJWv2kn800/EboiWoxduyZk5ix
	6F8dgLyl0GPmaNo6naAO76XhKKfFXwScEyzokh5N5/hiDYfWzeEpz+oWfi6s06Nu
	1ywz8SrRp+5UT13evU3HmHeu2TeeT8bLCeJhffswdNn/2HQfEJDg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022137.outbound.protection.outlook.com [40.107.200.137])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vr3ys-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 11 Jul 2026 07:57:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ynq9hmX6u3YTgbcEyDw7N+sNxp59v6dl3DNh0NZO8qWf2QlYeu8KobRbzPpwZ9+sFFwkLWUz6clCOauXgDE9ysrRq2sebY7Vi+IiLExXU8Uvsu2DzkRgDi/RXloQ58lYAdFaje0uOYwTOO8FO67lzBHISuUcXdhEbJXpLjTrkf2mnaRuR0FuaHEKpnVODhc3GsQUMyVinT4jhBvaWQPvRc0lnE2shtD8nG75M+3CJ3bnMwplrKAcVvZkZ4se0Z1cr7MMTyI0JQnJ8UNBDqRROw/RWvDY7XkKMj93uiq6Hnbr5hzqfK6UAeVvyyYYzksE+6/DaFLd+ljwDnR5n2etsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyq4HGKyVzkOAZNP096slr8mvKGFS76zs3XVChvtyHw=;
 b=txn8gD3e5bdWwyS+RLeR0NMLjSiRwyCLdXPP9P3wiYLdaJFC2T7sgfYJTvZjEGjdTtfPvQyM8XTjj9vzEywnb1rcD/kb92QeGwkAIjH48orrPmHHxxpZ51M6qfInBy/9lOtLKv6l+JwLHAdT/EGgsDVtTFTmTsmeHNXHbU7QmzJ475HLmw8DLkMcrCxiaUILndb2PQhbqjiW6TqbvqQ4JexCdx9Dy1+mdm2UpfV9vddtVqUmwbVAn6Dm89Ld+AyPxGnBVLJ0nSezReF8G4/QwptsOnmrLRPgtTQ+OnE7fecPbFaTgMPB0PR1yAa5zPCaYn6MScSG1Vg3TLmbqaZBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alpha.franken.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyq4HGKyVzkOAZNP096slr8mvKGFS76zs3XVChvtyHw=;
 b=Th6q99x8vjZzcQSCRs/7zBk8WwPdrdmBgoI9hzlbMBBq2P9Ya9unol21uGc0JEt36P+oLbKIeZnwkmre8+ULxSL4TN0+n23MsMmCSECN8xoZ1Gy0ZrbS67LgpuoqRL5/Rb/qr5uSM4Hy61F8PKQ1ULIv5jI0G/FkRKLQc4+LXCU=
Received: from SJ0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:a03:2c2::20)
 by PH8PR19MB6761.namprd19.prod.outlook.com (2603:10b6:510:1c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Sat, 11 Jul
 2026 12:57:43 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::95) by SJ0PR13CA0045.outlook.office365.com
 (2603:10b6:a03:2c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.8 via Frontend Transport; Sat, 11
 Jul 2026 12:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Sat, 11 Jul 2026 12:57:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3CCDE406541;
	Sat, 11 Jul 2026 12:57:40 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2BD8482025A;
	Sat, 11 Jul 2026 12:57:40 +0000 (UTC)
Date: Sat, 11 Jul 2026 13:57:39 +0100
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
Subject: Re: [PATCH v2 06/10] ASoC: replace linux/gpio.h inclusions
Message-ID: <alI9w+eQD6USFOpx@opensource.cirrus.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-7-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710211954.1373336-7-arnd@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|PH8PR19MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd1a1f0-2160-49ac-0ed3-08dedf4bfe8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|23010399003|376014|7416014|82310400026|56012099006|4143699003|11063799006|18002099003|16102099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	nRFfUHnV96GXfilQTbrIwGA7qjnZFkukWdUFlWn+nKZ4VwK64o0UHpVi61bMkvlTbvBiox8xhJpl9xflUkQG/jSCci1pk8I+JDaHGqatGOOHoUHI87BhVfCIxThVXgLt31yWThleE5QxQcCjOOf2uvcofFxrj+fqSJfnpjHXc/rEXSEi54xSRM4I63MUclqRYkttCSjcn7goNdv7DHx9cwMTP2AZMJvbkWffUglTOfDp7KvPDmF/OTVihzEpl9syvRUScd+ggDeUReo4k09ofhW+KCKhuZd5gyPXQGli650EzcbBRCuCyQZ2SOGTtZ+hwJfEUbW3BVCyQ1SdIZSGWf5vwMXkgVORHLZTOMen9MBYBj8V42Tl6L8ukgNg6GBGTtQKe3aFNOGgFGoHAQMs2o0mZyW729JNqqYm0XCL2Ju3OYZ3WJpwFcoGgzieOPdVj/8mTQSoaHJGNYJiXEZZd5Eveqgz3pCcPHpnqGc9mOZXX/pTxffAgDdvNhss0fWGvz7kI7cK+vLrke4mhardtqWMl4JFzJ44VWY7oWJnDzN/x1RbUJLCnxrF5r7H7/zJsLhZqfXrlosbJ8FDeX0LKl0MWwGq0a7giD1iPKcvA/rkvR1owC3WtbH14uUtKdW/uyfQYzEqZTgxfy8UC0mxjgWJpCVg33CwsJzgZYfRI35U+/SiE8HCrK4d9/2UjnFqQjiHOaV37fM9gRWOZxYuWj4UGvoCvDHX+UjlDfAKPZ9W0R6f07u4l285t2AB8cYdbcDnrS4zepznEvffYpxYyQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(23010399003)(376014)(7416014)(82310400026)(56012099006)(4143699003)(11063799006)(18002099003)(16102099003)(22082099003)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w/MeyPfFrs+mkVWXOdwwZUFHnuShFa9MR4E3hF/R2oNWxJbVWYiwmLJvU+th2MI8LDTBzOlJLnAYFs1BSKC3PwkFefj7pScoeVwZemeklJU/hEhrJGA4yIngfHev/dMJbfmRrMLdmUWUjAjC0lHqYNLW3hLSJyt5Xhu/NHm0YFjJtXiAEMeqjF5Kg7Y+EIbWWx0e8MRngz40pIzFGXrLBF9LLy0B5NGzCYoZglaJC1JPl0zwOIlILZ4PwQhx/9oHhcHl3mNWXDzz2KHE5++Il+jV2MOYY86xyxDvN+OdziNdj+9sl15cS8JzJyOOaDvGGw7xTI9aFWVpCE7ZeeO6VV51AThGbYAyro0MiWirXoA7QISza6dEy5qnnB3EO+pFDRpKKM8N4CWhVBTfHNL2g8OoGiCGxuBKavh4i67e0UDRgTCUGCVjFzoiVifh3imw
X-Exchange-RoutingPolicyChecked:
	Vg4Mo/749gH4hKT4Y7U5NbaaZ6D5ZIHAoKebVYfcDr4R1zmmG33fow04XidKM89z7NPHTUBvGxgVZRsZZEPEsemD3xtypAMzLd4wAlkvH8zsmWjqE257/64CwJNnErRyLcF0cjsRDQY1HzmX75EcrJyC/ChOs+TocVdpT4p5ZyAijttucunBM9H6wvSQniPZG0QIY5qzkmrLr586uUX1Shg9rm9soYbx69yZiuC/kW+zymcQTIg/+dVJP0nG58v/w6VeMEuGBxZfZLozYfbpHy/vEt3j6FNnWCXKoyAg1Uu72M+REJeb46pN5+fANeLBFgRLfFQuMvKTiK8Id0RM9A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2026 12:57:41.6506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd1a1f0-2160-49ac-0ed3-08dedf4bfe8e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6761
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a523dcb cx=c_pps
 a=fuE/7uQEd4exF76fV1vK5g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=-pYe6oGQtZftezQT2YQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: IYiFekW1LKm5gjJi7Bz5cwdpZARxJ5o5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX40ymPtFTRV5f
 CF58Xl7w0pA880pmLNrkAoS+0w5oTNwAqmSFWDPo3zQVX8TAggr7ofpa0Mzp13dk5ihUUp943ay
 zw6+3wz5S+ZRsnoGbq575CJ1r/sJ/gc=
X-Proofpoint-GUID: IYiFekW1LKm5gjJi7Bz5cwdpZARxJ5o5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX0FOmAs/oMJxi
 mmcZyFWp32IzeZu4evq4RBgrvTAsOryid7pDrnyd5WqWy/KR7H+TBG0/cE+T9QcUpnVGwOiUZa/
 EFQTLx8di8OtTDay6n8XtV5KeH4TXQkVVwi+/ktxtVF1ObdIKSz9xbPMMGH3+GNVlBj3hpp8JdM
 u8PCOOgdDjnga1028F2gkk9PeS+6aNWhXFYvHSgBPyFQL99gVb2nz/V3GbeXLh2m+SEQImMkWL7
 pLVJZL7XzhGQgMDtX4/ipQbSXIqEs1bUAOKkj1ngaozvL+RUOk4TQUohCI26HE+hPoTU5r5uk13
 WKI9aMwxep3awd2spx4nqOh+mkBEei3cUMbRL7y9EEOwzNNMnNRsT6wkzMWgrHF7vshNlCbGeQB
 33TAMWRyjroPgg6M2GmEF34YvQEG7F4wVTAn0NvIWyJybjHmaCdDI1AeZuBsfGDQA9WBvZrnhR0
 HSA2M7Bit+GXJArgxMw==
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
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[bounces-15771-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:dmitry.torokhov@gmail.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,arndb.de,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,dominikbrodowski.net,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,qualcomm.com:email,vger.kernel.org:from_smtp,arndb.de:email,cirrus4.onmicrosoft.com:dkim,cirrus.com:email,cirrus.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 4C017741966

On Fri, Jul 10, 2026 at 11:19:51PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away,s o use linux/gpio/consumer.h instead.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/codecs/cs42l84.c | 1 -

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

