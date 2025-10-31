Return-Path: <linux-mips+bounces-11991-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA23C23F56
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 09:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACE8B4005E6
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 08:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97BF325488;
	Fri, 31 Oct 2025 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQ6moMUW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B00F283151;
	Fri, 31 Oct 2025 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901027; cv=fail; b=dYu2n1StYdHjuphjHShmiyGeOjlXczOH7CZvyeBMRA4misCZ+F9uC2FBeDHPhGZivl79uVCRRFa7D+yedK9y9T6549Ul0lMfGecSihW4HQmo4307GsAzDZCxA12ueeuzFABgllt0DfMeIfD01Yh/iA46IKDbFIm+sf911jt2Og8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901027; c=relaxed/simple;
	bh=6LKOZ7R1NTjiI3IOIKvpJmo/breXjKl2I8S60vpiEbg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wqk3JPEmRZF2aSo+VxORytoOUJqhzHgomsGSqARBzAlUzyrmhg4z7ago2mALH8gC9O5oOtlnlw0KWgPfB9WRaeBONIZzEXs5eBz8MsJzowrw1DItzAYFEuBFcG1Uq1GwTwpV7X/oyL5vgnktECZJnLFH+JMogwzY+Zj911lqqO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQ6moMUW; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901026; x=1793437026;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=6LKOZ7R1NTjiI3IOIKvpJmo/breXjKl2I8S60vpiEbg=;
  b=iQ6moMUWyrS77vLkkAmoYaO1UKCWVOXO6QdRY3y86qkcCaXeNzbDOOde
   97GDVmTJA1MgO9X2kz6gdMkjbZsa/MJfkQ9PzimFwFUFW/ULcZJfmK7vt
   6Nj0Tbp7zWreqQQci3Q0hpzlmUKjQS8ncuKpFQB7Ya/96jHVfn925MWyP
   kJ0cTNJQmKm4oYDJPlFM0H2zKnv1TFD3/iLGNL37TAjebREYZkQbi2fHo
   4n4B8kDno9QE2p8v+jBxq6FLEfENajBESkcTPFbJ53T9jNMdAGVQzf1z3
   +krBHCcMFZ/hnD8PNx6pchmdkIjtIVMT0vwN1ltgEYC4zRQJ3loh9FSLA
   A==;
