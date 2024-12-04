Return-Path: <linux-mips+bounces-6870-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0C29E4203
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 18:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40297B48375
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 17:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80DA227BBC;
	Wed,  4 Dec 2024 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nugn7Ek5"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1232A227B88;
	Wed,  4 Dec 2024 16:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331525; cv=fail; b=aNs2DbPEflIu1BaVGw2Tza0GPplPF9RSp4jvFCp1kLlBDV10Xxdb7IKispM83iVZMK0nLvWGOuVR1JlmOeXEmUjMbErwkxhk5AnPS4N8uI7XdQ/pz6qRqD3CMlJ4mwP348JZamO4+V/rJRLyb69/cI2mTfPD85AzD7V+rbLvjCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331525; c=relaxed/simple;
	bh=1fl2cSY9XGd/VPlxV6tzeHR+eyYidgaVf6r2hLkEqT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oMaRU99ZGDdjtdkGbpvNPtEprvDDgUfseJDDLTWqBOvzxsM7aq3bigmX0bNyjKg3+IF71C11STzw6QVcUSQkDYa/zgccyAmQk3+I3aF5Kz3k4vThwjU1y/pIM/+/q29kOMaTzB0hMzmXpvTTvKrGoCOqtIampHXYJjsIX+SjJkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nugn7Ek5; arc=fail smtp.client-ip=40.107.236.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UN0sZ67O8sD0sQQ30pKsZKOsMlgWAoWV10nq1xirzVHQ5CwHiRLtxNArU/bQqsyN98nlXcAsW8Kf1iwIaMBFwzDjwArrA9hLfx+tEXwpPg2w8bXmke4EkPnCuvXrKrXESuHA3FAjd3TkXNZbk/ObbVPd1X1hp4wGjSLZtL585PE0gE3ECSJ5T1YKLxRnTFRau+MZCW8vDXSiT7HiZP7MaudqnqBrMiGmR/K1/ivkxNCjRJeijVw4jWL9d/AXWZI6efCuzru983DjsU5vk3UUGpDmGO/CGfT+tCE9e0mEj6H+w6TgC97E/hAue0Xon74syfwPcsSJQ7NHCR0y8e44lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJKHBtl62rTFPrqHryGAMV9RQFxQhTf+Y4DYORnKaWg=;
 b=g7K0fr73ukhAOfYxgSzhZKsWRVJjGhpbn/5SA6Iqmuj7w5gvqjXHaBIaegIbreehs+sxH2c6GD1Vc8xwtIM8OQ8eSfhr/FdlKEQ401Tilg7f7+IAHbDh+hW/80hpyHI1pUdZrlkQxYOQSgHLblpSAh1qloe8dh1mtkGleDpb7i1YtD8b9FklMB6R4l0B8ixQL6C+qyIUWocarNpP7RAxPOY3fdaHaHp+75V+43sxm2ZCQWNcC6Ra3uF8z7pdHT7+5jEW8jH43fXUPshSLWnhHFCaJEkxrXCAegAnkCMmA7hunXoSSE+u2DDEyXgoWqpsYsKFeASK3ZpQ0C7k87wnMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJKHBtl62rTFPrqHryGAMV9RQFxQhTf+Y4DYORnKaWg=;
 b=Nugn7Ek5MPK3IPjsSkVHv2IIgEwzNB96nqYF9QYCXHolMB8QfLat8fJGsUluXCWUQ3UKkuEaONAOA6sii45jxER+aBlmKg+D3PF2f3lkdyun7dtElTSx+5zyk3Od165GFch9ZHLK20tojjQqs5nWL72z87gHzBa4Zo+TgEpuLHcf6I022GSkuuRriLeV6wQxqEA3tdsF2jBjPSAQrJTejB5y9Pim5/5b+I74eznfOvv9qCap7dC2glV8VMW56v7MqEk779ycoCQcMGlQJB4YJsV0hiy78KUUgVFER1Bdu7dDhEfASbaEJwwwPeYOfXNh1kUdrr38zzFlG0U6VaKotg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB9249.namprd12.prod.outlook.com (2603:10b6:610:1bc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Wed, 4 Dec 2024 16:58:40 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 16:58:40 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, John Hubbard <jhubbard@nvidia.com>,
 "Huang, Ying" <ying.huang@intel.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Alexander Potapenko <glider@google.com>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Date: Wed, 04 Dec 2024 11:58:38 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <B65776A4-D434-4D9F-9C42-1C45DAE5A72A@nvidia.com>
In-Reply-To: <Z1CDbrrTn6RgNmYn@casper.infradead.org>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0430.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 224d2a84-bc0a-41e4-8e50-08dd1484e709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sci28EfTZlOdAdg9auTAyaDzIZz6PtHsnviGea8ELYzwdHQZ2jaOa3KMbSP6?=
 =?us-ascii?Q?7tKiudMVcytnXO2wQg55cW4KEIlRoDn+FMa9Fot29vwbb9N2tRWWRvKqUrSI?=
 =?us-ascii?Q?CUZpU8fveqBF9l3nON4VU8d1lAuupnJy7lYW1rRAqiXl+qQeydanBm/Oq6Oq?=
 =?us-ascii?Q?Rq9MHebhgBqXMXY45LnJCiZax2a3DTEpBq9AQ4GJdte2HS5YIM5Z1ct09Aya?=
 =?us-ascii?Q?qVamaF5Sm4arjmr34tm7+ks7oUiNmfiB/C6mguRyuSxi3P7+jsVRsnW7zk4M?=
 =?us-ascii?Q?gDX0v181VOLu3NrkyCYkImKBdvBXJFKOOJITiZOFxe1Ksd0UrOHmNjw1MvEe?=
 =?us-ascii?Q?faGuHPInT2Qd1urPgXSml64F18xuRwGddO6IFqOmEx0jGAOOlC8CzeJS1e6U?=
 =?us-ascii?Q?OCFVQ1fYcqCUpNqmGh95megCDCCvcD3zUjiWda+8kcOH3/MKbhA1Ae3q6gDY?=
 =?us-ascii?Q?amnXx/uV3Hu2RSGN5f/ig/SPTzo2on0w9O4qW5vumQDPtoXJF9HuBzZ3Xdul?=
 =?us-ascii?Q?XX9ML6dne+yI5R2Ry0SJ5EtjvBrR0p7HaXJMbBtZBeFof8fhoalKYpMVEftB?=
 =?us-ascii?Q?lmgWULK75MxpI4kl/E8OWeV64sWyI2j6SUsbhe7Ja+iv4IhxowVdoNogzlOC?=
 =?us-ascii?Q?gnZ1pNI+Ze1GCF+wnlNl5Ew2Z3bZGK7Akyr7rLTkm0jD0cPJ529I70xYKBPH?=
 =?us-ascii?Q?sWc7XARxBH9BCw07rWxCbXrtykNsarEguEkVWO2Ho/fw7JvHKXtHuhkfPx8y?=
 =?us-ascii?Q?KrvBAhkGKbx/XXzKBF1237R2flIU5D91+Is5tUg/MfEzZT6SO6rx5E+S6iAu?=
 =?us-ascii?Q?NEBZa9qB8Ls6kzofOuiPEKnAN/huJXLZN2Mueu4BLK15QHyPyksJ5TKrigey?=
 =?us-ascii?Q?2XeglLaGVKxH+KK5Abi7YyJr7fe1xqf2SumeEhVZxzm6pWCgOaIFsbFawmmT?=
 =?us-ascii?Q?bkC9W4DOG+UmXVTwCalVOhesM04e9iLYqEEPreTjsf9IjVovhy5xQNOJP4SR?=
 =?us-ascii?Q?Dhp+Pd5jUwbkY3Tk8tk5JWxwcQKxKSx9SZTd1tf3JsMTRLO+wDuDJsNxbCaw?=
 =?us-ascii?Q?s7yAkU0G+QnRyxhqeRhQA51y9PeYHmGMa5bmKRa0+pzeaeVSIF/xC6rcuIGP?=
 =?us-ascii?Q?G9UAIihacxy/ue5QlmIAYVKEqxYQ6co4A1em6I8j8aC/qPqemVjWQRBPfoT5?=
 =?us-ascii?Q?ga+Ndi2koy5XvTi6dyhlBjENo4W/UWaz7dMqkXM7CmC4l8fLbRCyiFukBBf2?=
 =?us-ascii?Q?vr4V9I5pzS1SaiEsSU5sr8t/MoZey8T1OAYXGoESeoJ0A4kBhnQAP3vb36sq?=
 =?us-ascii?Q?o5CIqi5Xb+/iF5PRxl4zbGlUUXwFUN7Yp0FjMdYE1qKEog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?igi3uJ5ZpRoQIU0YC+vX8Ob/VHojrbBMT6VZXqqAtVo/fk3QLkDOQCXHPlDo?=
 =?us-ascii?Q?onLfE0MGWkAuLV6mcO6QCgPcaToVYH2AtPDQ3u2djw5pyse4NcyEBYy7l4UG?=
 =?us-ascii?Q?ce9ky6LAUvkX+/CB09fOpfd3W02S5rjwsXsFwFUChrviwTOGI5FrEgg9ZQBk?=
 =?us-ascii?Q?rKp6Xrl8nY8hnZVAAb6xSsdPacSjpv8K/Y6mG0yR7aCZcxktxpzciaWCoR1r?=
 =?us-ascii?Q?m909xai3DstouAyKhAY50z37LyDrq9s9iimLzTn/QvVCvwob1ko8kVOHGIDm?=
 =?us-ascii?Q?bKm8h3ei8GaApNj+65FfWBTBMq7z83JsUe+iBBM5bNkHhqJMtUKU2elHyWWZ?=
 =?us-ascii?Q?jzfQaQ/cncBxdevN/332PqxBBlxTB1K5cIjiYguuz8Is/7ZkGTDIC6sgmDZr?=
 =?us-ascii?Q?Vvx4r8hzht1UVM4oQvDxzSabEr8nNVHysJdeABSIqZgb6q4cbHn8tf+9pohx?=
 =?us-ascii?Q?BF+hrv/VPoggP80me1SgbVD9ggW30T4Ia/l8+quqV/LR7fT2wx22II3h0Pyq?=
 =?us-ascii?Q?cAhuoq0nTOZ+FBo4PzPVNYpUMVDllVim4hcRho9f9udu7evdQuOHSsdrEJBX?=
 =?us-ascii?Q?UwLhz+Did+yx84RoOecW7wsq4zG3ESE7n6MzcCq4QkPShgEd5KFlfp9sycUQ?=
 =?us-ascii?Q?2IRogVwe1t9rt6YRZ5NmLJn3kaoOTXgGDaoBQSaD5bqLwGoS3qDQ9qFiC8a3?=
 =?us-ascii?Q?VZifh5/Odj4kbVpjI0SVaYSTvVoQG3xRtcxqw47SQfdokTgXjSElNXT+mFL3?=
 =?us-ascii?Q?KnSFSEEay8yaScb/2AnfPFMPUUDtze9CHhTNcgrpSXnIsSv7iLw4boGN4KuV?=
 =?us-ascii?Q?StN1qsW3lDSgGXvVpmMS2wwKZO3CgHXQ5MWAbQX4IC5ibKhUnucg5t5sMbhP?=
 =?us-ascii?Q?bSl+goHGjmrX9cqhsuozDtJPg5ngQxuU+YhCPAttMRd87qo41sPExn9B0Zz0?=
 =?us-ascii?Q?qKkU/qfR7Kchv5yPvRrjQ9OiW2BlkjZVjD8tpZXJO1Yzrrj7JCWyYA+gDrec?=
 =?us-ascii?Q?sD5X5IoRZZXdxEnZuuf5FXQCGWiTQjNjYu9aOT01Yb4A6qImTgzbbUh7gxmc?=
 =?us-ascii?Q?rH038gKjFcut6zb8/lYDmhAnR7SFmXeUiqTUGpJvVk3KAneqtW5bo+goVUsj?=
 =?us-ascii?Q?9G8D6b9HnoPSDumLYikI4+Jtx7gmwODiQVc4ODxZbix695HAOJmfkvho6pBy?=
 =?us-ascii?Q?cthYB94G2uEw+HKg/ojElSGic5r07IX8sIw2KVc2Q7rYQHW3qKotiwmDF346?=
 =?us-ascii?Q?++KrU2PDQPsNdjs6M87CApG1uNEwS+jkwtvY/0z1cV51+HHkt2hSExK75V0K?=
 =?us-ascii?Q?WD9ioKm/HB49fkOouBsTtBj9ZtAEa2+6V9S5D/zThRf2ex66uPJmViFvlTaz?=
 =?us-ascii?Q?ghnu7xp1/Z007BAaOFnRqm8BLpOMj55U6WgbNrVUPzE0VPT4JQ5k8JvhQGiz?=
 =?us-ascii?Q?8WWTJSBVFOtr+HN3ISXlUpI8MrjxaEAQKM5ztKNwRcT1LQ8wv/BGGYch67SP?=
 =?us-ascii?Q?AbDQS0cStiDNXWqS4BizV+U7cnTv1t+cVFxEGqEhS6kCtiGn6evQOZM4T85N?=
 =?us-ascii?Q?LlC9zXgOyBJLUdkFK9rjJfRMS7pKhM7vGuAER36/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 224d2a84-bc0a-41e4-8e50-08dd1484e709
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 16:58:40.2144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdCWt9yfXFPqbZiaujnI8DWj85yLA/Nn+D/rEgTrn5q3VwNFHMtYaNUcg0ZjVPJ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9249

On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:

> On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
>>> So maybe the clearing done as part of page allocator isn't enough here.
>>>
>> Basically, mips needs to flush data cache if kmap address is aliased to
>
> People use "aliased" in contronym ways.  Do you mean "has a
> non-congruent alias" or "has a congruent alias"?

I mean if kmap address goes into a different cache line than userspace
address, a cache flush is needed to make sure data is visible to
userspace.

>
>> userspace address. This means when mips has THP on, the patch below
>> is not enough to fix the issue.
>>
>> In post_alloc_hook(), it does not make sense to pass userspace address
>> in to determine whether to flush dcache or not.
>>
>> One way to fix it is to add something like arch_userpage_post_alloc()
>> to flush dcache if kmap address is aliased to userspace address.
>> But my questions are that
>> 1) if kmap address will always be the same for two separate kmap_local() calls,
>
> No.  It just takes the next address in the stack.

