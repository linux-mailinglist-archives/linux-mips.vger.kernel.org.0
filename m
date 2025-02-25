Return-Path: <linux-mips+bounces-7941-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 901D0A435FC
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 08:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79425189D4C4
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 07:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C963025A2CC;
	Tue, 25 Feb 2025 07:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwsrXpRv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC58615442C;
	Tue, 25 Feb 2025 07:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740467702; cv=fail; b=NCajkDMjXn75VgAbUhJXBSB1+dU9xUPCEJmeTw3EBfE9pUt7vpfeXRgdWnscuKqzDQ5cOOZ2L/rL062kuWvSxzPHriIC/SP5PHVBRFvSqkyDq5WkmRDTeD4mAaIxpWB6fGLvrLvSyi7/ISqadkCQSqLMN5O2kf+3rbsGdiLdgmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740467702; c=relaxed/simple;
	bh=TF13jN1tt9+mH2lYFVwQsgR6tiNvZ66j3TqxR6hLCAs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qhobUiGIGe1/jRceuappY5QxfVddTMgq0jHzBE8I/Mnl7+j5Vw0n9VtDI6Y9pmiRhI7eUpZEiyVsB+VX3q8O/2yIZd0h3v3Ez5emcgyvcmQrK3FypktoH7mRvXvzskCfXOvy3iKOIxT0DMR2OXBuG9RLabgkeWF28YxhRk1x8UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwsrXpRv; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740467702; x=1772003702;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=TF13jN1tt9+mH2lYFVwQsgR6tiNvZ66j3TqxR6hLCAs=;
  b=SwsrXpRv7Ls0EIYA0nIaAART8mDt43va/DcpxmGAgkh0DXfX6yOPHDAZ
   CuYbv7DcD0jR7O1YGJGltbRTC6Z+JoHoBAuJ867mCU+fwYNne9/0cZbdr
   JxSDow89S33J0K40RnFeeEnDRUaVwsOHVQbPc0cim69zkEl59mWdc9Q81
   doqX4nqZjaHecdp6/Ik9206ZxJvZRPaoAy4PBx30xmafEEbwqGvoxN6hr
   boWiBqSYAaBBF0Bz0ysqaRWCL43eoFer54GGB6ypn6m2WtpuPFGMx6a5R
   QZxr1M+1qqu8uWBKp7cD7q+lJXeMVWUyQkrbXjIOwlIUzzEHAPFzX/+kD
   Q==;
X-CSE-ConnectionGUID: uf1u8BihTY6X8ikF3jST0Q==
X-CSE-MsgGUID: lOvQ2y/+RnK+ij6un6gRBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51473950"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="51473950"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 23:15:00 -0800
X-CSE-ConnectionGUID: J0yNs5g6TtCETm9gONG4pw==
X-CSE-MsgGUID: 4Tm2/0GlTMmepFnN2FZpQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="139543688"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 23:14:58 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 24 Feb 2025 23:14:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Feb 2025 23:14:57 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 23:14:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gE5iQtf9D/q2PgQdSOu1Hy1zMjMYojAULKYJRqaa20ol0SpjRJMl9rr5Vwqx27gu2XL/JscVlVwb/lXI3u8fREm36TelhzNNHhVSflNaZhP5QTYza8aOTI6Cb/Ev10minw9H/ZjYp/6AzPqb2QfBhLt7ccWYwAtuui4qMV9CMTLVNGJFv62q5nB/OjjCoIdSQD3DZGwLtKLhjBw2L67/RgKdXSGsf/ulp+Eei9tPtkqv8Pra/z9a1DCpROvjAQoCTxy6k/KrAsCYH/G+GSafeUX0UmxWyQyzhgaFSr3R5gQ3VaDpjoGOVfEdrXgF2YUc1ByNMRvC9rzapcS8Xv59Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eXtWupIleG0kW9yNmueExqTKsyvUE5q4nQukp0s7bY=;
 b=gt3XICsXOSNq4WgE07R5fD7V+zrzdR5YT1SJnnfm+FTuy0cQejNMC6Jx+SFoUSK+46ocfX/0Ej877pZU0NwHrhiCft+LxNjLn4rbnwRIaGaNHE3B4LWAveU0nH+D2Lmljj/GQNDnj7KuMUSfg1FZuagDpNya3tjvdueXo29rudHVi69o+05r8W9uDVoxV3K44eJG55NQ+6+JwdNFSnt7MDpP3JHcdVNJsAg6rewnvatipa4MEZRGBcz5hZsC4nGzufKYNIMSUHWfcJ9N+isd+q8qn/LpUyNnwkCcTqxCX2/2eiwWJGdT1hFmRbzZPJMDqEwoaWPcaluVM/Os5LnHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 07:14:50 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 07:14:50 +0000
