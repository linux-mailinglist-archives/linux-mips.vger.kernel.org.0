Return-Path: <linux-mips+bounces-11865-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14DBBFFA77
	for <lists+linux-mips@lfdr.de>; Thu, 23 Oct 2025 09:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 513113A5ED8
	for <lists+linux-mips@lfdr.de>; Thu, 23 Oct 2025 07:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBB7292918;
	Thu, 23 Oct 2025 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5FPJpqc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AA26F29B;
	Thu, 23 Oct 2025 07:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761205147; cv=fail; b=mgzOyFcdF3+SqmtEjIcUQezxlH4DuJfesdPR0/bW1HLa8tvy221e3n6KxyNETrdPzMbIqsVE7iypXB6SOwy4vm218IIiUKZIKoymy4K/lyxDuC03cCKwWJ/NstnrbDbbRnxnlqW6qK7eL7j6Nd+gww9LBW+aNhFdK/ufEHtqRtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761205147; c=relaxed/simple;
	bh=8nYSZMmq34LdAsLu3UNF0eNqC9tvZ801C5lNoCsYOws=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bKPmTi2lB332I7AFAeuKKIl9kPQS9zKkoN7mRE9nrQw13lBs/Ha+djIk0KlPYdGqb3nlsSWyZc2V31W9hy7PWSGb0gRzr2jOThDxcmTOrVe3KwFDLSf8LueuErC0tofk/WfmvZWJRfRcuEjypnAzuZcYGaEVoky8RCjzolxsLvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5FPJpqc; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761205145; x=1792741145;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=8nYSZMmq34LdAsLu3UNF0eNqC9tvZ801C5lNoCsYOws=;
  b=V5FPJpqcZzy3NRscy+rzLxZnLxiRNVCEWszWD1afx8Hk8X31zvnI2wTP
   HhiTF4ibeT0RlllEXlRvQG4eWmRzaacY0A4ovSQaR00J8JHmIxzwWwssT
   gVsZ4Q42isSqDh2oT/a20Sh/mf6ne4VMOrQccGwlRE8lzKGCc+ZjDjvD8
   gL0HBfTyc64M/kJMA/sPI7GQfergXG4RXfyGejuzJ+BqF6NbCXnpVcD9d
   8WwruC9YH1S3Pd/uyzkJFXoDZZ6Q9ZZveq4la05A4vkT45G5wxRmOzXDt
   iM5WmL+VYxsTkmFSrhWG60nHWPDXVzJiuih3+RREfvri0q7dOlD6XAmGA
   Q==;
X-CSE-ConnectionGUID: HFkiyuC3ToegePpIH3EJpQ==
X-CSE-MsgGUID: nlIqeBm7RaeNqpy5svaFJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74484742"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74484742"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:39:05 -0700
X-CSE-ConnectionGUID: tb7GLMDnT7u6f4zXWuCqqg==
X-CSE-MsgGUID: IXZo/JOjQs2CKrAcmtttEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184151203"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:39:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 00:39:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 00:39:04 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 00:39:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrVLBY6rJBt9wLBDo98td2JMuxD/AAy+Ph4r5UQUm6FzwRXo+gzUj7Sp4+l/G3qnJa7GMmbMxXRymspviQqN8MZMhY2C3/TIQKWvu7H71w0hylyNM9Rxp0tl1dUBvzZkWn6N2bw35wRrPqUXzKlHs+OOeBU6f+5j+e6tnvO88FYqGRAaTYPLLhed8lKgLTPCo9soo/3eXsLmF8L61cXiFQ39eJhr0tWoTh6DzS21y8E4sImxvsUa+a8t9AvZrxaTCuImezKCRb99TBTtOATsfo4N0Va6uYHCfqEYxw8hWdfxudCS63TVDzQ+Nn+FudxddAswtbS4oDwx8z8+Ph3pMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb9oho6r2bjKK3jhDqusQP9xuL0e5Aw5Q+1FfjVk5FI=;
 b=vFQo04y+ACFHpNnpEAxOdT7m7sgaRIHmYqVn/sJO+huhVwLWpVoijXy7fHPz27SgSOeFaS2UPvLa0q70p8Kpnvlu3u1qLZL4rPhBxeEPw7KR0HH9lV+RrIJeRw2yqRMLjpI94VzAo3OA/Qq1EP1UQ4BVFQRctA6M/k6lM6m56oa80heIWXVl1uR6SnvOXqifXBmT+BV1MAD8HZCp3CTSRAP5ie9Bys/CG2gZ5iI6OGKFiMub7nNhtPBdYy2CsYDo3iSput3aPIHzkPOm74lRBhAAWweAzWfbd+3kPwqONLQQ7aanO2CQBU1uVQJJVrL2unVGnYLeH1+FOZtERoMurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 CY8PR11MB6817.namprd11.prod.outlook.com (2603:10b6:930:63::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Thu, 23 Oct 2025 07:39:01 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 07:39:01 +0000
Date: Thu, 23 Oct 2025 15:37:04 +0800
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
	<kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, Vishal Annapurve
	<vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v3 19/25] KVM: TDX: Assert that mmu_lock is held for
 write when removing S-EPT entries
