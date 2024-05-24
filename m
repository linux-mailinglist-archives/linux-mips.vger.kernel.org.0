Return-Path: <linux-mips+bounces-3318-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43608CDCF8
	for <lists+linux-mips@lfdr.de>; Fri, 24 May 2024 00:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12E361C212D1
	for <lists+linux-mips@lfdr.de>; Thu, 23 May 2024 22:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3082F84DF0;
	Thu, 23 May 2024 22:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQtTCsPa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC047D417;
	Thu, 23 May 2024 22:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716504456; cv=fail; b=E4hPGRKzDYi6YRfDF9MLLigF6QAWKZi3zrRzP9h8GC92DEme8Ip1LNcS/j9JrW+ApjLZzEdgX2+KtqQME02Y5v1Qb//dFG7j7vLCMUyem4iWONAgnB3FFdFZ+9EWIzQ21Q5go6hEcO460Rhn85uF5MZ2zKK7ZKpuUJIwb0hStn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716504456; c=relaxed/simple;
	bh=Oz0g/Qnv5VsKA2wyrB/KlyTNUeAfzhgPjUQsr9ETuJw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eaOq6V0i7ZQog98qGhzOvonor80+5sjr6LtTw2VbUh/wTkPnpriA9N1/T59j/3FPUqYYWTe3Ri546V4SIghh2z42RHS3QY3PmsccIUjiCfvpkkEOw6RL9mHtwV7Q2sV8tIArd3/Fo53mPa2dnYfqWHYkMBE9hgKYxTv78EMn/so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQtTCsPa; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716504455; x=1748040455;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Oz0g/Qnv5VsKA2wyrB/KlyTNUeAfzhgPjUQsr9ETuJw=;
  b=kQtTCsPaFJZ8R/rn0CQeX1HE5b9lrFFtL32cE7YewAW1PD/xE6aUNlM1
   zu0f6OXFuCzCuOxAimPOjY1tDQAJIXCc94GjzHLEwjvNsEj/IZLXpkzhT
   Wr2uZluW/Y83w4YGEot3uzSYsDI7Qe8pNh3nqzAMoWX/Lm+pv7Ng4wOi0
   XptDrNKN4IuWa6bNPVmtFcbfy9gtxGVpfJ0jd4D9gcZlVBPis8TKGVfce
   SOJS280k1o2RCYi74S4sN8H7/nW3PpseEOdv00RJa4G6d7GyTHh03STX8
   N6TlF+tE6UUgkhFLxZkzzdjhbA+NB8P1YuvnWaTC91+kYLWobVf/FG+LT
   A==;
X-CSE-ConnectionGUID: MjUJdwDVSwmTqtu5sv8Low==
X-CSE-MsgGUID: EFQcx8TbQe+VzoCGzI5OTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16649405"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="16649405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 15:47:34 -0700
X-CSE-ConnectionGUID: EgM2TvNFS76nOiCdnTseNA==
X-CSE-MsgGUID: hlvdl3sKTh6T4PRsX9Pu0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="33699871"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 May 2024 15:47:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 15:47:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 15:47:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 15:47:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 15:47:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8iH26OdFHYLAjlH1YYkUJo4nvsjjzBVO23NoTng0HnSvyTD0tch4KVOF+me5CEON5t3JaGjXbZv8n1SEsDK53su1B46hTsQcFUYSfMCTLekmndOx+ERVhVAxsrDMUefh/kttYQOizZwOBLsMyJkAIacdlkiIcWrHHTyrpzvtHytBc4Ew0XipWvMYDeCcEFxymP58rqb7su2DzqjGZjmFc8TjkUOs8ndR3Tb9F0Z4b+ywVyC87zHBSRQ5tgo3fgQ4GP7PMjMo6iWmBtnuV7uT6gTiA7ohQlgbAgfywIeCC7TACLoAje4vN7qG+zvhK316cSMDb1NUpif3glklcKbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwGIdT0A4vaPk2YBuENUo+i5ZI60/wJFkP0bwBOaBQA=;
 b=ZMll5Nl2GrL6L6uv0r+3zFoE0eckxi528QwFTX6iiK/w2oEvCNqH4qp12kBxKjQFbmYKtuTJHJRP0V4O9u5aXNLJFAonRD7e9Fw3kxY8Hfhz22z9ihDTDEp/PUtFSbT9tgqC7xDecw/3Qwl/SvqeQUI3v8SZpGa8w2q1DomgORDTtG2tJ8No8LPmq5PbsRtQVCjgelJPdedQRJ2v8YeBybxRrJ+IfDxPtvrBGnxzLQ5E6b4N3TiE69u1cGCNqC9SA4DeqUH40D+pyEq3s6l6Lsf/R4hG1jTg2czGASrOf91Gl+YzNO9X4Mi+Ez3bbP8B8Y1YTBw63ckyftLyETtaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 22:47:24 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 22:47:24 +0000