Date: Tue, 25 Feb 2025 15:13:27 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Aaron Lewis <aaronlewis@google.com>, "Jim
 Mattson" <jmattson@google.com>, Rick P Edgecombe
	<rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, Isaku Yamahata
	<isaku.yamahata@intel.com>
Subject: Re: [PATCH 4/7] KVM: x86: Don't load/put vCPU when unloading its MMU
 during teardown
Message-ID: <Z71tlzQJISk6PFAL@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20250224235542.2562848-1-seanjc@google.com>
 <20250224235542.2562848-5-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224235542.2562848-5-seanjc@google.com>
X-ClientProxiedBy: SG2PR01CA0183.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::16) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|BN9PR11MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: bc20028f-d55a-4850-e034-08dd556c17a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hqYSA875Zw2DhiA8r3Fx5eKLkN0fWKdaCGMUElyiUlLQaGkqyvbtnz9tboNK?=
 =?us-ascii?Q?bhrXAq9fLVqj2McuVSIEfUq6iCSRhChNurLDwb0luvZvhZTmP7dIykAATfgY?=
 =?us-ascii?Q?fbZDlpioHF1WWWsQLO5B0W2iaZzeU3fixRxHe7nTvRMcp0frCO3oEkJgp8hN?=
 =?us-ascii?Q?hqijPGlP2HoY1LETvQu/mx+2PbUtmHiCAAuSZOCWbtbtXSJLn6mUiiPLxrmj?=
 =?us-ascii?Q?AnZwiFz0UqrM+qLXMtbPVbiw8yVZCeGKDctUYORrywixrnq53AU0eFYj9JTa?=
 =?us-ascii?Q?eQ2RI43B+hqExxhml5fFuj3CjiVaR8MQbURCjdqGXxmqMdEL9qK5uyMGFnWN?=
 =?us-ascii?Q?upmoJ0Qw4t6OxFR+RZuQXhJmshswFa+tTd4OftPsditg7hgIn2wiGi+nw+JZ?=
 =?us-ascii?Q?AhZIfzupuaAclNIigep1vIOoYltqhKkl3IN5YFOfwxcYgzBEBse80nqp2j28?=
 =?us-ascii?Q?5LroO+uuN38JURMq/A8tUWKk3P1fqLvlJfG7C8yMY2e0HvcBz2Dp1oVT0IiL?=
 =?us-ascii?Q?K3lAyUOa0o6Lj6DBkKjuQgj2jZqUmfYFIvIWHePTxxF9wjTBX3XL4HCEgnUI?=
 =?us-ascii?Q?xO/Bx+PUAsusmfr+gnixJZcV4sftbWIOcy8gYn94IaF3Q/GMxPtF6TuaMQXs?=
 =?us-ascii?Q?+4j5dMrOMsJt+NldT/lgD7IbMi5vK35v1IgFeZH8TYUDZN2YCbpdJnph8VfJ?=
 =?us-ascii?Q?zLv9Kb+zwmxeX5vYEbsNHaoGpQ9w+hLjelfW8EhhOeduIdf9hKIUnv2UQzWE?=
 =?us-ascii?Q?He3PJzib0/Rr+hlxu8lPU3KX/N9nYcboX3CulRtPhMcvgB1OdqOyrGh6/7HZ?=
 =?us-ascii?Q?3JuPb2ZFK7aSuFBROBqyhgbubF1S01yFhg6ZIo+6mwdbmtH1scHvnltZA4QL?=
 =?us-ascii?Q?JVmwXgo6i9sR3TvDN9LUVM43DWGG6Zt+FuYm/tafwi4p6pNjM6H7AoE2heKS?=
 =?us-ascii?Q?eD/jVYx1V8pqI6EP+kTIYVi5eBU6hCaWBDJyqEFki28E0dckaUeK6u6au4YH?=
 =?us-ascii?Q?DE+b6+A2fURZoIGu1M+k/oGv6+5CAc9ixRkYt5A/ZP2aTcz8GThNoFnNF40U?=
 =?us-ascii?Q?+1QhUEhpHB4ahyj5JhHHsh+TsmsGw+Qa3vwJXsd7Gr80VhgefVeIUdlqYZeJ?=
 =?us-ascii?Q?s4rnp0eMy7N3PESpVdFhWtNUP/ALu/17PeJrNE8rRy6+Zg5IORXIX5FTv4Cy?=
 =?us-ascii?Q?8g0hJjUEUy7vEU6Y7pWLW82HUQfkOoXg+pJwF5vlHCsBjoYSdh1I6+VrbGQf?=
 =?us-ascii?Q?+qwQC4h8RTchk1aS6e6yzmtk62MHG9D8ewKRaoJ7meqzUys6avgET0/snvmc?=
 =?us-ascii?Q?2iK20+33DOEhY4X7/TIhXLTPfb3J3vE8OlMbtVx0DdIcPUtDQ4DXp0LaiWe1?=
 =?us-ascii?Q?wAm7hkkx1aGr6jOTEJDiRxP1EeNw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m8FxL5S5R+47DNffELbhSKSGh/9Bs/lDqB9gx2O7SeT01jaNx2lN+2+q22RQ?=
 =?us-ascii?Q?6zkl24qcDj8p0k26d2Aob1l9gCFTLBWQmEjDD11h0fkSNsBzgj5D7J6tHP2y?=
 =?us-ascii?Q?C0H5TyB1ahnhCKjcbsTi+WMaGuXErPBDiRkm9Kvl6di38Bx+Nlm+NB2lZ5Dq?=
 =?us-ascii?Q?Azjub9+fl4SfRrOE39CXkqNUxXU/akEZRQEoxYq+ODZphiGx22CSU26EhDsg?=
 =?us-ascii?Q?DNq/wA1FGeeCl6akZ7grIINinnxbg4mSvfPTasfxj+tXiCFtTffEVoN98/DN?=
 =?us-ascii?Q?z5yoYDtW22qPdSszREePA0W9KQs+skQg8ZRvtvwEK1fM0XA4//eB9KWIK5zQ?=
 =?us-ascii?Q?2fLMLLLrzLy0zEDqueT2laejbYVa4jAJKhoKYa9+BmgUxtGUFQTU0UuKP8rU?=
 =?us-ascii?Q?1GzMgjW5jpXpNbj0LY4zJp05XlIabG3vstjOduGatOXR0sWhto/7q9onlnKG?=
 =?us-ascii?Q?8dPTrQdjR9A0UERPd6kPNeWsH8BDIZ+hFOSpa6hqpebjzyhfwk3UKWLPbb2X?=
 =?us-ascii?Q?4tHKbSbz7s9KP4gcbMgDqBv4YyXPxKKB5NBZKaOp/BvsRE4C5AIiypwfn2At?=
 =?us-ascii?Q?gSHBYMHknaj1g4EXh0PzPTn53Jca9HyXADzEN/CXiIpY3zu69EKOj0gCXAwm?=
 =?us-ascii?Q?zLtJuBlW8a1zTjdahT25VWiGDrTYNUpt2XpEMnpnHYM3VR7UxBmJvaz4h+/n?=
 =?us-ascii?Q?6wXfGITI0lBxecvZjqJu59uhhrff/VU2YHAShrzAEOvUlqZMpNhvRXB8gXxy?=
 =?us-ascii?Q?MVd6EIz9lbeE8+i0QkSkJdeal7tLKOsxu5UZZ29d4x0UAyrxiW7TLClXbLVB?=
 =?us-ascii?Q?pNWRaMDV6JkgRNoL7kcv5cVJwksFeJBizzfLFHuJ+uaXFWcfzfTdO5pJyvKX?=
 =?us-ascii?Q?8FIYQm9qAfVWnONOB91mFa5ccyLIM9bhxkIEktqFWI+rFJAiuna1i+/K4D/b?=
 =?us-ascii?Q?WqXftDUXyyKYNaqc9wvqXAAzHrhizeJcvv23SBIUjPURMKzSQ/9KmBmwyzUb?=
 =?us-ascii?Q?aRKaTQ0TPThAxPi8AMfkFq/fVLQxF7J74MGWoK2inkRjmSMUgAdeBWkDiOUW?=
 =?us-ascii?Q?wLbSJDCYWcPmJwPNvKa5lTq6ULw3MXoL51UJ9F2RqWEtxBPhzi8hPG0Fv6tO?=
 =?us-ascii?Q?dLpJSJ4o39b9XdCGJArIMAPIpGuklvF+ba4cFqmZYWGysqUlGUiKjwK/3ZfK?=
 =?us-ascii?Q?LI396Pk3GvidZvUGoTjAj7yOwzwZqoImy1nHHua/MEGfy1gvKzvWrt83F8g2?=
 =?us-ascii?Q?JRuEupoPMulwDI4OEVQ6LGB9CCrJrPsHudyJIld6QnHE4k1qQeJiuCO6sZWu?=
 =?us-ascii?Q?SfT2TyglBoDM/JiUPso9lVPMWyTRz4Z9/RprEg1Dktr4YXMFbHi2BIgaOOD3?=
 =?us-ascii?Q?bs9rStWQSZ0jetNWinW+EMAcCoRpY8YYquzdrophtAAllVQFvWwA3XHS6njO?=
 =?us-ascii?Q?ab2Yf19j8pWtDKlLkKHhkEqstz+tVZkZjx+jgCge4sPVCulFSrU0LJPEXgkH?=
 =?us-ascii?Q?FRL1Jqs5iZqAbqDD6NTPsNCUGgb1Ani7j7aEV5LHFb0Or4Aytc65FDkLMGl2?=
 =?us-ascii?Q?OwHmrz5hB78cA+/cCQaLH6iqPQWhKv+kmy+VhLOv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc20028f-d55a-4850-e034-08dd556c17a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 07:14:49.9404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oo7EuvvAguO7cMQddF7hhuel26NsaabPJRxLDvp8VzfNKIaD83I4Xm/aSyeJXjxZXKyW7kHFLVBCSyPZGG4HUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
