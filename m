Return-Path: <linux-mips+bounces-15507-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6U9+CAt1S2ogRwEAu9opvQ
	(envelope-from <linux-mips+bounces-15507-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 11:27:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695570E986
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 11:27:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=blVBZCCd;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=FhBHBkoo;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15507-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15507-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDB373027315
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 09:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92154DC55B;
	Mon,  6 Jul 2026 09:02:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597993E92B7;
	Mon,  6 Jul 2026 09:02:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328553; cv=fail; b=H7YAGjTnt453Ju7W79Y0ljS6geBLUYukOKcXsK709+uMrjmo2uhchOMYo6WR5zKsXPIpUfzsD7nRkHrGr4LTwXEFm2SuRIh8LIgy0xrhRnNn4L0q1LsZCbyHcwHUEIfQ/PEDs4vZC6Ls2j6s0E7jQ14sjOuA/x2qZtA0OmbAxpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328553; c=relaxed/simple;
	bh=dl4DWV+tUp6PIfVJTf0z8FPjr8X+v6XiOe+UFLx4PFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ji2xaInsEmGMfK82Nt4eE7Ndo9ZwVgcOS79wWCS77Xqw06fsURAL5cptRKm92HtvxnJ7gBDDe7cKO49xDmwjZRs62+dB8bDWSSbj13JJ6GxxVUpD4IaU4Kvb67jTnrLOm+YiCAAHGS/dNIeHWguDaTVwu/sONlQNdl6gborx/mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=blVBZCCd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FhBHBkoo; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6666TAOj1108462;
	Mon, 6 Jul 2026 04:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=yXdWuYMihFfyM6n9U4
	ZrutHAClkmiLeG9CAjyKKoBTM=; b=blVBZCCdRpkqzGFictHe3cAZzlDaSJUG/g
	eKD3BNBjaTgmg6+cWriispq8BkJcaCQsXU7xYkdrJT098KjPOiXy6JRJ1MDwviCT
	pQ5Ow+pPtMl7vwsgZp7wQM6F2mt7UjyfR8VEixfyMMGWYdyU5PijfnI/iMijCwJw
	07+tmfSkrrQjzmAFYf2wS/CTY/Vn6CuVBZ1+rQYeBjAMaF17ELYvfFva4C+qgDZG
	OWrOHWC6zu0NZPix3MNghhQKXAH7Ssac7Urq9lgmWyfO0dHqI2vUOJnZIR1lhl9k
	jzVwU+OorrmYPujKG0RbDA9Ds67DXAX7iTW6h1CjBG1G+kAFS0jw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020126.outbound.protection.outlook.com [52.101.61.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjj34t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:01:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQzjMS8y/hTCz0GjCmE/BtlOoSwvJ8oL8YxpgNfRgxMG+jChvd00/I9CRUcl7VzHAV+VMrjeNw/8KjnvUWF39ZVDh0wv4VSULgGZncywPzzrSWEoG+dC7/xWsvQJEstawjFKRjca4Bru28nPv7YI8sXql+TWJYvVNZnonjKEbZ6wLmTc2nmXr/2/6xfLnBoNCrIh8bENSw0DuN9gc2cfrvRXOlnhsNSrwejK//vEXfLlVYZfNZKpkgLMRpHrCsM6C7KZZcn1R3Juaut7mYxNOMpJrpxWlADVZ0lJi/Ay6Hp6PHT8SgEqX91ciDGgr3vvLCRivnlrq1yqpMAu5lqj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXdWuYMihFfyM6n9U4ZrutHAClkmiLeG9CAjyKKoBTM=;
 b=e4Pr5ukptq0sTI3AIYVJGU+wlzroJu2XUYb/LlGSX6KloZBiXKVvfxDL4NWcLv3U4Nj9wdwVHjd8R5VXQwja/syCOpVwA450fuqi5KjZwUAzVWfj1sf2DHw02Yzk/d9IVVHq9XewKCTTVp/1pT7/knQVFQa+CU/X/nGH9bs365H+CI665/LSGYhL9EoXElpRLrYXvKFs3+9pU+zirq+KhJImtOLx/6e5ZLpB+gnqhzbbLLE1aqBjppMmg/vk1JFFUfWFiv5gRunCbG75B7DZqfdpwpyfnlPc9oW687+PUVXW4MRD6BynkOrJgj1qY1Uqt8CCnxbZ1log2F/XgFtkOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alpha.franken.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXdWuYMihFfyM6n9U4ZrutHAClkmiLeG9CAjyKKoBTM=;
 b=FhBHBkoofEHKXrRLF3tXzRjKuqv7+xEzdY/EKQJoPONbzBYUVnnhczc8NhP/7DUjfIb9XgQCokLp+v1bY6sS8P0OMNviv4q08W8Zi+q4V1Pn/Ef6NRb1OrsSbsJ8J/akNTgI5AVtoa0BhXgI0RsjF+fpd/ybGB3VlTbByKRoMa8=
Received: from SJ0PR13CA0193.namprd13.prod.outlook.com (2603:10b6:a03:2c3::18)
 by SA0PR19MB4523.namprd19.prod.outlook.com (2603:10b6:806:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 09:01:31 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::19) by SJ0PR13CA0193.outlook.office365.com
 (2603:10b6:a03:2c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Mon, 6
 Jul 2026 09:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 09:01:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B1201406541;
	Mon,  6 Jul 2026 09:01:27 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9E024820244;
	Mon,  6 Jul 2026 09:01:27 +0000 (UTC)
Date: Mon, 6 Jul 2026 10:01:26 +0100
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
Subject: Re: [PATCH 07/13] ASoC: replace linux/gpio.h inclusions
Message-ID: <aktu5ldIypW8ldjW@opensource.cirrus.com>
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-8-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629132633.1300009-8-arnd@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|SA0PR19MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: 19450c50-74fd-49f4-b6a3-08dedb3d2b57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|61400799027|23010399003|16102099003|18002099003|22082099003|4143699003|56012099006|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	+QJ/HeqWI1Hsto+ZYw4jR1arr/TiIqFEB7FTWF1094fOwQYiYGco98DH+OSowWEZ21Y8vskq07KUu/3XFgy4KHPV+ucWiKdHu40LApHeD2+XHxSzPhIlLj5bL7a+RJZPi6amMenpUth2Fl4nCQc87Qlc4N25p4ygRpdHaNb9gR8vQQEUQER7x3eCRyEJz7ik12fd88YovOHakpqNFfbFI2SgxYdybWdstNgw+JwgdW22ePNx2p9OHjYHFwtcpau6Cm4kJwif2phF47IUQrIc9Vkl2urI20rYfDGoUjB5gvaV9+JvSJ1bgvbh/1deA9SYJ4cBiE2FpBk8T4YzPBXzNL284SUYWQYuLaY14MP9hZWvllpNc65AGzwfLRu63HkwFCQ5WfvcYOVTtw1hcIhtTnMYXSBIaJWN7M0pG2RPka7+3LcCXIPSH3QiEUsvywqj+xhrVJyTmxBEyLF8wSNgkaQIm2a5ENtGhHkVaneW9XkvfhLv7o3/Y3coFKuLxJo2tNYnUhIMU5hVf0Ia4pzXEmEj7Tl2nsmmavFouzemOSFT9B//2wtkhQ8TepBCauY4mc95lh6w/CZjWsQPmHT1INcYPRIVNYUDBdI5WSsysIB4YKe28GgCiVUn+HZP0Y2ejq+i7CuIA61Wh3mHB43fgmB9KEQPNkAdPctnMN7QB2Ju43NFFcGBXBG/v4Sf+8xadyI/jqKksjPX8gdskuaLgGA3/xeQYqRr9u09BhK5yVtsNpIILsHGsqFdUJp2U7rxOGm26O4jLJ+Q0JnMl9z2cQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(61400799027)(23010399003)(16102099003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NnpZXkxdGREsJOxqUZ63mDS+Qm6Kn1jV/RE9yURq8DnKdqCIjibyOs+ZXQh0l6o8As9sV5cEDUMJPZ6tTUjrwuO9/BB5l8gZZeNBvxhtPY+xHxd7axdIczwo5yiiXZr04gckBi/D/v6zDk3gn+q1qQFnDxNgydLMWdckLMSupDKsxGrGNmNJbY1PsMGx6a3s7khADCcUpx0X0nDXa5KDpK9Fx4PYLQDzAnLldgOGO+jPEyQ44KMJEyd2o737wcGcyCOlLxzg5wh/fiJAfKmhqkFtbfd1gNNtfQ3hz9NM6ePmkBkmr3K4mWU9ELDbmpa6nKMeXgM/VDa3rBHNQUTniLPaC3OmLQLtGN6y95I4oxhFh4rfqQIHdoyIzsU0sZbbm58bzSFy8ojC4OoXOPyEamPtUhm+tkmbmJm6OjKQlm20SCLFS8EheH8fC0xYjjVC
X-Exchange-RoutingPolicyChecked:
	EKnGnIo/30ilIDjSohtKwuElnRdClZI5txSxfNe3fibvfHtpIDXjZ268YH84pDrA4TxEnp/JIU0+4y27NT/DVurNFr6Xo5lpUm46WQczJKDqjdwWLbjpMgze/JA38D5ewbZSgxcUzI/oDsjJSqBZ3kEjoCNe6lYwwSllt6YJafqnYewDkzO7IiOBBltdoGvMp6AtYlF/TC0x+iBFPGtitjTNRNZWQWRrXRMAq3H/a4+s/oGZH0/jmDoTHsJ34OsPWcmtVogqAwHspoiLg2y7QrqUYCx8eCPtjQE4mIcj0nG/JnrIyhLwZu8ZcNDEWTcnLOVER8a7qr+JG7ihdFcYtw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:01:29.6835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19450c50-74fd-49f4-b6a3-08dedb3d2b57
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4523
X-Proofpoint-ORIG-GUID: Xr6Ce48YtsZvvi9-ArXAlnrZLSIFHCXn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXxewslzTEi6V7
 UnEUdN4Dh5Wuwsrz05hVAfKGSsHWptx/BnT3BrFxaGqhsMwKKb9BgpwXnSzj6OOc1JsGzly0XL5
 I5A/keuaM3TVnfl/gGKsRRTC9mHrRxk=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4b6eee cx=c_pps
 a=+K7kHGa/lm5mlhWRmKhmBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=laggWU-tNtq9GTYVk9QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXzdGOTmleY1wa
 ImXEhP/xbR4J/lc6a3zmAr2okywqKonxJGGVXCMrr01xuuM+PpmcS4CHO0xW1LOA4B/PqF+PpuL
 4leIFhrRAoBwvLb8G/1/EkJmXJ29P0vXSmRplPEp7LWVewVLKVgsxdwWS9zeZ9e2oY/rIjRGZD9
 k1UQb8Zr2S382lgOAZk/4F6VZSxwgMrk7tgGna9ABQ+LUHJ9S4BhdJMRdL8GQGclRexqv75ppOc
 FYwZuec3lhm/QQ5g7cp6Jn+Rp4JvxluU2P6RaG7gzo4V0xtE+mWW5pJJwJGkUJ0CBa/obbtoiBv
 3/QsAFIIFTMAQh1X+6UldtwdHaHdZIDnAouuesZVn+vvyckmhG5+5MkMQuw/kk571BwaCFKaxzW
 NSp8Z11jVtJ1jUDwNKjt9ePalPBSi7wErIUvL6op9NCGxEGXw4/42ZTZ+d+Qtxed9A5VMRykOGr
 81YM+LRRZ0joPN8gFkw==
X-Proofpoint-GUID: Xr6Ce48YtsZvvi9-ArXAlnrZLSIFHCXn
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-15507-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytor
 okhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cirrus4.onmicrosoft.com:dkim,arndb.de:email,cirrus.com:email,cirrus.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7695570E986

On Mon, Jun 29, 2026 at 03:26:27PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away,s o use linux/gpio/consumer.h instead.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/codecs/cs42l84.c | 2 +-
>  sound/soc/codecs/cx2072x.c | 2 +-

For the Cirrus bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

