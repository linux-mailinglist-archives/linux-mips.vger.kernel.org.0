Return-Path: <linux-mips+bounces-15115-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VORoLnDfMWoIrQUAu9opvQ
	(envelope-from <linux-mips+bounces-15115-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 01:42:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D3695C33
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 01:42:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Z01cHDGh;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15115-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15115-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D02A3009820
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 23:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43C3481FD0;
	Tue, 16 Jun 2026 23:42:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DF3481ABD;
	Tue, 16 Jun 2026 23:42:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653348; cv=fail; b=BHtRpwbXveipT9ofhmHZsXpHFUHEb1rIhB/3s1174naEAadBhvjkucnI7oIX2I/XxXEdt+zHgEcOYk43zKJPntB5rbXWdV795JtPjUk6pczTrMcrxPMJ2fo7bsveHZyqW1Vr/eqDYRF7pqJ1VRLSwc+4Uh35emDXDiljJ8nbO1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653348; c=relaxed/simple;
	bh=QFmg8nnKFoA+SzUj+0Jft56NE58ghv7Ef8VkoZEaY1Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BU3+cVbpzSfVL8KqFzhZ4PvQtEpZqh+79YsTpDYgGUgeOZecJdUyEkVdYJZwsc5Jd1sl6HpGReoBjuHIZCgupqncJHfPA5dvr/wTsnWzSVB08wSMpdEQ8sbzw1lofITZlLLM2o3bQc1NCXWM1xCPNtXpt7dkb4jH2NKU3W3nPv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z01cHDGh; arc=fail smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781653347; x=1813189347;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QFmg8nnKFoA+SzUj+0Jft56NE58ghv7Ef8VkoZEaY1Q=;
  b=Z01cHDGhUBsR5Dg2GCqT7S5nlP12p5oBtvnRG+VeBO4vI/x/c1qbIc4w
   7VHDL5M3I4hK9ob/RIMOOGW9R/9Tqw9JetnMIS3NqE+6+RtQajB7eOqip
   A0RuErs+pKNL+E7zvuUJwFltyNz0dEdKJqkjuf7t/LcU4xVqlFWVmzZPH
   7fw206Szq5ntQc46Zk6lirn+DsnsyaIb50yjO/pIcgnezn3fTzLdakEAp
   9e5hUt5sPf+jyRbxjnrJzAqTC99adbxPwCqriUkWK6vjgn2ZKVRol7lzO
   MWvX7SAE5TOkeaiZC3ZklRnwG+TI+I0hm3xMoNhGkUNGScS1alxmXRNkz
   w==;
X-CSE-ConnectionGUID: Zv6o9at2QaCQaeLPsDBGag==
X-CSE-MsgGUID: TY+V2JfNRwScX/Y8Pl/44Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82446715"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82446715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:42:27 -0700
X-CSE-ConnectionGUID: T8EIr/ZlR2m5dU40rUV9Pg==
X-CSE-MsgGUID: X08j38XFTWWkZEasSoq2/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247023349"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:42:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:42:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 16:42:25 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:42:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ma77mXFjM71kHMIHdpWugjqHsJ4JjpkDQjGI+C/W9mJYX6A0FylnFG1KCsMwpqPo+F23/WQNznzKUnq8pcAQcuhdinM9p6IQgaTy2RvNhW722th4uFrgQhcAg89l+3rjJPpk+T0sn9HcS7kx7K79ogSQQHt13SuETOGm6yFw4vHZH0Cvx8qmc7ktAljTU9DI3Y5VPSp1ISO6+vksXdiN1fCPuPspPUyWMQcVkmiOFp0Zj1j96HLV4XRvo2gKElmxag7cYf23YmtIEzOO3qjh6RqrZZHj5icTtKwE4B+AJPO9OS9bxtZVT/xzkLLIttob5s1sGRa7kxjBuwv5iVwgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lG6i0nvX/OzvkhmyAFitC2zc+tYqqOTfjahalcVnDTs=;
 b=bvD5OetT1KFKi0c1Bw3tHjPO+IViLwAEuUA9rYiC9ZYaFVpuxyqYMkcSv5ODbUbaZSYihu6K5v8HslGPgCpY6JYLqRl3IeNLAv+IXWG12h03gx70fQMC9kA3Yx5ikdaICGmxXxJiBKDdYHWvteKJFbYEVu49HhaSfna3kUxdepJyJGY7H1Fw6lRV1B/cn/hNeH+Jyx4KQ2puGhlHZOlCu81akam96VXFm8EYl+5wnQ2BnVb0O4ayCSGv18XU0bbJnepbN+t8QoM0HJ31w3WQ7P35sHi100nLa8Efa1M7/e21Y94qvemFK+fsVeLxXlPI0OpCLob35fdtXgotPldWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by IA4PR11MB8944.namprd11.prod.outlook.com (2603:10b6:208:563::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:42:21 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 23:42:21 +0000
Message-ID: <31630db0-85cb-421b-8ebe-bbae07521533@intel.com>
Date: Tue, 16 Jun 2026 16:42:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: loongson1: Use dev_err_probe()
To: <keguang.zhang@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-mips@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260615-dwmac-loongson1-v1-1-cbcf5bc01d9b@gmail.com>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <20260615-dwmac-loongson1-v1-1-cbcf5bc01d9b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0314.namprd03.prod.outlook.com
 (2603:10b6:303:dd::19) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|IA4PR11MB8944:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d18fd25-8289-4b0f-03f8-08decc00e8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HPBFmXAaEmjUgDQNzKJd+mAXgk2mn1DSgdGHVqMCxTshU0vhbTS6g7uF7PWgfSFoyhFqPVHoQ0xt7XriSBtKMoVgm+zJnscVm+H0fIdhzxWW/2Suqfqy673KeZHLtgeGkLiFhNk9qLPPPKCCoTrwETuKYC4DCsl5qLLO3vStyGXlawzlZQwK0bUk7TsJni/jFV5mXeY6l3tpUxmo/ES14rhjEWRIL0bOikKtk63SHSx/ckhG/Fhe3auo630K7Pp108sOmI09wGfNX9djO6XzRVI6PFeb5S9GzL6rGZGWqwKxev2wQTHMjloDlpTHVVmAf/Wu2TGx8XmcHWnnTRBOTPzYJKzGNu1LzvHVT1hbYeD7/ERjA8R783oTzNK+jJalZnV3muHp6ZPxFHkMnoktQc5eCS7zeH6zzovtGJdGd20kI4xNgWOVl3Vq+7MHINzRnqtiYSP/cCMu3xBuifGx7O2z8iMJZjh/c6q2qd4HTWCzvqBEwKi4ORSnBNsiEPJXC56xIMDGd6Nz+yTiajORvFu3wNY94aHnwXqK1JMqqAHd3ZihU93emwLM+kkkW7+yidHiKB+zQnR28FiAGqq55ZfABAVIphFf/1Gh+YO+mAiYYHrcTXWPkTZKjYOj8fW6yyMxXKC1nDrkvm9omPesIFjkIdkge3UXzRITwPwwEpQ4oYz/9fQdoR2gmXK/b2rO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1JaMUtzUGtoSXJrczQvK0lWQVBsSjBjYlc0QkxYVmNTc3NycWVUN0drOTVN?=
 =?utf-8?B?MWxRVEMrVk5Fak9aajlXcXQ1OEc3NWk1NG1jcktobDZqRnBuYkNuUldxMlN0?=
 =?utf-8?B?R25SV1phVllGM0ozU2U0Skowdm1YLzkzalJDblc1aWRsbDZTZS9FelZJaEZy?=
 =?utf-8?B?RlhIM1dkR1l1d1dpWFNpTkhDS3ZzMjJWcWJTSlVLNHpSU2NXZFlONDZsbnhS?=
 =?utf-8?B?a2JMNzU1bEVoZnQ1YkltYjB2T2JzakZTLzE1T2ZwZi90TFRXT2hDS1NLZWNB?=
 =?utf-8?B?RitiZGhPOG5iRHkrclJLYXY0VlhGR09hcGhSK29Xa1RVNG11dkpwKzlVZlpQ?=
 =?utf-8?B?bUdlUFd2bDVtMUVOMTVwS2hLenJONk9LWGxodEtFOTRpeWw2QVZJRFpzd1k5?=
 =?utf-8?B?cEx3Tk5FRStGRVJFaThqTm0ybDlzN2lKaDhSa0ExK01ob3pLWDhyYXZHc1k4?=
 =?utf-8?B?SmJwRTBzWlZnSTlRVmdIa3VsNTRWd21ZZTlRREI0T1RBQ1FpcDVvMVJLcjZs?=
 =?utf-8?B?Y282T0JxY05pK1pYT0VpL0xjTXc2a1g1akZpMmNrZERncFdPYzR0YzBZY1Jo?=
 =?utf-8?B?TXpvR3NoWjlBYXlpNFVrTXI1N3JSdndPOEdLY2ltZmxPU21CTzU0eFFzL1dZ?=
 =?utf-8?B?a2lsV21OaEgyTmtzTkZPZERRbjB0M0dacDEyb2JzVXlNS1ZtM0JnaXh3RGxv?=
 =?utf-8?B?ZFJteXRUb1pXL2F0TFRrWHhtNHlESDlNelNUVkRSTThaeFBwYlpyVEJpMEhD?=
 =?utf-8?B?UWtndkl5aXFJUmNXSzFZSzBaMGZoTUMzbnVsYUJmRlkrV09kaFQvTmVSekNO?=
 =?utf-8?B?amFaR2JHLzloZUJLazNwL3dTWlozVlVjVW9PaGx5Wi9RczhHRkZudHFPN1N2?=
 =?utf-8?B?OXVlS0NBYzdqZlZGS2VjUVJ6MWJ3SzlORENuSjFDYXc3Y01UMFl2WjhDZlNS?=
 =?utf-8?B?UStXMDhsSThtNnJ0VjRYNHViOE1UM3MvcWVteWNLRlhkQytpb1g3WlBtYTht?=
 =?utf-8?B?Y1NWYXBCWDdNd0RQbUtqUkxJcWFUYXJqaWc2ekkvSnRRb1BqZm5YYkpsc0Vk?=
 =?utf-8?B?cEJUVjNidUN6T1RGb1JIcC81eEI5VzBYcFVrKys5WGVrNFkrbTY2T3Y1OXMw?=
 =?utf-8?B?WjJ0UnZQdHJJcE0ydnRmRjhWVDVrR25Kd1BlcnBNbEJ3L2lqZFVFOU1vYy85?=
 =?utf-8?B?M1M4YVhIYWljWkVSTHZpVWVXeTBxYmIwemNhaVNFN3BGZW1wN0Y0OU95Wlp2?=
 =?utf-8?B?R3EyVWNEYXNoRWhlb3dUbllFN001YTA2dzlyKzZ4R0JWWkVXamlxaE8rREk2?=
 =?utf-8?B?WDNuNVlJcWFHeGdHc2I3YWxVRXJQUk5QUE5zTWRFUGZwVSt6TmZwNzljanVW?=
 =?utf-8?B?VSt4WkE2aUtMZlhxWWdrNURvQXlUazVTOWt2QTJEQVhkcmhJNXpTYVlOckpo?=
 =?utf-8?B?Z3pXSFhpcDJLSy9xUTF1RnJEV29TbXorTUdqdkdqOHg2eGQvSEc1WStUT056?=
 =?utf-8?B?Y2JzTEQxYy8xQlBaVHhMSlE2MEpvaUhIT21sV3hBbjcwdkcvakNFRjBwQmhh?=
 =?utf-8?B?bXlZVGc5Yk1OZlF0aFJJR1pKSk1sNVdrMlFZaW4rMlZhZUVscHV4bDhIektQ?=
 =?utf-8?B?ZDlrWjQyTkJHRW0xR3A5WWNuU2lCTXdUNzhVbnBLNms1eXhJL2dSSkh6aTd0?=
 =?utf-8?B?M1JBbjYzWnBrS3NLTUNIZmJUTFlZQ0d6R1JyNHZGdU1kNkVzby9YbnA0RlJu?=
 =?utf-8?B?K2YyclhJbWVsc1J4b29sNm04TEJQVkIySHlwRHZBRXM2dzVYWDlUSGs4d2Rt?=
 =?utf-8?B?dWhZRkpJaldrZHNUU0R5aDZtWlhBNC8vVWI3dWxVbUtDbE5oVlpvM1pFWk5l?=
 =?utf-8?B?dDRIS1M5MUt6SzUrQWlXamJ0WUtjTXR1NnlrZVhqQm5XMXhiVC82RGdpMWFD?=
 =?utf-8?B?akQyNFN0MkpSd2pDSTFHUmFiVW9TU2tTeWJwMW1aaFJ3bis4SVZIUkNjc0Zs?=
 =?utf-8?B?ZG1jeHZ4dkRqVDZNV2lSczdKYkpHcVdFMzNRVkJRNTdsc2RhRDhLY2Zjamk5?=
 =?utf-8?B?eDRsTnBKMzFnOXNDazFPRTlWeGpwd0JzVXVwakZ4QmhyeTF6SFpNeU1Ud3h2?=
 =?utf-8?B?YXBvVWIzL3M1ZG1hZ3lqVXhQZ0QxNkZFdlIvdkoxTllZbUtxMVAzeUpIM3JV?=
 =?utf-8?B?cUtFV20wY2RoS2RNRUl2b21aOVhkQ29PS3pQVTI0Rk84ejhneEk3SnNsTnF1?=
 =?utf-8?B?alF0dmE1Vi91TDRJTTh3MWJENzBDRmN2SjlWS2NRQzAvd2Y1YXVQdndENW12?=
 =?utf-8?B?N0daUVgyZVkvOE1qZ3hVV2ZwckpMNkpxTXhQWlNidjAweHhzRjVZdz09?=
X-Exchange-RoutingPolicyChecked: gDoLCpC3omJ8wOKQy2q4cMo67U/yHv9A8p1F1JGnLlOXaB9NeKvNGKPUv8skr1wH6E3Z7GysKBBYqpF4DyrEgPbEj9FRS0p9Oz2fKenRIjIWzFN9ZUY7ezFYcGd9y65FnWNIbPWPL5ja4/JYOgZ0vmUTlp2y2R9+eHKnEchKG3S2nungkMJYxIAw2Xb/UkoNvFb5mGeJMOuN4KKjBixL7t0zIKDrRoBSDmfcT1tLofMSM/iNNT+Ns76GEw5AUzckOwWctejc6PXTsI/4Pj/RRfVijETynQ5MUu8jNEXxifnovZ/MwWhSZvcXF5AE4cFJ5LKpHrrPNzIvp/7Q5nbnJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d18fd25-8289-4b0f-03f8-08decc00e8cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:42:21.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtYzBoQLiRShG5EfCIwONie1n6jx5jwwDqkQ/22kUalJ9a9CGKTkoANQGfvdDIWEjcPowJijQsgi2QCmlWDG1y37huUDu6M0OqrDArH0q9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8944
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15115-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:keguang.zhang@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-mips@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:keguangzhang@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacob.e.keller@intel.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacob.e.keller@intel.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E32D3695C33

On 6/15/2026 5:24 AM, Keguang Zhang via B4 Relay wrote:
> From: Keguang Zhang <keguang.zhang@gmail.com>
> 
> Use dev_err_probe() for the missing match data case to simplify
> error handling.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---

At first I recalled that dev_err_probe does strange things with
-EPROBE_DEFER. From the documentation for dev_err_probe:

>  * @dev: the pointer to the struct device
>  * @err: error value to test
>  * @fmt: printf-style format string
>  * @...: arguments as specified in the format string
>  *
>  * This helper implements common pattern present in probe functions for error
>  * checking: print debug or error message depending if the error value is
>  * -EPROBE_DEFER and propagate error upwards.
>  * In case of -EPROBE_DEFER it sets also defer probe reason, which can be
>  * checked later by reading devices_deferred debugfs attribute.
>  * It replaces the following code sequence::
>  *
>  *      if (err != -EPROBE_DEFER)
>  *              dev_err(dev, ...);
>  *      else
>  *              dev_dbg(dev, ...);
>  *      return err;
>  *
>  * with::
>  *
>  *      return dev_err_probe(dev, err, ...);
>  *
>  * Using this helper in your probe function is totally fine even if @err
>  * is known to never be -EPROBE_DEFER.
>  * The benefit compared to a normal dev_err() is the standardized format
>  * of the error code, which is emitted symbolically (i.e. you get "EAGAIN"
>  * instead of "-35"), and having the error code returned allows more
>  * compact error paths.
>  *
>  * Returns @err.
>  */

I guess even without -EPROBE_DEFER this is still acceptable. The change
seems fine, if a bit of a minor cleanup. However, net-next is closed,
and this is definitely not a bug-fix worthy of net. This does have the
added benefit of

I'd probably also argue this may go against the desired goals of
net-next with only wanting such cleanups when in the context of other
larger work. Of course that decision ultimately belongs to the maintainers.

You can add my reviewed-by when/if you resubmit when net-next re-opens:

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index de9aba756aac..ec34adb63f61 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -176,10 +176,8 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
>  				     "Unable to find syscon\n");
>  
>  	data = of_device_get_match_data(&pdev->dev);
> -	if (!data) {
> -		dev_err(&pdev->dev, "No of match data provided\n");
> -		return -EINVAL;
> -	}
> +	if (!data)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "No of match data provided\n");
>  
>  	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
>  	if (!dwmac)
> 
> ---
> base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
> change-id: 20260602-dwmac-loongson1-5e1b9dfc3c62
> 
> Best regards,


