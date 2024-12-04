Return-Path: <linux-mips+bounces-6878-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162569E4691
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 22:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C089428151D
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 21:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6046418FC9F;
	Wed,  4 Dec 2024 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UYTvSfyP"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EEA18DF81;
	Wed,  4 Dec 2024 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733347526; cv=fail; b=iDoTMa2jBNu9ur3Cwcaud+g3z/dmcL/Fo1BVmHZ/JfDCWrcgFh1qr0O+k2zDNdLgGdnVWJrQoCiLaNvrc2OpA1guiFwD900mMXRtq6eMJO0w1F8kAUkS7+G8iu0ziy4K7FI+UuMqqkPkjI6dq443kLKLuVyeDk4RMvh8xKig0w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733347526; c=relaxed/simple;
	bh=3EVqkvhfY+SM3h7RB7qYNbwDtD+cmJiF+kzHp+ihcr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SkHZlvJz9dhu+5vfpcg+IM2wMYmmaQldicX2wBvjfAzNotSedrPqnw6nj6+MBG9JxJLjXXcr4hsi/Y3JEle6YfbWJuBY5VVBptElcHKkmWnxfOcF15mfots83Kq0Zugmkh4Uj6lxQ+1lsnDN444QdaxYSJq4kZjME0EQEzIx4ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UYTvSfyP; arc=fail smtp.client-ip=40.107.243.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMOO30ug6AMFkJcXQbWHn7CWkgOC5CbkQNkdobnGyZGvLTxGpdF1ifxC1RJwDizYK1oK663yD7wbQdaYNicv4T8lWoNH3nQxRajLTCfPF/NARTe77if9aKKQcloUp9lh0/Sda7BhyaupGdP3ZkGSZIkqAjxEepXl0R7/WfNNggSYKFWhvzbQVdHz/DAWYXNjw5C7Z/C57W7As77AsvfZto8DGBJ+hPQEwjFpTpZ9T1lm1Q+7row9oQBglcOX3c5OgZzSgLTyaLka3GcPMUe5ScOvOKdRCnWwJj67A3KPYzs+2LqRBHVF5dFJOQtnw04feTW6xcJAXmhcA8mY78Ym1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08qBHPBBlMkczhYgj2q/B6OWIajTyM7o5apZtWATbns=;
 b=NL+yK8P7tIwsrmDKrTfysp9DDflvhRSmnDTHiCQgxYdNoU48D5ggr26Wg3qxSjvjJSo+FTF6Uaf4tjkLPMBPujOm1Ka97tfEI9W0cUQ7Zm+MaiLTpIJ03CuqjFoibQlF9AQTVYJIWYkBFGgm9H+3XbM7L0D7wD24vXxD8hx9v5FHbTdmKHloSOYHk8KfJumXoBF2hckJItdbkiNeDiRql6ZrZmrSNf0QAL/B0drPnmQ1YaYuSB1eCpYQtXoLtGNN5z6SsWzwv8BGrjYwr+oF1trSpPyRwNvLs7VVXRRqFaizrwG1k5/Gi7TvvQ3yzQG9niIQUVp/QZGPR/CFk9veQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08qBHPBBlMkczhYgj2q/B6OWIajTyM7o5apZtWATbns=;
 b=UYTvSfyPvldHY2kgZfWYN5YLfYz0kvCJgm41V9vrCByC9W+D7giiNSunznqmHP/Ivc6y64TpKJpn9/JVAClyj0bQf2XJxzSPPPplpi+c4Czp7je6ekhY0Kn3ghkkI+THVT3+oxYsnyoCSyM6n5bgY111/ByC4ZU1yMpXX7mW0I3Bv2+5durUbKMuCMhDAndjHzvspKGri+mDW9yTBOPHhRS9Weh5KV6ppABNc7bAhzA0EqwP/Pu4hFFv6XczlgKLF8M4BRBIN2KzRytoz48Sumqiu1udryAcL7R1Fwo0Nbv+Vs27+w/XbZfavnZgxe4/JFaTVqh5neZ0LQ+vbXfI+g==
