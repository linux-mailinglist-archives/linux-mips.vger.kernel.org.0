Return-Path: <linux-mips+bounces-6861-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DD89E3A56
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 13:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 024CB165CC5
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 12:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4641B85CA;
	Wed,  4 Dec 2024 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gTEdCc7e"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F652500CE;
	Wed,  4 Dec 2024 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733316634; cv=fail; b=GFgQddhKqpSxcvqXPYySg46uq99D73hP8jOVQGdBqTAhoDMeXx25ujtNnVO2VcpSRV8yLksz08Vh1/phzCqsvOxB6DcbQzqwsf2ZxhDmIOMSuJggo7LqZz4Jd5TQW9Nyxv6oRSv81RS0YEMiVABFvEJfx2Qt9oeGrIwaJSk9TXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733316634; c=relaxed/simple;
	bh=ZxFds6qelyan6Xmo9AmRLRQ70OLLcErpJMztN8SFrEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GGpfgOl2bEHRohweRikDiadTnTUmRZ/6XGbqwBsBsVwCu/IJ4XSk3rqLOYogOlwwSQWgZeQXtZFU7jOwUpCB9ipdKTsufxgDnUcXJpnBml3buLLMASUFIhzC2c8AdCbPdQB4pUF7f2BgkaCV0GSu2ZteV6+ZuWqdefgoNtzQBuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gTEdCc7e; arc=fail smtp.client-ip=40.107.223.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n26TUJCEc43aIRfoZmm2o6yyzPrfLRgZ6owmwWcRKoAdxTbQL6PAJQgShK4WhmoTiPE6mhnVyLvUOO55+IjCiTUqSqKxa4CGPCfrZaJLzHCeYPVW6bLXPIPvzflMlxvvrw1QWO5QOTXaAJhgz5BUWuyvfV1n2PqoxNQprN2d/EYOLj37lk5omU5oZ+s26d4jgyuxzspEm65TtSy5Y6bIaM3jk7LzQNVAJXmWmBl5jDxwNvkpcd7D9F8TMWwMfA93egu9eT7BMTJZewFrLpT2CeV6E2gv/ATMK6rjFxRow6povVKU2Gwnk1uT0chZDpqxcXS+nx7YXeQyKnhj8xPA6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhxJIJzTvzTbBWC9jPlXT/maQqRqPje7Rmpm4f69YgE=;
 b=MbzDGHFgaqAUQI9GQz7ZGp9DQm9hoUAagriSfx84KnuPLGHUE5MB4yaKzgGpEd4QdTTDKEoHS+vVHqGbi0X1mXlWUGuTIv+Z2OP/VawazL/IFixlG6bPU9hsxkzvVEXsHTEaTPAVxGcHNuKHModXpaVps9Sm/lq+9Usu0XIPBQlk/+ihxKfcLEh2FaVrzyuWq1H+Bh9M945NEUl6aGnwiWloPnbX8y1oQXR/aHd43vUGgvVfc2vZAbtl/sMM+gZFE83Fl0KA+SwHzrMrbXdzMgD98h4IUTNEckhkL4zrRvsP6S0SqlBTsPngpJrWYTOFYCHN3Y5VYMR57XILmOo6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhxJIJzTvzTbBWC9jPlXT/maQqRqPje7Rmpm4f69YgE=;
 b=gTEdCc7eVX8HxMKOzobMK636kol+IbAt8XuzDT6wlKzQucrEyQjx8Ri/Ge4bfWgu4CB+vg5kGmRtE26az9XeLotoCs07/mEMJsWnFz25A4aSMiPdAAXyAGypYPEFIk+6Ma4jYtbns3EXnxBDBmBrgHojHeU2fnvk2Mhp04TdXcwzIFfUWLBH61fN1VrXTwiMKUfMCkw+j3IsyZ1Tc9uNEju2ZTIaiYTPHBrwuxG+H+WAEsSC81dsen0HT+QNKvX1jrwuEehlafoSZSIfzj9TeqqDIZf/D7AoOSB19x5+RkVCDOgBfyzEOf/Gn3/A7yapX596QmCdURkyNNkV2LzDHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Wed, 4 Dec 2024 12:50:28 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 12:50:28 +0000
