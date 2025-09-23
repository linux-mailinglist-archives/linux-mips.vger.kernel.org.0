Return-Path: <linux-mips+bounces-11548-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B02B97D36
	for <lists+linux-mips@lfdr.de>; Wed, 24 Sep 2025 01:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A9F117D2D6
	for <lists+linux-mips@lfdr.de>; Tue, 23 Sep 2025 23:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95F22FB61F;
	Tue, 23 Sep 2025 23:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JsC5banj"
X-Original-To: linux-mips@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FF92F5B;
	Tue, 23 Sep 2025 23:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758671604; cv=fail; b=KjPtYPMJOhf1sY5oZZfFAc5bbhaSZt8tPJ0uPCRAI5gPtB0aNWoyFMOjkgYHIbL53sfv8DHedj1DYpNaTJOsZhuff7WUFPTdFNzEBorl1Yil1217moU49Y+7TpmGRtchWFyEqeiY4zDSE42twXLIZerEGHcz3t/SSAA4ZDGd8ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758671604; c=relaxed/simple;
	bh=p7lQttNuIzHu/PpqXg8JpahB7mO9uqoR/q0NvDy9eZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tZ7FuZAK9Zqe2x0MirVDl7EqoMCJ/JysJPE9fb9et3oFHFXM07CrfGB4mP/uSXAlpACU35qqa3cpvUFHbRsHvrd+eR6G2Y6icDcei6kcmjg/fAbgF+P8T6uBLKaOZFWPZT7o9ThQi0zRbAStpfsneiKj5Xcv994dKXO/jaG/cSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JsC5banj; arc=fail smtp.client-ip=40.107.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzuGb0YPnnZDypK46oCieMglXQVvJxHJXNXHxaP0O/18UoLSHb48v9dyhR7dIgm1CzHOTFRcOntHSxGmLlIwBf+MlacK8F/kCgHwq+wiCRsgQ3A+6BdRDDSQwqdhk3TLB+up9oUmMSCzKxN3kO0mbk0/o1DeMsy9PEFLPAwshCXxW/u/4o5M1o4rT5aNa0SiiECQRdR3XZ0/DG5Xm3Mgq/VdavXqjE66h3BnwiIBo3LaJ/miEZNKN8JuHIVNEfnf9MqWKSUwMFiDjapV6tyYnx17T2dUPkaqTmP98dHQvyOeTs4GdGIxg6/EGNxvZVifPfU2mLXksP+J9y+SXbKgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOqcF1qx3uRM59GkEJfLCCyAt/XruVhRcf20l7ynlzg=;
 b=tCbK+2g47JGuqbS6eV6WP1jReD8ESsLu/f9L9aMJNHyzyOFRhCoFOlFYnBwFHqpfH/vyvlTUgj1toMVS3YiQ+4C3OM9TEBLSXLbFlJPxe50Mdj7zR+M86SV+tVeeuddhJSluqjTZ5Fe95LXzR2adq5A+dT+9xfHHwc2NLYaB9HIBaVtmUnkF4A8doD9U75r/jFyRPo9R8PU0RXTbDWm1dc5yjeUgauPoIUxb+2d05GtKiM0HnvYbJHSAvA8+vx7KXcZUz2/JdWVTRSgpFJAR63LVptGKlovwYZUnC8mHeA4o1Rjx1VT+8Ac9IR2PXHIdm777M/GW2ifsd8RKu0zk2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOqcF1qx3uRM59GkEJfLCCyAt/XruVhRcf20l7ynlzg=;
 b=JsC5banjwSLEvQH/7wtP276/J8UoIwtyfOWgWbR+GHOP+JsSu2kyFipmAIUQZfLE2xa2Yan3GBXhLPj4RWU6pLvNEsusbIBOQhHCcgwE2eCiPZHhxm1hd3d+s+GPEaiKvojvHufCYB8/+h/2CcgeNizRtiBd74pjKiXzSiL1Drk8jC+q7Ee4u7d0JSeGFUeEpdjMPmy6ck4jaj/3v0eetafJtomRU6yvUtZt8x7fLqYmdJxC4ZNDlWb/xNmQNRaYCt8jLbdsGzl2ybB0ZznSvH5zNL2HMx4xjbt9/58mWjv3sBomqjUW77I2EMtLARWflN92vqj0Ynfohpg7yPfK7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 23:53:20 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 23:53:19 +0000
Date: Tue, 23 Sep 2025 20:53:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical
 address