X-OriginatorOrg: intel.com

On Mon, Feb 24, 2025 at 03:55:39PM -0800, Sean Christopherson wrote:
> Don't load (and then put) a vCPU when unloading its MMU during VM
> destruction, as nothing in kvm_mmu_unload() accesses vCPU state beyond the
> root page/address of each MMU, i.e. can't possible need to run with the
> vCPU loaded.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/x86.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 045c61cc7e54..9978ed4c0917 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12767,13 +12767,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  	return ret;
>  }
>  
> -static void kvm_unload_vcpu_mmu(struct kvm_vcpu *vcpu)
> -{
> -	vcpu_load(vcpu);
> -	kvm_mmu_unload(vcpu);
> -	vcpu_put(vcpu);
> -}
> -
>  static void kvm_unload_vcpu_mmus(struct kvm *kvm)
>  {
>  	unsigned long i;
> @@ -12781,7 +12774,7 @@ static void kvm_unload_vcpu_mmus(struct kvm *kvm)
>  
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		kvm_clear_async_pf_completion_queue(vcpu);
> -		kvm_unload_vcpu_mmu(vcpu);
> +		kvm_mmu_unload(vcpu);
What about just dropping kvm_unload_vcpu_mmu() here?
kvm_mmu_unload() will be invoked again in kvm_mmu_destroy().

kvm_arch_vcpu_destroy() --> kvm_mmu_destroy() --> kvm_mmu_unload().

>  	}
>  }
>  
> -- 
> 2.48.1.658.g4767266eb4-goog
> 