From: Zi Yan <ziy@nvidia.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Miaohe Lin <linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 John Hubbard <jhubbard@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko <glider@google.com>,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Date: Wed, 04 Dec 2024 07:50:25 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <89C00242-69F9-43E0-84E8-A4CF8369E86D@nvidia.com>
In-Reply-To: <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:408:142::32) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d206b63-a2cb-4893-d386-08dd14623aab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVB1VXZpTG1YcHpFeEcxWjNYdldOOEZ0Wm9PRTNVU1NMTUZaWWRRNHlQTUNQ?=
 =?utf-8?B?QjhPTngrMkJyc2NKWjhzeC9UenVXeCsyMG4xZnlXaFBhbzFQa1ozRzFhMlZp?=
 =?utf-8?B?VDhCdW5peVk2Vno3YXJUcW1CR2JwcnFoTlg4NXZVQ0Z3Q1BTZ3I3dGxkcW9S?=
 =?utf-8?B?SWI1RGtWM2RwQVJ5WGJWRXM5UWZhMTZTbnl4dHZDUDM2TjAxaE1tMG1wbXM0?=
 =?utf-8?B?Qkh3V2l6M0VEK1JJWnRkWmVCQ3diRWM0ZTg0UXd0MUtYdGpQbkFxYTBxMUpV?=
 =?utf-8?B?R2tySFZSOW9MNWUwczVKSDIwRlZYVzA3ZkpZSEltaFNLbjZKYUV4Qm9wR2ph?=
 =?utf-8?B?b1JhTy9nVUpvbWloNFk3TGhLNmdrQ0E0WnplR0lYN09aVTI0eTZIQTlkcEl1?=
 =?utf-8?B?QlZVRHhkMTE3QzZaRE56VUk0Y1JydzYwKzZ4b1dteG44Yk1xemNjQll5a05L?=
 =?utf-8?B?bng4aVlyVkZGZzk0a0NJdnNtMDljT0FRWEJ5eHUxZHlWaW90K0xOYTdnMU9w?=
 =?utf-8?B?cTFlQnZ3N1J2SmQyRHY0TTh3ekRKRDQ2eGNtZ290bzNpQWVvekhHL2xrZGN2?=
 =?utf-8?B?dWx0Y2g5d1ROUldqa1k2NzV2a0JHVHE2M2hBTDdtRHYydFNJNHZDeEpiaWdR?=
 =?utf-8?B?YnQ3WlhxeVU2ZE1PNWtsT2RMVTZSZEd5ZXZ3b2FHRHd5L2hvUVVxV0Ztdmtv?=
 =?utf-8?B?bytodHpPQUdDYmVoZVNCOGJpSkc2a0xUekRHK2VmbGpGS0ZkK2RiWkp2YWVm?=
 =?utf-8?B?Z3FRdzJqYmVJenczd3prVnNkWTN0Qmc4OGx3RU96VGsycXp1V2I4TGkyVHd0?=
 =?utf-8?B?ZG9TSGIyMExPbWNIcEVLZWljTFJTRXVacUlLTkpnWCs0aXBrOHUzMk4zSGJX?=
 =?utf-8?B?UVlhNldPQ0c0Q3MvZmx0VmhpRVpCZ0lxd1czMjhYdHJveDhCY0h6V1IwYlJW?=
 =?utf-8?B?dURySkFvSm9JQ2NvZG5xMmVhRXRaQTV6VXo3Z1NvM3pKOGN6KyszSlFTMnR1?=
 =?utf-8?B?L2NKU1lETWJUK0Y4UE91SlU1NTAvS3VUYUs0UFlCQmpON1hhdmwxK1FhTHBY?=
 =?utf-8?B?TkthMnNoMG5EU0pyZ1lwSWxzSlRCRW5ZWHpwaUVDUUlab0RTbUFDT1BjMU5h?=
 =?utf-8?B?RlVRVG9EYWR5UlR2Z0tPN1BvMDZhQVpEblNTVUo2UityM20xYjFVSzBLNjJp?=
 =?utf-8?B?QjZmeWVwcmRSbE8reUlWa2ZwUFpsaGpWK1M3bzdwV1YrSXlDdlJvWm4rN0p2?=
 =?utf-8?B?WE01UHhBK3JRSW1qMzBTTjJkUC8wWnNWam4xT2tuTllHT1ZLU0lVdm15ZDYy?=
 =?utf-8?B?RGUwYU8xK2lHc2g4Zml2ZjYxSHROV0dObWxWR1huYzRSLzBFZlROakJoUlZV?=
 =?utf-8?B?QjF0a2o2aUhycHdzZ2NCcUlxYnJ6em9pMDkzRTRHemVGdnkwVVNaeG11UU5P?=
 =?utf-8?B?L3pnNlIxNkxpOXh1VkdPZHh6eTNwNVJ2K0pCbXNiRjF1MmxiNS9IVXkyaXVa?=
 =?utf-8?B?S3pSTjlZSjhycFB2WTdRdHlNU1FJRitLZWd6a3JncjdLK2VRVmd1MjNOZmlH?=
 =?utf-8?B?bDJ5aEJsR1ZKbnBzbkc1RVhBdTlvUzdTV2dVclkrb1lrclQwN3k2UkZEdW5z?=
 =?utf-8?B?Z01IdjdhdnFHbi9sMG5NTExVNUtRWm5YNlozWnBvVnlVbWFpZEpDOVl0a1dF?=
 =?utf-8?B?SU9LRFhHSktPdlBidjd2MkhtVHJqQUp2VVA1MWhtZnZ3TVVKSWxscWdUM1hK?=
 =?utf-8?B?YkFSOGNQMWt5TkhnS0lqQlNyQUdwVGF6OG94V0RNNk03R1ZTL0ZtamJsb1d1?=
 =?utf-8?B?dFg0ZTJJWUFEYjZFQmJ4dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enZNNjBXV0pIVmZ2MFdYYitKYkRyWVp4MUdGOXVUaGVXYjMza3R1R1grUkxo?=
 =?utf-8?B?b3pHb243bmpNV3hyVmd6ZG1ycE9vNHgwQUd3S3N3dHFzd3JOcFV2Z1ZFSTNY?=
 =?utf-8?B?VmV1SEJ5bEpMR1k3aEY4bzcrRHpRWDdORFFVQXg0bnVIUDVnL1pINEVCem9p?=
 =?utf-8?B?ZGtjZmtyUW1RYk5OT3BUdG5MdFN0OHZweGM4d3FscXZWdHdBTmJ1RzBQVzMy?=
 =?utf-8?B?alUrV2hIMlBIYkRMVkpEdWdicTkvb0w5OXkrbC9ZZFZBTzhtMkRiZEhOUm95?=
 =?utf-8?B?Y016Z0FzckEySTM2N2drczBOcUVNdFdtUG0zeWI0eUNFTjhjaHNaWkFpZERX?=
 =?utf-8?B?VlVKYlFTM3FSNXpnMDFYc0pVMHJtb05MakRHMlFVaDJiTFVFRlRubCtQUytH?=
 =?utf-8?B?SFlQT0JPS1V2b2FNVmhHNU5za2d0a3pKSFRJckF6NGtKa1c2NTZLWVlLUnhQ?=
 =?utf-8?B?Y1BvYWFaU2d0bHlSNFFLMXcvaDBXaU83RGhEeVdwa09vTXRyc2RlamZjSngr?=
 =?utf-8?B?YzgrUVZsTHlDVldvNUtza2tQdEtOU3l5RHl2YU9hTTk0NWVrS0J1VjZITVJy?=
 =?utf-8?B?d28wNGdQN0dpaWV1UEp3ZmU3emVBTW9sazZFSFdXaDlNSDdWNUR1bVdWTHZR?=
 =?utf-8?B?cEF4YjRRbVJnemZWRjVjem1MdVI1cVNHK1Z4MW5rY3NYTDJVM1gyYzZLNjBW?=
 =?utf-8?B?UlhxNUhxWGJsWjZXYTlXRlpZQzhyaGYyQTRyTnkzM0hGZEZ2aEFLTjFCdkN1?=
 =?utf-8?B?OGk1WkNtZnkvWmY4ZjVzOXJBL01wVUEyV0Fud1pZVWNwa0hET3BjM1pqRkpE?=
 =?utf-8?B?RTRXcmJWTlJBdkFvU3REODRpajkzSEhiaUJuOWYxRFVuWVRNbTZYMUlhdllY?=
 =?utf-8?B?SGRpTnRqZ2Z0bnM2TjI1S0tnNTFaUHhoWWJ6T05UV1VqQXhGczJORGw5SFFx?=
 =?utf-8?B?YlVBMGtiQTlyUUhmM1I4alF3QzRhYnFXRncyTnViZ1VtZUVpdyswaVJadlBW?=
 =?utf-8?B?WmIzWkhnWWdVTDJKTmk0ZlE0Q0pRM09EaFVmZi96MHVoQkJjVlRIa0YvMmM1?=
 =?utf-8?B?VWRCenluZXZmWEVja1UycHBxL1orQnMwVmhPT1BrblVsVlZoNWxHSEgzVWhZ?=
 =?utf-8?B?bkQ5NTdWS0N3ODYrUFNYMzkraTZlbHBabEJxSnhLdWpCWjJCdE9vcEpoSkZw?=
 =?utf-8?B?eExzYldRaVVWdVdaSERIOXBTc2RYWkdtUFVpNjRRTndhYW1JTkhIQlI5TmYy?=
 =?utf-8?B?RzB2TnJUejhuSzRRVktyVFU5Uy83RVJDd1ZTdGdoeDM4NVVGeWFoRUh0NWhK?=
 =?utf-8?B?ZFNxREdYM2xkVjJVK0kwb09MYkFQbmVWVkl2M01lSENmWHBDTDhlNUFPVWhD?=
 =?utf-8?B?UlpQUUROS3lmSEp4SS81b25GNGdXU3dhNmIxQTdYQVR5czJmUm1XRTdQbXZQ?=
 =?utf-8?B?dE9vQm1FSlBoSFc1Ukc1K3hwVDBDN01udG55WDIzTTBJMkdMOFlPeFA3MUwy?=
 =?utf-8?B?Q3lmM29TQUhRL0tDZUlWd1l3eGdtR1NCcGJLTWh1S2YxVUJTZU00UVV2ZzBo?=
 =?utf-8?B?b0dwUEFiR1NrVkQ4aVpnZkE3eXhLWk83YkQyZGNHZkp5enIwYW53UGFJZFJj?=
 =?utf-8?B?OGRWYjRZR3cycWp4MFZtaVE5T3B0MTZiWisvaXJzWGREZ3NvWXFqM3U5OUhR?=
 =?utf-8?B?UC95eEtqUmROZ1YvWU1BWUxKU2tVRDd2aUxpNmJPY1c4aldnbGMxQzMxUGw0?=
 =?utf-8?B?Q0VvWlZrZllMV3pwMENiODBPTjJ5QkZuRGpBaWVCNTdnblJjb1dtdXVCTXVu?=
 =?utf-8?B?d3U5eVdYcGlydGtjTmMxcEpNZXVtVnovczE5MFhzTndiUzgxNzFlRGRiRjdT?=
 =?utf-8?B?eGt3UzBqczBseUNLVGNDMG5rako1b2VxSHdpQktCekZEaXNBVStUVkNVcE9p?=
 =?utf-8?B?N2VPOEdhcnJQNmNRWUdEZFphTHFnYk9TbTVUaDRuM2JTUjhRaVhzOHI1TERi?=
 =?utf-8?B?eGRQQjhmNGt0YldWN1pRMTFTaWVXQ3RzWGZ1anlVaUt1OWtxTXJWaDNWUmZD?=
 =?utf-8?B?d2RTMTFoWWVnS3h4bmZSVTA1T0NHNHduUkNpZjNCNmJLd3JoamhUZEJtN2kw?=
 =?utf-8?Q?1Sh0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d206b63-a2cb-4893-d386-08dd14623aab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 12:50:28.1319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4J5ixaria9o888Ewgsk1U9TjnUI/E7FV/G/gGOMHE22jv/PD9mshCgrkPXqIDtfq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693

