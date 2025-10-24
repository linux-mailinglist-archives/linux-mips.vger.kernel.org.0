Return-Path: <linux-mips+bounces-11880-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B878C056FB
	for <lists+linux-mips@lfdr.de>; Fri, 24 Oct 2025 11:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8E184FB2B5
	for <lists+linux-mips@lfdr.de>; Fri, 24 Oct 2025 09:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE18030CD9B;
	Fri, 24 Oct 2025 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtqJDpua"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C1D30C62D;
	Fri, 24 Oct 2025 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761299597; cv=fail; b=tiCPKorVwTnfL2yvaua7t0NUS9krO73aovhY9B5GolRYjG7F3PM44SC19Yl3PzcqWSzZZ7KRBRQNbWdYTZ1mGrEWv8ffDatnZG5YJZkhWBRwayRWP9eTtBDmMwH+WYTFN+kymv8yrcHQO+bBAMqhSyhDSYP0ybnjxAiwQuZL3+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761299597; c=relaxed/simple;
	bh=sDOxdNVCA4ax+0WufAF4qEIbsRs/qWM+v24TzuiUAaU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P7R7fxj8Mnnn9SiTaE6R2+PnG343okGrsq7/EojV4M9TrNMkcZYA72AOCj1gOvPH7p4oKuHtKXChSrD7/JcvJbyoplMyJsUtwjUSV7alVRPOBmpqyyq6t1fJkyvh8hca86TyhS3D9MFe/guWiz9MZi/Cgs/e/deERhAg7AibcXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtqJDpua; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761299596; x=1792835596;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sDOxdNVCA4ax+0WufAF4qEIbsRs/qWM+v24TzuiUAaU=;
  b=CtqJDpuaBNBzot7ghb8PsHFQ+LOZIM0EwPjvdcml1em7T2l7LVFngVSQ
   PXKC9MdtXH/uMKn2FVjpfGx48mFiunPsV+4K4nl24xC46WBeCHVI3q6aF
   +4gIwpPl/schTPOwkKLhhIYqynFFaMIUP/V8gaYjGO3OUrZXNCBs0NUPn
   OT+Ek5RiVOG3g4IrdlwxB+qyeRT7tryGbeQzY4lOnfUcqWN5Xhk+yO7/W
   TMEPTZOtIrEyu7sIOj4DZx3Ks6Y105ufvnOlzGLy5pUdQlyamgtiWiTqB
   JFmUn954JOGvxwbOv1PQNT7/sAejaXDTQdq3EuTRsBME0jffu6vb+SAyz
   w==;
X-CSE-ConnectionGUID: +O/p7PkuQZyTz8RByYQMsw==
X-CSE-MsgGUID: q8LEn+z7TZGAPTv8uEtwwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73768653"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="73768653"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 02:53:15 -0700
X-CSE-ConnectionGUID: VE6GGdlTShO1FMJLnm0wlA==
X-CSE-MsgGUID: ztgl0c7rSi679VfUVATFsw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 02:53:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 02:53:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 02:53:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 02:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iv0jcad1VAY5hKohLr7JygFYr2HQnJ4NZ84jK5aQY69rhM5FhAU1RBJGp0RgEZaOIusLaFSDOMd0jtPuOKnL+xnYF9cUOem1H2Gc4HBzrEew3MH9JMSTNKUaYc/uPunRCIlajIc9nZ9CNowadsQv05/TmRDwgiSlJuXpN3GCyBQHfA9x4lxMniDQTCYr7x/lLhHO2dlR6QaLITNqtnb1hb7mwtvZXquz97K8CFlj5F/FdJQDA8N2SGu+ilZJ+CMgpF9n05V3q0C8Ihb9C88O4VmtW9a0JeZUqmTL0zMnk7weeYC+LTo62faqgty1UZsOHkl0b//s+zehfHPbEx20Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDOxdNVCA4ax+0WufAF4qEIbsRs/qWM+v24TzuiUAaU=;
 b=UwtlgAypmo8NKR+Kizb9T+4fiY8xzmmXrRgi7EkfzClJXLKVPPh0zGaNi/YVJGFmLQMrRBX3oPyaHkEV45U4+P1o/KpMlUepRpupwdnfxoKOwmSXLOb9kNbbbXD/Xce589uaMkw216TBomClU7RtYY8z6Rd4Ke9tvY148ovu1u04ABTXI5tGKZ43oJsl3Uy7+5fvmbL0e2xiQabUQCZ3rEqP3P3Zl021ZiDe0KxSuhC8j8FCvl20EpA8dVIWBWyLDSZ8pVs0/OBK7kbS+AKcCtN8bALeXiWynMSuwlJ6iYAhKv7UGaMvE0+nCdyXEl8Pm9XulBzj5O/iQS4QkpU1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:53:11 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 09:53:11 +0000
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
Subject: Re: [PATCH v3 16/25] KVM: TDX: Fold tdx_sept_zap_private_spte() into
 tdx_sept_remove_private_spte()
