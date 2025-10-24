Return-Path: <linux-mips+bounces-11878-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED40C04B27
	for <lists+linux-mips@lfdr.de>; Fri, 24 Oct 2025 09:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 452C9501DA1
	for <lists+linux-mips@lfdr.de>; Fri, 24 Oct 2025 07:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E038B2C3265;
	Fri, 24 Oct 2025 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrXn5pLk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F6D2D23A4;
	Fri, 24 Oct 2025 07:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290477; cv=fail; b=gPryGW3QGAve6Uf00JQ+hIkIYeagz08tgOZjQK3FEy1VF4FGD5zao9F72r2wxP89hyMuSzKbFBEWUT18edtPLyCvxkEQt1jseYIyPK9JPOub/USU6OhzXBTvoIqtsjzw83qmMWrirGdFjP7DA4U62duuDCK8s1jBpbaLKIqPQcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290477; c=relaxed/simple;
	bh=TWTvcTtz/Y4shwInQhCt05XxdQ5d95pyJw5PJGm5CW4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kJXYIB89xrC1WquAyVRjTT70y7snX/VKXz6r7IdcGq7MqviCCNHiQ2XY3AZTBJfQRVeqDsWdrraBCAULR5Y2pp8f9nlbVat5le/Dz83Lo1E+rNuxqytKezNmp0biDyaJpdNu7Crhr+M0uT1q5ckA2aJsnlpOM2O8B2qu/TDL6Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrXn5pLk; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761290476; x=1792826476;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TWTvcTtz/Y4shwInQhCt05XxdQ5d95pyJw5PJGm5CW4=;
  b=DrXn5pLkHlPhpx3sJ792FDjEuFdOkDoG2yg9ItnUNB3igUK8dVuaF8aA
   hWFG6pEbka++RMSgZBdNTZtFz2kTYP2wXnM/xp9byw4/L2QPH2oKO8qDj
   9BQcpCl6IQY0N+fz3Q15PQJfygPkYxTwLE6dwD3YogmT3+DP0hwyT13ls
   7NH4ss504bUf6EyHTs/EGhUl7tc5pOJSw+/MzQ/sqCcUfuCiIA8+NhW2R
   GgKPPtA5cUqKst6qzugavN2f4dBsvLkDs+slNYiba5MXCbn7MOVzM2rcH
   02spxLfuCp4cPLQV/vagPKQi71WAXIYnXS6JRd7cJVT60O12KxKeIj9JY
   Q==;
