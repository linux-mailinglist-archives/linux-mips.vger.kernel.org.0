Return-Path: <linux-mips+bounces-15128-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 03kKGd0hM2pZ9wUAu9opvQ
	(envelope-from <linux-mips+bounces-15128-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 00:38:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F1A69CB3C
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 00:38:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=K1Rz3idj;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15128-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15128-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C6B4303902F
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2026 22:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA51839183A;
	Wed, 17 Jun 2026 22:36:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7853370E4;
	Wed, 17 Jun 2026 22:36:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781735798; cv=fail; b=o9UMy28K9iXIiJH5UQT0ptMUS8rp+zqw91sUT34uzcEPrpq9M6L/V44clcphjTZegfl9RbF3yj527g+wiqTc/dZduC3fYuSwBmHpGtr4LwPKBEV1rAJU2GFChFhWa41jbBnK8vC4n9KirxKcFdnZFAFYX+fUz/hL3PVx5/Qohbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781735798; c=relaxed/simple;
	bh=5+iGSe9iWmkYihC4wjdGVswVCSTzqsEk+7tJCH38iXI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=icPrNPWRRtDR7AbXIJ4mSaUdaBzlojx8amgfDPhMDxfK8qsUx2JIS6vtbCIqNA2UpRHCKmwV9r9PzkS2WEvwVB4CFDvUtTz+CfZP+MhxHcX97n0U6aK+M+9QYdHReGX3g5rp1DtnVlwjAdB24iT92E7+DN3wKplC+rZcLOKo5ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1Rz3idj; arc=fail smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781735797; x=1813271797;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5+iGSe9iWmkYihC4wjdGVswVCSTzqsEk+7tJCH38iXI=;
  b=K1Rz3idj5hNKgb2xlj71Mwh6R8D07LgN9frid3wlX6X05+u2+GdbcQHP
   69pp8+8lwIRkxgcE/aDpPVmx6F5qmc0eZ6aepGRtihH7h47irgPdMvfDk
   6gEvsgAEZoh9iruD6I3aexSEtONgKdkZOswoYwzuA3C+XIYYGpENmzInK
   eQXTVf4qzSaH7yo2oHpvLTxDro94tfB0noYj07QPt1iC9fe64nMJfkIxi
   ixyYkKCvbwF+RKraYbwftfufffrChbM/LtPf2ttjnAP/ilPCVB2Pt3v9X
   vdnWvD31SOYfNJmevMvcmf3HVjL7jrYwStJHN1rjVuh7KDmWrnIhu4gXU
   Q==;
X-CSE-ConnectionGUID: R3PU95sBRsK6UzQz32SRUQ==
X-CSE-MsgGUID: aSg1M8VvRY+dXJWT9NRr7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86399454"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="86399454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 15:36:36 -0700
X-CSE-ConnectionGUID: tnRdIhfqTMOkIKUM+mRbVQ==
X-CSE-MsgGUID: hPuj61biTyOFtvSyF0IY9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="250080679"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 15:36:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 15:36:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 15:36:35 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 15:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=di6mBd8ssB//WRj9GlgUT55dzO2TNxoYQ7d+QphEeo/7nMrFluq656c4WX5l9DsBiBzzcW15dMTHgTdptQeKr9uzJokllWL28pjh8gPouZCeijWqgBpe+uqsiR8QZp5rdJ0BkdPt7E8pwyHCU+IiXfegtQBiQI8zzi34VvD16LNBtuoCLpL0NBANqyeaKhJSIgtBSYxfIhFAW/uofNb6aU84/dW3Fj+YJflu322vXPsvCneXviuyz9XqGAGSebmD+2Wi5bYR4TT/ImZg26yOqo3FVsarYiNrcUGEvT+nqz0mZboWlWrv1+ZzS92LPevGeAzoBLcRJ0/92GEAaaHb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJhWhvZhcNBIulZ+zg+Vdx8iSYl6FqaJTLG0SfEWu5c=;
 b=hOD96P4pmUiLwtfExAYIVtBBlBqrXOQDm3lkEUW5sfFsFvdSxSAURrLE5DSUs/4nvYZ38uszh07wj2mBzSutaTDjBBYU0OiVxSbrL5l8O/TUSTVxk5MNMZ68kTeuO2mU8FuAnP/lvZIrmIQOOYmheIgHeexDPoyopwvu2M592VMWAq6jUvhaEQGj7IELiaen3qcaHDDCHGRu0bNFsacBN5AcLHweN7TJcEpBfN5bE6Jp2hX6SZU36gJn1i8D/NbKML9+dSUitOvj+ImLgE/0yZ6CKtO7+s2o3kjWYSyrJqfu7jIaJL3DFo9h4ZR3BvcwaRrxiRkD/0lsMQJQ1174PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by IA1PR11MB8099.namprd11.prod.outlook.com (2603:10b6:208:448::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 22:36:32 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 22:36:32 +0000
Message-ID: <57c31dc1-39e2-4977-9331-5eed20d676fa@intel.com>
Date: Wed, 17 Jun 2026 15:36:30 -0700
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
 <6b8db599-5bb2-47f9-ab53-a0b5141af2e5@intel.com>
 <20260617150744.05756f0b@kernel.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <20260617150744.05756f0b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:303:b7::27) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|IA1PR11MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 432e86e1-00e0-415b-1bb2-08deccc0e184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pxMg4vF1h498QdAqGCeJfj0RoJSDDPM9UH7I2MsZn4KNTJJ2OcHTFk8zUn1nhyvfzhNEJcIjGr+/xe2xN7iCyBEGDPNUt/qsK9C+MOq9DiGzAJ1fMG1K0okXlgsod3ejZxeAmmR4mUEPpX7vK7lmmTVEvVxTL0z56GMcSRAu6VMVtbPJrnExRGHu9v/9rVbrZaV4J4OlpXRP5uCPYko4MdyoVJtw0RhBNwr1qEuOhoJ4B7fitQf9y58L1B4In36gZDiSj7hdgYLYheajkTnhYNN/G6cJV0TcOwgm3qp3NmElF1giucAlNRmLNSjrXdMP4Pa1OimuSYavM5aihbK1V/jw83TsCt4Klyt7an6lahLUZjeegNtgJavea4DFU62RW7SKYDXocRCXrPMzjrk/9mBxfcalh2P5D3BpBgIt1uVGUZKy+iHYA5GB/pPgoOLWG/pMt9O9GMQvnBh2yhw4seMiduoR/2c/k2k7cHXyx64KNjPVIr98pDWfsakcUiOUXMweN1iy1W0hBNdVK/UPeNsjKHtyKSCdiLr3JF2ip8NkFgPRQsJfRjCe6hSg+AXL410hy6CAXVRPOyzQE7DtEwNchZHPuTcoXu+WZ2UNdenjR7Y+dEU6lJXeuenZ5QbrUcnWHBqJQJFHjpgP5DCNc/M/iBU5U9tX28aZLEIld1HrkxT/cZlsrDaiTvli+9xQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNmdzFpQ29aMjNTYmIxMHRzNUtHZXRXZEdqZU41TW5DZ1VqWTFPNWxPUjIy?=
 =?utf-8?B?ZWhUZlk4UzBNSzJvQWtmNEUvNTYxVW44SjNFUmIwWkZ2SVJjUENmWHpLMnFz?=
 =?utf-8?B?MDRYald2NXJZUDB0dE80KzVHb0VEcGFzMTlxajJvREZvam5nQ2tIdE0vMGE2?=
 =?utf-8?B?c0FVWHo2a2Z1d28vMHBXejlNY0lFY2MrVTBXTEJpR2M0clJ0SkgrempNMGd6?=
 =?utf-8?B?V1g1enFESkZwdGRlUEhpQ24yWEloTysrM1NESDVpTzRmRkFZY2dqTmJCSENG?=
 =?utf-8?B?NzRNS2tTOXJreXpZT0NvSG1VcU9DR3p1ZytZMnRqMlRWcFNiYzhZN0E1bHov?=
 =?utf-8?B?MDZyNEttV1hlYlh5Rk1tNzRpWStxYnR6VnI3L2RFdTJxU3FXMmxrNnAyK1c5?=
 =?utf-8?B?WVZURmg1cFRrSTdwakNJVzB5ZHluWkRMQUxHZlN2UkcvL0ZVOUgwbE5kM2lY?=
 =?utf-8?B?S0t4bmRPQ0Z6a29Rd0wyNVMwTkRMcDI5K2FoUVc4djExM3cwSDU4Nk9TdjFS?=
 =?utf-8?B?RVZPSUt5ajBkcVF3ck9zZ3RveTJrSDVQOEZjdkVoMmUzRklUclJrWUxRQmgr?=
 =?utf-8?B?dTkwWGVWMGp2NVRPVmN5STJIZFVQUWFoQ3k5K2Vka0Q0TTVkRTRWY25pbTBu?=
 =?utf-8?B?OEtUWitlTUVTRHlBbW1GbUd0Tmwyc2ozY0Y1MllwWUdMNkFCUW5ZQnRzc2Q5?=
 =?utf-8?B?NWtsbFlSdUZrMFdFTGdzQUlPZEFqNVoxZEVueVhET3l4VG1yYWkvYldqYjBP?=
 =?utf-8?B?M0hmNU1qK2ZNZlpaUWUvM0plaTlHSE1zb2tDeEdxem5OQnFSeEJyWWowZEEy?=
 =?utf-8?B?WitiSjFIbXFkaERTellpNDUveC9ac1lVWVpoSnR5bld5a3lLUHgrczJTUzU2?=
 =?utf-8?B?RmVPUmFlWUdmRFBFYnE4ekZxYmJaVXBuNElqZEg5NWxhUFNuWlo5TEx6VUJt?=
 =?utf-8?B?YVFKZUZod2diSkFDS0M4eG1uWEtLVkwyOEVvSlBVZDl4UjdtLzMyakgzSXhr?=
 =?utf-8?B?TVVMNzJ2QmJZQkI2S2J4NnZlckcyeDNZNG96UXFac3ZlWklaeU9zZ1hYTndH?=
 =?utf-8?B?ZWZqcHEyZkkyYU96QkdlUlVQL1hGa1pjWjlDOFJNT2szK0IwbWp3eTE5ZkFO?=
 =?utf-8?B?cVkrZG5EUEF2UVR1a2pndTlTYlpYOFVvN1p3SkpheGJMV3JzNWxnN1BTd3lt?=
 =?utf-8?B?KzRlU2pJMFI1WEVzL3AvUWNhSmtob0h3V29wbElMUHN1Ui9JQWswdHBhaUd3?=
 =?utf-8?B?TlFpVHkwc0VqVFBNb0JkOWJpMkZlY1pHd1JmK25nTkZQUEk2V1g3Y3NjUHls?=
 =?utf-8?B?T3lvN1k0aHErcUFQd2hrRTQwQVRpYU9ib2FjZFoydjd3SXlPUlV2cmwzTW1t?=
 =?utf-8?B?MmdTSmlia0dsWTNnNS9pc3NldlZzelpvNi8yREdVcDJkS0g3QlM1REM5SkFX?=
 =?utf-8?B?NGxjeG05aTVPQzVWM2RnZ3NCNlBkOXlTdEdwcElsWEUrN0tnSjN0bXg1OUI1?=
 =?utf-8?B?bGM4aXIyeUFvWjlncGJDQ01XMlNhVHlacWxIYjZNYVBkMEpSQ25qTFVCRTZp?=
 =?utf-8?B?UDIrMnVDYlB6Q1lTTjBFN1V5V0sxcXZoRE9HUHNJMmF2OUxQSlUybGF0Rmxu?=
 =?utf-8?B?WHQ5RDdra0E3eThFT05qVVVjZUFPZnl3T0pRc1U2MSszc21zTDVLc3ZTSHZS?=
 =?utf-8?B?OEtJNXNRc21CU0xmbVBTbmxoNWxJME5RN004ZnBWRUpnTCtPQ1pwQ09aK2x0?=
 =?utf-8?B?cjM3VWJFQlFNZHJ1c0tremV6Zkl6ZHg4eXdXSUF4MWdkUjR4T1ZSQnhTWkE1?=
 =?utf-8?B?dUEvZmNQSVQzVDZRVjArZXM3WTlGQXlBUnR2bVdmVDM4Unk2L3ZhMVVqTlNq?=
 =?utf-8?B?b1R1WEltSDR6R3FiVzhmYmJoNVdkMlFmOHpxQ0dEdmE0V2Rzbms0MUZtODVu?=
 =?utf-8?B?MHpqM0RhTE1OeVZHek9LbGFYSnhwdExTbjNrb09JbWIxdlJIYnFQa1R5WmQw?=
 =?utf-8?B?Y1h1Zk9uSFpQVWlmUjhubVNkWFNyM0NBM1JTZUl3UEdENFBQeC8xS1JPK3lN?=
 =?utf-8?B?VnRvaUZkakFVS3pUZCtuWUo2ZEp0cmMzd0Rxd25hUmd4SVZ1aFkvK2pvU3BV?=
 =?utf-8?B?aUF6bWw1S1JhdGxOVUZwYlZFb0VOL0lrNG4wQ3V2cnJEVWhDdW5pNFc1VlhF?=
 =?utf-8?B?NlhDbjdsc0NvWCtBcGNVVWxwTnd5NHpqZTdKVERJTDN6MUtPc25FT0xPY0Qv?=
 =?utf-8?B?S1p5WmYyLzk1elJKRlFnQWpkT0xWTFA3SDlWR0pOVGNVQlZMTGRYTERXQStS?=
 =?utf-8?B?Q1RTMUN5YnJ3NlF0QjVTY29YOFJ4UXhpSUVyK290aW5xN0pNdWozbHhpYlhn?=
 =?utf-8?Q?z0JNkx0s98CLZOzc=3D?=
X-Exchange-RoutingPolicyChecked: qIghjDl1Ue70u4hN0QZnVBOimUkZszjcFBZvBJknHKSVUJAHY+gb7GDgQzhEiEqVMJ0NRPy8NqJ6kKDe4Heu22oiJOwioas1NBLC0Re1hc4P40EQctAP+gb2o5sSnNKujSfaA2jGDSmcAxR+Y7WYL3FAVXmaPcfsKRWdmm+fDJ2gn/4/a5cNOdkSq7HyK+ZH0p7bGhnz2VCK5oEmjUWCvbUnplJNSPPg0UDMeXw6GuNifE/QEbBPR2Y2OjwXFvJta3fMKV8aroEqCdExlBO3Wj9xhY1zTzR1yDZEVxUqiTrMrbC3sUxqQQjYdWuy+y2VlkZ72n9Y8cGOcANOdr3ldw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 432e86e1-00e0-415b-1bb2-08deccc0e184
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 22:36:32.4493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUUzfoxCQsMvQZ1I0DuR+mmUJVpJyTbLOU3/JjFqemmR25Fi0QeD8ezU7lNrAG0BPT8INlBN+2ov7g8x3e7PaxPMXA5gHTN8I27h8iUM8PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8099
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15128-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jacob.e.keller@intel.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:keguang.zhang@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-mips@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:keguangzhang@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:mid,intel.com:from_mime];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9F1A69CB3C

On 6/17/2026 3:07 PM, Jakub Kicinski wrote:
> On Wed, 17 Jun 2026 14:26:25 -0700 Jacob Keller wrote:
>> It does claim that it has benefit since you get the error code emitted
>> symbolically. But we have %pe for that. I wonder if dev_err_probe
>> predates %pe?
> 
> I'd argue
> 
>   No of match data provided: -EINVAL
> 
> is more confusing than just:
> 
>   No of match data provided
> 
> the EINVAL is meaningless and hardcoded in this case?

Yea, it is a bit more pointless with a hard-coded error.

