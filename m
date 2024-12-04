Return-Path: <linux-mips+bounces-6868-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E101B9E3F74
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 17:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A45F8162727
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 16:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDC91FA16B;
	Wed,  4 Dec 2024 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gRZelFxO"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C472A14F9F7;
	Wed,  4 Dec 2024 16:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329020; cv=fail; b=YRZ3fOYo6W69JXkN+9kKZrlPOpqxvrSxnpWZ0y31E48yVX7ysSikTHm2fCkz38KTOPaUdDkTk9piAnOlJZiy1Arv0TIimM7gSu470yMMjVyVqVe1QNJCqEkyUNra9N+8ujP05V9sl/m3Ocv2yd0TWEG3QmeL78kW9szqTQS3geI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329020; c=relaxed/simple;
	bh=sxqI5qx5/JE7KlMDIRNW5UaSl4Sohh1FGP+CVdwCzDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u4mvHq8fWSDLdfQb8wNssp2U2WFrpVj2xsoXZGOHs3WvGvNFeLqoSxOfy9g9owfxAQnUj4uAtJpwIidoofv7rgnqNewtpOYks3xUk4H5jYu6W1y5yATNnwIW/6KTPEQtQ3PloQSAquF7azBVrzcXGaUeLEVklJGuO02XLJo+MpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gRZelFxO; arc=fail smtp.client-ip=40.107.223.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDBrkBks6nHVlY29pA53TetsmaXL+orX8pDOj+DQLrZCAEAPi5pTCCToCCNHsioboGwhMHZ1N1uilPb7lRNMDuZRcMzHpXuy40EUrmMgn0zQRc18LjDU3xRBCmkwFYuZJfrAs0YEyjzSQcQ46N/gz235zRFi3SKH5OSPM4lbeACj8mfpm8k/uTWMmiBTJCDCZYo2td+FnEG8UPynLgJv/M8+95NzPBiytSuz+W4D528FnhiZNMWKrmaObT2Kx+WBVkcGs54oYPyzceYIBE770xe06a4aNNCtXcEACTtI0hUGjDXe2ws0E9gfYtxToQie4VsO+ZG/76+mU2xJvBhYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh+0Wup/hWXY/dzNBdit2ydiIU347pbZUxOrpiuX6UY=;
 b=maoCOm1ITMuA5t63eZwARVHU7MLpiR1BRs26jmQ1/P/K/iuoPiQXx/c+qPbWLTHmBDLBybplzAPTUIc9HYag64QfGCgjDfEz/1H64B+x3xTeDKN2PpReBxZngooOs+GzqbZ3wckMmOjWRSaGeYXIwYu0my39PuG/4viBPJitXf6NErct8/qZnTjBzhPQkfuQbCZhQ9ri0TtyIn6QJMRkXk51tHcn8jLWx7atZu2TEKhqJTm5PRiTjxcMP3nW7gugEXkPvCXTMDMesQT4PW2UkX0FiJBpGqms9W3q42tl5i9e9sBxMPp+VtZMXZzzz+w+DcsWTLKCyELCQbPjRzzCyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh+0Wup/hWXY/dzNBdit2ydiIU347pbZUxOrpiuX6UY=;
 b=gRZelFxOXKccYNDfxs0MzoxS0gqH37ek6BMrU0fSGdmFEH+xKYN0Ys3UDnakOoI7AJPtSguibWg70ZMRh1DBGj+URHfaj7uBF7cvAQQ7RdQgzIW5nLvvx9OBnzm0L8L0Dr20YQDsJZYtLen4y36vIX2ZUKi3n4z/nOmRkygESn4WPmNE1btnqlvo1T/rDAj0XQIb52HIRABcWI0omhGSplURxQGoGx7jWj9FbIAO8Xc9n8PscFygBjwiCZ1K1YzpzQpVSyHKZtK50h4FwGhlQGoLPcwgMJkuhD5IXXfQyexkwwWF5TBSbpiGN/MpNF1nVYhw1yMPBiS2gYrQSGsyBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB7927.namprd12.prod.outlook.com (2603:10b6:8:147::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Wed, 4 Dec 2024 16:16:54 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 16:16:54 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Miaohe Lin <linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 John Hubbard <jhubbard@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko <glider@google.com>,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Date: Wed, 04 Dec 2024 11:16:51 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
In-Reply-To: <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0028.namprd22.prod.outlook.com
 (2603:10b6:208:238::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 3425b6df-1557-4a4a-c60c-08dd147f1196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/jgO/hVQz9xZkWN3uqfaozZp+BDONhC8QmoCrlIvLtiQiv4MXx4ll37gYAEX?=
 =?us-ascii?Q?mbErGV3jkxmQGg2Q3lNib5wSQKacEjhc1v7l1KtIlxtVBowk9heUH9jSqCEy?=
 =?us-ascii?Q?ElURI9kc0hgRh3ar8v0daEaDrLiTFCeDlGPd7EbKkL+M3NVyD6kBXUjZSGGO?=
 =?us-ascii?Q?5EtNB/KYRc1uYPYzLAGKad+BvLbCLpAi3U98LjsQqwoJ4mdbqHEv76fCnIRZ?=
 =?us-ascii?Q?R065eKteoyVh/SD+uuOSHvKMiswphGNR5/2uAKUVoMfcqs/psf2tdF0cvlMr?=
 =?us-ascii?Q?eoucDt84AIh8Er5BTTqoavKEOlDgF1NzO9kPE5GdX6MP1QpHPZIWgG/MAXum?=
 =?us-ascii?Q?HIH/mgkyeW0WqA14FJyU0+YRCjY2W2W7mSQCQEQiYoJ7lqZnm6p3gOmQb8DX?=
 =?us-ascii?Q?D2KoAnwHX46XCA5kHstJv2bMQIl+uPoCk7W+MnlSQpR2nRGKqBmv9DHTasPN?=
 =?us-ascii?Q?GK9L7zC5yMFlxSYUUo9hgOmEVGksjPQwplr3wE29oy+Gk26ytkO3buSdVEvj?=
 =?us-ascii?Q?dB5uLkNAEvsDoEoMN5YYJUdVUS6AHRUBuFhqNbDvHXOhJhQVafBFUk8VEqUU?=
 =?us-ascii?Q?2sWBd1CYCgTPXJQgva6Eh5yIaiIzAVV7/yF+dFTjD0YSqWtgGddBugir+9mL?=
 =?us-ascii?Q?CnW4vokqsvozW7lPmrc5s19O9yUzFPn/dWD9WXBAlPb7JERJe6phBrB6oBF0?=
 =?us-ascii?Q?UadnZi0nMdBZfs5fMGtl1pwYi+RZpTzAsb04excAO9/BsVFSNYQmbZLFqrCA?=
 =?us-ascii?Q?yEAlWQvXEFlnLwhvFRFAG1slqEQ6S/hMS5W/CYctuzOZhhfP4U12z7bR+hTP?=
 =?us-ascii?Q?0qKwukxf2YaYIz5/nidPA0gYUZyFHwki1HpVLHbpmGBUqiXT5+/EmlG1X3qa?=
 =?us-ascii?Q?sB3Gvefs3/zDBqLD43BuLQIZr95Cx7i6m+QM2ZzM5dX1shOphPI4qzm+pucy?=
 =?us-ascii?Q?YKh3oEWjv0bJYXnmsXXpkRshc80cJyE/SUrsaH++zgnDTJ/GILrbKF5dchzO?=
 =?us-ascii?Q?htYaJ00+SV/3iif0HVXv45HmiTI89SO3NKxynU7dmttKIU1olXbP13GbRYHd?=
 =?us-ascii?Q?oVxSLIu6BILXo7XCCio86pPtFKCsTRybYdYnxEoPwtgCFHM5oIKmPwCRhYAy?=
 =?us-ascii?Q?hAk5T5Dn3gDAnsPIH1u8KlHxuvQn0AKipgc+P8zj4kpzcKYUOy5wIBjdXr+9?=
 =?us-ascii?Q?tLjZ4hcywL+INUl5+UnZg9JZTy7zG2NNdr4WRM28fXHs437H420HFqq5n1Mq?=
 =?us-ascii?Q?y3PwRkNh9YaSY/rJCP2D0mJi3S8VKIf0h5S/7XxYr9wP0jJaQgtvwWmwiRrY?=
 =?us-ascii?Q?XgCJTVOEWcsl/Vj9GbPWPgCcWXgy2K0augyo53aZelumZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0aBJhXcjZUWrh9BGR8saACW9x3+n7q6bUBC48lyp8kqio7DxhmmQQTXFIFdD?=
 =?us-ascii?Q?lSGe7MYOAI16p+G60fpVQf36LkpZR50r0PAH14MYpkWBx9arOEjXvfDYC32j?=
 =?us-ascii?Q?g42X5qYB5Do9h/P2gH0XN5odkA34Kq+4Yz+HuPLioRVP+jSFgVbPgp6OJqXQ?=
 =?us-ascii?Q?lXf/tqSqK2Rm2DlQJk82Kp6EIoviBgNZXjePqPYfh/MBn6kZOHk9kOQjdj1Z?=
 =?us-ascii?Q?gKP5GydXsxhlZelaAnuO1pzBVjI0d5y1SQw1qEYxE6lH5JkJfIt0ZJWQDLNF?=
 =?us-ascii?Q?bznEuhCiKXnHIiTcvuDc/tdTQAPqkIucA0WI2u9ffktLrKLeIlEEvDOzqbVs?=
 =?us-ascii?Q?gpHjjyz3Wzd1X0QAYa2Z1QsC4MCO7Dkl+MMjfQiBuTLghb/8FREIBATH5w4I?=
 =?us-ascii?Q?BIFXUwe8q4SmgdyGk1eZZpyMTqpdybtT6tU9pQXDNhpx0N/rB8MZ9DkqFo4V?=
 =?us-ascii?Q?Gr0wfBec2EGjyCS8Cf75DJPBCT2WsGcAxRL25mkIPQFDOpzjkZlrzTumbjr+?=
 =?us-ascii?Q?tDFaV5qJGQN2A0WLSoCh+ILO/AmrYY/KHZAfsm+J8TICzb23yfQBzltmQqov?=
 =?us-ascii?Q?hZRs9ZxuVWUIGhb+q2oP8eyxbPX4leP+bf3rK3k5IET0kE3e1AI78pz/Xog4?=
 =?us-ascii?Q?KWnY1xVXXOoYeEGsQdoq4E2jM0eswH6AFRL51auanzwoYtk0FxdzpTkLyEgL?=
 =?us-ascii?Q?w+RO3C64wXNfTPTr5xNOXms5yeLCwSDedi5ak+DZZHy2NBvHVm19lGiuujCD?=
 =?us-ascii?Q?pFD8ZnvyF6yuiatqq8Trwm/AZ5f4MPanHnZaFIgMLwKR+BLPzaHx831d0aAN?=
 =?us-ascii?Q?nnXi/KlYXQqK2FDLj1s3ezgJlkg+pDZ5QSCwvdmlxyfEAtFj69f50YTeGDYj?=
 =?us-ascii?Q?yq6vF+JJp9+q5sZoaI9kGfx0nMmRL+mjHULiWrx8CR6Em9V94T2fgkWpw74L?=
 =?us-ascii?Q?7jqbujySn7fOnY6zNHJi+CHsX4IViEq68xiplF4kKIfKroZJXeWmusya3NKx?=
 =?us-ascii?Q?X/SqRJqXDB3wBRFseuIznrEtVfufENIJKDPlJZ+7d40WLuhV2O/DwVpRyq0C?=
 =?us-ascii?Q?GHqMcAFvZOuiiLmCWYKys8xTV0sp3Tx6o8iMhOS0JPySv+0SP6ksRuzk2CZ4?=
 =?us-ascii?Q?phgsdN3LxyELFru3RdzVujChGLR4B3K1Snejquso3IZtM9W/src78OpGD1iC?=
 =?us-ascii?Q?/5eyGNQuWvSGWCl+SsGBbyk+ZO4fod/wcOyBhqqEmJpzTZD5N9CYXgDZ3ZqF?=
 =?us-ascii?Q?iPe+60rDpyrMYzfy//UbFeda9RcIn6focRxjGoLsDbNWTU0yb0k87fEd2rlK?=
 =?us-ascii?Q?neXewkJs0k+mVYQ69aG2YLabU8ILkovXCQa40ck9smlIs1uHXYaof92bFx9i?=
 =?us-ascii?Q?xoY9Y/H2VioU12SLcGkfHEVXcfXZJIvcKjreMT3CC8Lq633AzppeGX5fwO6E?=
 =?us-ascii?Q?oAzI3rt/g1mzP3KcnMBTyIRjIdStBXBOK2Cdnb7OUVjKWIf7VwIC6aW+9f4G?=
 =?us-ascii?Q?nJ0cBmZupEhANoW52LQPcAnGZnnOzI6InH+SMaUGmUSDc0dwZN0gY3C/5vxy?=
 =?us-ascii?Q?oRElFoGKjhkZsX+sWLQTkyJWmyC6WMCX5Wgkxaqq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3425b6df-1557-4a4a-c60c-08dd147f1196
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 16:16:54.6245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBFjjEe1bO3URLo4Q6c0DpaEQLqDWv49TDHQwl78qCo+uPkxK3bDNLtUjOInm/+x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7927

On 4 Dec 2024, at 10:41, Vlastimil Babka wrote:

> On 12/4/24 16:24, Zi Yan wrote:
>> On 4 Dec 2024, at 5:41, Geert Uytterhoeven wrote:
>>
>> The provided config does not have THP on, so the changes to mm/huge_memory.c
>> and mm/memory.c do not apply.
>>
>> Can you try the patch below and see if the machine boots? Thanks.
>
> Hmm looks like mips has some involved clear_user_page()
> in arch/mips/include/asm/page.h
>
> So maybe the clearing done as part of page allocator isn't enough here.
>
Basically, mips needs to flush data cache if kmap address is aliased to
userspace address. This means when mips has THP on, the patch below
is not enough to fix the issue.

In post_alloc_hook(), it does not make sense to pass userspace address
in to determine whether to flush dcache or not.

One way to fix it is to add something like arch_userpage_post_alloc()
to flush dcache if kmap address is aliased to userspace address.
But my questions are that
1) if kmap address will always be the same for two separate kmap_local() calls,
2) how much overheads the additional kmap_local() and kunmap_local() have.

>>
>> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
>> index 6e452bd8e7e3..bec9bd715acf 100644
>> --- a/include/linux/highmem.h
>> +++ b/include/linux/highmem.h
>> @@ -224,7 +224,13 @@ static inline
>>  struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>>  				   unsigned long vaddr)
>>  {
>> -	return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr);
>> +	struct folio *folio;
>> +
>> +	folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
>> +	if (folio)
>> +		clear_user_highpage(&folio->page, vaddr);
>> +
>> +	return folio;
>>  }
>>  #endif
>>
>>
>> Best Regards,
>> Yan, Zi
>>


Best Regards,
Yan, Zi