Thread-Topic: [PATCH v3 16/25] KVM: TDX: Fold tdx_sept_zap_private_spte() into
 tdx_sept_remove_private_spte()
Thread-Index: AQHcPv2oAefPIfagQEmrupWdYZHUjbTRGgaA
Date: Fri, 24 Oct 2025 09:53:11 +0000
Message-ID: <e8aa7d53dcfe4725e4b90065e0f794f900a066c5.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-17-seanjc@google.com>
In-Reply-To: <20251017003244.186495-17-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA1PR11MB7086:EE_
x-ms-office365-filtering-correlation-id: e6607797-ad57-40fb-8f36-08de12e324ca
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?UW9XV0owbGdlK0d5UVJON3dYVS8zdy9wME8yc1N0UmlzR0dRNmNPZ3pMTmZo?=
 =?utf-8?B?ekFYdXFydlNPM0dsc2Y4QzNRUkY3aVBTbklGbW9ac2lBZkQyWVZhU2VDK0NC?=
 =?utf-8?B?QUJBS3ZRMnFWaitzV05pZCtJcUQzdnBWUVppQmxITzlhTlRacUZmdTdaT3Ba?=
 =?utf-8?B?N1FDVHJTWmtyOUc2anVtUWlmU1REaHk0dG9MVzl0eCs4MmkzR0xidWFWd0k4?=
 =?utf-8?B?MDFQSnZyUkVNVlE0bnNwMTFDRmxBWUE0QUpScjREa0NRSkNlNitrY2FGTjQy?=
 =?utf-8?B?dW5KSlJtMUVWU0JiV1hKYnIvV1hIOFRDSVpJTFJBT0l1TzRaeE1xK3dCMmQ0?=
 =?utf-8?B?enlNMTJNSkcybzZvQ2dEYWhxTUFWcGdRbWZtQmRmdzJtYlZZWHF5SkhNMHEy?=
 =?utf-8?B?UkxzSWlUUWRMTkcwVUtrcDF3dFpIcUpvN0grQ2xPSjd5OU1rbmZpVjJDc2pX?=
 =?utf-8?B?V1FNVUprVSt6emxVa0pnSTA1NEo4RTVGWWwzMm11OFJxaU83MDFCVkN6ZDQz?=
 =?utf-8?B?N3dGdFM2MFVlNEtvVDEwYTJLRm9wSlZDZU04ZmRyK0l0enZoUG1BU3YvTGo4?=
 =?utf-8?B?WkVvYVZSZGNKd0x3VFoxU2tWWmJ2c0xjN2lyK1pZK1Q4cFRCNlFWbytYVDdI?=
 =?utf-8?B?RFY1VTZwc1NWaWhHNTJGc1ZJVUpnMUlmOXFsQ3JxUCszY3hnUEs4V0MvTE9s?=
 =?utf-8?B?TTVVNlVRZkMvZEdhaDlNYXVGMm9oSUp1TG8zYWZMejFMam5tcG41UVh2SDdK?=
 =?utf-8?B?eXpacVNuQktiV0FWc3AwZmtXVGREdGUrR0RaZCtKRW0rTDBjTGpTZEpvVllY?=
 =?utf-8?B?WWMrcGg3ek1HZ0c0YWFycmJXenhpcE43M3FTRGNqMjg4T2RjWnhaZWx6SWtD?=
 =?utf-8?B?c1ZkaXc1YnpGTFIwOHNhKzNVaEsxZ2VkejcxU2JqV1F5ZDAvRDRmOEZweGNa?=
 =?utf-8?B?OHZzVURYNXozTnJZNlBjbE5qdzRKdy9HT05NbjRRSUdobWlNNUVManMzU2lV?=
 =?utf-8?B?MGlvMnBkVGxIc2VaSXFqemk5TFphVGczZnk1bHczZ0Y5N2g3M2w4TW1LL3Zy?=
 =?utf-8?B?d0h5RDhERUZYSjVncTc2NHkwdFZyT0swVE1kN25mbTlFaDJVL0xkN2FGdHYx?=
 =?utf-8?B?NHNSbU9vUG9iTkFNbEFsdll2YzlVYVRrdmJWY0ptSUN2OE5kd3hFOFhSMVhD?=
 =?utf-8?B?ejRyU1B0NXpuUmFmTjVlVVJ6V0FHNjZUNTBSb25oYjVmZGwrRDhSNHcvS0FL?=
 =?utf-8?B?MmhHRUJpa1lPWU5rZFRaUjE3dTQ2ZThraTdtQWZRenRuanlHcnBkMkJaWkRu?=
 =?utf-8?B?NlRWbGFMQ2VFR2poZHVLbEZFR3dXMHh3bS93b0ptWHlTNFEwdlhlWUgyNDc3?=
 =?utf-8?B?TlMwakd1RjMwNlpHQkpXZWdjeXQ1WU1nK1YyTGhibjBITkpjeUJnN1A2ODJh?=
 =?utf-8?B?VG9NWkJ1VW84Z3VNMkc5OWE4VzVyYUNQUjFkcmdmWlhoOTlkNmM4Mm9RRkhx?=
 =?utf-8?B?WnI4Zk5VT2FHVEt5MHhnL1hxNGRxYTdOc3hFT2J6MHF0dE92S0tCUThTVUVi?=
 =?utf-8?B?Q1ZCamM2U1BtbEgwQkNDd3h0UnVKT2RxeDNRYzVYS3RRSzhtREoxekNNNWVp?=
 =?utf-8?B?d24rK2E3RXJmUUQ1eHhCRmFjTEQ5N2I1eW5mZVgvVkg1Tk9hTmEwRlYySlpq?=
 =?utf-8?B?T3Nodk5uMG04ZXhRTTZtTW5zaER6b2QvczVSQXMyVFdNK1NzNmFNOGVkVExL?=
 =?utf-8?B?RVcyZ3JvendvNnhHQms2RGdCZVVrNExUWkpLSUlNNnNuQ1BMYWlMRjV2cFFF?=
 =?utf-8?B?aldBSnhhSlFLZ0QrUUc0OTdaYjRGNlNyNGFpMzRSa3hMOEphTTVFdFNuT2Vt?=
 =?utf-8?B?Rmx1bURSVTMzb0JXQXB4SnZDZ29XRjRlUkQxaWVsNHd2Z1BhRm81TDVyUCty?=
 =?utf-8?B?ZTBqclBqRk5GRE1tTERNOEZMOGpKc21TaDBmZjRaWnFwU2VkWkZ3bTIzQk8w?=
 =?utf-8?B?VGxCdTFTLzBsdEtNUXZ3QzlIcU45L0dwbXZ2bkkyL0FEQU96SWdFeDZVOXlK?=
 =?utf-8?B?cFFLc05nTjJjcGpjb3cxa2FSQ3ovTU1DNHdrZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1I3dVRhZzZ0ZXRpSXdIbENibEh3VGZvYUxiM2gwaENwVDBrZkVIOVlTNlU4?=
 =?utf-8?B?OHpCMk0wTC81Y1l1czJDWmhGa0gwaGZTQVhSbjYzQTh4ZnhOa0Jqa1BxYVJI?=
 =?utf-8?B?T0JtZmdpSGFEcWNVZy9aL1NucUxDcFdmS3hmeVh3MEI3OW5qQXFoejl0N2VS?=
 =?utf-8?B?a0RGSG5Ea0RJeGVIZnd2aDVQN3J3Qzg5a0pIL3A1VG5zZ3lzVlpadndvSCtj?=
 =?utf-8?B?VWtnWUFKWXFtTkdhNmtoMWsrZEtqRmpGSHgvaFIya2YwVVFML1M5ZmFQWWFn?=
 =?utf-8?B?TVhOeUhyaEpYdEliUm1NK1BDN0V1UWlHQW15YUl3TTlFb3JJdkhmNktBSnNT?=
 =?utf-8?B?MURVUGM2bDdqajBia05XV1prdjFwUzVmWis0TEtGM1YxRGIvWjk1K0dHN2ZK?=
 =?utf-8?B?OUpOTU42V25lOFZ2YXVPd1FTSk5paVRhaGZwMDZNbklSVWZKUTdFUkRXU0sz?=
 =?utf-8?B?WkY5N0wwdnFnVWFLSGVqSHdZaE9yOHBVSFU1UEc3dlZjekxaWURwZE9NZXJr?=
 =?utf-8?B?UXZlclhON3JFRzY1VUltQmJQTkllRGR2OFMvNTRkNnoyamFoU2VHUzkyMTFn?=
 =?utf-8?B?bmNPODM2VWQyZ1BLM1FaU2FLYlNFVDNxekhiQ0M5cER2dG16MU9aRERwOEJU?=
 =?utf-8?B?UjhRaDNvUkVHRWdZNlVXWnJSUFpaVmQ3bHR0K0M3dG94YjlDbjQrMEFzU1Rq?=
 =?utf-8?B?Y25kNlNHdnV4V3U1eWZWZzYyU09tMWFSaEJDVFdJVVozMTJBSkZGTVhVRDI0?=
 =?utf-8?B?L1F5VUd0WjlGWU9sYnE2aldodHFrOEJRMmVQU3NlOVZwQlZFaGk3SFF2ZEsw?=
 =?utf-8?B?WmxWdVIrMkJtdGNpb2pXVURXbFZTaHhtYW9ReGwvYU5ST2RySnN6d2VBY1RX?=
 =?utf-8?B?UTU5SWp4eTlLWE41enNzQU9NYnRrSHkrelBobnpZK21JZDNiaWNaLzE1ZDVE?=
 =?utf-8?B?TkFMcHpTSW9LV1hoNTV2ZWlFRkFORWMvc2ZWaVhqMFY3TXcyMVRxSVBDZlVp?=
 =?utf-8?B?eWJBNW04c21NcGN3SzNrZ3dQOFZQajRQVjBVZk1xY0JtV3pUbUhlNUxoVzls?=
 =?utf-8?B?VG9hbUk0MnpDZjg3eUgwZmxGbU5tWFZSY0Z1UGhTT01jRkhXMldOL1FhdTdw?=
 =?utf-8?B?b2Y3RXovNEJTbElGb0t6QXd2UkhUb0FHTUVCZ21WanJaenFjc1RaQmxUY2R1?=
 =?utf-8?B?alRNK01pdFJCek5BWFEzTTQxejdxbXhvYkpoM3N3ZXBzdWw1c2NMckgvRVhE?=
 =?utf-8?B?R1ZEUkM4MC9BVk5XUTFnRy9ESVRBRng1THpnb1V2UnMzVmlscW83VDJiL2ZL?=
 =?utf-8?B?QXljbllsV0RPbkwwWVRJcTdXUnFDVHFTSDVqUG54ZmZKOGNaQTJvdG4zclJC?=
 =?utf-8?B?WXNFSGJ6aEVUVkk3MGw3K2YybFRxTjBJcG9lMTkyc0JMSE9CbzZVY2JVUldv?=
 =?utf-8?B?QXJKMjhQZUNIUGwvdWJYT3AySW9HQ00reXgrREMxNEZZTDVibXk1U3g4OVIx?=
 =?utf-8?B?Z1NRby9LVlFrenpBdk9PaXdYVjZ0QllQRnVYejZSbVBxM09LS3NJS0FFbU0y?=
 =?utf-8?B?T1FxKzlyVVZ2Y3Nud0F5NlIyV0FXbXVKc053Q2hLRFVpandFY3hOODV3T0xR?=
 =?utf-8?B?b2xuVEdEdWd0TUJjTFQ5dnJVQit6cEF1eTRlbGdBdzJkbkh4TC9hK1hTUFVQ?=
 =?utf-8?B?K2JQemZHckdlRkQ2SUZ2L2UxMmZtUHZYNktMZUJ6SWxpMWZvSzVvOWRBWFht?=
 =?utf-8?B?Q1JSaDVxTE94a0JlZ1IwRHltNE9YNGNPeE5BLzJZRkxqeGpEREo4K3oyT1ox?=
 =?utf-8?B?N3FTZ1pmUlAvb0dKRE1HcS82amMreTFBMWZlUVlPNHdxNlJNbHNIb1lpZXF3?=
 =?utf-8?B?WmJNSFZ5S2tTeXQ4bjRrVFM3N0YzQndGdGxxb2owdVVkYmN5akhyd2NSc1NR?=
 =?utf-8?B?V2E4aTNGNXlJZWdONTB4RTZkT0N5MzlkWDg0RnAyWVpIN001KzYzYTJmY3li?=
 =?utf-8?B?QkhTb1A4cWdsOC9uM2l5b0pjRThiM0x6NHJlTm5vRkZ1Yjgrak11enZjL083?=
 =?utf-8?B?Sm1OSTBwcmpaQVpxRGIzSFhKQWdaN2ljV0k1M096aGlFSHd1Ymg0eHNTWXcy?=
 =?utf-8?B?eFRVckJHS0pUT09IYjdlQXhBYWlvZzZFMjkwYjQrU0xPdVdmTkFzajlZcHgw?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <716827902B76C94E9FDB5C94A201101A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6607797-ad57-40fb-8f36-08de12e324ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 09:53:11.7079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQ10OIImYxMVniCViK8JTbZtITRQObngmAs/Jq/p2/ZggFTijeSuwdPFfk/nvPM8WgxJ1QyatYv5cFtj7BLk0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBEbyBUREhfTUVNX1JBTkdFX0JMT0NLIGRpcmVjdGx5IGluIHRkeF9zZXB0X3JlbW92
ZV9wcml2YXRlX3NwdGUoKSBpbnN0ZWFkDQo+IG9mIHVzaW5nIGEgb25lLW9mZiBoZWxwZXIgbm93
IHRoYXQgdGhlIG5yX3ByZW1hcHBlZCB0cmFja2luZyBpcyBnb25lLg0KPiANCj4gT3Bwb3J0dW5p
c3RpY2FsbHkgZHJvcCB0aGUgV0FSTiBvbiBodWdlcGFnZXMsIHdoaWNoIHdhcyBkZWFkIGNvZGUg
KHNlZSB0aGUNCj4gS1ZNX0JVR19PTigpIGluIHRkeF9zZXB0X3JlbW92ZV9wcml2YXRlX3NwdGUo
KSkuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCj4gDQo+IFJldmlld2Vk
LWJ5OiBSaWNrIEVkZ2Vjb21iZSA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPg0KPiANCg0K
UmV2aWV3ZWQtYnk6IEthaSBIdWFuZyA8a2FpLmh1YW5nQGludGVsLmNvbT4NCg==

