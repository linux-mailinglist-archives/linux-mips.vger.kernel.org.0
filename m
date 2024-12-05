Return-Path: <linux-mips+bounces-6895-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3AB9E5D6B
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 18:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58C36280DDD
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 17:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB5221D595;
	Thu,  5 Dec 2024 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="niHr0vfN"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FFF21C16C;
	Thu,  5 Dec 2024 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733420309; cv=fail; b=Vcwtccbw60hVTlEtZlGwAWeBLoxBli/UzPFZyemR3PPdSXqbDl4D79ZN8B1TykDsVeemMZZHMhcXpoz203Gpyfwv56OcI6npKr1z3BQ21FM0oJN5xBlzX07AdV2Cf/t1vh23Zy5MMa73DcVRsJ/RM+MUB4GN+5FJoG1aPqapnKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733420309; c=relaxed/simple;
	bh=CgCpMMJIO7fjMLPFXRsOFuB7oEAuYvhTDlIMCoPtylI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p+3YbEoz+HC52Q/dVGDj5DMHuOivWD7/mzERRYLwvmc3OnMMcBA2SRXJUXGCJWqktP1HNQuDv180V0bL/AHGCvbwx/Qflzl+YUMY0BEihh9NusmkDr52ac8HLSj+nsIDzc2UfexeMpjjmZyq6fbS0v5fTbj58vwmzMPIvYIkaMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=niHr0vfN; arc=fail smtp.client-ip=40.107.94.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJC9PfV+K2Xlypn4mjSCaH6JjLTLJKd+BCzS4iR7g3ng59IA4aHGORTnZil3aEnLAaPOo0lNc8nf3DQKakVjl7smyXzEpRSH1Ojmn8vN1v7OuJ3ei8SLZgRZYRQozC1jgonKj/ek8j8yWp4edoQUnECG7BzqQQrVtLcR5AG5pbL75u8RsLuIqoYQ4ubiPudrkPDR1EQkRlIbS0ZZAeEPa3nXGc286YKcbYcHPaJWJg43a1CkmwCFJW1Ubaoo8qBCgtbEf4Y2eIUjxKh1NWrFxjirWFbmIWDCkDwoRtgvCNG03Q9UZdh7dwmoUdGcI8wZu9VgI3IjpqE7amOJirkVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgCpMMJIO7fjMLPFXRsOFuB7oEAuYvhTDlIMCoPtylI=;
 b=sF0bZvBhOfyYaC+UhDF48tvPnnLuKP+HNJsmk8bHIivUpN1CJNDTMZJke2Gz6d53XvoJLqUk/1c1SFeqSzSNeCRGxGVzpgLpmQoSSZmtSgAhd7wCXeRA0n+Q9Q+IgrY4CEn7UW6WZAzQJeexAG5MUMjlXyPQSY6/FPuUZdndqvkYBSssF2jTA059d6F4uUc8e0PNdyNoFZfEHm1kCIy3Ln0JO6ddMrBk4lapNHDrnwlaGYPLpdaxVE2gXAb+WwDGg683l4xjj21azfComJe+swA6XSCDvyhqP82EzCld01pkiS/XDYKwSCfrrs0oxPLVY93KBLTqeFldamFiRcihvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgCpMMJIO7fjMLPFXRsOFuB7oEAuYvhTDlIMCoPtylI=;
 b=niHr0vfNCtnClH3VHRMueSUQ575TH/OXoq0H2oHZSiaeqyvKll17jDQIOLyjrz7T4LHFfcp3bZ9qbo2AJ8vr3H1ADxTdqInuyL6l4bbQgtwR6xGBx0JRrvt6jIdtoXG4HhBv2D0XFdGVzNnREOIV7vvNNa/GwmhyF2+zT3iidnAWOlbZ7k2RJcsy2VMAol3CskI6YNeDWzz3hUdLUAqz2dQRmapVsNJ6f5E8tvyZMvstSPWULNGLajRhRIpN1n1vNp1qRVhSc59m1OKXmPshs+AVfOyMdbszIh0aSShUuD9Bq6B3tRpPVmbRxspiz7/6jEHH9CzBv19TBmPkTFpEXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6075.namprd12.prod.outlook.com (2603:10b6:a03:45e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.17; Thu, 5 Dec 2024 17:38:24 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%3]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 17:38:23 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Miaohe Lin <linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 John Hubbard <jhubbard@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko <glider@google.com>,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Date: Thu, 05 Dec 2024 12:38:21 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <9812FEF4-73AB-4B83-88F8-EC21BE37147C@nvidia.com>