X-CSE-ConnectionGUID: /pqua0V8R16M1FMH08H4IQ==
X-CSE-MsgGUID: tpeYoeGmS8GWAS/9ZsO7ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63753618"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="63753618"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:57:05 -0700
X-CSE-ConnectionGUID: JFIwTBJWRBK3fk/HQ+Qq2Q==
X-CSE-MsgGUID: U8UleFdqQiKuBfnNQYSlJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186299627"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:57:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 01:57:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 01:57:04 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 01:57:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUgCYlpo+z6ilgenMTs9FnzxnTnqKJkBQW1+f5IhQbmLfVyBmLlhit2EHenR6JcQmiE6DehebSsZL5XL4/YKJUtiGIsDCcKKxgqBYPYrCoPZ2XD9Z1oVKdt2zWIpG0AxFpGvSKuae9R+lFgzwkagT8NaEPm+1t0XVf1RCr/2EL0oQrL9QRoXZFrwGchyVHB81XC1xUZ03tBXJfiwTu69PR063Bsl+CWCmk3ZKTg01pcVS6TuV5oLzwaftiQ5TqxI1pB8co5gFeFWgRrPZSd8vI0Pg4iIA3rZXRVRVHTY4hrM91W1fUsoh9B+TKdxFuEfk1PF11d011pSeMbcSty4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LKOZ7R1NTjiI3IOIKvpJmo/breXjKl2I8S60vpiEbg=;
 b=XUr69LhrVyQAF+xB9iE3dVZZABzwAYm5625KcWAKQC6fXIDKFS5lL6MwwsY/GsElN5Mqx85NZsqq6ViiE9EKDPLxMLoYrKhrs6vx6eidhGdkrt0dXhWn33CUjwsrrJ9XQl9NuPY51kztuWkSLA/HqAB6AZyx8OcgM2WhRRA+i1OCMUJDDX/iKpri8CA8T5LvGCyxmNyAYHBZtzCvdXdgRXs5uvyBwuNaLpayY7KbIbpi7TAL07Q+Glm1r+IuHNonVKB6oQ1AYaJxr8PCmrCZV+fc8qCEB/oKVjNVnnzqTsqoiiYeWaJds4qyVnEQIgZQw9fESfuOMiLlaEXlvVl8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SA1PR11MB8394.namprd11.prod.outlook.com (2603:10b6:806:37c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 08:57:02 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 08:57:01 +0000
Date: Fri, 31 Oct 2025 16:54:59 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A.
 Shutemov" <kas@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Kai Huang
	<kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth
	<michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, "Rick
 Edgecombe" <rick.p.edgecombe@intel.com>, Ackerley Tng
	<ackerleytng@google.com>
Subject: Re: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
Message-ID: <aQR5YyfVA3/AGksh@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SA1PR11MB8394:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b7cc1b-b658-439b-3fd1-08de185b7509
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YegsHNwPhDoE9VPeHycbWMRIwtZwRc/8iwqcCQCeDp0NN3O+YV/NtJ1vQgRJ?=
 =?us-ascii?Q?lSiyMKyjXpIbepYVqwu3NZQiHp+PM06nLlREMCt5/+ERlw4O1ci7GLlHLym2?=
 =?us-ascii?Q?ypar+FSuNplhH4ZM7G1Xv1oGqHPcF/3nW7C2T4B2BajtIbEVxrs6gaQtI0t8?=
 =?us-ascii?Q?O3fYniVOOxZywH6L4Wg/gJcK6JvKgyb5ByhLy64kMbd7+pJtynOmWOJ9Fe5K?=
 =?us-ascii?Q?BxBNaDNfV+12LW+YVOJudr1S6saHiamp0mEe/VwsWW7dAxl8edWFc7Ia2RcT?=
 =?us-ascii?Q?kmTqTe9Ov/ad26LXnkB5YjvqaLTPjsbSNG5r6KL3MzJS0gR+yVOWRheKxzyv?=
 =?us-ascii?Q?uUO1k2oRkUypXj30Gr6ue9cDg6bKIavRkfpMni7t6nE16H25AyN4V0esDesP?=
 =?us-ascii?Q?AsPeIxDn7NLO2G9F/WM6oGKoC40Rpemg9cWZLkladcb67IzyjxP5aMQYYLGF?=
 =?us-ascii?Q?03BaOkJn0RBwLu5KT7PIygUscT5zL555N8YW0a0BBmKAJjorY3qM3fxNZgPv?=
 =?us-ascii?Q?XA/2j+h/J5B0r3tJJ7s8puK8XcYMBpaMZO4CZ+8TCCW2dBVEZGHRofg0vDyY?=
 =?us-ascii?Q?gG9TeXnesYeDhOwKC5vJdDkSNADXKMZebgCHriEaE0STX4ZOu1bqs2sf9KGU?=
 =?us-ascii?Q?LPnz6Voy8yki+s+i3N4qehp8nTgfCDwhI/e6YU7ji3CqaKAIihnUJsHb4OOy?=
 =?us-ascii?Q?XGgJ0EL4fuCXaHeSbS4/vuwVBS8vjFDYmaaNrudFp2W9ZPoNs3DGBDLxTRV+?=
 =?us-ascii?Q?l2BWQrNtIG+LchecWYAJvslYymwG5VjXFzHupRXkhb4AMSvAYjk7enLEXiWn?=
 =?us-ascii?Q?2McBtXEnyLmnTJ+FsIkO7xqREDiIn1t9jT5pj8OWfoiP8VijgdVeMwmxdaDa?=
 =?us-ascii?Q?Hq0j3WdrAGSeCLckSO41ftCVVxZK/j7P6UQKra9hHzO5R+as3yACYgXZUsov?=
 =?us-ascii?Q?m7vWQmdCjhcG2Pdm8s33Mjpet1cytWz1zS8vAYr7EQwtX/6zqgLsIeXdm4ZQ?=
 =?us-ascii?Q?cAsV79V1G+q6xh4BqS88uZmU+Zk/j/Yt4HmF9bTlbXqgQOvBp0KPwndvAYP0?=
 =?us-ascii?Q?UkATC4XU3iCCOCpjGqWgn25PCOA55ZJE5fJ4Zf/4IOSs1BO5Wwd5H0b2A52/?=
 =?us-ascii?Q?zZJD+xuzCOXZEFMFMdBbu/uo9RY77ZBNFdBVMAhunYVFqB4HtNPKDTvl388E?=
 =?us-ascii?Q?oII5cuHxZ+qTrWHbw9djiFt8Ed1sfpIAYi3YqtwwIwMOJjareVAkxkRJfviz?=
 =?us-ascii?Q?j8230BuyMnt9Jq+g6+8Ck+Njg8AA4drzdLHAPwal2QwHfQnKvB1Udo1LURHi?=
 =?us-ascii?Q?9rR4bi1/94KNGkf+cX9TJS+L/8xfXZRpWsFF17TuAB6688DGRrRQ4bRQI1Oy?=
 =?us-ascii?Q?YEWtcXYSiO6M79bpgwuGBtVXscLndADRqd0fjEAoy6c5dHahKNkyqp9k0vqf?=
 =?us-ascii?Q?ZBb/BwNTOXhiGER6p7nSTm9vTte8xFcv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t05AuEY3d6c3XyidxLdzA382l4gj6b+QHCI/cq84W1dqyn0HKJyUl8NaN7Pb?=
 =?us-ascii?Q?n3j/UyZVFmwYW8SFyh11dr0Zmvtl68IjbZblUaG16rm5xfdY5GDKfOe6t9/V?=
 =?us-ascii?Q?op7wQxnFT5fIiRHMV2fnrPr7DuunULQMBRlmZvcy6ourzDjkddWxzg+9w7m/?=
 =?us-ascii?Q?wXW4Iz+8RelXj/DpjX8X/Ux6WtSMrAGcYOF5K63KHJ698axb3urfy0A2iLQJ?=
 =?us-ascii?Q?M9gRQizn58k0I+T8xZnmt9+XTrOdxiCHgTO7/IHG6arH79uxiWytYICXKnfQ?=
 =?us-ascii?Q?Q2Damn8WXJDST6ifpmuqECF6/St/rsAzsCjXFYtfft2yAfXYVhVe2xNDmhqF?=
 =?us-ascii?Q?10hG2xebfs7SEFKvWSmKxIOwaFWlekX4Mq/RDHoKBlNCfY40rwX3O6Oj1bga?=
 =?us-ascii?Q?m6aQCaxakth9CfcCbfu0VZh+BvFP0MJbBPL2OLUh+K+TF1OO9LW6ieHPeVA0?=
 =?us-ascii?Q?H7SLGCn/TvspnyNnr38aRUE+WCrzibSpaEHHQ2h1nWNGg3ALziE4vfrsKl1J?=
 =?us-ascii?Q?kgxc+y4SbTuZxFL49DzTp1nGe0A1CxXEwytW6ANape4s/ZXZpvJ26u+h05Db?=
 =?us-ascii?Q?a6T9opUn68+KKWNMSWLfv+KLz3mB9qDZcZPETs9zVEg0Go167zkOfsX9g6O/?=
 =?us-ascii?Q?5f5YkVt68gNYpRSFcVB2yLirN70qkEdyK+BHronhOOjZ2Js8XH3VWQ8O/lVA?=
 =?us-ascii?Q?Zjcj9nRqC7BECbzY+9B8IdtMCAzXDz8ynQow2v8ybFZ2ntbAdfzmvvMcowa8?=
 =?us-ascii?Q?Qmr7XOlqMoAPvXgaLN4Bd3ZB/cUaOabWSl7yw2m4LlXftdT9RHkGV6waf1Ke?=
 =?us-ascii?Q?eTBnnHpoKIgJaB7XfgBWJfgVVywqw/28sloTML8msA6RQ35HIIqOR+Y34s+p?=
 =?us-ascii?Q?nafBA3H4jphkgCwsGzcA/3ELpN3Kl1a2mO57ApDsd4jGHNeTfJ4v8/SQMTUy?=
 =?us-ascii?Q?QJD3JNmqi3tQQ7YZuoozpLLvrm2H72glua/ukqorzm/oNkT7fzKmu6zEM2UN?=
 =?us-ascii?Q?m5N6XWOfxvGQTYs0SRVVROdCM0+ya2PtPwQ070CAEVfbJDX4wVHRvSD04kTB?=
 =?us-ascii?Q?1yTag1aLeN8F2UXl48MXpfRQgnKQkq4v+K6zDC2d7U2XKI+ZYXYaA0tYiM/7?=
 =?us-ascii?Q?mvblxHPpgaw8/036Lq24vSJ2ygF2f5PH5mz50ZIjK1i23oxscH8vAf9F3bwH?=
 =?us-ascii?Q?OCciklku9+zAnWvm3Pg5d3QMjKteM+OOmXPlZ5psMtjtAfFaYcVT9Z2ixghN?=
 =?us-ascii?Q?bqZex2RVSsNeYdg7gyRelagLk31IgtI09Pxe1ZMKZoy8T3UnWj5ZNv/csE8s?=
 =?us-ascii?Q?IutjixmgAsnYO62u/EJo3RsyCVXXw4xQw+rGpHsgB7Z1GHm4pi/YJlkpzVFu?=
 =?us-ascii?Q?hTu5NibYu9UcFKKtxoh+XW7/WOxZdMA6m96chnObDFyG3EZ7QzFZqBIEQJSG?=
 =?us-ascii?Q?sWKtHPlSbHY7uaYozkUz2vYHKc8PiJoXMo+F785sRqBEMzxRuOafLPoXz0jq?=
 =?us-ascii?Q?co/yN41Ee7shg4AuQYpTFednu6ntY3QC/VMFDsMLuApCC4hB1RffMp1oBM/r?=
 =?us-ascii?Q?4oDyBVCnrpyvJ7MqSHoBZVL0Zay2fWKrlji0RIoI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b7cc1b-b658-439b-3fd1-08de185b7509
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 08:57:01.8830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4j21esJVrRq7jpn5bmL8qc66cuufFYFam9JdInzIl3d/LlJokc4FzFGrEr1mQGS4g7F9bYrrjRweUH5fw0NMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8394
X-OriginatorOrg: intel.com

Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
Tested-by: Yan Zhao <yan.y.zhao@intel.com>