Received: from BYAPR21CA0022.namprd21.prod.outlook.com (2603:10b6:a03:114::32)
 by CH2PR12MB4118.namprd12.prod.outlook.com (2603:10b6:610:a4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Wed, 4 Dec
 2024 21:25:13 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::66) by BYAPR21CA0022.outlook.office365.com
 (2603:10b6:a03:114::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.6 via Frontend Transport; Wed, 4
 Dec 2024 21:25:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 21:25:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 4 Dec 2024
 13:24:58 -0800
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 4 Dec 2024
 13:24:58 -0800
Message-ID: <512db7a7-9971-4db0-b0f1-f6ecfffabf7c@nvidia.com>
Date: Wed, 4 Dec 2024 13:24:57 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
To: Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>, Kees Cook
	<keescook@chromium.org>, Alexander Potapenko <glider@google.com>
CC: Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Miaohe Lin
	<linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, "Huang,
 Ying" <ying.huang@intel.com>, Ryan Roberts <ryan.roberts@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com>
 <b2142993-e77f-4998-ba87-0d51629c0f6d@suse.cz>
 <2390F919-D502-4428-B8CE-5154D30112C4@nvidia.com>
 <2D6F1B31-A261-4983-B0AA-D45C07E21CFB@nvidia.com>
 <EB367D67-E3A3-4590-A1DF-B1B3204B3F2A@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <EB367D67-E3A3-4590-A1DF-B1B3204B3F2A@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|CH2PR12MB4118:EE_
X-MS-Office365-Filtering-Correlation-Id: 453f0162-a808-4ad5-84b4-08dd14aa2357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHkrK1NTaEwrdlc0ait6QkUyV3pzT2YwMkdlc0lxMm80aGtuVTVqY2srRUp4?=
 =?utf-8?B?M2ZUOG1ZclNBOTRtYlhnSmUzQ211cERKWTcvbFZINGtOdjZhb3U2N1A0NnNH?=
 =?utf-8?B?L2FGazZOcGsxRmJUNDlHYTRTMWFZcndpM2U4cGx2cFBSaWJvOVVraURZclpM?=
 =?utf-8?B?VTJ3RFU3UTdWbk8wTDh0YWJoVzRkVWV4Q3BpUWNJNGN0NjI2bWxhQWx1ZGlX?=
 =?utf-8?B?NVBhSWkyQy91TThvbGd6R3l0c1ZSeGtRbzhzc1F2T2V2TnRiL21yWlZCVlVJ?=
 =?utf-8?B?bFJkTTB2dmpHMzRadDkraGxlZFowRHdSZXZJc0lsdzFkby9LRXkwZ0lYZm15?=
 =?utf-8?B?Mlp2MmhRZW5vQ2lKUTlIU3hzU1REWTBUdTBSUzk3dzQvVzMwcFJsbDQrMExP?=
 =?utf-8?B?MU1iaFNhb3JDMFFjN3k5UUpwWk8relFVeHppRGVIQi9vNWpIczJ1L3hyZ241?=
 =?utf-8?B?My8zd3lXNVdoNHhLVVBzWnMvMUlZZE92WVJ0WW9Zck9FU2pBSHZuQWRzbkIv?=
 =?utf-8?B?c3pjbk1WZlhnL0RNUXUwL2NlY1JURVJ1b3hGL0dvSXljZk9uRGUwK0hjSnBz?=
 =?utf-8?B?Nm9TRDFKbFprMHlhNHVUL2dhMmlXNUVoREVrQkFVZ2hOYW9Ldm5ITENNNS9v?=
 =?utf-8?B?b3NqSG9jbmVCTWxLUkIxWSs0b2hSQW1KT0RvVG1BYWI4QU5seUR5TmpLTjZV?=
 =?utf-8?B?cjFRYmlPNWNQL29IMFhYTDhFMU9pYUZWWHB6V2hnbzNKYmZibVZZeUpUcXBq?=
 =?utf-8?B?S20rU1ZFMzBzUGhGZTlWbENuZUwzb2FZL1BLcWRDZ1lRWDh0M3BHV2hFdGZj?=
 =?utf-8?B?aTlLeXAvSVp0bEdpRC9nU2gzS3JRMWg3NWk4K0lra3d6Rlg3M2hxQWFRUFZK?=
 =?utf-8?B?OHlwUjlhNTNvZ2NCeGYvWWJVK2tMWTV1YVcremh0eVVlU2QwWXJFL2Zzc01J?=
 =?utf-8?B?WGE2OUl4VE0xcUEvcVlPTnJvcmdYU0RtaHN5WFgyclVEMGhza0tiOHpBNWdG?=
 =?utf-8?B?NWNwUXBoY1VuRVpyckxQMUx5YUlCNGRJelJOZ09PcllGTGI3T3JXbWN6L1Zn?=
 =?utf-8?B?NDBjd2VBSXQxMHJpaE5EeE9Fc0loVGhxbG1UaGpWeno4dm5QUEVvMXBUTEVM?=
 =?utf-8?B?VGF1S0hkZkZmcENCTEIzejRLaGF3TWFrK1ZDY1V3NHdKbVdTOThMbFE5bFpn?=
 =?utf-8?B?Vk13WjhjRmsxUzZ5aStyeDM1ZGUxdWV1akRXUExrNG9ON1ZMdVprUjNhM3l1?=
 =?utf-8?B?d2N5MzhyTlhqYVkvNk5pcGgzc0N6ZkZjeHZSM3hyeWEwbVdLRGRTakVIL0kr?=
 =?utf-8?B?YVNObmhDNysrK3RyK2ZRZTR4eGVFWW1hQzIrQUFUMkJzUUxSR1E0UXlORC9S?=
 =?utf-8?B?Z2lkeXNjaU5SMm1iVFVZUEpKUmVHTEsrcS8vZGJHS1VzSmxrQ2FnYlFjSkFU?=
 =?utf-8?B?bGJ1dmhCdFRNWW42VGZkTURQVFd5aW10NnJBRGVBL203TXFFWjBTS05yOFZ6?=
 =?utf-8?B?dXNBL0MyVlgzKzhHSTIvSFdZd2k2b2NlWDI5clhHNENJcmxINkZiUG9yVWlm?=
 =?utf-8?B?NlF3U1hKWTJxM1JYK1pvUEd6Yjd1bU1VSGI1QzNBREFublkvbmZmQ1h5Y2RY?=
 =?utf-8?B?WnRZS2pJUjBkMUpOa0RkbTdtaVJXREFuQkVRZlo0aFBUUUh4VXJXVmp5Vkth?=
 =?utf-8?B?MDhCT0xwTkRoMklaaG9xUncwVnJMVWRZcUpaYktJV0c3S3pMZ21hOWZHZFZO?=
 =?utf-8?B?Rk5BN0V4ZXpsYmlSdXpKTGVJTmN5bVhJWDVFODNXc0ZhK0NVWmpwdlBYRExO?=
 =?utf-8?B?bUczR1FkZnVjakM5UVJ5bUU0UXNPak5xczhrZWt6eXFDOHJNRjlxMnNpMFNz?=
 =?utf-8?B?ZklSQnJHb2xsZWs5aWFiQ2xEVXd5NXZqM0R3ZGxVOTI2eXJPWkxDOFp0a2w3?=
 =?utf-8?Q?K0E3Lb1k38VfmacJzhovm3h061zNykUu?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:25:12.5318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 453f0162-a808-4ad5-84b4-08dd14aa2357
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118

On 12/4/24 1:21 PM, Zi Yan wrote:
> On 4 Dec 2024, at 13:16, Zi Yan wrote:
> 
>> On 4 Dec 2024, at 13:13, Zi Yan wrote:
>>
>>> On 4 Dec 2024, at 12:46, Vlastimil Babka wrote:
>>>
>>>> On 12/4/24 18:33, Zi Yan wrote:
>>>>> On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:
>>>>>
>>>>>> On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
>>>>>>>> So maybe the clearing done as part of page allocator isn't enough here.
>>>>>>>>
>>>>>>> Basically, mips needs to flush data cache if kmap address is aliased to
>>>>>>
>>>>>> People use "aliased" in contronym ways.  Do you mean "has a
>>>>>> non-congruent alias" or "has a congruent alias"?
>>>>>>
>>>>>>> userspace address. This means when mips has THP on, the patch below
>>>>>>> is not enough to fix the issue.
>>>>>>>
>>>>>>> In post_alloc_hook(), it does not make sense to pass userspace address
>>>>>>> in to determine whether to flush dcache or not.
>>>>>>>
>>>>>>> One way to fix it is to add something like arch_userpage_post_alloc()
>>>>>>> to flush dcache if kmap address is aliased to userspace address.
>>>>>>> But my questions are that
>>>>>>> 1) if kmap address will always be the same for two separate kmap_local() calls,
>>>>>>
>>>>>> No.  It just takes the next address in the stack.
>>>>>
>>>>> Hmm, if kmap_local() gives different addresses, wouldn’t init_on_alloc be
>>>>> causing issues before my patch? In the page allocator, the page is zeroed
>>>>> from one kmap address without flush, then clear_user_highpage() clears
>>>>> it again with another kmap address with flush. After returning to userspace,
>>>>> the user application works on the page but when the cache line used by
>>>>> init_on_alloc is written back (with 0s) at eviction, user data is corrupted.
>>>>> Am I missing anything? Or all arch with cache aliasing never enables
>>>>> init_on_alloc?
>>>>
>>>> Maybe the arch also defines some hooks like arch_kmap_local_post_unmap() ?
>>>
>>> But this does not solve the possible init_on_alloc issue, since init_on_alloc
>>> is done in mm/page_alloc.c without userspace address and has no knowledge of
>>> whether the zeroed page will be used in userspace nor the cache line will
>>> be the same as the userspace page cache line. If dcache is flushed
>>> unconditionally for kmap_local, that could degrade performance.
>>>
>>>> As for the fix, could it rely on e.g. __HAVE_ARCH_COPY_USER_HIGHPAGE instead
>>>> of CONFIG_MIPS? That affects more arches, I don't know if we broke only mips
>>>> or others too.
>>>
>>> Yes, this is much better, since this issue affects any arch with cache aliasing.
>>> Let me update my fix. Thanks.
>>
>> I notice that arm64 has __HAVE_ARCH_COPY_USER_HIGHPAGE defined, so I will
>> need to look for an alternative.
> 
> It turns out sh, sparc, arm, xtensa, nios2, m68k, parisc, csky, and powerpc all have cache flush operations in clear_user_page() compared to clear_page() and
> arc clears PG_dc_clean bit in addition to clear_page().
> 
> So __GFP_ZERO cannot simply replace clear_user_page()/clear_user_highpage().
> I can add ARCH_REQUIRE_CLEAR_USER_PAGE for these arch and use it to decide
> whether clear_user_page()/clear_user_highpage() needs to be used regardless of
> the presence of init_on_alloc.
> 
> I also wonder if INIT_ON_ALLOC_DEFAULT_ON works on these arch or not.
> 

Well, I've been waiting to point out that if you actually *delete* the
entire INIT_ON_ALLOC feature, you'd be my personal hero. Defense in depth
is nice, but at some point, it crosses a line into the absurd, and I think
we are there. </pause and put on asbestos flame suit> :)

thanks,
-- 
John Hubbard