Message-ID: <20250923235318.GD2617119@nvidia.com>
References: <cover.1758219786.git.leon@kernel.org>
 <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal>
 <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: b183311f-b954-4ab0-5432-08ddfafc5f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ASdrlY+8Zb9njeOBHMqcfc/eh8Zg2SFJXx/lvxniYDxmTalUE3idJma3mgNz?=
 =?us-ascii?Q?XQTBE7Dagc9zhrGW/xUTu/ZBQ9LK1y4QWHg1v+aRJTvGLYKNrwJjmlPiueq8?=
 =?us-ascii?Q?AwgHMrURRS7lE/VbRC8xXyYTf1EAGcj6+tPb8ii0VmcOtV3xn5FpiH0QKJIK?=
 =?us-ascii?Q?LuxlskD59bHvpho5az0JH5QWUsLpr4joCdx1smQHhPmCAhmtQyYoAWm7jMv1?=
 =?us-ascii?Q?34pkDyFJFJvr4GyR/Q9IucRI+H9oHBj0adJQqhboz8QkNxIVeBTTZBwvjFAA?=
 =?us-ascii?Q?pTUVHjcXpXc9fVuHyRQ0mj/dxNpi6jMmIEHt1c4vodSNBaCJH2NSvFwckNTm?=
 =?us-ascii?Q?wLVqUQuP2b3I9p4JZOyNnsx6AqnfEZu9VAT2MjGl3RuTSfvExtwVKZseaQc0?=
 =?us-ascii?Q?HsPr92lkfK0+Iagrxjb6ktI5SinqXWlo+rlmrTVtCCDR7j02M950eo6W5sVB?=
 =?us-ascii?Q?xeUCUloYPNwVdupdJtemp6GEHIFf+seqKMQ1ss5JgdUb2hVLL5P2cCu6Z7sZ?=
 =?us-ascii?Q?ouu3LlZXe3nDDIxKsxucv62W6Lj4Oum5ulcg546CbzdG35DfmkxHKtmzTgnh?=
 =?us-ascii?Q?a+WwcvrivQjMYsSmssBFtQsOb1Q4JKEbPFlmYAvtK89MQr6QaNoaxfX5Izd8?=
 =?us-ascii?Q?XzI355bA71jECy0ua0t804kjIURmWZW/kWozx8DetwKNeBjrVFePGdwkav0m?=
 =?us-ascii?Q?K23I9kidRwjYud2683BgMP22R0pi0zrRWyJcxe75Queus4v4wojV0Ivi/4kf?=
 =?us-ascii?Q?2VMToxp4YS1iVQ3Kk0WhyaH193itlEn1+Dwwzw6niB/1WPGWKm9BVvYP36Sy?=
 =?us-ascii?Q?R8vzpTeWkP98n5zGqGRkzP9fTrX0NX4GLmdfPkO0SqkeLD1C5AwP5NVcJvF8?=
 =?us-ascii?Q?ma8GuMagOgv2+tuHQJn8dZQsot8Mwz4jZ5J7P5tJSBDr2R9+3DXxobhJi1tE?=
 =?us-ascii?Q?pBMuYn5qPotVnDi7mpYQjCCi8pjF3zwSc/495AOgLHpd8CaC9mnA3CbJYNTz?=
 =?us-ascii?Q?OJYMQBSP9UVnGNZd77AIHCrG45y12Ah/0zjeMD9Ohr9hqHkAZ6m2xGQk1BHy?=
 =?us-ascii?Q?cEWfiUIXV2/YY/gpXBsdq7nbfsTlCCFgSOoUd/QVYgqGNAPwabUSIiYKvWYH?=
 =?us-ascii?Q?mpacuxdAgGzQP9FOZeNqgxShkBGJ7djUu4hI3QxsHfHXPTCVHZU++OdNSRQ6?=
 =?us-ascii?Q?EKbcTZwOI/Njh92G195TofwiiEcSuikA6Gs1W6oLQxo5g5gvjqrnpFzDCmKO?=
 =?us-ascii?Q?SyAIvzs/PXKIiPx0YXHwkA5c3LNYAFfebL4nkjQS5B2kHB3Zpz7ry1YhhDzc?=
 =?us-ascii?Q?tGOAQpkGVz1O8UmnluQ39EEgU8/cTfCezIq4ggbsThsv+yyPV9FYifNbFNd9?=
 =?us-ascii?Q?QVcc3i7PFaugBpNMUBlqBGdfT02H73zGnDOwOzYREpwe4Nl+CeG69VmADcRg?=
 =?us-ascii?Q?OFHmLIK7rhs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?peXJ0Z7S3XrLMQ/hE1F1WLFaJfiuFa2yW5FCC7liy+MWHRTVuE6BDgKAU9nN?=
 =?us-ascii?Q?gYjiM+lzfGWKwd4liZ/Sm10uI/L+0lx9Tk0Rzm692OP6zDjsnE5nub3th8ua?=
 =?us-ascii?Q?Z0hkSo7wO316O8AmEg802J3NyxO1uK2szgA727mLkf83/+Om/Pbn7pYREAtF?=
 =?us-ascii?Q?D5ayhgk3wVmdByjsha2O65qiYm7uVfeAnmMFo3ARaLsynjRlVu550p1fMfqG?=
 =?us-ascii?Q?56ARmZ0mVCHcw/fBs5Wh0MfHjW/JxVhlGTpJGZAiH4BXKaD92qpvllgt8BRL?=
 =?us-ascii?Q?TI7O7gqWQez6EaLdg684Owognx88D1zBdvcurQOYAy8g5+KfDWneiGC5oxxM?=
 =?us-ascii?Q?xUkmw/QpIf//l1V2lxgMfqwb8glFd08SLNaACnKKEAjn7cxV+N7oa/NHiwpp?=
 =?us-ascii?Q?DhC0jLEk2Zj5FhLDrLrVUl3lgL6BrexFA3NVxnBDQGOMULXRyZOZu70s+k69?=
 =?us-ascii?Q?xVpiFuiyZrwxwT7got4V93PNa872Yn6edlfzhpdb648c5Jf6ZVHBNkJRc2B0?=
 =?us-ascii?Q?xINHWoHsWjwP7fkGAU9Z0yUoHV2gTwsVokeRDB6UD0tVNMe5lg8iU4Txeux8?=
 =?us-ascii?Q?CbwwbL5lzhex+vzIa5fUKrMfHs0kIhFDEgKfm4mM2g/DJIskN6J/y1AW6z87?=
 =?us-ascii?Q?htRs43Szjwr/q3AARKtcHSDwJZTPDObjU+h1Fb3KqMiU/vhVRE3AacuSy0As?=
 =?us-ascii?Q?WmDhMYzW46bUf9fHxSICWyHfW6W7xUS6l7iMbeRIGn5xqBr1OBbGsSUeH6C8?=
 =?us-ascii?Q?ZQpjivRpStjAwxi5Ia/mK3SCwM0enBBofdGS3SYwr5uf5M8eI5iKArJoPdbo?=
 =?us-ascii?Q?8CCc26kT3KWSLXbnN2DgkICkRSYZx4DUfPjKtHdQuY6DF2vDHeJlPengLRSH?=
 =?us-ascii?Q?g4C9wV2z799ijnjdhF1Z38DEpxG73bmZwYr9lRHR5n50R9uh7HFX4L+fT96K?=
 =?us-ascii?Q?KM9M0BwaGRsAws3gF50PAAsHqOcd0DdLLtTEBEoU09mND7bltLkmhwseilrB?=
 =?us-ascii?Q?vXwgsel8sbs+dF6BaU90yf5VVUVCi7HbDhyCtUF9KYdTLf+EaSolk7BepAre?=
 =?us-ascii?Q?Wkkm7lcDuEQLWeF1AMzMaLzczOKp/33uuCg6JhZY7TzyMiMCHcyqhNIXl/zo?=
 =?us-ascii?Q?mSZkH6thaHsT3iHV7GKq0x0oljb3tHeQ6hVJrZ892iiqk1jLY823G6/y+lxq?=
 =?us-ascii?Q?33iAo39CDpJZWIfUB95bGUly3LYxqfjkojRPykbAIZy8v/d+QhFjy1iRHjr6?=
 =?us-ascii?Q?N16RZMjM1oK8h/2Zm3RTFzS6z8y+kRD5sbK+7wYKNIZX5gTZz83FZTklgsvU?=
 =?us-ascii?Q?pIZ3H636tyvtM8oyfrl7wo+2y/Rc+6HiA9XoxI+a/R58INEMv1J3E/0H8tnb?=
 =?us-ascii?Q?8x1XekGodPX2zYMiB9sHodPR+1SV2JCa9iuDMhDbc/pgkiOBT1xYZILv9fCj?=
 =?us-ascii?Q?9UYR6TRQ5OhTD5/1ENb6wMc8oRYIL7i/uR1E8UwIVIiE9TQcGjJz7ltoVL1A?=
 =?us-ascii?Q?wBACfJmJcsWq91TIFPdNvw/FNFxjH/FAgNhZkTojV8xoAub3hkyc4NCGHrvX?=
 =?us-ascii?Q?Cz/DSXNBWFre1ItR9KuaZZ5NWdFZBGYHmF48mzzz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b183311f-b954-4ab0-5432-08ddfafc5f73
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 23:53:19.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hf0pOWCX3e5dXk6AaQB06RjIj3yBdW2VjcD/zO5seEmRunAO1bhNpobnPLGfv2k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159

On Tue, Sep 23, 2025 at 09:34:31PM +0200, Magnus Lindholm wrote:
> >
> > I will try to setup Alpha architecture in QEMU in following days, but
> > would like to ask first. Did you test alpha on clean v6.17-rc5 (without
> > my patches) as a reference?
> >
> I'm running now on a fresh git pull from today so it's more like a
> 6.17-rc7. So no problems running the latest git at least.  I can
> dig deeper into this to see if we can figure this one out. First
> of all, is this alpha specific?

I spent a bit of time looking at the alpha patch and could not spot a
typo, it looked OK to me. I was worried for a bit that virt_to_phys()
vs __pa() were different, but I could not find a difference.

Suggest testing the same branch with the alpha patch reverted just to
rule out any issue in the core code. If it reproduces suggest to
bisect Leon's branch.

Thanks,
Jason