Message-ID: <aPnbIDxGlcAyI9vy@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-20-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251017003244.186495-20-seanjc@google.com>
X-ClientProxiedBy: PUZP153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:301:c2::22) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|CY8PR11MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce3ec8c-734c-4e16-22bd-08de12073ba7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bq4R6wrNJ2waEKhFKi74Xf5dgSna1/e6ReITyXM64uvc5WEJCGkxgV4CdYwk?=
 =?us-ascii?Q?e9FyCpvxT8lClLJF3g6Du4LSbQVYWDCRl4kKFgYDOk6fJPtMVtSWorD0reyl?=
 =?us-ascii?Q?EmAsUoMzw1eUqVVWx+tWUt06TPGB6ormS6KSBIgDpUBQyezrbvu7XbUzBeDr?=
 =?us-ascii?Q?6OXT5EcIBGGq4xlsO7pxHTnsc308inmN2Bcp7RFKdJcSLu6AJcmx2dHZegdT?=
 =?us-ascii?Q?kiFM+tRWC9vp4YSGb6+yVV+yoGG9LpXXPS2XZludZ4hxTifPe2X60xtHC+qK?=
 =?us-ascii?Q?RvaG19flAux2iWRHz6Mav75XDl7lf9818dHQzCfjGJ4FCD+aA26rwyfXe1ZC?=
 =?us-ascii?Q?G/2AT6d7qrk4+5JSqgSg7G/oBiqyjQ3vlkEp4ISS+qSv0zMUvXKwf8irRc95?=
 =?us-ascii?Q?4kAEKfAgQxet47ZMLrMmIN1p0m4v9u6wB5kVOas9BoQRFI2HbXo+gQYastVL?=
 =?us-ascii?Q?zwtBDvcGYZl2NaPDzLLnWSwR9dxvVR94CAQiVaQKiKyfVd4ENyv5nupR5jBO?=
 =?us-ascii?Q?ohgRmZiPsJ0Nm2MWyk+zpGFbdP9ZlU23kDxeXR0RKd806O1kqwRZozYC6elC?=
 =?us-ascii?Q?JBk4jYJQmgeVVse2GnbbAsJLSNFpV/5U2zXIXjSQiB5mta1NXCQRuR1TBr5a?=
 =?us-ascii?Q?NL9FS7eA5ck/00pfeSPz2DkVJqAwe3wn5gASiKLHIYbjfCUJ84bDfqwcvm7d?=
 =?us-ascii?Q?NVjfuF5/jvQ9xrUZFC3i1oQ6tPw0oW2fWvcIDvtZDFVTmhyPbtM8bukFbh4V?=
 =?us-ascii?Q?lKrNVruRNKcNtpLEqk5uhb7J567RBqXtlLBLm1HjnOejLc2bH6WGOqXkgKnf?=
 =?us-ascii?Q?qWkrVkc6FNftMvbvdwL1NZnXHmbB1x6M1cnJD8Tjj9j0ulYzWokQRO579CZc?=
 =?us-ascii?Q?iB8WoSm4iiDhAmRMkOyo33Q5F0Lp27uHYLdR8rgt951qjISQ+1yWcTMVsJqx?=
 =?us-ascii?Q?woTQbMpbu7dfPbbR0l9bF0aMKe37wnQ3ReTTk+HrZIeC+0/K9p2Azr525WBJ?=
 =?us-ascii?Q?duBzxnuxjjOLgviiA4vfNM+geD2ctvr7IkbvlSEdQM5+oomg9zjLvCd5hW7b?=
 =?us-ascii?Q?S/ote6+A+F3IYkdoFmeEcEbZVcvjxRK7rkq+YPfDjwhoHGVfo79qvLeoNor9?=
 =?us-ascii?Q?CI0tWVunE4cYA7N8R1z8yfCmU4FO7UPjws+MGkaUgYpcjv4YOw/rjL4ZcPtU?=
 =?us-ascii?Q?Z3+ZhMwEGym80pDhH7f0Bi/pnff2WrOWdHS0lTVA5MdhNF928m0DVGH22Ag2?=
 =?us-ascii?Q?CQKNntDSCaCjt96agyad2YcCsFl+lRrWnLofdaU/SPZWahdqeqUH2yLtZCqO?=
 =?us-ascii?Q?CsuqMjkih0hsF7zGEc/X04TpGPaJ6kOMtn/0br+H5XisiGLnXv7oKf8IF+U8?=
 =?us-ascii?Q?Anianw6PYiGpcXFvXybE+46nE/wSEJqGSns5c/swIsOeyxP/QzhrtjOS6FM9?=
 =?us-ascii?Q?dWxNJhUMPAmES7PtGcOlaYZlDVuCovUk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QGQaFVGnFeaB37ZDqAJWZ2sbOAzKK7KabFwoUKrw++yk2TcMm6PEU0HdQAg/?=
 =?us-ascii?Q?isnqLb64yZ05hoH5nAb/vLTwOtEOwnohz24DByr7sekg6YZbJZr0IgTvgvSe?=
 =?us-ascii?Q?I9MP43UfWbPrIGcpsdPbITQcL3u9kHKQOFYh32uBuMgEDhu3BcJ1PQN8GpvW?=
 =?us-ascii?Q?PSJtmiz0Dx26smbLnv59plp4TjMe6H5DwX5oro/aVMedihLef09q3YLWhrM1?=
 =?us-ascii?Q?QkznvXydWhJBdM/a6sI0sdhNVzMoKNBR4wNfKLqDNUsc4oYPU1AwFlrpuW/r?=
 =?us-ascii?Q?J3Te1Rowva6sv9AFseIrC7oeBWKSoVuThSXlM5WgyUiU2Z28CdVNxWcUZR2Q?=
 =?us-ascii?Q?mu/A45y3o/O7F/MczqDGx1kntxiiXN6JzNMedImGNgw/eAbJ61P2si7Fm/z1?=
 =?us-ascii?Q?LCYM4xa4EmH2NBgJT8fUBYY20XkL5BHeS9YzEu+k8dFaYDfcMNY9yHGdWsOZ?=
 =?us-ascii?Q?gWv9j3o5FO3Uv7ceEBDeOv92k5dreBcVQmD33+eXpmHgZBOt6iWRe889jlSP?=
 =?us-ascii?Q?Ex/5cDz6ZDXHN13xjo0J/034ZQIMEJuEfWcigXR4SeUI+/oUFy5tDDZ5gyUJ?=
 =?us-ascii?Q?O7RX9G9fEYRbZNAS632BE8KwuVSBrVHZSPiAIW2XMnxz3MRsINrXFKEgImrX?=
 =?us-ascii?Q?Fndr/VsIvFtJrkgn9TzkrTGQ7n/jVUq+OCocJD/YrUykTXRFuZXR7vrvHMGh?=
 =?us-ascii?Q?wEit8H3Iq1UBMDls1rltOHqUwaI9L/A57NBg5ADJz0LOcxEKRuZc/PECPQEa?=
 =?us-ascii?Q?e8DwYm+fpwyWpW/KfodKGe1xGj9rhMhIVbzTUKbIQiYXb2sIOKz15ZgcOrf0?=
 =?us-ascii?Q?UvDHfOiV6/aEN/wBNZh0JLK2aavmcPBwPNOx96IjPei7+P4t9WwFsjos2vEG?=
 =?us-ascii?Q?oQ7xXMYa0ek+nxNUwMR46DW/Jvom0zDiRzP/Jf/cqJiAc30UGhN3kqmYXzTm?=
 =?us-ascii?Q?FPPt+7ml8Tizc9NuK0AW2YTrvEZXBTl7uyEMHdDmtNzwO6+NNVmYXtrfMl9S?=
 =?us-ascii?Q?OAAW5L64um/SAeA2X5kZjxpkMQz4VtGnIlSmgtwpBL7J4QmMxrxlpDiGUGeb?=
 =?us-ascii?Q?p8LvjoN4S/kI/lzYD2bqNUHtqzNL48jNwd+t3QL4FtFdZjabk6WYX9rSdorf?=
 =?us-ascii?Q?77mbb0fguoc4sIHxlVZqWj1ICiFju2L2zLT8c9067KeDy6C7xnaNmEKJ5ElW?=
 =?us-ascii?Q?DUsZ2zmH18TVlGaLipy3Bsu2ZOPrG71l2zJwVroUDhWDfnLNda0WIcITwJbt?=
 =?us-ascii?Q?bO/yEGOB6a+nuJiv197/jfm44F7nnA4K/mjHrpTs0D6/pbavqs9SG5wv/gir?=
 =?us-ascii?Q?KeEGAlATxzA/+zAMoDTLdao23Kdb0INDViX0J0BR1MnWIOUss0dShR8FkCkI?=
 =?us-ascii?Q?gnVLNJHpu2lHN/LfKVEgWAj+67/u5Mdr5F3sd19elyJul+9Ru7ESYrPd0ltR?=
 =?us-ascii?Q?7wRXYTasQp6WsU0SHjYV+fqa1MWBIYtBNAk7NKAakmme+N8pf3nf0UszwtkY?=
 =?us-ascii?Q?33W27W5dZ2cvP1rlo4qwJFiHZyZPBtBEvaqrq+Xo37nu8IanhIwWpT1h/DBC?=
 =?us-ascii?Q?RpuJvw+UHem4/cHcFmem1kRw4EwT/m/J7zl1p73T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce3ec8c-734c-4e16-22bd-08de12073ba7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 07:39:01.0385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VmG0i7LmgiDokVXzhNCdaD19uE9+I4OWrlPVwRq1IiUmz0Lh61lwiLpQ5iRwhMWYF8s5riHbvNeLYMi2fzx5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6817