In-Reply-To: <434596ce-5514-42f3-84f5-f8a70954f058@suse.cz>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com>
 <995E365D-5B83-41B3-A46C-6493D203A761@nvidia.com>
 <CAMuHMdW4=HScVk2C+vkG_JqO9uMCF2VoJTuGqSi1-H=86e2RqQ@mail.gmail.com>
 <056a2305-db07-4168-868b-164493ff8587@redhat.com>
 <F3805AF4-1660-4CEA-868E-2D1F4A70BCB3@nvidia.com>
 <434596ce-5514-42f3-84f5-f8a70954f058@suse.cz>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::26) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ1PR12MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 2febb473-62d4-4868-1613-08dd15539e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5133njcY6x0F15ezZwsRWiQZngy3+TbOt3asbCxBOZydbh/8yzI8FupzFQqm?=
 =?us-ascii?Q?JfRRJPbhtHRVcJE1KuYe+bQOBnmiVO1zo0U631FYBNIxKxxae/5JZXWqv1nb?=
 =?us-ascii?Q?HcMF9RhDK0tTZLj1nmffvCwRaWRbaq0MahJFEss/bIqt2Liwrd9iNMs8eH5P?=
 =?us-ascii?Q?aa4JeIpob+RBAUjlaUY6Q7z8TqRzLQbno1FVUGSGpHu+TuBtSd5enihBs/AN?=
 =?us-ascii?Q?nvJdvjOkKMEHnt1mNLad0dmCdMmWuXGKDCb8EC0EdRMGk9sTA3i80CkWLROi?=
 =?us-ascii?Q?HsS76c8ecsVyfEKmTXmhmZI2K2lRPI4QZt50qf62C1E9MgkczuvMaeBu8KkA?=
 =?us-ascii?Q?cUxuTDqlEI34zpYR7UtyrXEZ1dxTDO5t1j9AsK2RMAbNr5+CkmYk+Vl4dkXG?=
 =?us-ascii?Q?ZGzjRW90vqmwMLT+iSiDJRYVMTh6tve29kR0def8dmeQ63RNNqg/VNnlZLH8?=
 =?us-ascii?Q?eSGOLYEfa4v8WQBW6bItLlWX0iCCHg3x0cJDpOh68QeYWT5jeYedOBBSUP1H?=
 =?us-ascii?Q?sIAvJGZnUxhnsNF+mBTF//6uqNN3SCf0ik7hZTZvVlrwQxGTcmir3WKNn2Z4?=
 =?us-ascii?Q?onkEWTTjxWjU1FKepKSGG3CGlIjq3jS6W2o68XHZPHHdajLwKtG+DPeoQrKe?=
 =?us-ascii?Q?N0p5VLO3O8swRnCgTez9FnhBu4LjZ67jreFKiDGx1lHeAZ0md5BwWzryVTJ9?=
 =?us-ascii?Q?w+8ws+t+Oi9sWMU8ymF9486T7iNCDrVmvUAL915v0HgYSY4GOKmCGt87Uddc?=
 =?us-ascii?Q?CqK+fdQttlAJ9SkKBS4Kuy5NntX88080dsL+v5YtebVbxEiHCuV2mb+Du82S?=
 =?us-ascii?Q?ZwMs/VW1YZ09grbhroK3o6wBVm/LhRlvfZoqpm1D+CcwgGOLrJnFiAgscwAI?=
 =?us-ascii?Q?7OcgaP/kgKA5BTd4SiIJtJmM9yHhYV9mMh3gxJlNbRoy90tXITWpJpgzFK+p?=
 =?us-ascii?Q?blxMdVTGIhBT6Y35rpnjsASJb6hvtZwSYoDjlWNg8rg4cEgxY/Vqr2nfcSUj?=
 =?us-ascii?Q?9qw3CE1AIDMRl8NT1+5WmXbkYTmeQKqpJuNmVP4YgJZH9QSXTPzkvyqoCpPo?=
 =?us-ascii?Q?8ZDHYhjpuzJdBcUgO8NuFr3T68Gq+FYcrA/L9ePAxS1I6Bt1EYM5ApeyXJEj?=
 =?us-ascii?Q?CF3z0TjNpOf8+3RTx+VU7vM6x1ecCiOp1M7baaWNwguOj77hlvaUKSSzDZ+y?=
 =?us-ascii?Q?bgR6OpPYxTDrXDwAn1k96v36T7/bP0hfr4dmXrNC3vXMVmvnvTeNGHujPkHZ?=
 =?us-ascii?Q?f0OFRtYf/qZvWLxMf8qJq2VEhkNnQRpPnsZLv62JnBnzXElzxZAVqTs5Sq1f?=
 =?us-ascii?Q?qsnX2OKr9vDEoCjx4KnMP5iYOstdHAbQPWBtB8eN2DYBNA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fhu5fKmzF31wHzYMeZHKawfOc3NSmRiwaGBTp8KpwplOMj8KhMLeIXs07e8t?=
 =?us-ascii?Q?Xt9/KkLbcz871s1PeZA7tYAK2USJHGh5I//Z53DyFXSgwyPqaGD35hnj00tk?=
 =?us-ascii?Q?l1nym5weVCxcD+Jxo4y6iFiF3r18TKfLUbcXbh3+dUR/5wrN7SuaNLdvGC9S?=
 =?us-ascii?Q?a2y23pzQqFCHobgXhjfkBu4LIF3b7HEXROzQuSRfpRAHYooev9AX8ULjNCVi?=
 =?us-ascii?Q?Sr0O+xqnFADtYNKX6r8vFBQjOQ+jJY0Mr+DnnpJA4qguJT5bqyDQKpTeuJQH?=
 =?us-ascii?Q?zxBsxQ88ugAnc78GYWVQUNcC/9BNJ5Wgk/2AvdvYprxBpv8OZwq/tX2W9f7t?=
 =?us-ascii?Q?/VRgYMOKg+Ow/cbhQsz4tdVhbJ65FSYfXs00VK+JTm8vPa6oVi0CQ6NwXbCZ?=
 =?us-ascii?Q?q7aVKgvFAEgSuDm8vovdwWYwC2E0YcVx9FOX5jWx+wK3DJ1yALB1V/r447pY?=
 =?us-ascii?Q?H4b+rELoS5iPE4gtS/O11aPoxqdNi6h2lSWlAB0SyrevPfX9jBiKEP1nNPbg?=
 =?us-ascii?Q?6MEFRvosrd0Iop1WG91TESlsUnqatclbpjLqFb8x+Ojopoxios+TBSJjyP0e?=
 =?us-ascii?Q?lvDsIQxPqrAQ+5IeCffFtAZ0jA92Bbqs0lLqRIxZcsKggr0JZnSFuYD4fkLm?=
 =?us-ascii?Q?d3VZ9+1WLzl3i1Ikf2IL9KRfbGShvS61uIezlT0bJAhTarCDDQ3IQLtELGe6?=
 =?us-ascii?Q?xzH0sTbq28D8eTs8X+KUGF9+tmD7bb1ZU3NW3hVc3yg5zJFKDeXwl1/YoZmw?=
 =?us-ascii?Q?HuJ/wip6NOinyBMz+1PaPt8SDZ1BXg7zrNbvgRPXyK92aaHgATttwJHF+M0d?=
 =?us-ascii?Q?szpVLpPnJIBsdgbFmJGAw+x809i42rw7PAWYYQc8bPmmtEodNSClpuNeYIJd?=
 =?us-ascii?Q?otGIyYdusaXcaEzGAad4tMDhqXFmpLXGaIcU/9EA3Prpo4Alef+eTPUxeX0W?=
 =?us-ascii?Q?WPuDK57m59rXDrfptryToKMUv9bNtf+gD8CbvBTptS98Tc/6RQ1jr0QCJYTY?=
 =?us-ascii?Q?vK6IVYlf+8n4GwicPWG3WOXEjbnxEalErw+yoddzsE7sXeexC6q2PZzkrgBQ?=
 =?us-ascii?Q?ioSF9WexBCjK4N1b9LmnPBB1kZj26ezBRveiGOos3CubRvEM54l2IfnxCtJS?=
 =?us-ascii?Q?ValpbNzLCmeQSdcasLkKPUxSLl4Ai1VgFHnqV4HU7B1GqHcgGTr8/IgMmCCN?=
 =?us-ascii?Q?0cwUe5NINNTZuU83fwusql+mmguEN0phkcQISNqJc77b69Ms2g+aHJH6akn1?=
 =?us-ascii?Q?BNe+xUx5c4tINtxvVo1D7fbU6D2au7KZUICOaDR4eRpJxUcQlRdiZ0GdXBBc?=
 =?us-ascii?Q?iwSbTbeExo+diHjybL253gfUoukR5Pb3RrFio1C4JQFTHeb80g9qtQ7/V+Ro?=
 =?us-ascii?Q?DAZz62eO3n1W4SWMx/0JECVFF5RxV8zC8LJoeHnGJpm9rffOSODtKWeUibYK?=
 =?us-ascii?Q?KmFy78+Q/3Rhsx/9ozHHOjEdARyI0xxTHaBNfxAiagNewBEhZPWIoQ+S/y5Y?=
 =?us-ascii?Q?A8RZKBiTb7rULZ0VohOYidlaL4WYTlZ5V7KX1sOdXg3w1v3XR783FocGp/ox?=
 =?us-ascii?Q?Y85Xdr3BD62bww1gBu3O6eqS0pGpisLeHdQ577Df?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2febb473-62d4-4868-1613-08dd15539e3e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 17:38:23.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5IzyHtaQV2T20DhyYsE53OayDg858PguAD060/uZplfLEkiAF+XvpofZpoUSzS+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6075

