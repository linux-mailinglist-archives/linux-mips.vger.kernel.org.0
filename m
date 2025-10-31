Return-Path: <linux-mips+bounces-11978-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88774C22B04
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 00:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 686CA4E1A4C
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 23:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B212E2665;
	Thu, 30 Oct 2025 23:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEBmW8p9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5E125F98E;
	Thu, 30 Oct 2025 23:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761866393; cv=fail; b=We7SK26ZBVzHQcP7WffHrxXXc68OycJ/NQr1a0KQN1rk9iuRcgkaTAA+GIf15PqEmyQL75V46iCj767yUq16jsEYNN+TWRK93WBDqroubAGq2LYmEoAlPXEr1JzluXIVtDI1xJlPMYWZL+8XGkp/ZQNcHBc7CXi5O9Kql/BFWxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761866393; c=relaxed/simple;
	bh=Z0nzgjqaedRiYXm4DEYZR+1Hcs7XXDWx8HW60YfO5b0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sKCxDfZ7wYLAlhPXZEoIAnjUbE0rR8SW+joY3J9zcMwYtDYEwRm+gdEfW4/vR4gcdEM27EcLHTKcor77+qX0w8XTMreqK/rUgymCIjXJHSB6j3Y++DRvxTjEP4oQBZ2wtaJ49HHIfw6S2LhvzuXWI+iQoYxo/bXnII3MWfyF+aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEBmW8p9; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761866392; x=1793402392;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Z0nzgjqaedRiYXm4DEYZR+1Hcs7XXDWx8HW60YfO5b0=;
  b=jEBmW8p9j8AUGDe0Du2oOCRhvk9A/IpmFwcli2qYcPhGcB18Z54kF4Nr
   /iwdBGErLcV8LYnhh6HEq5q84HeakJDtg+Y7xQzdozMK8KY6CgetT4RTt
   Lvwd9unIIXagPktmopqP2LpvJx32q0vNetq8ONIvSGRz4eNQGcIc6/ts8
   a4lmKKVwTnK8S6WotPv5Bf7Mo1uEw1GN1IfGTBbPerpLfueC4ZQJeKwxa
   eMw/gqr251AXTOEfPPmJBcmrwK3nLLGtt2+vLNHVDb4fKsF9Y2oIY2a81
   MsnU/2uQvzfv3p6IIMKq5Ym6gQ9szB6kabbi9zO3PIJaZC352Gy2p/aUj
   A==;
X-CSE-ConnectionGUID: D0hoq4XLQcmm1Hni2HYpgg==
X-CSE-MsgGUID: 12W9QWPZQr2pQ3neUuzHoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64063361"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="64063361"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:19:51 -0700
X-CSE-ConnectionGUID: 6lNypkNJQCClkwui9DxPlA==
X-CSE-MsgGUID: pvR1WogAQNypVDsCpUw6Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="209651731"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:19:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:19:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 16:19:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:19:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKiLAOyLsR1TDyTo6OHY0qsvhkD7gMOmLaKMCGs5+4bgzct+/ttIPpI7/fgcACND4AimFtCQQ/iWhiBEIRTWf8jim6VsDasVNjar2niNPNRHSfP5RPWboNjnhr9opq6t4Oj6hj6EiOdRgfSTOa9dSV1jSf1F/h+Iape1TSCTGWPU+EOKhPL1sMw3151C4eLmZqC/ok4v+MxpFQMchFePyQpvK15oxmsvHWli2tbi2hjDJQ/Vje4btB8pIwxqN29eulR0k9qATuC8DqXLnxeEL3gn80vqoToMV7K9HWpsY4duuANbvTNltZFIl0h73hRbRXuosPdjQz/NdsXeWXfjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0nzgjqaedRiYXm4DEYZR+1Hcs7XXDWx8HW60YfO5b0=;
 b=k5bpgcUcKHBhz/wsulLDyhywSEOntresOBBg3HYgvysweH17G6+wI7z6W0G+6IAzkzq/F3jfvxIHcQYjyzCzqu++E/CcJLMHA8KRPf9gg7pofgifmdEwzDwepK/QKl3M6o9bj2o2N6ZotvEB69qYven2KkjpvZuiw+J8rjszvlnKsoil3vmfTiuXasPnRyh9oGX1XMK1Riqv0ngNKZEFkjseI8Yaw5VB0bxRImYZKpidBWDWe9MQv5E0QO+byVmazS50pFhEKCiULsR7iIeNqvZMR30mJ2yTJbMXYsPokiBmeOmB1Lg6N0nB6ExyIauXQoWQN3GrSe1x+jN5vvFRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 23:19:42 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 23:19:41 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com"
	<frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com"
	<imbrenda@linux.ibm.com>, "zhaotianrui@loongson.cn"
	<zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
	"michael.roth@amd.com" <michael.roth@amd.com>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