X-CSE-ConnectionGUID: lY4dYK8IRa+NNbp/L461MA==
X-CSE-MsgGUID: WsSarQ5NQxKfMLDY2iIHug==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74589352"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="74589352"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:21:16 -0700
X-CSE-ConnectionGUID: VP/KcHN0TmGbBZT5X4Pa+g==
X-CSE-MsgGUID: 2PvxHhNTS0iq/dZzrexlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="221563593"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:21:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:21:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 00:21:14 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELU3uw/QAB1UZJikHUNLZSEi03nVc/bzxwJmwSY6eYzlucHRDsYjudKC8SlaN9BZileOj9T0Ah9VSW/2B1nUawAM/81CwWSSZms2OsJtVk+8/T99Oibf4PiyK7hriAohqnooWANAwxZR384BUYyYJGT3E94D/c3h1cCnVPhOhc3A4xhBB4StnIcu0fx4J3C6YEk7DjmBI+CxrqMTb44lKFPp0I3/WRslC4H0r3lCtVWPFEqx8CeLY4A8gpOfNkDOr3PR1HIf7620CGDp59sxEXkF3LWOoQKVNWW615G1gHHmYdxT3oeUYfZTOc02916nLebshFyaMj7IxbqbYlkD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWTvcTtz/Y4shwInQhCt05XxdQ5d95pyJw5PJGm5CW4=;
 b=HOPbXLvsdQQ+dvD7rNEnDISUklSznIspernebgRGfn7YoFNiwLF3fJdhrWE4up/97aR6zMRY9cOkyH0C4AeGLeeSZo9ccPHX28JoA475tmVCvG1qH22y01xrc67FHEZz0vFjNzeYcYah/8VeoeyPBUvwLqTrGNNWc/ioTEU74T4jGAD5dqPyJhJtYMF/VK4JOeTC0W09MytwKZQsOBpFGj8NT9Mk3tVFlFN3ETXGRuXWL2FedFigLsX7JneRJH8/27LiXCVfRzV+M/x54HbAQ0wOnrJZYiNebXlEi88ELN8LhbaEAk3gvBAF3aZQbWQdVtkzW/3bY3Cy4pf6DSmJMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH3PPFD6B8A798D.namprd11.prod.outlook.com (2603:10b6:518:1::d51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 07:21:05 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 07:21:05 +0000
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
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "Annapurve,
 Vishal" <vannapurve@google.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
Thread-Topic: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
Thread-Index: AQHcPv2n07zQi2kCh0qwUFWmoDYx07TQW8QAgACTwQA=
Date: Fri, 24 Oct 2025 07:21:05 +0000
Message-ID: <8ccad4542503eedfcd09eca990ab5bed77dab154.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
		 <20251017003244.186495-14-seanjc@google.com>
	 <233d0250d457abd153cbd63cc8227f67b9a3a933.camel@intel.com>
In-Reply-To: <233d0250d457abd153cbd63cc8227f67b9a3a933.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH3PPFD6B8A798D:EE_
x-ms-office365-filtering-correlation-id: b3f6003a-8a01-43c5-6ed5-08de12cde50e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?dVBUTFNBM1RPOUJZYlRSRElwbHhDMkJqc3FlODdDbFZRYkZrSEpkK1NYZFpr?=
 =?utf-8?B?blI2NFQ2RVF1Szh3RXlnUysza0lTYTRPazRqSVVxUHZzc3NaSkMyUDBYcmkv?=
 =?utf-8?B?dkJJRk5iTCtzeGZmU1ZPQmVmOExLZnErY1NhR2dvNENrbjl6WUlMSnh1SGhT?=
 =?utf-8?B?WVJWTVlHVG1yTEFtZlR1QWhVQklYVjl2empKT0htbHZTR2xMRFk5SHlOOGhk?=
 =?utf-8?B?bTA5Um83VGpEcnNzQThvQWtjSkJ2Y2x2MmlQaktMREVJZDlHWHFpYXFVNVBQ?=
 =?utf-8?B?Rk9ZSm1vMlRSUXJLL0IrRkkzc0xnR0VIT095SjFXRy9SMWhIdDd1bVhhVGsw?=
 =?utf-8?B?SU9MN2VwWElxVG5kaTVCOTJBRElObkpZRDltMDNTR0dvLzRnTlQ1S3NBZGl5?=
 =?utf-8?B?YnRaWnF5Y1Mvakczd0xyd21nSTY1S3pOK0RCOGc1clI5UkNOekZ3dkFnd3ZO?=
 =?utf-8?B?SStPK3ZrSVhvWW1ObnZVeDM5VXdFcGJmY0VMMkdlY1JEWUtFUzZMNWtvZGV0?=
 =?utf-8?B?a0s1cnlPcFFFN0JhWFlGVGxVU2VjRXlDYjNHZGtYSDBYdTlpRnFZMk5icEJY?=
 =?utf-8?B?Tkt2U3o1OFd5anFRMGYya1Vyd3NFb2l1TndIUFBJakNWNXJ4RUlhTSszVjFq?=
 =?utf-8?B?VGNzZWYzL0cwdEdKNHJRK05XRWw5UFEzcDE4eUdWYlQweGxEYW5sTExVQjl3?=
 =?utf-8?B?VzFDNWFjVkQ3UXM0ZHN0cnJqMnFsUEhPTlFwS0QwQ2FMQVlWKy9UTmJwOE5B?=
 =?utf-8?B?b01YV2N5dm9mVVJSK05vT3kzZy80UjN1RzhQbnVkcWJKdGlSU1lwSzhmdU92?=
 =?utf-8?B?bGErVDJrVmRPNzFOUW1uUFlnakFSd2hDa0l5aDNnN1E3c3pmL250alhiNHJp?=
 =?utf-8?B?cUJIR2czaTI0L2NaWmk4U0N0TDluUENuNFNWYklkSkNydE9qSitQRXBUVG9m?=
 =?utf-8?B?SnJ6bElSNXlVRUtCYTV5enZTdnFxaWNYT0ZQdExxYi9MUmpqUktWSDJUNXBI?=
 =?utf-8?B?b1Y2YmQ2UzE1dXFFZkozUGNOaHlISU1KSjNjQUxPRmNKeXA1eUF5QVJVS2lP?=
 =?utf-8?B?SVFvZWFHSmZ2SkQ4SCtvREUvU2Q1TkI5YU5VM05DWWQ4OGM3bU1ScXVWTHRG?=
 =?utf-8?B?SkhGR0g0OFhvcm9mQU8rdHduS2o0R05qY3BSUnBLY2tQbUYwVm9nZmgwTWpR?=
 =?utf-8?B?cjdYZTR5S1RZQUdXVW5ubmpaK1p4VkovYUIvVysvdHJING5ISzdxOW44YWtP?=
 =?utf-8?B?OTFDc1RYZG1rcDJzU29RNnN5eUpSbnoxV0VMVzZhZXd4bHhpc3hpaHlqUVh3?=
 =?utf-8?B?cXc3ek5SbmV5THZ3dFQ2TS84cmcyQkdZSDA0cEJLUmdrazhJQkJFb2pmcTdT?=
 =?utf-8?B?YUZ4UnJIYkpiK2tNZncvQVlGRnc3R0hpQ1hpMjdGTW1iaUhWRGZqKzFvRFlr?=
 =?utf-8?B?UWY4Z3JXcUVXRXVTck90N2JVOCtFQVlpWW5za3d6Z2NCSFZ3eVIraVFtMjhj?=
 =?utf-8?B?YU5uaTE2TXZobGozQjVTQ2tza1ErN1J6elB2ZXlsYm0wQklSdlNTeFZMWVNX?=
 =?utf-8?B?Vm0xN2hBVGhqSFN3KzVsUDRxOUhnaEN1bVFkNExxVjZTbnJLWkFlbEc2Q0lq?=
 =?utf-8?B?dWZhRFdZendRSkpGV01GdkhSTTBqdTBpT0RLOUVIMGoxTjY3TUJMM3BEY0JP?=
 =?utf-8?B?elc5Mjd6bHBKMzJQUW1ZRUFBQ3VOenJiU0xPTFVGOWkrY2FFNGhlcFFRbFRp?=
 =?utf-8?B?VUFKc1RzZkRlU0pUSGhUSFB4bndOd2RWTkR0WVhxR1BYMnB0OFRyT1JTU0J0?=
 =?utf-8?B?eFh6dFJsSlNPMFRyVW5MVEhBVWlpSlNyOWx0ZThRb2prR1lVZEZCejYvWXg1?=
 =?utf-8?B?WFFHdHBVc2xITkJCbFVTTWNrNStuamNCWHg5ZHV2b3hvUldqUm93VW92RVhx?=
 =?utf-8?B?Ny9QUkN5Zk1lWWdsR3NweVN6YStIZnJZbi9ucTl3RmhpRWNoVVF5ZmRObVYr?=
 =?utf-8?B?dk8rKyt2cVpGcmkzb1BQd0R6V1hYa2djMk8vejZ5Vkwxak1Tc09Ca3JDUnFz?=
 =?utf-8?B?cEVkYVVWc0x5Rm9vZjExaEo5cTVMOU8zYTdsUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXk0YTBHTndiYnNMS05yTWM1Ly80VGlEMys3QVpLS3JhbmVtK1hPaFdXZnda?=
 =?utf-8?B?bVB6bzFFVysrY0pFbnRuQVFBNTF6ZXVnVVhYMUlKZllaSDJZMENvaVh3QnV2?=
 =?utf-8?B?VjhEdXNyL2JXakJxNFNqQjRTZ08zQitHenNSYXlyR0hTUHRVY1FnUTFneFhF?=
 =?utf-8?B?L0xIWHUvVEs5dndkV0RUVk9vMmhJdGRqbGxlV2Q2U05KeDVXQld2RGphU2lU?=
 =?utf-8?B?aUVNbWZEUVcyZHp5ckRmNFZDcFdqd2FBYnFodFhnRW9JM0tQcE56eXZDbFZP?=
 =?utf-8?B?NEY5NW1yRGJaL2JGdzRCRHc2Z1FvOXdnUHhmbHMwTWV5Z2RwNyt2bnRDUnhR?=
 =?utf-8?B?MlY5c2ZvMnErODB4YkZlSXV3ZXVyRXhjb2VQUzVnV0ZyY2JyK2RTckgvR3Mx?=
 =?utf-8?B?TVpaOWx3Y3hrellLK0QxRkIvOHFjWjJ0Y25sWjdFdVRWWVAwa3RKakZDZE5Z?=
 =?utf-8?B?Rm5YZmpQN1l1TDROck9HSnlWT0kxclc4K0lnQ2JtYVlYemloVDM2V0w1YXIw?=
 =?utf-8?B?V1pyd3RMNGE1cWlpbDkra1RuRjM5V3M1NUoxQWNmZVdsRlgreGVJK1dvSkhT?=
 =?utf-8?B?dkRUcm5zZU9ScmxsbW9uTEU5cHQzMmg4TSttcmdadXVmS0pOMlRVSTQzTlQ2?=
 =?utf-8?B?VWNzWERtR0txRkJPWmJoaDJFMFZyUWVPQkxsQXZHYWoxR0MrTGJYNVhWeTFa?=
 =?utf-8?B?NDdiYXU1ZjBwS3dxQ2FSMFErYVFxcUlQdzZ0UHhqL1RHNjV5Y243cWFPVWp4?=
 =?utf-8?B?TENPV09OTHkvTjZkSXlJS3pwK2l0SWFvTUczM3VJcFFEN1pRaERmK2JxeVpR?=
 =?utf-8?B?b3hWb3I4dlA4QkNrM3Jod0cxNnM1ZXV3VGwvL1ZjTFRFNEdjemVOellMdVpY?=
 =?utf-8?B?eFFsNFJrUS8xVG1QV3NpU0JLLysrNGRLOTdyd1EyWWlvNGtGdThHLzIvdnB1?=
 =?utf-8?B?QmZHM1pmQ0t5dEI4ZmExOTIrMC9nL3E1Z0liYVZTLzY1V0o0TzY0YU9VejFy?=
 =?utf-8?B?OEUyTTh5Vk96bStIVlRRVTlScEpVNlQ3emtLR1U0c09pVGFnOGxXSEREanZT?=
 =?utf-8?B?NlN1YVRQUG9hbUZPM0Zhcng0RGEwSUpTUFZHK1JxQStHUEZXZmZDTU1HY2Y1?=
 =?utf-8?B?UUlsZUhNV3dBTE5YU0JqWllnam5WckY4eVRLQkovL204QnJnMmxWdWREeDkr?=
 =?utf-8?B?M2VEeFRYSVFMYzBHTmlPeWYzMFk1ZkFUN0J3RjZPanVEaEVNWDBpZ2ZkSnpM?=
 =?utf-8?B?bThrWU9UeU55M3pGNlhTZnhSTXdZRnN1blROaHdueGxFdUUxdWY2dExIc1E0?=
 =?utf-8?B?ckVjd0JBNnY5bTNDeDNyWlA2TkV5elBkNGkyUk9FWjBFQzBpMW9HTDlnNWZy?=
 =?utf-8?B?YU1Sc2hvelhFU3l5dFRtcXpCOTlNL2lHWGEveStzQlZsb1Y2MjN2akR5d0JQ?=
 =?utf-8?B?TW9VSDNjRDNRY0FUaHh6bkpHNzdBS3hQQ1dvajB0dURaMEtMRHR2eUFCcUpt?=
 =?utf-8?B?TFNrNXJpbDA3Y0RUSERQS3pNYlB2YUprTExuSFRXeXdudkN0UWd4d0NyK0dU?=
 =?utf-8?B?NFNmWXhnRDE1SlBHMEVRZjNDZlBCTk1YRGdpLzNoSEpTUTNTVkxzM3V3dGFY?=
 =?utf-8?B?RWxCUUtzcG9VTXVZZVllZjNLd3FHaTZtSVU4c0tqZ1EwY2o2bEdPckJ2VkN2?=
 =?utf-8?B?djFoU3NHYXNWZlU1R1prb3lxQmRsNGlvZERmcmVsanZhdHhsTlgreFEwMlg2?=
 =?utf-8?B?VnpLOXhMMWNpUmdlekNNdi9ZMHRkQ3B4ak5MSlhjR0dEd1d0MnNVSHpVWThN?=
 =?utf-8?B?TXg1c0hSWlBDdks3Z3ZNRFBHNjJlU0Z2c1pYMXdOdVRyUDIyb25UTElQbktN?=
 =?utf-8?B?VktFVXhxa1I4Z0RqN0ZMUFdhd05BQy9BVTZpZDA1cDBhRWNJeFRJVVdEQXlo?=
 =?utf-8?B?MkNwTWxpWTI0S2NPK3k0Vjh0S0tWQkNhNnAzR3ZkWUJZb0N2cFNiYTFJQmhY?=
 =?utf-8?B?SVlzRzBSRXFjUDJHZVZTbzMxTWxqRTgySjIzcWsvUEkxVWNMcVk3Tk5ieVhM?=
 =?utf-8?B?QThoNVlwZ2JxdWJxcVVjSkd5b1k0MnZsZWs0UEVQa1lLSTdUMjJzNzNUQVNt?=
 =?utf-8?Q?RpF0HzG7SBGzIUYLYdylaohtk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1716770DE66B9E4CBDC7FFFAFF9C4ED3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f6003a-8a01-43c5-6ed5-08de12cde50e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 07:21:05.3490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ICuBXN0KD83ZyUATTksfLNIP9Tg6XQAwratVmrgh0kpd0K0l1OHaNPEtSl5bngSLvCalwDYkK/1Q/PT0cREiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD6B8A798D
X-OriginatorOrg: intel.com

DQo+ID4gKwkvKg0KPiA+ICsJICogSWYgdGhlIFREIGlzbid0IGZpbmFsaXplZC9ydW5uYWJsZSwg
dGhlbiB1c2Vyc3BhY2UgaXMgaW5pdGlhbGl6aW5nDQo+ID4gKwkgKiB0aGUgVk0gaW1hZ2Ugdmlh
IEtWTV9URFhfSU5JVF9NRU1fUkVHSU9OLiAgSW5jcmVtZW50IHRoZSBudW1iZXIgb2YNCj4gPiAr
CSAqIHBhZ2VzIHRoYXQgbmVlZCB0byBiZSBtYXBwZWQgYW5kIGluaXRpYWxpemVkIHZpYSBUREgu
TUVNLlBBR0UuQURELg0KPiA+ICsJICogS1ZNX1REWF9GSU5BTElaRV9WTSBjaGVja3MgdGhlIGNv
dW50ZXIgdG8gZW5zdXJlIGFsbCBtYXBwZWQgcGFnZXMNCj4gPiArCSAqIGhhdmUgYmVlbiBhZGRl
ZCB0byB0aGUgaW1hZ2UsIHRvIHByZXZlbnQgcnVubmluZyB0aGUgVEQgd2l0aCBhDQo+ID4gKwkg
KiB2YWxpZCBtYXBwaW5nIGluIHRoZSBtaXJyb3IgRVBULCBidXQgbm90IGluIHRoZSBTLUVQVC4N
Cj4gPiArCSAqLw0KPiA+ICsJaWYgKHVubGlrZWx5KGt2bV90ZHgtPnN0YXRlICE9IFREX1NUQVRF
X1JVTk5BQkxFKSkgew0KPiA+ICsJCWlmIChLVk1fQlVHX09OKGt2bS0+YXJjaC5wcmVfZmF1bHRf
YWxsb3dlZCwga3ZtKSkNCj4gPiArCQkJcmV0dXJuIC1FSU87DQo+ID4gKw0KPiA+ICsJCWF0b21p
YzY0X2luYygma3ZtX3RkeC0+bnJfcHJlbWFwcGVkKTsNCj4gDQo+IE5pdDogdGhlIGNvbW1lbnQN
Cj4gDQo+ICAgLyogbnJfcHJlbWFwcGVkIHdpbGwgYmUgZGVjcmVhc2VkIHdoZW4gdGRoX21lbV9w
YWdlX2FkZCgpIGlzIGNhbGxlZC4gKi8NCj4gDQo+IGlzIGxvc3QuICBJIHRoaW5rIHdlIGNhbiBz
b21laG93IGVtYmVkIGl0IHRvIHRoZSBiaWcgY29tbWVudCBhYm92ZT8NCg0KUGxlYXNlIGlnbm9y
ZSB0aGlzLiAgSSBzYXcgdGhlIHdob2xlICducl9wcmVtYXBwZWQnIGV2ZW50dWFsbHkgZ290IHJl
bW92ZWQNCmxhdGVyIGluIHRoaXMgc2VyaWVzIHNvIGRvbid0IGJvdGhlciA6LSkNCg==