On 5 Dec 2024, at 12:24, Vlastimil Babka wrote:

> On 12/5/24 17:05, Zi Yan wrote:
>> On 5 Dec 2024, at 3:10, David Hildenbrand wrote:
>>>>
>>>> Kernel log confirms it's enabled:
>>>> -mem auto-init: stack:off, heap alloc:off, heap free:off
>>>> +mem auto-init: stack:off, heap alloc:on, heap free:off
>>>
>>> If I'm not wrong that's expected ... because we'll be double-zeroing =
that memory, clearing the cache :)
>>>
>>> I guess the question is, how *effective* is CONFIG_INIT_ON_ALLOC_DEFA=
ULT_ON on systems to prevent exposing un-zeroed data to userspace, when i=
t doesn't end up doing the flush we really need.
>>
>> Hi Geert,
>>
>> Is it possible to run a 32bit kernel with HIGHMEM and
>> CONFIG_INIT_ON_ALLOC_DEFAULT_ON on the machine (of course with my patc=
h
>> reverted)? Just to check my reasoning below.
>>
>> Thanks.
>>
>>
>> Yes, it should work, since I forgot the actual issue is HIGHMEM+cache =
flush, not just cache flush is needed after clearing user page.
>>
>> For arch which needs to flush cache after clearing user page, with HIG=
HMEM,
>> init_on_alloc first clears the page using kmap_addr0 without flushing
>> the cache, then clear_user_page() clears the page using kmap_addr1
>> with cache flush. After returning to userspace, the cache lines of
>> kmap_addr0 will be evicted and written back to RAM eventually, corrupt=
ing
>> user data with 0s, because no one flushes them before returning to use=
rspace.
>>
>> For a proper fix, I will add ARCH_HAS_OPS_AFTER_CLEAR_USER_PAGE and
>> make mips, sh, sparc, arm, xtensa, nios2, m68k, parisc, csky, arc, and=
 powerpc
>> select it, then make alloc_zeroed() returns false if
>> ARCH_HAS_OPS_AFTER_CLEAR_USER_PAGE is enabled.
>>
>> If my reasoning above is verified to be true, I will send a separate p=
atch
>> to disable CONFIG_INIT_ON_ALLOC_DEFAULT_ON if HIGHMEM &&
>> ARCH_HAS_OPS_AFTER_CLEAR_USER_PAGE.
>
> If your reasoning is true, wouldn't any other user of kmap_local_page()=
 of a
> highpage on such system also leave the cache unflushed in case the page=
 is
> ever reused as a userspace page?

If the page is written and no cache is flushed, yes. But if the page is r=
ead
and the cache lines are clean, no write back will be done.

I wonder in what scenarios kernel writes to user pages, besides copy_to_u=
ser*(),
which should handle the cache flush.

Best Regards,
Yan, Zi