On 4 Dec 2024, at 5:41, Geert Uytterhoeven wrote:

> Hi Zi,
>
> On Fri, Oct 11, 2024 at 5:13 PM Zi Yan <ziy@nvidia.com> wrote:
>> Commit 6471384af2a6 ("mm: security: introduce init_on_alloc=1 and
>> init_on_free=1 boot options") forces allocated page to be zeroed in
>> post_alloc_hook() when init_on_alloc=1.
>>
>> For order-0 folios, if arch does not define
>> vma_alloc_zeroed_movable_folio(), the default implementation again zeros
>> the page return from the buddy allocator. So the page is zeroed twice.
>> Fix it by passing __GFP_ZERO instead to avoid double page zeroing.
>> At the moment, s390,arm64,x86,alpha,m68k are not impacted since they
>> define their own vma_alloc_zeroed_movable_folio().
>>
>> For >0 order folios (mTHP and PMD THP), folio_zero_user() is called to
>> zero the folio again. Fix it by calling folio_zero_user() only if
>> init_on_alloc is set. All arch are impacted.
>>
>> Added alloc_zeroed() helper to encapsulate the init_on_alloc check.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>
> Thanks for your patch, which is now commit 5708d96da20b99b4 ("mm:
> avoid zeroing user movable page twice with init_on_alloc=1")
> in v6.13-rc1.

Thank you for reporting the error.

>
> This causing a panic when starting userspace on MIPS64 RBTX4927:
>
>     Run /sbin/init as init process
>     process '/lib/systemd/systemd' started with executable stack
>     Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>     ---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b ]---
>
> or
>
>     Run /sbin/init as init process
>     process '/lib/systemd/systemd' started with executable stack
>     do_page_fault(): sending SIGSEGV to init for invalid read access
> from 00000000583399f8
>     epc = 0000000077e2b094 in ld-2.19.so[3094,77e28000+22000]
>     ra  = 0000000077e2afcc in ld-2.19.so[2fcc,77e28000+22000]
>     Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>     ---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b ]---
>
> or
>
>     Run /sbin/init as init process
>     process '/lib/systemd/systemd' started with executable stack
>     /sbin/inKernel panic - not syncing: Attempted to kill init!
> exitcode=0x00007f00
>     ---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x00007f00 ]---
>     it: error while loading shared libraries: libpthread.so.0: object
> file has no dynamic section


Do you mind providing the full kernel log for this panic? And your kernel
config as well. I am trying to figure out why changing page zeroing from
twice to once can cause kernel panic.

--
Best Regards,
Yan, Zi