Message-ID: <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
Date: Fri, 24 May 2024 10:47:12 +1200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
	<zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen
	<chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Anup Patel
	<anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, Janosch Frank
	<frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240522014013.1672962-1-seanjc@google.com>
 <20240522014013.1672962-4-seanjc@google.com>
Content-Language: en-US
From: "Huang, Kai" <kai.huang@intel.com>
In-Reply-To: <20240522014013.1672962-4-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::36) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5978:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 323e7688-f8fc-4479-febc-08dc7b7a506a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015|7416005|921011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDc5cFQ5UGFiVUFsQmJSZTVxRW9PTGtqNVcxK0UwTUFRbklBaTZ0dU1lY0tu?=
 =?utf-8?B?VWloUGNORG9CSU55OHovbk5DbWZSUVU3UzFRL3c5eHBQQ3h3VHljU2JPdGpJ?=
 =?utf-8?B?YjhGV2tMcW51K2hxNEVYNExWWmhwVXN5U2k5NWpQV0ZFZjA0ZC9KZzJpckht?=
 =?utf-8?B?R1lrQ1JOLzcwK3hMYmVWMGdsNzh0YURBM0cyZXUvQnpWRE1Cb2hNcWhiSE82?=
 =?utf-8?B?WEVLaDBJeElZQnhid2J5cWkveW5ZWENURFRMVURZS2xtQU1xdVo2ZFo1elU4?=
 =?utf-8?B?SFpKeFRwOEFGL2dRY2RvR0VSejVmKzhPZlNhNllZdlRDTFVzUGhrdjZrWW1C?=
 =?utf-8?B?TjRYMHg0YUQvbC9qanlES3JPWHlkN0tDaS9YMGRRRGtBbXFScWZoWHdtV21B?=
 =?utf-8?B?TythVEl1ZzlEZjJCQWR1OUdhSytRaTdZS2FJV0krVGEyRDMxN25kU3pMVTJa?=
 =?utf-8?B?V2ZzSjVodmg4bnZ5czNwTnhLVnZ6TS8wKzFpZnZScnNuZEFvc3JiVnF3Y0hs?=
 =?utf-8?B?azhCRkZwajIyaGpyRG96b0NnaFp4bktneE5SZFBqQWZwTGV6S2NiSUNPWU0w?=
 =?utf-8?B?ck1mWDdBZDgyTUtTRjNCZG1zd1E2bVcwR2tTdGhwSEtQSUY5UGVITGlIaE1h?=
 =?utf-8?B?MFhQaTgvR1pydklPdEtGRUdENjZBWndzcWpsRG81S0VGUStlRzJleHdlTHF2?=
 =?utf-8?B?M0pGL1BQYm5helM4MEFyckp1UlZRRTdtdFBuUUFJQ05FSUx1SForNUtReldx?=
 =?utf-8?B?NTJvampwMSswOXh0WjhWVEs3WGtlOEFkZUdkcUkvZXJoZFlBR0hVeUplN0ND?=
 =?utf-8?B?U09VSjk4TC9BMk84b2J5Q1FLNm5qa0xKTTJSNEo0YW9nMmpIbCtJYzFlOHVp?=
 =?utf-8?B?aUlHMXNEZFRBTlJNdGlHc0F0SFVZZzNXVEZFRVJhZU1jVjl0Zno5S2YvQnhM?=
 =?utf-8?B?MmxMVko4cUVTMDQ1RGlET3ZDR3NmaXZwK1llOEF0YjJhWjgvL3l3dkwwVXEv?=
 =?utf-8?B?eXdyNVhIcTcwcTRSSDNPdHdBWGs3cjNTU1UwWEFGS3F2b295dVdmWXhpOFlR?=
 =?utf-8?B?K1BjOStvVGFENlIrcFFVcEduZHZ1RVl2akR1YkpxU2s4L0FuUHhBUE5BaTNY?=
 =?utf-8?B?eDJtZWp2YXlRSXAyVmNPQUIraVdOd0NaOHlqckphb3NDbjQ0N2ZUYU5nVllX?=
 =?utf-8?B?TTRicW9PZWsvc1VYcThiMEEzcE5weUNaUVZVeTYrbXRIbW4xWUZMVmR0Uisr?=
 =?utf-8?B?eDVNSUlUMkZmWkJuZU5IakdxSEVYWUdKRWRFcm11dExHcHIza2czTVJwazZ6?=
 =?utf-8?B?RGdFTmNDR1RSaEpjNVJMRlFDL2NBRFJJU1VXaTUydC9lemwvWTcyY2c0d3Nh?=
 =?utf-8?B?djVuamgrNkpBdlRXa01RUG1rVDIxQThlT1Frd1JxZWxxVzI4SHE2dm1uRGhC?=
 =?utf-8?B?elFYZk9PdVVGdWtjU1cxWXB4bjRpZ21DZWNvT2dyMnk2WGR6N2tHcXcvYllV?=
 =?utf-8?B?KzVaaFdyb3d1d2U0KzJkT0dWY3h4cCtvcjJKZ04xanFqVDRRVmhpRk5waTU3?=
 =?utf-8?B?bUlkUVQrUlJ6OHpFZjBKWjFDQlM1dHd1NGFqSGpKd0lKY0JLanZpZUp3QWV6?=
 =?utf-8?B?Wk00V3BTSkoxVTNLSE9xK0VNVDJDWFVHd1pMbVpJM2tucE5kelBjOGdxbGpq?=
 =?utf-8?B?eHRXd1FTR0E2alNQTFhGRVZGQ1pZYU5EMUJzeXVDaHYwZ1Rzdk91OTdqZXpy?=
 =?utf-8?Q?SzImSkFN7MDGwPQyyzvlugiitP3vB3S0KAQOi4m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkpWNjhydW9GT2N4ZjhKODhFcFFtcDNWMUUxM0pLSTdjSjZTOUc5YzR3UzNn?=
 =?utf-8?B?THNBZGxwbWlRRUx3LzRUNFlzMTJjQ0NRQ0RaMjhrR1E5aUpHZUVVMmxMRDBT?=
 =?utf-8?B?eHZRNU5SaWJ4WWs1alFkVjJZa1BWbTJuaUpmVFZkOVZ4RXowY0VwMlRVa3FF?=
 =?utf-8?B?Z2lQWXkrYm1kVldhRmhqNlZSekE0eFBWRFVrNlk3UEViVDNhSk5DMEZxd3l0?=
 =?utf-8?B?Yk1DODRpYkVycWJVVUEvbm5kYVEwTnByZ3hEYlZCTnFheitHWVhLYlV1b0Rp?=
 =?utf-8?B?TGg2UkZBOVBGUTFNSURKYkM1N0ZleU1IOXduMGNFcU1ueVB2RTFMSXFuaVFU?=
 =?utf-8?B?U2VPSkJhUzNGM25YWC9NL2Vwd0RwZEUyMElIQllDUDd1U1Z5eHg4Nzl4YjlG?=
 =?utf-8?B?OFd2aWxHVkhPQnhVdXlpVnBvcGFaMUM0bWxhSmE4RWhrM2kvRjBHYXRleHZk?=
 =?utf-8?B?N2E1V1hTUUR5VXQ4MFhrbUt2azR0bnlRMk44MElGZkxEdmxvTnUvNU4waEhJ?=
 =?utf-8?B?RDNVSFlQL2luRjNWdmdLcytpQUNwMlBNekRlckVzRmsyeDdueVVKM3lUS1k0?=
 =?utf-8?B?WkFVVDd6SVVEWVd5U01HbFJGWHVSaitJUU1HT3hrZ0hTYTZSa21sZTVKejJ0?=
 =?utf-8?B?NnNWSWI2Vk1hWm41a2I4bjl1VkRZZDVFYkZoNS93VHBzUVRuTGlwR1VVcm9O?=
 =?utf-8?B?Y0haV3c2QmlwcGZGQkhOS3hyYWpTNVZBTVVvTEp5OW45YzY1aTJNdmNoNzNP?=
 =?utf-8?B?czRqYTgwZ3l6SmZXbjJBNDZOckNkSjZ5em1NcUxmVWwzZzdkZ1R6a3F4dzhz?=
 =?utf-8?B?QVZKS21oOElTcnB3RmJJclBidzBjZGdiNHZWNTdyQkRDMmwxRURSUDA0YU0y?=
 =?utf-8?B?ZlZPK1kvaXRkS1lWRW5HK1NrUWpDS2tCTzU4RndPb2VjTkcvZVhVMTVwKzh2?=
 =?utf-8?B?VGpCQ0VMT0RnbFVFbC9UNlU3eFM1LzBtdU8xWEM4Ry93Nzk3M3FBK1ZjU0RS?=
 =?utf-8?B?bDBud1V1OWNOVkJEVDYvdzhCblhaZWFnell4OHZPMjVsbm5YeHpyenJaalVC?=
 =?utf-8?B?S0wrc05WMVZWWGJUOUJzWDdDMFlEeTRjN1JwbmhXaHlGbTBhMlZpVUNyYmF3?=
 =?utf-8?B?a1hpVlM5bTBwSUhPRHJaVHZ0VXVkdU9vOXlHcHpKWHB3ekQ3Zzk4SXNPSzI1?=
 =?utf-8?B?WldMeWQ3R2Q0WXd0emFkZmN6NDQyNlFCbzhlVTQ0eUZudk5wK2dhazA5ZFZX?=
 =?utf-8?B?bmh3djE5alBIL2haeUxDZDdWZ0tLUjdmTE9RbWxTQ2M0V2JycEdWLzk0MHd1?=
 =?utf-8?B?TnJ4ZDNma3lST0pZSDJCa1hHekdMWmFZSzZZcmY0dWNXUlgzR2MwdkxhVFV6?=
 =?utf-8?B?empTMGVLSGhjNXVHbzdCSHBBcUc2dERaK3l3dE9aVnFtUHM0K3dhS2pWdGV6?=
 =?utf-8?B?NHQ2WUdWWVc3Q3dObUM3QnlTbXpqVlhobVJUV3kzNTJXajRLdkF6UldtWHFO?=
 =?utf-8?B?QjAvclB1M09zcGhtUkxHK3AvSkxOd3BaRmxqUUpVNlJnM3hjcmQzeVNNTHVy?=
 =?utf-8?B?c2FpQmQzK3Q1YjZXQTVtWHF5VjJjSzhMY2laUzlZbWtHYVowem5XenNiZnBj?=
 =?utf-8?B?NHV0b0pGeVJIRFlUU3VXZUk4d0NyVGNmQWx5OFJZeVRLekE0WTZQM2o5cGM3?=
 =?utf-8?B?d1FHeFppcGlMUGxvUS96S2IycFlFNHJQWDJ1aHhLM1QraDA3NlRhOVRTREJW?=
 =?utf-8?B?Uk9qVVAyV1RTS2tiWktXSzg3YjlqVWpTWlZObXplNzNXdHMzWG1Ma3FCN21v?=
 =?utf-8?B?c2JWNVBvZERyVFFNbjFEcCtvV1JRMUM3SnRrUWpmMFBkc0lnT1Zqdk5TbUd3?=
 =?utf-8?B?RjhEUk5OSDN5V3FlenBFa1ViWi9QODFqazBIKzJHKzZPZzkxSHU3TnJ1WmNi?=
 =?utf-8?B?U081QTVnQXZmRGJ4MWNiRUwzOUtvanF3Z29kenpRUzg3VTl5dGp6cGlHc1M3?=
 =?utf-8?B?NDhicmljSHliWTQwb09aTm80VTZXaXA4RGhqUXJMaHFMRHZhckxqNitKaTAx?=
 =?utf-8?B?NXN4NzU5VVhKSS9IMDJtbnNYdzBHaEpna2tSSk9LS2x5dkhRbEp2Mi9EQjhn?=
 =?utf-8?Q?9Mg6rnPpvFZnsdZQT1+xHc3Hl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 323e7688-f8fc-4479-febc-08dc7b7a506a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 22:47:24.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKq/xzMtXRRR/iXeOibK3SrYcknmMSVExmwpLWnLyClsQh1VOfSXjhPqhJRC7R4LNWiV2oigR+elATOOdpeJTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
X-OriginatorOrg: intel.com



On 22/05/2024 1:40 pm, Sean Christopherson wrote:
> Fold the guts of kvm_arch_sched_in() into kvm_arch_vcpu_load(), keying
> off the recently added kvm_vcpu.scheduled_out as appropriate.
> 
> Note, there is a very slight functional change, as PLE shrink updates will
> now happen after blasting WBINVD, but that is quite uninteresting as the
> two operations do not interact in any way.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Acked-by: Kai Huang <kai.huang@intel.com>

[...]

> @@ -1548,6 +1548,9 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   	struct vcpu_svm *svm = to_svm(vcpu);
>   	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
>   
> +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> +		shrink_ple_window(vcpu);
> +

[...]

> @@ -1517,6 +1517,9 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   {
>   	struct vcpu_vmx *vmx = to_vmx(vcpu);
>   
> +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> +		shrink_ple_window(vcpu);
> +

Nit:  Perhaps we need a kvm_x86_ops::shrink_ple_window()?  :-)

