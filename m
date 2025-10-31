Return-Path: <linux-mips+bounces-11979-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A07C22B1C
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 00:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B21081886340
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 23:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7F733A000;
	Thu, 30 Oct 2025 23:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTv8RfGc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5B0324B3F;
	Thu, 30 Oct 2025 23:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761866444; cv=fail; b=NJGpQQ5zUllrpuTHggv+sujmCprVMr87VQs/AhAK6jMLyjNGEupl++o8xmikJFoo373a7m8zbkJc333e03mB5oaWVTPh6rIibJ/1+vA1kO2toHXD1sRO6FYjnzP3FgB4YdrgoIbNuzzAe55XOgzsCKNnNIygyoMu4sfAIce55Jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761866444; c=relaxed/simple;
	bh=yZV8NDVxogONykQfB7hIR2PjmfCcqdXI/b+R5k5NBKc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AIox2a+Ywl4MZi7xBYFcMAtTfh7TPfa3mZy97WPW8L889SqUu2gJb/W9Ne30QRSOfES7SjHekVTBvxEsA3nXOJ2YK9t5YQlE0XRwM9ON7ccLqbDy+I+edZo0DwAvocI1lRbBIB0c9A/M2Z+icW//29S787G/FvbWFKYEMrAc4c0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTv8RfGc; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761866442; x=1793402442;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yZV8NDVxogONykQfB7hIR2PjmfCcqdXI/b+R5k5NBKc=;
  b=JTv8RfGc18O1bfQ5kGLUlyJVQVJ0miFRluI+uNsSu9ETj0pcjXQQwSnB
   2rKt12D5g1SLrFV+ZAa873pn3BoEULpIEG7QOpKfNKnpdq/5niVYaLHCR
   6D1wH2cf/qiWKLo8svaXH45qTQ3xs8UKXt6iQbGfhnEN2Y1wg0uH1W6HU
   fPNeaXmHd+LM94tdkhx/BcuneX+zbMdAnvOkKnjyVAfDvguNE4K3K5zod
   ahd9dXJuKJaBLwi73k89xgL5CcD88xy3FsggEQsAwhEHZEkuTTZcnWpQb
   Qm7tPzMTg0vt3aBg7BNPTtT6/4FtM05yjp3imPhfgLN024tljZ4ODFAUu
   A==;
X-CSE-ConnectionGUID: e3gMAXbgSTW3gVK4DrBomQ==
X-CSE-MsgGUID: XAnftN9rRKCoRCwe4jB6Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74315249"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="74315249"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:20:41 -0700
X-CSE-ConnectionGUID: EgfT2DydTbOg4HJCWwlX4A==
X-CSE-MsgGUID: vxzBuh+rSlmzzR8zoZJm1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="190433128"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:20:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:20:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 16:20:40 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:20:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1pd4Oby+qQaIoqHSyD2B1hxrk+XWG04VkwBKoIXkpbfLmBgo7roMfTKcU/yOldsQoJmyAKNY8UXOUXCef5R3gDlrVTPWGLjKXGRoMP8u7/E70QGWwxLebuZR5DswvhHNR7sy/zWMYTkwUBOEhS5/HhTWmv17GxdmkReGAexC0bAMj/qIDFLMeiqUcH5oWVpV0MiPPsnwNpzOz5oJdW79CU25o0FGZmRYkBTjXM+UkcgyyxDx/1TXS1NcdSM+mZ3Jkp6bzx3iZW1xMD7eLXA4RdHlnq68kl9DRjRMKkyT8fxTtZowe+FaqcuDf6TLA7U/5ILjy2ZhsVakywxDVjggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZV8NDVxogONykQfB7hIR2PjmfCcqdXI/b+R5k5NBKc=;
 b=OmhXxWB5Ova2xIDuh+IHXi75HjV0df4ogeolCOr1gJXwexm2/Va27qiVQJ5HvORz8Kr5bWVY0Pl0ae7P2utxWWLUv8qskAl3bGkiFfBD/gXfqYolrxyh7W148fntbhV/CNEn6z0dTbKjOkwgtXcusXOalMOnbamD+1o3FcGcREBWIlNUOCNahQ7boP0Qy/ydpNBdw5YYvaAZ2bBV7+nPOQV4kRsR1j+ppjMs4WHxz7QhgnsNKvN38RMveST5lQREJwb1PGI1Cq5tPx0HRxRrjCvmX+E4t0Pa+hHRYKpc5RWVnPbkVbIRaK9XnKPylzgpLGdkG1q7Zfs0+Nl8mqNluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 23:20:37 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 23:20:37 +0000
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
Subject: Re: [PATCH v4 18/28] KVM: TDX: Combine KVM_BUG_ON + pr_tdx_error()
 into TDX_BUG_ON()
