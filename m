Return-Path: <linux-mips+bounces-15126-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RYK5LTARM2pQ9AUAu9opvQ
	(envelope-from <linux-mips+bounces-15126-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 23:27:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EF869C879
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 23:27:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=nnJ44Oy3;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15126-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15126-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DDAC3006B08
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 21:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8F83B19B9;
	Wed, 17 Jun 2026 21:26:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0063BB12E;
	Wed, 17 Jun 2026 21:26:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781731607; cv=fail; b=qrL/V6fLbNLnsAHh24mUsawcHJiHKSn3jVsLk7KY08kL7G3fSjnpWbJCBdEizwVCUwSUQqkSYOBvIkA0LaZlZcnSSo1t5ZHsb5EQt0BNjRWXvWGuE+kZysb8Rdq1oGSaJJCYOVYTFRLk0xjsD8BuZdw/xn7gg7aWjKNxnkGbTLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781731607; c=relaxed/simple;
	bh=1e/nJsBSKvlxVgr5m3VA4tej8hVa3AylhTKtGKt1KXQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sD+N/hxH+Pyz6izuXzGtXd9SoisCjZFroCjirwO7Is9PxsgmrcIX9FLszfCHPefpnsamIx2HHkNuJih1J/uw9gHMnbn3rzR8HN4ep94OcmbIQBtzIcHBkyKaHvGNQ8rjmo1D5Aptay78qrFHyetTdMNOqDCzkKCCapY41t3CGhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnJ44Oy3; arc=fail smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781731606; x=1813267606;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1e/nJsBSKvlxVgr5m3VA4tej8hVa3AylhTKtGKt1KXQ=;
  b=nnJ44Oy3C4pqI2NpPgczrr/NqCGw8pCMiyRx7SGbyDT6qiVw1LwtjPF2
   hrj90O4VbjqQJjTZ6DRjS26w1LPkXpaqznxo5gTOUfX6O3i363X9nxWiG
   CY/edILy2jTdJZ7/yjzT9eEnXIQc3i7wh48lqm5bTsdu+cYy4jgGT9kDA
   GYEofckwCsBq8UmWpt3v6FcRoF2J+jfrlUBrYDXN6PlFHP22H83iGzk6S
   M/UGHhco/mdofI66y1cWBGAkUE5IDKOqegRJuMF/Byxw86H6bhoZoBy/j
   MyQy2pIQ+C0z1jtFFPYAcyvUHmuXJP3v3OzfUB8dPHKi9xlj2Ru6GKbN/
   w==;
X-CSE-ConnectionGUID: i3ZN80DoT1agw9fZzq7ZRw==
X-CSE-MsgGUID: v6KApLU1SsOWuzBHVacnRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="85106364"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="85106364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 14:26:42 -0700
X-CSE-ConnectionGUID: qAx1bl8WRHCDVc0LpdcvWw==
X-CSE-MsgGUID: +tArMvWbR6uZ3AF4QlVhdg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 14:26:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 14:26:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 14:26:41 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 14:26:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiraAfTF26OVjlwhArgfnRNMk7TloP/HMCJ0fvmaYA+5j3l8gsr8sy9gEPJ0Ka+0UPO3NN4TAfdp3Zg0rKW/tVX8OFxSNwqrDkdW/gNySdPKtgbbMoROp9j12sOFJhLJxvsrqMd8n+cVbPTaHs2WNIxREWlZ3fjCnbC6b9Qw0FesAtMzm1LBtxQbHwx8No901+GQ7hiaa/6nKzSoHSZ9y2gyRb7WMRwtXiFjd/amZ9pV9v0xI5iVzMQi5qwsLHHdc4ujYoyExqPU4yfXBPHPFJmaGjWlQV1jZhI6AmkpTfxCHeadMAMdinaeM8yLobN+banKF1HeLOIFf/TxyN5eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yalCcxQ5OLAsDwLDfK5Pm6dcAvm+yptjanMpgSp4Cb0=;
 b=wR3CEDHqlGvM3zPcN+3qouW1zLx53wTZ92yFfUN1hYX1tRYxUyYjrkH9R3AX/ZWNBSGRmfQ51mGF+SIyZ9MAJUCxYdsdRqmxNj+9X1cOoz6kb8PkgOmd/7O7X72crBDV3ZjQioxD6t8uuu0tecLJfRuDSZtrWI1i8UaR9Xd+TKWbwPzyF2RJDvq6u1u1DrFeR1Yj4v3YtX4FbV5zXH8waDBw2p1TWOFJKzdBVSLmV04aEVDEUu7vxR5yWK3z8Df1NNevtgZaohULcEn+KLt1sCjl1kG4o2nQKG+Xpw+I6dSRYKLl1nwWqxTQSGbTE7JyMTwkhMPGmmc4g11yfMKRpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by SA1PR11MB6687.namprd11.prod.outlook.com (2603:10b6:806:25a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 21:26:28 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 21:26:28 +0000
Message-ID: <6b8db599-5bb2-47f9-ab53-a0b5141af2e5@intel.com>
Date: Wed, 17 Jun 2026 14:26:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: loongson1: Use dev_err_probe()
To: Jakub Kicinski <kuba@kernel.org>
CC: <keguang.zhang@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<linux-mips@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260615-dwmac-loongson1-v1-1-cbcf5bc01d9b@gmail.com>
 <31630db0-85cb-421b-8ebe-bbae07521533@intel.com>
 <20260617135407.6ff54e27@kernel.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <20260617135407.6ff54e27@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:303:8c::21) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|SA1PR11MB6687:EE_
X-MS-Office365-Filtering-Correlation-Id: 69602cf7-6abf-4e67-d11a-08deccb717b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|11063799006|56012099006|4143699003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: QaLTpVX8lU50KGaDE2mvHe2Vmq3STSHgWkZxXR00K9GIvltXa/fxUHiUKJmkIARlaKhGSRmnROAaeAWHybyJjDvWfNQGKJ8xUTgmw+ip0f/c36nZ3UfBKHfj1gHMRbPnJWgVeXeCeoyDstaTOnazsWZCM1NozsqDkQhYOZsUupZY1b/PjvaiJ+r53IS1hDEzVuIx9F51XFZuVptvO4zGdu8H1aizAJn6CoI3gZuF85DcwfDqt4BrIczK6sEyuhEnSISwQr6Mqcmw0NuNiesfEat6fnYw04yc47kjWU6MVuxIZ0XxztjMBgli/BqvP6FgDRImBnxPLS/saPZ5X+sNAqm+GfZ72hy3DoeO8rc7EAgEgaSu72YnyqXwlt2Y5ATUhYPkDcfaCE+ztaHkeDwHv8i60JN0DtDENRwWD6WVlH5+IV+rH16rrfXHGqNdzTBx8ySJ6QRR2QwuowsiUy6vkRDSmDtQyH9hSXx4qY/WMq7SWPY6gV0J4DltvRsB/L8KJt/Yz071fZgSWuwG1+8Ul0HTslBOWEQS75Jw5QkNfcPZZzrb5s4k2nHiCYDIAucNHE0IjYRsjN7e2zg9DjSQMC9QhtNySdlWXIIucpwnCGdTKRefzuft2d67Y5LkLaqReRv8zV7bYAmcyXZOEGzo91/aY8kFeA7+xc7sgrd8casEnwb1oxqmXr1btPUG3Gci
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qkw4blNNTnF5T0JWMDdFaFU3TFZZT2IraHBwOUxTWEVQR3pqZjBDTlo5bnhs?=
 =?utf-8?B?NWY4bHFjYmdxejlHNjE0QWl1RVlEYkhmamxURXhhMjJFckpCay9QelpSR3N1?=
 =?utf-8?B?WFNqRVVPenQ3MDFWU2k3Rk1BK29UTk4vd2ZwTUcreGFSS0JzQTVzZ29iNk9V?=
 =?utf-8?B?NWtWQkxidGtOcHlYZnBkMURRcHdSUFdpTUE2UGYwcU1mVlpwUmE2TS9iclFE?=
 =?utf-8?B?cWo2MExvU1MvMDlzYkJXUGxscXNkL3FmWUkrMEEyMHRIYU1MekdHMHZWMU5N?=
 =?utf-8?B?MlNaSjZIekc0RjlzMjVXMXpuNkFKQS95bGhQTHkvYVlhM2ZXem9MUFU4RmFq?=
 =?utf-8?B?UmNBclNabWl2Tnc4b0hSeG9tUVVBVnliZzFPWiswckFGZXZiT3NxRkhwaXBG?=
 =?utf-8?B?QWpPZGZvb1lmUXd6QTBCb3dEN091QVc1TERVYnRLUWwvbkpzYWRwdVdNSHcw?=
 =?utf-8?B?OXR2UDAyUWMzN2NIeVBEM1hWQi9Za3gzeUVma2pGRzFOUkJvTWZ3Q29HTFZQ?=
 =?utf-8?B?WEhUQk1hTkJMWXlTc3lwZ0tJM2ZualhZc3dIWDVzYlJ2T2JINTNIUFF6eDVQ?=
 =?utf-8?B?dmFCQTBOczc0OW5sN1ZkMFpTcjd1QjZjZmJWTHJiQ3ByWUIyQW5nZUtDVnVp?=
 =?utf-8?B?cHE2UStzc2dHOTJ4bE5iL1VFZjdJemJLRHJ3bTBoeTdRYmNoMWNlcWNhc3Fi?=
 =?utf-8?B?N2hHUzIzRFpzK2c0N1R1SGV5a3EwWTZkcyswSmFDQlVXcVBVSUVScWxubHJW?=
 =?utf-8?B?T3FFVEN5ZUhMUnNHeW5IYkRzWm5SNWZwcllMQVJLcHlYZFJDUGxNM1Z0ZzNI?=
 =?utf-8?B?MzFyRzUvR3B3bUZ1ZVppcHdVVlVMSUZQMDdVY1lzWjllWUVmeldRYUFHODZo?=
 =?utf-8?B?OTcwanlOTG1lVUluNFhrRTVIUVBabXJaVDQxcXZ1WU4xblpxSHNJSHloUThr?=
 =?utf-8?B?Z3BZM29tS0tZaGhPM3pGQ1B5UGtUMHh5UmR5a1Y5ZGRuU0plcE51Nm1LYmo1?=
 =?utf-8?B?bE1sdUdNdXROLzg3eUJKUUE4UWRhK2xBdlZuNzVXZ1FPSE9hQTF1M1ZvKy9V?=
 =?utf-8?B?bnc0b3VRNnUrZEEzeWxXOHowQThGUkg5T1RJMHJBQnliOUhNSzBQcXcwVzcx?=
 =?utf-8?B?ZkFJbTNXeEozN0xleHBtR0xXR0E1bmVuVVpRNklDaERsaTFldmRhbXhMYVdp?=
 =?utf-8?B?d3E5THQ4cW1HOVJTZVhJYTR4akdEZDRoL3pldWJrSjF3em4rbDcxZm5rMEQ5?=
 =?utf-8?B?NHlCRndaa3hlKzZBclpYZlpRRWxBM0YzY3hFYUIvZGdTN0xvTjc5dnRPcERU?=
 =?utf-8?B?bjNKbjMyMlcwZkhzZGk1RkhZNDJrY2kyajN2eWx6QXE3bEFIc0orRFVJdEVC?=
 =?utf-8?B?djVROEd2Sm5BZkdOcVMwTTZPVW4wbE5GSnNpL05UekhLbG5nb2hmamt5V3Zm?=
 =?utf-8?B?aWJFdGh0SUFPMjQzTFlKNjRrSFpYUTdoNkdTQlhuOTRZZWI4VUlyUHcxa0la?=
 =?utf-8?B?Wm9VUW10TXpqL1hMNHRtenlDRWVTR1FnV203ZFJ2YlVtL014TUZmZEJiMkRo?=
 =?utf-8?B?eW81anZqSmpTRm80VmhGQ2VtQ3N4WVJLTG9ISlJjRkE2SmZ2aFptT3h6Rk1S?=
 =?utf-8?B?cjNVVkRCMGpaTThNVURvT1BiMTFRektOMTZhVWVncC95ZmR1ZjVXZE9kZUc5?=
 =?utf-8?B?VmpEVnVWVkt1Z2VmV3hzVjhNZDNlaGVJN0VTKzBReVZmSWRxakc4UFIwT2Vi?=
 =?utf-8?B?YTVUTkRGNG1odFJET0FFSmp1Y3ZaMWErN01CUlpMVzcvZXIvc3FaVzVPYWZY?=
 =?utf-8?B?aXFCMEdVUXQ2RlBJVlhGSWViTGtQQ0R5WmpwaE5GQ2Z5U1VXbTFvMm9uS1BZ?=
 =?utf-8?B?YUlZaUUwTFVqS2dESFMxQ1NEOXV0Z3pIRFAvcXp3anFRd1ZuMURaZ2w4ZE9l?=
 =?utf-8?B?ZDFNWkVGZ0NBUkh3a0tReXBpeHdGemw5dEI3dWxpWE1HMnRhVVY4VFRwaXNW?=
 =?utf-8?B?MngrMmJEMitqNlAxUFVEZW1IbFBhWWZXUUZGcHdFdGMzNE8yRmsyK3UvRGZo?=
 =?utf-8?B?dTRkVmRJKytKZVZUWE00Qllra09KNHhPTWVJSDNzUTJsSmZ3S3VTUEVhcTZS?=
 =?utf-8?B?WlBkc0lRbmV0Mk1kZitZRURKZ3RjbDlsR3pVcHVMZDVYNFROcC9IVld5S2U0?=
 =?utf-8?B?SmZORUxUdWdxVnJOYzZOWkJUbElIWFpvZ0hNSVRROG0xY3ByYWxKNmZ4d1Qr?=
 =?utf-8?B?bWFnR21SL1YrUWgrOGZBcE13NTVKV2Z4NnFSMHdjNjhXTmhHM09wWnhqSWVO?=
 =?utf-8?B?clBCUGhKRVJhSVhxdUpHOTJHS1JZaklLMDFQQmxKcEViSW9uV2lKWStaQlBY?=
 =?utf-8?Q?tI6MWPktghcR7wws=3D?=
X-Exchange-RoutingPolicyChecked: JY4mYwQ7c/YzcBRi40asvd963kOzbq+sHZ8Kd29Y7VFIopZlasTA9IKMdWxMf7ieVVKW31noHmK8DTaswtUOx7ycy+btYU/NiYv/ElQao0b2gFs2rOQG/uXD+IO6bf3gYRAcEGZBNOe+QQtJFo84tmxmftS8b+B6OMvSH09ugJL8kDdBmTtJqIibqdE2nXy8kxL721+otDmvAteD0TnQi+9EiHGj++JXA5Li4N6E/HwLkOeQ5xPl+e+PKXGzz9K/IhrpQBys8Rkt5FRAV8LjBaHni55OioFTgLcSfK+4D35mSwtp2OK66VQVXDRw2Y4zHFwkCjvSOtRWA22+aZyb3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 69602cf7-6abf-4e67-d11a-08deccb717b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 21:26:28.3104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QGftbkzHQpf67eWgMlxM1aHZoM32EfRJPnckTt00rXmEXw5Wna8r/kZr9zvnPvr9FnFvxK5OcmfoWYCGDUAWcvuudKtqyJyEsb7z7CaSiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6687
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15126-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jacob.e.keller@intel.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:keguang.zhang@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-mips@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:keguangzhang@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacob.e.keller@intel.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08EF869C879

On 6/17/2026 1:54 PM, Jakub Kicinski wrote:
> On Tue, 16 Jun 2026 16:42:18 -0700 Jacob Keller wrote:
>> I'd probably also argue this may go against the desired goals of
>> net-next with only wanting such cleanups when in the context of other
>> larger work. Of course that decision ultimately belongs to the maintainers.
> 
> Yes, feeding const EINVAL into dev_err_probe() is pretty pointless
> so if this helps it's just by "saving" 2 LoC. I'm not sure it's worth
> it even in context of larger work, let along by itself.

It does claim that it has benefit since you get the error code emitted
symbolically. But we have %pe for that. I wonder if dev_err_probe
predates %pe?

Per commit: 532888a59505 ("driver core: Better advertise dev_err_probe()"):

>     Describing the usage of dev_err_probe() as being (only?) "deemed
>     acceptable" has a bad connotation. In fact dev_err_probe() fulfills
>     three tasks:
> 
>      - handling of EPROBE_DEFER (even more than degrading to dev_dbg())
>      - symbolic output of the error code
>      - return err for compact error code paths

This was in 2023.. %pe was introduced in 2019, so I guess %pe is even older.

I personally find dev_err_probe acceptable and might find it nice when
writing new code, but I agree its not really meaningful gain to refactor
existing legacy code.

Anyways, all this to say in too many words: this patch doesn't seem to
have much value for netdev.

Thanks,
Jake

