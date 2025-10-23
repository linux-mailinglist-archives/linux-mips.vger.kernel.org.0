Return-Path: <linux-mips+bounces-11866-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD36DC007E6
	for <lists+linux-mips@lfdr.de>; Thu, 23 Oct 2025 12:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 225F04FDDDF
	for <lists+linux-mips@lfdr.de>; Thu, 23 Oct 2025 10:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364D730B51A;
	Thu, 23 Oct 2025 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pzy+1Mlu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D993090FF;
	Thu, 23 Oct 2025 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215331; cv=fail; b=pUVn0nQgU7abiavWaOSd2d5b1SYpe38lFrtL0slp/kDbwg11sYZkhiyXCjK+wGBBxs20w5hc12JiOe+bKbrSX/JTybxiu/hw1o4f23efG2v2N37zOlm1rmvgxhf3BEiT/MqCkZwARNZ9/z4/XshKDdutuJrbPZtc9J2ZvO7N86o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215331; c=relaxed/simple;
	bh=IBt1mSS/g9WPQFOCAy8yGpGLNfyrY9fm8HaNXBhO+Uw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OaMEsu2QbGOcQM7DrId2s5MIHtZQQaxkGSS5rVhehQLsWZ5+ySxJFHL0qhOxyweo7HpLgDgRVXHsCQNPk3dtyWvg0pN6astbd6KSpXsTnQ+AdOa88B/0pj7PZ5iqcojPlTgon2bpDivc0FrP8XEWSObfHPZV9+k0MJpmXLHATWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pzy+1Mlu; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761215329; x=1792751329;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IBt1mSS/g9WPQFOCAy8yGpGLNfyrY9fm8HaNXBhO+Uw=;
  b=Pzy+1MluAJtFKbR6BlVOpLeH4crwPtFI60ohdKdS00Z5gv4GVZTvGZLr
   NJuo/+Uf7des68Zj9kPune0Kx5ZaPUas1TbSCOOhTeiflO3xngRnCCRZJ
   hrMgIFjloA7PUC9hCmqGZ16Rfp0eyHA7nQpOaQlxzSaRIFYZV1Wi8GLUR
   1Y4PGDr9+ad6kDbesLvV0S/u71afZ2KvUlco+y2Lu3OhQZCnm3cf/nZns
   EbOU1eXYS4kBrbJKQYdlsbUYwr+eUaOF6kk8rXzNhMvUDJQr5GJxDq3ni
   Rz+BCTZV+en7WDMFOJN8Uua/UC9Z36L0XDntYLRwkuhP3HOabVjCDfNPo
   g==;
X-CSE-ConnectionGUID: zS2cRrG6SHGEiC3ZLeOdDg==
X-CSE-MsgGUID: jpAF5B06TXaR3fchR2pipA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63529416"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63529416"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:28:46 -0700
X-CSE-ConnectionGUID: yJAGuOz8Q2+C4any6mi9Ag==
X-CSE-MsgGUID: hLQJk+FsTwWsbtADeWUvJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="207776790"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:28:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 03:28:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 03:28:46 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 03:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwQNGtTt03PjitHu0iAAUkUWzjuKM3CrbHnM6kEIreFKMHbb5Ow9cnjC+TBJDrgpRw3yzTll+uXYeeMdXGYfVjSq4cW/WO1wdBrh/3qsbfyKCfRvY90ctgmtgfoyeHS7q5xTynqiqd2s1LRG3OioCrGiGocRDya/j0fbsum0qvEWMb8TyqU6tH3srfwrtzOjkOiCIKUMgRgoiiXbPch2edCNJ5l/HkfpIXbU+HsRB+Y8cAiMze9YmK5wuXD6o5RnjSv8gE58qFkmNINMw2ym+YIjtKUckCR50Qii7T8UPZXhrw26pSiSHD+pd3KAemrR6Ixqr5Zd7xkBgMhckpjGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBt1mSS/g9WPQFOCAy8yGpGLNfyrY9fm8HaNXBhO+Uw=;
 b=JOJZgy5huNQjgkPn1UiDgV1aUtDi12/aqkHS8waA0KDdZQGHwfBjvDs7wbZAt9vAjUzjKRCSxXIrlORLx0fBm3BXODzd5ucWhngjjkNRlrJRIcVUkmU83WLhQQQy5zkjnlUa0L9Ew6vKeclr3OWOtJIeZT/ioHm1e3J9JYFwUprCtVXwlE/+245LbausQ8izSZosnuhNcmYnQWMFexiqFJdtmNsGWWDk/85TpgIfJYCu/kQrhXavh+om1elekKCEbv3HDElBhxyFAuJ+41d5WV8BEtFWzVj7HyhdVYX+dGcSSLEdHJs6Z7nzACm4awKWfrQLN4ZKqA5ts02uoy2Wng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 10:28:43 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 10:28:43 +0000
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
	"michael.roth@amd.com" <michael.roth@amd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