Thread-Topic: [PATCH v4 18/28] KVM: TDX: Combine KVM_BUG_ON + pr_tdx_error()
 into TDX_BUG_ON()
Thread-Index: AQHcSdlMv5zFaVFmmU+0pwxTuTDAP7TbU+GA
Date: Thu, 30 Oct 2025 23:20:36 +0000
Message-ID: <2bb2f7a9885bd24c4773afe15839958d30000e39.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-19-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-19-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CH3PR11MB7842:EE_
x-ms-office365-filtering-correlation-id: e7813531-cc54-4f00-49db-08de180aeef5
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?dzFQODVrTjloQndHVUtDMEcxSFM1N1JhaGdTR1VkS3M2NExlbThEZUcrS3J5?=
 =?utf-8?B?R1dObTRpK2hROHJJTllLbW5BZVozOUxqSTE4d3BsSUZSekMrdXhHcWZIK2h4?=
 =?utf-8?B?Znp5VFN0SG5vaDZVOUFlTWtIUTJKUzE0TGk3cldtYVFWSUllK1V6KzRnVmIr?=
 =?utf-8?B?NnlkTjJ3SUdNcUNma0NxdW45dk5iWUpmUWgrek1qdDI1NngrYVlrbm04YSti?=
 =?utf-8?B?UlB5QUg3RXFWaFBxZlQzZnpFYkZhdGJrYjRkNkRVSDMrR2dNU2phRk8vS1lv?=
 =?utf-8?B?RVE4RWx3czhjWWkvMU5qdEZ4RFJGQk5pSk9JTnpFMjVMTkJoSk5ISmp1ZkNZ?=
 =?utf-8?B?dmZDRWhsUEFML0RVYmQ2eEMzN3NzaSt4Rmp0cEhRTk1MTmFVbmpBZ1VzS2Nv?=
 =?utf-8?B?N3pSVjhnWkFVV0RxaWxqRWFvQ1Z3SFB6WGl4NFcvNEoxL0RvNmJzTWc0Z1Bw?=
 =?utf-8?B?SFhRZjROeGppUmdjTWw1OTBPcDlncGFLYVRNdHJyMFQvZFVObno4cDJndjMy?=
 =?utf-8?B?emJTUk5nTXFNV0NER3ArMHZDUnI5Yjc1RElCMnJrZHV6QVdRenczNFphR3RU?=
 =?utf-8?B?SmdvSitUbEZuSkxHMjNuTzhLYy9BU0xmWlBLUm1WRGQwTjRPcUhRT1pGTGhs?=
 =?utf-8?B?dDFRblRucmFJTktpU1BtMGxIOEhpbFBpa3FOTC9ZTnVaTnNHbkxOMDRrTGRS?=
 =?utf-8?B?N2E2RXQvQU80TnJySzVIaWM0OXZQWTBWaFdqQnpOcmlHcGJ0OVRFWnR5OXNQ?=
 =?utf-8?B?dGFlTU5YN1kzWGxaQm54NGtrcjFoK285SitWdGFQWWJRa3BRMUVUVTRnQm5q?=
 =?utf-8?B?blRJZVdhcUZSaldpK2wxMWFiUEVHN2xmNXdyeDlOcGRGcUV0K3FtR25hNEo4?=
 =?utf-8?B?c3ZYNmhjZWMyc3NSOExWQnpTRHZvakZDZ0Q0NHdNM2dWUWxYamhBS1JjVVpT?=
 =?utf-8?B?STJZbTZxbzJKVnBaeEI4Y0Y2TkJ2emFYMkJOWDM4TXZuWGpUNVFVQ0Nya0w3?=
 =?utf-8?B?YXhBeFo5aVRlbHkzZlk3dWN4eDFQeUxibGtuVURkV3dRMm43WUVZUVYrUWhM?=
 =?utf-8?B?WVBqTW9tTDFlTnV6VXRCN0JRVDV4VXIrVXBGbzc5Rk5HbWhwUVBnOUJHeWxp?=
 =?utf-8?B?V1pSai9lRWs4SzQvc2RIa29sUkVnWVNXVlQwN1gycjRiMmY5a2ZlOGxTekhh?=
 =?utf-8?B?TU9KTnFFZyt2N1FYNUVRdG0wVVg2MG9RYjlNY080QW1lLy9nYWkya2FBVyto?=
 =?utf-8?B?SnBzMWhnSlBKVTc0MkZDUURiN1J0ODlLdUtzajBLUEFhdTJ1VCtLMWllYTNt?=
 =?utf-8?B?Y09JbU12MkhwdW9wdWI3UXFNSTB1TUdWbnBvdFhPNHQyemZZcmNMQ0d0VkVt?=
 =?utf-8?B?RzVsYnMxM3ppN05ya1BkWlFrTE5ybzYwckdWTklmcVJ2ckdwS1F0YTg4WVFN?=
 =?utf-8?B?YnZuRy9hV0RrU0xZcEF5bUlNTXRVRk9BUmxVUnAzWTdwV0dNaTJ1N3BNajBu?=
 =?utf-8?B?OWRxeU5jajlMMDJ4WDhYT0c1NTZKVmo2Ykp1ODBMRTU1ei94UzY4OS9Daytp?=
 =?utf-8?B?QTJMdE9OKzUxTGNsVVIydjQ3Z2c3WDVlUWtFaERGZkZxbHlFR0VyL1hHQjNu?=
 =?utf-8?B?R24wVUUzSDVlQmREUU0vbXE4MVpkWjlNVW12Y25lUUo1OVJLckFFWnhBL0xC?=
 =?utf-8?B?SVl2QzRpdm9jLzBuN2dIQWdtN0NLT3VoU0RvZk41aHRYanIrL2dNbU4zNmRO?=
 =?utf-8?B?cDZBTkNyMDZsUjVsUmhGbUxKUThoaWVCbmtnalBxT0E2d0JYZzB2OE11VUQv?=
 =?utf-8?B?NFc4R3VWU3drbkhHNVVLUWZXMUlUSVFxb2NZVEJzcnJPVmRJeFErN3dja3hZ?=
 =?utf-8?B?c1VEcjhXdjBXVGl3Skltc2FGUC9KazNicS9pWlhpbHJDOW1jM1dFYWt4WUth?=
 =?utf-8?B?MXM3aGxtZno5WnptWEtBcUI5YytueWl4OFYyRXhTdUE2aUpiWUhwb1FmblpU?=
 =?utf-8?B?cTNxQkxZNStqRVRHTUdkK3o4QlFkY0xmK0Zodzh4NEhPRkthTFUrbWI5Z2FB?=
 =?utf-8?B?ekZzNHNQWmhpWVNVTUJpK1ZLRzU5RDVmZm9Odz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDQ4STJJM21PMzdSLzI3U0dYZU9kb3lhOWtVTndmQUFaMVVPTE9oWlVXM1J4?=
 =?utf-8?B?Qks1Vk4zcCtKbWwwQWdtWGRRby9VcHg4YjRBZ3RBaDdVYzZoQmtxTkp3Rk5W?=
 =?utf-8?B?VnNXSXRBbytJRzQ4Z1VpTkJBR0xpNmZENnQ3aWIzcW1jOWgwb2ZQTWxBQld5?=
 =?utf-8?B?ajg4Y0RxVTRvcGdaTERsblI4K0dvV1NmeENLRmFzc0k2NXRKRm5yMXUxUTBL?=
 =?utf-8?B?YXdyY2ZEc1RrVE1mdkh6cFgvWlIxN3gwOGdLWDFoQnBlK0hrLzJXN3pTNkNq?=
 =?utf-8?B?MGdRNDJ3WmMyaElndXFBdTg0UEhqMkxzQ3VURGpuUWxvZkRqcDJ1V3gxcXFJ?=
 =?utf-8?B?R2xaVEFiYk1sZUNqTVNmWnZZTkhQbC9WQlNDSGhJbWxZK1dmcnBTZ21zZ3Iy?=
 =?utf-8?B?RmdMenhxTDNpSDZlczVJVDlmN1lxYWNzNExzWkc1YjlUaVBTVDdmRndBbzlS?=
 =?utf-8?B?Zm1aaDlQRlRkbnkwZm9tMk05WVlYVFlDR1kzTGdESVBCRjhrTG1IVTFFVkJW?=
 =?utf-8?B?ZnIxbnEva1ltdjRhZXZPZFZGdW9OdXEvclV2Q3p1aGh5SGxSQ3hCbndXS0Ni?=
 =?utf-8?B?L3hyU1lvSHBCYmFuMFVya2taa09pMEFsRjdUcFA0c1V0SFk3c01DOXdHSXJE?=
 =?utf-8?B?S3NQWDV0aGlFYXZVN1pxR01lUndGNlVzaUtNVXdyallnb3RSa3IzaTAxcVNi?=
 =?utf-8?B?K3JBbUNpRCs4WkwrOTZyTzRaUzdCMHVwYS8xREdtRlRuNGVjVWNmbnNxOFNr?=
 =?utf-8?B?eEM1TFJwWmJKUUdIci91OVpDZHpLNjJ3ZE4vL3pxVG1NaGIzZ3A0SytRQmxr?=
 =?utf-8?B?MElpV2Zkb3JvSmJSMGRhcGVXKy9zOWVEbUR5SkIxTWFhZ2R4d0toV3o0VHo5?=
 =?utf-8?B?ZVhHUjAwWXZoYWh1SnA5R2FiVTdZWEtUcXhkU2s0MzRURkJPVTdVbjB2K3dt?=
 =?utf-8?B?aEQwWElMT1Z5T0MwOFQ4QnNCN3hSb283NlhtdGxEbXhRbnNxaEVQeEFVQ20v?=
 =?utf-8?B?emIrK1Nhck9TcGcwMHE1Y0x4Y3RyTTFrREZnRVJYTjhnV1NlaDFhUkNOOGdq?=
 =?utf-8?B?cnN6c3FSK1VpcGJHQXplZkxZTnZxNWlRaWlIdG1JTEp2WXpPdnQxcndla0Q2?=
 =?utf-8?B?TjlXL0Y3NXJQTGZLQVFzMUQ0TFI0M3ljN1BYVU95N1VTalNjT2FzeGdlWVZB?=
 =?utf-8?B?blRwQzdOYWxSQ2VMaUZ0byt5MkZSd0JwOTRteUF1OG9jVklCNUU0L0pMV21E?=
 =?utf-8?B?NGNPWHE3ZmUvd3g3VUl3T3hDMTkrVHNqQ3NGa1docW9HaVVEN1FvSWVOVTUv?=
 =?utf-8?B?QXVNUEpXWVRKN0UrbkxRcU9zUllPakJubnpsN29uYVN3OEZ3ajVFNDlzb0VR?=
 =?utf-8?B?cVBMOEswQU1xSlFHL1FtUnA0eVhObU1lcnpjRDJOTXdLQnRydnFDaXdJL1hO?=
 =?utf-8?B?ZVVQRXNJUUY5b0IrT3haTEdVTTBYWUtTWnVYcWFpUG5oVEZnRk9MdjFwdyt5?=
 =?utf-8?B?KzBUWkxTalBlTkJUZWRYUDlaSklaWld3Wk0yeEYzSWFCZTBMN29zTWFVekJ2?=
 =?utf-8?B?U0FlOXVCcEFuOFZBR1FsemVYUmRYKzkxV0plbngzeENRTllWQXNaamlIN1Fn?=
 =?utf-8?B?b3AwN1pvVFpxNDI2Zmx0WFZuZVlsSTJXQmE4SXdibEVBY0FMNExpYlhKakl0?=
 =?utf-8?B?UHU2MmdDc01DWDR4T2wzTDhiSXBCTnRWZ0VqZzRrSm5FRVBlNk54TThtQTc0?=
 =?utf-8?B?SHFVYU03RVg5MHI4elM2ZHQ4a0t1MCtlTXhJVkNDMEdjV09iT1pWN0VkbHli?=
 =?utf-8?B?c1NDNlFOMmZodXU3YTZPNmFFWHJGbDZLVDNKbGdRLzhiSFR2TGM0N3dZQXNt?=
 =?utf-8?B?SGdwVDJYU0c1UGNJSGJWZjU2aUpDWHArM25zWDNjZVZQcmlZOUpaRklQN1Y4?=
 =?utf-8?B?Snc1RHBvdlN4eWxyZkVBMkhZRmZRbTRmNVpHY0IzcmI4dWZIaUlQaE5RdUFk?=
 =?utf-8?B?bjU4WWt4R3l6SmJ2VmtDS3ZpaUF1WXEwcG43eXczUG9yeEVWMG5weHpaZlN4?=
 =?utf-8?B?SFhKRXBEbkVSRzE4QkNrS29zRzdoNEl6SmJHeFZiaWs5dm1tdnZNT014VDdR?=
 =?utf-8?Q?6SAn0nf+JK9xYHVX/ovQyeiA9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A790954122EB784C8CCAB4EE346A9E40@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7813531-cc54-4f00-49db-08de180aeef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 23:20:37.0353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o0A38UVFXcrawKmwoM+jWCv/cYiUVxDjxPjsvAbPq9bvO17wZkc2xuMxyxLKLYKLOF8ioeLoQAIfyndhEA401A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDEzOjA5IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBBZGQgVERYX0JVR19PTigpIG1hY3JvcyAod2l0aCB2YXJ5aW5nIG51bWJlcnMgb2Yg