X-OriginatorOrg: intel.com

On Thu, Oct 16, 2025 at 05:32:37PM -0700, Sean Christopherson wrote:
> Unconditionally assert that mmu_lock is held for write when removing S-EPT
> entries, not just when removing S-EPT entries triggers certain conditions,
> e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
> Conditionally asserting implies that it's safe to hold mmu_lock for read
> when those paths aren't hit, which is simply not true, as KVM doesn't
> support removing S-EPT entries under read-lock.
> 
> Only two paths lead to remove_external_spte(), and both paths asserts that
> mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
> handle_removed_pt() via KVM_BUG_ON()).
> 
> Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
> that wait_for_sept_zap is guarded by holding mmu_lock for write.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/tdx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index e517ad3d5f4f..f6782b0ffa98 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1711,8 +1711,6 @@ static void tdx_track(struct kvm *kvm)
>  	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
>  		return;
>  
> -	lockdep_assert_held_write(&kvm->mmu_lock);
Could we also deliberately leave lockdep assertion for tdx_track()?
This is because if we allow removing S-EPT entries while holding mmu_lock for
read in future, tdx_track() needs to be protected by a separate spinlock to
ensure serialization of tdh_mem_track() and vCPUs kick-off (kicking off vCPUs
must follow each tdh_mem_track() to unblock the next tdh_mem_track()).

>  	err = tdh_mem_track(&kvm_tdx->td);
>  	if (unlikely(tdx_operand_busy(err))) {
>  		/* After no vCPUs enter, the second retry is expected to succeed */
> @@ -1758,6 +1756,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
>  	gpa_t gpa = gfn_to_gpa(gfn);
>  	u64 err, entry, level_state;
>  
> +	lockdep_assert_held_write(&kvm->mmu_lock);
> +
>  	/*
>  	 * HKID is released after all private pages have been removed, and set
>  	 * before any might be populated. Warn if zapping is attempted when
> -- 
> 2.51.0.858.gf9c4a03a3a-goog
> 