Thread-Topic: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
Thread-Index: AQHcPv2eXIiTBJOx2UC6xtfyjFl4Z7TPkZ0A
Date: Thu, 23 Oct 2025 10:28:43 +0000
Message-ID: <aeefdd64b991973b8faff3714d509f80f5a81de7.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-5-seanjc@google.com>
In-Reply-To: <20251017003244.186495-5-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SJ0PR11MB5150:EE_
x-ms-office365-filtering-correlation-id: 268e2346-6c08-4362-a570-08de121ef0c9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T2lrdEo5UmdhR294bWkwOXN3c0pmNFI3Wmh3Z0o0Z0tYU2NZV1JvMEUwZnIx?=
 =?utf-8?B?Um1FajV6YkxNYzNwakRKTStNQUtJb0N4TUZMZURMTjY3cWM1V3lVU0k5WDJj?=
 =?utf-8?B?dnVNU1QrMlozK282cE1uT2tyUmhCS1BRMGZGRGVobTJjMVNYaVZsRW8yTjhX?=
 =?utf-8?B?bzBoT0ttZ1JNVVo1Z2FUUi9DUHhJaTJjWVlzcE9iVGR1NTF3ZFY0ek51WVhv?=
 =?utf-8?B?QkJsMHR1aTFZSHdtR2xpMGIwMnRMSU5XNnZKRFhZQVplR0ZMTHU3ZlBxMS82?=
 =?utf-8?B?S0VnZEFOZUFaaUkxUjl0UUVmRjNNRUhLZWJFZTc1YUhSUkFoeTBuWDIraE42?=
 =?utf-8?B?eFdnNktxU3dUWFh0cVpYZDVqQmFpR0tQeW5NZDVaRGpvWW1yQWZjbFhSdUc4?=
 =?utf-8?B?eFBEOGRlNTc4cGpBZlhyR1FScFRhVHRicEI5WkYzZk9Oc0ZWM3BEM1ZRSXZB?=
 =?utf-8?B?NDQzSWNHQUpvMlh3SVZPUnFKSUpmTGVtZUlwSi8vSWxLSEtZdG9tRGcva3Qw?=
 =?utf-8?B?NUgyamhLdkdUSVUxcnliZzRCSjA1ZlFnTTRKL3lUcG1kZ0pBYm56NnFBK2kz?=
 =?utf-8?B?VnUzMUMrSUhTT1dxa0toMjBhWWxNTEhtTDBibUxsd0ZpbWhoejhYM2dQTTBH?=
 =?utf-8?B?SG5yM3ptUkVDclErLzQ4NTB2RG5pK3pCeHBRanlXMWNjVHhCK0ZDTFdtUkFE?=
 =?utf-8?B?TW83d3huN0tCNmZGUnVySDEzS3A1NDZYZ0VCOS9ic2Vjd28ydG5CLy9SQ1gr?=
 =?utf-8?B?UDIrcVZadkt0cTNCaTJGcnBFWCs4NWQ2K2ZxZHE2NFI2cm1RQ0JINlh5T2ln?=
 =?utf-8?B?bHQ5ZVBMKzRHc1dIclFaSHAwQjJKRVU3L2pLOUFxejg1VmxTOEp6dWg1Zjlv?=
 =?utf-8?B?dDdOUlhMM1k2K3ZxMVJQRGI5MWVUZUx1STFpNnd2NjY4VjFrY2tKdDlCL2JN?=
 =?utf-8?B?TnZwS1pCMmR6c3FZRjYxRXkyYWJaQWxnZHNwYmhETWI3eURGMzlGcDlNbUo0?=
 =?utf-8?B?bVA4SWlxQnczckhEM1JCZ3RURy9SMWJjZklwNmZmQTl1dTRDQ2VPeko5eFB0?=
 =?utf-8?B?MTlBSHFoWC9EdjdLMXlPa0FiVGVRZFVySGd1V2dVd0YzR0tpZFdBVHRTVG5w?=
 =?utf-8?B?bHdiWGYrWEo1YUtHY3ZyT1ZxQjA4LzJ4eTNTckJtUmlkc0tQTXpoYmduSHlL?=
 =?utf-8?B?UlZ3ZlV4MW9MM2JaeDRxK1VvUVowUjQ3U1Uvb3daZk9Nb0tYRWVxdW5nc3Ew?=
 =?utf-8?B?VEYrM2JhNm5FeDFsMG55NEhxc2tSOXhEZ0tDV3k5SWZOMGdJYzhTNlZ3STln?=
 =?utf-8?B?aXFqYWI0cWNYTXR0cWdHVDZKU3BDdnB4Wmk4dGlqV2FYMTY0V0xNbU41L1hN?=
 =?utf-8?B?WlBJVlJFZEF5Skl5RUh4d1c1alY0VmJ1RjVWRDFJQkVjOWIrSEpVWDhueTlq?=
 =?utf-8?B?NFdUVzhxdC9UUWpRUlkxbGwzZzR5WTVjRmxLZXk1OFVLcWZNb3NUaTdxenVU?=
 =?utf-8?B?SzZkRTlFR2JwTzM0SVNGYzJubW5IOUhSN296ZkJ3NUpaeEZlRnJxZFJMMUd3?=
 =?utf-8?B?TjdwODdEUG9NazlIak5nQUF4eGxmRmlQSUxaT2dXYmR6RkJEeW42akFGVGlh?=
 =?utf-8?B?VlgrbmplK2t0UW5WQ3I3QisrR3VYYXkwZGMzUWZJR2FzZUNZOTBWUzQ3Uk02?=
 =?utf-8?B?emtLZlAwQ0NrNlU2UXJYUm1MRGl5MjlZSXBLTlJYTEtXNm5Qd1RvWnBoUnAx?=
 =?utf-8?B?UEtzZS80STMrQUUrUHdhNDd3MmhEcFRydGQ2L2Z3WE9mcEc4ZkxVbVBhNWFt?=
 =?utf-8?B?U3B0OUVXRWR1OHhmSkdLT0NQVXRreUpHUzFRTGVwRzJMTmF5T3dwU3VWV05G?=
 =?utf-8?B?OUV2K1AxdGxUZnczL1VWd1VNcUJLcGRUODhIbTVoQVFOd3MvRkxocm1hWDE4?=
 =?utf-8?B?M04wUFlKcHNDSEFhV2tYVjR4VGwyMFRtK2dpNTNKM3Y4MW1wZlBFSEs5QndV?=
 =?utf-8?B?dkZ1elZzcXBnYWRsc1Q5RG9nQlRtWkJyaHI3NVYydWtzK1BFUFpSL0ZsQWpa?=
 =?utf-8?B?cUhmYyt5eFBtL0FhTnFYR0xTSkE1R2xyN0Nydz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2Y0TytVM012b21yNHVXVHJhc3k4a0tOa3ovOWN3ZWxRNGtQNUVpczA4YWpy?=
 =?utf-8?B?emxIc0ZRcFhUYmk4aFhRUnVSczhnN2ZwMmcyWEdmNjNqQk5vZDRka0g5TGh0?=
 =?utf-8?B?ejlrOXNKc2dTN3lYcU9LcitkcENOdzZudWJvb3ZXOEhJcS84bG05QWZJaE0x?=
 =?utf-8?B?UjBUZ1pWTHY4NXdCdjEvb2VLemJlTzdqVllvSFZhMjc2QmZRVDZydEVBbCth?=
 =?utf-8?B?SmNXRHMwNEllTlZUNmtTVHFIU25CZUl6dXdHdUVvREczWndVb25qUEcwbGI0?=
 =?utf-8?B?Zi96QUxtcWNUSDlXTXhESjByaEpON2w2T05XYkwvNTgyd0hPSis0SkdBMFUz?=
 =?utf-8?B?Tk1EYWFPQ0RjRWpEelZYa01UYlBjSkdvbjN1SkNiQkxMelJQMFFiUGsxTm95?=
 =?utf-8?B?b2NLdGxTSUpkaGVUL21Nc0pPSE0zNmJjSFVRZ1RCdHlKbXVCMWxPZkQ0NW1S?=
 =?utf-8?B?ejRHUGFlQXliSHR5bzhXZ0N0NitXNytpeFUxL210RWlqREtOMkJVY1dLK3g3?=
 =?utf-8?B?bG94a1ora0Uyb0tuYlNuVlcxSmFCTXdWc2hZUnp6UkgxL3Z6RnczNUxWbHll?=
 =?utf-8?B?MDJyUkVFWWlVa253ZHVUclR4YjVNL24weXlEZWpseFE4UkFkbUZhWVIxMXlw?=
 =?utf-8?B?ekVNK2JabkZuM2wvQUt6SkhMT29pM1BPZVN4MnplcXdkRzZ5SHpYR2xvOFZt?=
 =?utf-8?B?Y3RDVUxwaEN5dEVRRzNsbHE1OVM2VVMxZlpjREVmdGhpUjBaQjB2bEE0Z21X?=
 =?utf-8?B?MU9CbHlKZHdLdXpKZFA4OGc2VzNmN0QrbnpwV0VUd0p4UXRNb3hmZEZJV2dL?=
 =?utf-8?B?TWhMSEdzUFIvOFlhOWpYNVFTTWthaGFmdU4weDN1TUlaNHFDclhKQTRURjhC?=
 =?utf-8?B?MUVyamV6eDRyYVhmSEhJUkcwY0N4aTl6UWwyMmlCKzZ6VmZJc3JMYkMxbTJk?=
 =?utf-8?B?UTNOZ3lFaVlHZXRxbksyWk5TVW0wb2tBd3FVM3ZlRGFJY0MwbWNHci9PMGxY?=
 =?utf-8?B?UzY0Y0NMVGI3c0FKdnJnMGNzWkd0ZjhwWUhBSnc3QkFCRTVrMzRDWnNlQmo2?=
 =?utf-8?B?Qno5blVUQ0pHUlRxM21ndUdaQ3dmcGNTOGcwd0JYR0FGOFZud2tZUnF4TW1H?=
 =?utf-8?B?YU5heTVZQ0JrUmJ1LzVJQXVWQndjaTByRzRialdMYjI5MFBVeHVVUUVFTHFV?=
 =?utf-8?B?Umpjd3liaEdQRFJNQ3F0V0tUUXhXejVZc3c5Mzc1WUM4cFlESUJ2K0p1Z0th?=
 =?utf-8?B?QU42WE5ES0U3Zi9ZbUw4Y2lMdm1UY2V5Z1VqS24wUzVWYnQrTDhSUmh4VlFS?=
 =?utf-8?B?MnR2NHRtbUw4RTk0MTlOL0JZdFlQcGJrQ1FpV2wyWTQ3RW1QRlNIcU9Zbnp1?=
 =?utf-8?B?LzNzOVgyemlkZXphLzZ5QnJtcSsrL3owU3czbThhemhrWktPb3ZMb1U4K2RN?=
 =?utf-8?B?SzRNVHk3bHBRdVN4L1YvYUpMdmxBNEN1WW4zY1JDSjVmbU1qTFFLTVBPWUMv?=
 =?utf-8?B?ekFuM0NpQXlCZlRDbXdXYThNKy9FMWNORUJBTlo0bmhPS00wM1BZazVnV00x?=
 =?utf-8?B?TmEyMnhCc2FlZlJudUZYV2ZkRWFmRTZIS2tLd3lRTUdDQ2xvRzBXRk96V0RB?=
 =?utf-8?B?bHF3V1d0SGNCQWliUGs1QTc3WVloZlh5b1puM29MbDJXZHpTVjlpWGF0bG13?=
 =?utf-8?B?TGp3eU91eTN2b0huWEViZkhSLzZDdGlDRWtXY3pob1J3ZXdXa2Z1VnoxNUVZ?=
 =?utf-8?B?d0FlZG9LY2FKTUtLZnppQlJsd3IzUm55amg1Q3c1cjdBZmpHbW5remM1UENn?=
 =?utf-8?B?RTVaV0ptWXlONHhESGkzenNwUEVyTXFtSjJpQ1psLytqNUZzU0EzTkNvdWEr?=
 =?utf-8?B?WWxRWVpoTU1rYXd2T2xRMTd3dmtBeFVOZTZyM1RHa1RtbWh2eitkYlgyTmpq?=
 =?utf-8?B?b3YxM09GblJyZGpRWUQ3aGRVOUZHYkd0Y2xxMU5qWUFWdXo4MGh5UmphTmNx?=
 =?utf-8?B?aGRnYTYwd3lPazBKNUVjL3VsdUtCS2ZsRitxb3lkWWZERUEwejFsa1JsQm4v?=
 =?utf-8?B?VHpxU2JNQTlVOWtFWnA1SEd0QThUQnRlbnNjUUJMdkpObngrRzVqMTZXQ3Nn?=
 =?utf-8?Q?qN99mVMH2ZVYmEUmI/o8Ij59R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E87B5728AA4F2489E75ECC8E8B889AD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268e2346-6c08-4362-a570-08de121ef0c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 10:28:43.0935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2V/pkWNY598mJQgqyPKNnVCg4Bjgu363bNeeMHuUjhNBghk5AeV0WKAzCvoxftEpFaRoTBuuLlbwfr1teyCvqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBBZGQgYW5kIHVzZSBhIG5ldyBBUEkgZm9yIG1hcHBpbmcgYSBwcml2YXRlIHBmbiBm