YXJndW1lbnRzKSB0byBkZWR1cGxpY2F0ZQ0KPiB0aGUgbXlyaWFkIGZsb3dzIHRoYXQgZG8gS1ZN
X0JVR19PTigpL1dBUk5fT05fT05DRSgpIGZvbGxvd2VkIGJ5IGEgY2FsbCB0bw0KPiBwcl90ZHhf
ZXJyb3IoKS4gIEluIGFkZGl0aW9uIHRvIHJlZHVjaW5nIGJvaWxlcnBsYXRlIGNvcHkrcGFzdGUg
Y29kZSwgdGhpcw0KPiBhbHNvIGhlbHBzIGVuc3VyZSB0aGF0IEtWTSBwcm92aWRlcyBjb25zaXN0
ZW50IGhhbmRsaW5nIG9mIFNFQU1DQUxMIGVycm9ycy4NCj4gDQo+IE9wcG9ydHVuaXN0aWNhbGx5
IGNvbnZlcnQgYSBoYW5kZnVsIG9mIGJhcmUgV0FSTl9PTl9PTkNFKCkgcGF0aHMgdG8gdGhlDQo+
IGVxdWl2YWxlbnQgb2YgS1ZNX0JVR19PTigpLCBpLmUuIGhhdmUgdGhlbSB0ZXJtaW5hdGUgdGhl
IFZNLiAgSWYgYSBTRUFNQ0FMTA0KPiBlcnJvciBpcyBmYXRhbCBlbm91Z2ggdG8gV0FSTiBvbiwg
aXQncyBmYXRhbCBlbm91Z2ggdG8gdGVybWluYXRlIHRoZSBURC4NCj4gDQo+IFJldmlld2VkLWJ5
OiBSaWNrIEVkZ2Vjb21iZSA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPg0KDQpSZXZpZXdl
ZC1ieTogS2FpIEh1YW5nIDxrYWkuaHVhbmdAaW50ZWwuY29tPg0K