So this fix will not work, since it is possible that first kmap and second
kmap have different pages_do_alias() return values.

Another way would be to make a special case for mips, like below.
But that looks ugly, let me think about it more.

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index bc3e3484c1bf..ef3c6f0b9159 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -95,6 +95,19 @@ struct vm_area_struct;
 extern void copy_user_highpage(struct page *to, struct page *from,
 	unsigned long vaddr, struct vm_area_struct *vma);

+struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
+ 				   unsigned long vaddr)
+ {
+	struct folio *folio;
+
+	folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
+	if (folio)
+		clear_user_highpage(&folio->page, vaddr);
+
+	return folio;
+ }
+#define vma_alloc_zeroed_movable_folio vma_alloc_zeroed_movable_folio
+
 #define __HAVE_ARCH_COPY_USER_HIGHPAGE

 /*
diff --git a/mm/internal.h b/mm/internal.h
index cb8d8e8e3ffa..d513fa683aa3 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1287,7 +1287,8 @@ void touch_pmd(struct vm_area_struct *vma, unsigned long addr,

 static inline bool alloc_zeroed(void)
 {
-	return static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
+	return !IS_ENABLED(CONFIG_MIPS) &&
+		static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
 			&init_on_alloc);
 }


Best Regards,
Yan, Zi