cm9tIGd1ZXN0X21lbWZkIGludG8gdGhlDQo+IFREUCBNTVUgZnJvbSBURFgncyBwb3N0LXBvcHVs
YXRlIGhvb2sgaW5zdGVhZCBvZiBwYXJ0aWFsbHkgb3Blbi1jb2RpbmcgdGhlDQo+IGZ1bmN0aW9u
YWxpdHkgaW50byB0aGUgVERYIGNvZGUuICBTaGFyaW5nIGNvZGUgd2l0aCB0aGUgcHJlLWZhdWx0
IHBhdGgNCj4gc291bmRlZCBnb29kIG9uIHBhcGVyLCBidXQgaXQncyBmYXRhbGx5IGZsYXdlZCBh
cyBzaW11bGF0aW5nIGEgZmF1bHQgbG9zZXMNCj4gdGhlIHBmbiwgYW5kIGNhbGxpbmcgYmFjayBp
bnRvIGdtZW0gdG8gcmUtcmV0cmlldmUgdGhlIHBmbiBjcmVhdGVzIGxvY2tpbmcNCj4gcHJvYmxl
bXMsIGUuZy4ga3ZtX2dtZW1fcG9wdWxhdGUoKSBhbHJlYWR5IGhvbGRzIHRoZSBnbWVtIGludmFs
aWRhdGlvbg0KPiBsb2NrLg0KPiANCj4gUHJvdmlkaW5nIGEgZGVkaWNhdGVkIEFQSSB3aWxsIGFs
c28gcmVtb3Zpbmcgc2V2ZXJhbCBNTVUgZXhwb3J0cyB0aGF0DQoJCQkJICAgICAgXg0KCQkJCSAg
ICAgIHJlbW92ZQ0KDQo+IGlkZWFsbHkgd291bGQgbm90IGJlIGV4cG9zZWQgb3V0c2lkZSBvZiB0
aGUgTU1VLCBsZXQgYWxvbmUgdG8gdmVuZG9yIGNvZGUuDQo+IE9uIHRoYXQgdG9waWMsIG9wcG9y
dHVuaXN0aWNhbGx5IGRyb3AgdGhlIGt2bV9tbXVfbG9hZCgpIGV4cG9ydC4gIExlYXZlDQo+IGt2
bV90ZHBfbW11X2dwYV9pc19tYXBwZWQoKSBhbG9uZSBmb3Igbm93OyB0aGUgZW50aXJlIGNvbW1p
dCB0aGF0IGFkZGVkDQo+IGt2bV90ZHBfbW11X2dwYV9pc19tYXBwZWQoKSB3aWxsIGJlIHJlbW92
ZWQgaW4gdGhlIG5lYXIgZnV0dXJlLg0KPiANCj4gQ2M6IE1pY2hhZWwgUm90aCA8bWljaGFlbC5y
b3RoQGFtZC5jb20+DQo+IENjOiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+DQo+IENj
OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+DQo+IENjOiBWaXNoYWwgQW5uYXB1cnZl
IDx2YW5uYXB1cnZlQGdvb2dsZS5jb20+DQo+IENjOiBSaWNrIEVkZ2Vjb21iZSA8cmljay5wLmVk
Z2Vjb21iZUBpbnRlbC5jb20+DQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI1MDcwOTIzMjEwMy56d211Zm9jZDNsN3Nxazd5QGFtZC5jb20NCj4gU2lnbmVkLW9mZi1ieTog
U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+DQoNClJldmlld2VkLWJ5OiBL
YWkgSHVhbmcgPGthaS5odWFuZ0BpbnRlbC5jb20+DQo=