Thread-Topic: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
Thread-Index: AQHcSdkxtpZLAyCwOk+1LQGkkmx/fLTbU6AA
Date: Thu, 30 Oct 2025 23:19:41 +0000
Message-ID: <7d6960714392c013e8f3529da08694a04ca91177.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CH3PR11MB7842:EE_
x-ms-office365-filtering-correlation-id: 93ae6e42-154d-40d3-afb5-08de180ace14
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?N25rNUlpVzQ4TklEWmZzN1YxUnQwWnVubzBjbThqWkhnMytpTnowNUQ2NFpB?=
 =?utf-8?B?L2JmSndTSm5JR2ZXMVVKU29hSTl1V0ZhV0NzVStLOS95bVZCbWoxejQyYnRv?=
 =?utf-8?B?ZFFBY0plWmVXa21GNjQvZ0pSNEtZRlVrc0FheDlTcjFrYS9YM0gwSUQwcFRs?=
 =?utf-8?B?emUrcTdPU2VwbXR1MUpQK1RaelVVZE5RZXduSW51eTd0cGo0UERPTGd2b3VG?=
 =?utf-8?B?aGY5QjFkUW9wRldnQ2VLVDQ5WGw0aEEraWxFeTBna1ljUDJQR09PTDYyR1R5?=
 =?utf-8?B?Ly9ET2orMU1YRDJnbmVpeVJjN25vRzVpTkdEVjdRR1BYKzBNNnJqdkJVdUdi?=
 =?utf-8?B?WWFHb0pwdkt2U1oraVBxZkRhRENMNDZjK1ZXZnRJNHQ3c2c0WU16WHNNSVdT?=
 =?utf-8?B?a005SEZ0Z2Rwc0Q1U25FenpETWtsR3hlK0srNnJaRjJVL3lZRytyNzJ4Tk9w?=
 =?utf-8?B?TjZ2dDhMaUtqKzFYWlQxaGo3dk5lWTJkd2NVZUpFcm5VNHN5dThrWGt0ejJY?=
 =?utf-8?B?ZXJqM2JUSXYzSVhESlVrdUdPN3RWTHFhRWh0TTdwcE0rcmxKa1Jha3BQWHNv?=
 =?utf-8?B?YkpmdUZOd2NKVG5WbDVJRWZoN08zYmhqOVQvN3RMcS8vZVlMN3lySVBhTlYw?=
 =?utf-8?B?bmtyTVhUVnF3a0pNODFpcWFXR3RYdU1zdHorNkhoMFFWSGNZZzErVDZSUE45?=
 =?utf-8?B?YmtrMDUvOFpzZndEY2U1K1NRQ2g5UFVwcE5EYklkZFF3TW9jVGNJMXdONkpC?=
 =?utf-8?B?VFdRcFZYTjhqYkVzSmoyenVVVlpIalQwcHc1SEoyTW1QTnFOSU83Q3FMYTUw?=
 =?utf-8?B?N09SeWhteTROcm5CN1ZzWiszY3hWL3JBSnh2QnVLYjZsSTFRUEUrRGZBTDlu?=
 =?utf-8?B?K1drKzFqQXY1Z1E1a0N5UHRjT1dLT0tZYzRRNVhDanZNQjFxSFZhZUtSdk1O?=
 =?utf-8?B?Q1JaYmUvWmc1bWxDNktkWWxkZEhDMHJPN2Q2Z1FxVEpjbktMdzU4UEM3Nkhx?=
 =?utf-8?B?VDBpUit6L3oxemxGOVhnb2prTEVKNkRkKzFzR2hianlXeTE4azZaTkhhcHVR?=
 =?utf-8?B?ZGRvbGpEcVhFZFBXVlp6WnVUZTNiRU1iNml3cVJaRitKRU9jM1hGNWdJdWNq?=
 =?utf-8?B?MWROUDVxMWFQMk9UMVFLZEN5RXhZRmg5bUxwM1RzTGtGM2NBVEY2eHdCUHFx?=
 =?utf-8?B?RFlNMDhjMHI2K3RQWWc1Ry9qMko1aytyWnBNY3hzZWhPb1hucXZMLzhnYklu?=
 =?utf-8?B?aXBOV1Q1MlAzQUUxQkpWRGtYd0QxTWVaQm4wZDNKaUVaT2piRGUyK1JENlRY?=
 =?utf-8?B?UThINm9nNGdGaDdGalV2ZWY1N2wwS09BNXZUZ21OMkJwTmEyVkJQRzdTSHUy?=
 =?utf-8?B?b01hTzd3UndSQllubXpCYWE5a3BJdnJYUTM3QWdhaEJpdzhNcjBGbzlkL1cr?=
 =?utf-8?B?T0RyUUxwQTFJcXZ4UHc4RGNGdStydXF3ejd1dUtkKzZ5Y1VSK0w0N3NycHRB?=
 =?utf-8?B?ZFM1dVJsMytBQTY5aVdLczZsbVZaMG9rYXFxZ0VhT2lyNitGYW9WS2dKWWJh?=
 =?utf-8?B?eXNGTThEZEhZWWNzQW5xWi91cDUwalhZbkMwTzd0M3BnVWprR2VFWTRLcmts?=
 =?utf-8?B?M3Nhc002bTNzeW5RZkFQMUhtMVR4VEJXWDJtN3dXamdCdUZrT2tpb0ViWTh4?=
 =?utf-8?B?T1ZIUVl5S0ZPTWJTbGNsS2FNRVM4bkdaSFV2NjB1TzIxYUVSR210KzYxZ1Rh?=
 =?utf-8?B?YWFRaFpnUU11dUJSQVZSR3VPWWFKY0dVZkNpQXl3ZEpUeVFuTzU5TVNCNEwy?=
 =?utf-8?B?RE44d1NrOXcva3Y2MVltdm1pWUppUUtVYzdSakRzQWt3bzFBVFE5WXFWZjBN?=
 =?utf-8?B?Wm9zRlpZSzlMaFN0T2xHcGVBL2RhcG5UbVVROXlkdzUySW5EcEVVYUU1QW9k?=
 =?utf-8?B?QVdLMEVlTStscUtBVjRhZ0VVV3RzT0x4L3lpd0hFSldqL08zRmFxTHg1Uk5O?=
 =?utf-8?B?M1lIRlF4RmlwZk9LZGtWV1dzY1FJUlNBUzJUMG4vd1FEQTRpYjlpVzdlMmlB?=
 =?utf-8?B?VllRSEovLzBtV2x1ajJsL0VoR3N3VVozUTNZdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnZ4bkpLT2dSM1kxVEpQcHhvMUloTW9Wd2w1UnNRNnI3NGNScWk0WFhpaGJ5?=
 =?utf-8?B?Z0hDNGJyQi9Bdm9RbDI2UGY3bFZ5SUREQXNobkk3cmU4OEp6b3dyOC9rR2FQ?=
 =?utf-8?B?Yy8rcWdXdEM5d005RkllNHRvWThpR01xNnhXZ1d4Nk1WaUp5MFg3YUhOOU1Z?=
 =?utf-8?B?NS9nSnlnTHhKa1NYUHpReENsbE9yeFhqNlVrbDVGdy9JMG9LRXBYVVdQbmRV?=
 =?utf-8?B?Z1J4YnQ0Y09OUHBLYlcyMjF4SEZmZnNVN0ZaTXFNUlNEVDZNQzdXZzU0NVpV?=
 =?utf-8?B?RkkyRUtwL2U3dE9CZGlleXNlQWxXZ0lZOXpaelVjM0RFVmpNYUxiTVVvM1J1?=
 =?utf-8?B?VjVXbW1OVnArUHB1aXpkSW1oMWplOVJYckdwWmYyUDVMZXNucnFYN1JxbUpJ?=
 =?utf-8?B?RnFmRlB2RzhnQW02cWZUSXB3SEtzdEFiYnZjUkdSVDFlc0VieldBTUFraCt5?=
 =?utf-8?B?Nk16U3E2cksyU1VkYXR2bFgyYXB3V0l4RklmSm1HWXd3YTdhS3VCemRWSmVX?=
 =?utf-8?B?Vk9iN3MzU252VEsxdmpIVnpKNFYwRnZZd1YwZWd5T0ZQcmVUREtod1lLMCtF?=
 =?utf-8?B?YXNJWGtGZGJqV2RMdGo1UENRRUlQU3RGSHk5Ym1aYzRkWGE1b0hhMFZnSFNp?=
 =?utf-8?B?WUR5SnE0cWNSVVBuaFUyYU5CTWk4ZHg4ZmhURUlDRGN6UWNPV050MCtpM1p4?=
 =?utf-8?B?dkxVZUVla3lzb3hZVkFrRTlpYUxXZXhZOUZucWZlbmExaWg3Z05JeWxLSkEv?=
 =?utf-8?B?Y203c2VXTEUyWWttU05DMHQrZUtEc0lwcFpHWHZjbFF5ZWc1Y0tNa1FkN2xD?=
 =?utf-8?B?RHlUQ3l2cmVnRDdKT3ExNnVaVFRQNFIxUE81dmQ5RitJNDV6Y1pPQXJSUVh2?=
 =?utf-8?B?OW0xV25uRWpYZlhsWGpETklmQ1BkdWtZaERLUkkwMU1RaHhoM3NXTTZCb004?=
 =?utf-8?B?Ykh6M25hcTZVaVE5aHk4SXZVb1VYcTJGd29HY1BxVmg1TFBkMjZyaUIrOUhI?=
 =?utf-8?B?OVlNczhwTjlLZ0JBTlVJbElYa0U1WDhFOG9hVnpRM1ltSU9HeWl4UHBKVE4v?=
 =?utf-8?B?SytTVlVWRFR5d0JHa0Z5TW4vVmNXM1UxMFZGRlZtLzRPejdLbllmNDJNY0tM?=
 =?utf-8?B?SUhPejFSamxIbGRVZlVIbEpZUjllWUthaHFUMmJOTzNiZTdJcElqMUZ4Y2dn?=
 =?utf-8?B?Wkk4QjQ5MzluWENUNmRUd2RQTXY5QnNZcnByY1hTamlNWmpRbG5wb0duN1E4?=
 =?utf-8?B?NUR5YWJVVmU2TzNWVEwxaXB4b3NVUUNJUXpRRWtuMENKOWFmbk04UTZRU25a?=
 =?utf-8?B?Zjd1WjZ5SThoc0llVzFHLzAzYy9vSjR4V0M3VDcrWmNzS3pVNXl3bENPUTRa?=
 =?utf-8?B?K1JsWHUwelcrL1ZMK3BKS2tkZ25Pd2ZINzVwTE9EL2xoaEhzYW51ekxCZE1D?=
 =?utf-8?B?ZlprNmJnUXpnMHRxV011UFBkMTJPdEQwU3kyU2RFMzhOY3lyL0ZDYUFmK3RY?=
 =?utf-8?B?a0VtM016QzBHdHl0Y04rUWNTeUFZNjRQSG5yR2czVmpLcmxuNURLeVF3ekFk?=
 =?utf-8?B?bGNUZ09XMjBRMUJYSzhzNnkvWnpacG1UdVdKMDh0MkJZYW5xSWF1KzRYL3Ex?=
 =?utf-8?B?a01lQzNOMldTSWV5WnZVb2xQNUNpVERoaEcvR3JzUGQvU1lpSGVJVmtENG1D?=
 =?utf-8?B?WHlNMjNDR2F6QWp4RE94YmkrVTVuanJOcE9zOVVoalNudFppemw4TTR6VmNj?=
 =?utf-8?B?S3VPcDNTaTBuYkxWOU1XcWhPdncxLzlBK0FaRjJWaDZjVmVMdHF6Z2xVcFVM?=
 =?utf-8?B?UEd5cWc1QzJuZ0RsNUp0eS9oRW01TGJkSW5xRmdqOWVoblQvMTZMQlpBRVF2?=
 =?utf-8?B?elhqWUVuckpUWUZKNGRxNEJ3MTV0cEYyUk15Vmc4aWpYM0RoRUc0SldBMG1E?=
 =?utf-8?B?aG12MkhuVUdDeTUxWi9NY1NMV1VJUDNkWWgvL3hwT3NQN1cyWEVIUTNGbk9D?=
 =?utf-8?B?VUNaSXhuZ0VGUFkvR3hheWN6RjBqVmd0NWhDOHRNVjlsYksvNmdvTCtKQ1Vk?=
 =?utf-8?B?R1crYUxYRHdsOVV2bTIxUklBYTVudk5tdVFKOXJvcEZhVzFqSldsRVdBSzlX?=
 =?utf-8?Q?dr/LS/wrb1UgiOkHooktXEBc3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B9811EB14B5A344BF6137023B44CA06@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ae6e42-154d-40d3-afb5-08de180ace14
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 23:19:41.8948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hBYY0asCp7bFssTtg/b3d/vLUj4R2Z/VGg9iAL/QYYu1x3XZ+2djUmQtK4HFcZ1Oj46hrVVvZ7fXvNr7cuiePw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDEzOjA5IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBOb24teDg2IGZvbGtzLCBhcyB3aXRoIHYzLCBwYXRjaGVzIDEgYW5kIDIgYXJlIGxp
a2VseSB0aGUgb25seSB0aGluZyBvZg0KPiBpbnRlcmVzdCBoZXJlLiAgVGhleSBtYWtlIGt2bV9h
cmNoX3ZjcHVfYXN5bmNfaW9jdGwoKSBtYW5kYXRvcnkgYW5kIHRoZW4NCj4gcmVuYW1lIGl0IHRv
IGt2bV9hcmNoX3ZjcHVfdW5sb2NrZWRfaW9jdGwoKS4NCj4gDQo+IEFzIGZvciB0aGUgeDg2IHNp
ZGUuLi4NCj4gDQo+IENsZWFuIHVwIHRoZSBURFggcG9zdC1wb3B1bGF0ZSBwYXRocyAoYW5kIG1h
bnkgdGFuZ2VudGlhbGx5IHJlbGF0ZWQgcGF0aHMpIHRvDQo+IGFkZHJlc3MgbG9ja2luZyBpc3N1
ZXMgYmV0d2VlbiBnbWVtIGFuZCBURFgncyBwb3N0LXBvcHVsYXRlIGhvb2tbKl0sIGFuZA0KPiB3
aXRoaW4gS1ZNIGl0c2VsZiAoS1ZNIGRvZXNuJ3QgZW5zdXJlIGZ1bGwgbXV0dWFsIGV4Y2x1c2l2
aXR5IGJldHdlZW4gcGF0aHMNCj4gdGhhdCBmb3IgYWxsIGludGVudHMgYW5kIHB1cnBvc2VzIHRo
ZSBURFgtTW9kdWxlIHJlcXVpcmVzIHRvIGJlIHNlcmlhbGl6ZWQpLg0KDQpJIHB1bGxlZCB0aGlz
IHNlcmllcyB0byBsb2NhbCwgYXBwbGllZCB0byBrdm0teDg2L25leHQgYW5kIHNhbml0eSB0ZXN0
ZWQNCnRoYXQgYm9vdGluZy9kZXN0cm95aW5nIHR3byBURHMgd29ya2VkIGZpbmUsIHNvOg0KDQpU
ZXN0ZWQtYnk6IEthaSBIdWFuZyA8a2FpLmh1YW5nQGludGVsLmNvbT4NCg==

