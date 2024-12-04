Return-Path: <linux-mips+bounces-6874-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C509E4317
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 19:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB4D288A86
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 18:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D0323918B;
	Wed,  4 Dec 2024 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o/a38iOH"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FCD239180;
	Wed,  4 Dec 2024 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733336044; cv=fail; b=Rugb90fIfeavrmrN4gEYAW6ULt2ftB9TYR/glo+ar9OkPj/EOma92rzw92v5yo9akDWzFE2/X0fvBBxSnoKtE9GXryu1Hc0jhLzmBaKLgrinF0pvupz69h49tF2xbVkWWJASfLewjUsWrpHaIXoqJ/Pt4CEcK3hscmLFyzXgB3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733336044; c=relaxed/simple;
	bh=c5ACqlbgC7zu6SjTpMzH2b+UIadP6NmcXqINmfwGW4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A7bvX07udEtf9g2GY75rAhurBUZ+tcp1kDaCfSD6fpicRPw9zVbRSiRsV2RSdBokAHbWA2pdOAlodmlzZAvBlSv2OFg+B5wajnyJbDg46CW31+Dtdoq80upb9al6NmDbtFFCj0gnqzec6PqSA20LMxQ0KNYpVJBQMouoY0zFyYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o/a38iOH; arc=fail smtp.client-ip=40.107.94.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EouwS47uryqbZPyY1Rh728R9/yRVw9d78vesc+MtzpJLSS8JbStQ+10R10Imh1DixoCWzMuvDHLdtGQkgzqtqPVDPKAgzG3sD0nZ+6Y40dYYlreZg4XpK1VtgVY0d/f1Hzi3qv04MfSgnwJPdWWqu0zLSAmMiT7OXI3m8kt0pnBJWwr92p7Em/IE8+be25Jy1VZXMuQb/gw0lpo/aNDiaAeXAk4bpLiUFat0v/dPtkBLpI6OEBkuD63tpGWuSRBJNqERj4UAa3o5zCk1lylNQzgRo6T8qStG0XQx50v+5NvaP83iatacikLyYEalDi6OTc7irIBH8wLUI5wh5IS2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CmM66vtSqxOjR2yHWqd/ep1yiaZIO+/6NMkmo35A1U=;
 b=Dw6dvoEIKLJAjKfwJ4oVlvvGYdjMl4zea7L6v0sMwS9ytKhPmB8K/s2L7tikh4GZvj/YwhQmuSIb6QQ4E6xOOrEX2fYPjOERsjqXBZzalHLg0sV/xqT+uOT2UO9AejuPjN6VoH2LC4ab5E0tLKBagaGWfMwsoWYH4hCealG1C8Yb1xhQ4FvJwi7d/IZlBPgb9wuIMRS/FrI+h2rJ31ftWiCi9Ty0RUI2s/LamRDQ4v5SvkHxUXrMOglFhf7NfHDwA4W+bw33qPYbyzVojV31Zr9NHcdLkyk8H/kMiuJ79bkJHcwI+MCaHXXl7Gfr3OSQZwOxKvf0DzZeoL337zx6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CmM66vtSqxOjR2yHWqd/ep1yiaZIO+/6NMkmo35A1U=;
 b=o/a38iOHthiJRnowAmIYwBwFPFxmQIymZmjHe28VM6j0zAjlJAYvjeeyLX7LgNfWg1e/R2/fg/tnCK7cLEuGewmhJDjYOI/L4vp0VUXX7U/agn169+E8xTA07jZvhOoNHrLWbIQ+IKlWVsuZY3U15ln2eud4j6iCUXvewqzEj1e4NdCm7x2ETEmXZLS/qqfQJCVpVquY5qyfy0GjrM662juiAHjP4l5tlJlzyNkTwxBiBLz4+7jM4cw9same0PJMlg+60j7G+G9d8ou0eJ6whci63vTeqs1wLmAUfFuAI1llpQJ9bVWbY/rOkPAAjQ6Twberf1iusn5sGBu2lKF05w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY5PR12MB6550.namprd12.prod.outlook.com (2603:10b6:930:42::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Wed, 4 Dec 2024 18:14:00 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 18:14:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, John Hubbard <jhubbard@nvidia.com>,
 "Huang, Ying" <ying.huang@intel.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Alexander Potapenko <glider@google.com>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Date: Wed, 04 Dec 2024 13:13:57 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <2390F919-D502-4428-B8CE-5154D30112C4@nvidia.com>
In-Reply-To: <b2142993-e77f-4998-ba87-0d51629c0f6d@suse.cz>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com>
 <b2142993-e77f-4998-ba87-0d51629c0f6d@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:207:3d::37) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY5PR12MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1ffdff-e9d6-4121-41f3-08dd148f6d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDZWU09ON3Rrd0thZFA4dlZWcGRtVEdwMERsQTl4YVVIS2dZRm9XcGVmYVhT?=
 =?utf-8?B?SEVqQWwrOUlyTmFBZklqZ3BSU01Wc3ZHRjhXbEpHU1A1S0ExbEFDVkRqeUZE?=
 =?utf-8?B?YUdXRkp4Y0lrZGFGWlRiN2gwQ2Z1K1RUZzVOVG1QcHFXR3pSeUpmeEdISVRy?=
 =?utf-8?B?cDhubmZtbmN0NW9ydFVrSVNNM3NmOTc5MWtwQnZ0UmE1clZOMUhrdTZuVVpD?=
 =?utf-8?B?WGx0Sm0vV2FzMXA3b3N1OUxWdFVldktST2dYVXFJb0tFMHNGT0x1K1htMGdt?=
 =?utf-8?B?SjlnV2U5MmFxY3RuUHVZQitTQWgrWGlqZ0NmYVZaTnAyR3U1VHdxUHBVMFNp?=
 =?utf-8?B?S3lCcWp4eEdGVityeTBacHR0bFI1UzVPMXg4Y3dUd3Jsb29QeUZFeVZ1V1hH?=
 =?utf-8?B?L0EwY3N1aUZ1NXAvMmtDNDR4NkZVSThCNHRKQmhoNCtlbEt0MDc1dUl4cHQ2?=
 =?utf-8?B?N0NFVEJWZGVlY3I4OC9LZnJSNGg2UTVLa0FiV3l2aVRJcjFKeFc2d3A1RXp2?=
 =?utf-8?B?SC82d1RZeFZic2pReEx3UVNkREFKT2VYVVh5QWczMUpiRDJrUHJtdjJDZnRO?=
 =?utf-8?B?L1RqNjl4Tk12andFR2FHOXFGb1BhQVlkbzdXVWJHSStBWG00SzJ6TVFWbTRs?=
 =?utf-8?B?NTFVMy9lc1EzSVBIR1RFWWd0ZHdzNFlHNzlOQStqaEdHcnArTk5zbmxYMEZV?=
 =?utf-8?B?ckdCRGVaaWZaSkpNTWE4SU9La2RBcTdnbUVJeHlrTmtYcnprcjh2MTVFSnBN?=
 =?utf-8?B?M0xPU1VrM2pvSnpYUEIycnd4UEw1QVB0cWkycDlRMTNIT1dJU0Jocm55NkFF?=
 =?utf-8?B?N0Y2QmJjV0FkRmtPUzNFWmlsNmd1TVlQNmRMOGtvdkhFY1BxT1ZyRzZUUWRR?=
 =?utf-8?B?MnQvNE9WZVdUWHZxdGI2TmtvNGtmbyszYUJuSXBOVEdlUTdHR0dSU3N5RXVZ?=
 =?utf-8?B?eFNSbCtlS08vVjhpOUFSdWVqaVhXK1RQS3k1UzR5aHVrVXdNWDBkdFViZEJo?=
 =?utf-8?B?enFJNmRFN05RWm1HTC8xQ05YUGdPQ0J6dFE3K0dnNm1JZEZIOVFnRGRvZStt?=
 =?utf-8?B?WTIydC9PNDVmNUZ3T3I3M0srS3R4YU02Rjh0YmtlOGtDYnI2SXoybC80ZDVa?=
 =?utf-8?B?enJ5WVR3UjRjWFozT0FnNDAvZnRFb1B3cjNaVDRHMXpUNnJHTmZpVzluK3hv?=
 =?utf-8?B?ZlJlRWM4QVBtQlJ4eEVQZ0hvbGRKM2xCQ1Y2SXU5MHpCU3RpcmxxZHhIYng1?=
 =?utf-8?B?ZGVwbmd2c0FPcDJRZkVFMTRKRXhITldOeEFCQXlyM3pVMkd0dkZnU0p3UjFI?=
 =?utf-8?B?VHpZbjRENFdVVEt5Z0ZOT2NuL2lOcEVjRHpOSk5COE9wQzh4VjFZUUFrdWgr?=
 =?utf-8?B?TXBpZUcyT2tqRE5mTTJKVnVYK2hQQk5jTC92WENVRTVMU3JmT2E3SlNlWkV1?=
 =?utf-8?B?U3RQa0dLc0xtbE1QT0YrblRHeXY3NytCYU1FRzU3YUpTTVNqOHY1VU56Z1pL?=
 =?utf-8?B?dDNDcTJyYzRhSWNGQit0dDkxR1JqL2tvMWUwb1h3RVpjSmFyQmg2dWpmUzcr?=
 =?utf-8?B?SzluWDJQWkx5eHhmem5lWjM3blY1aUJtaGdQcVhidDBCZ3ZtdEJ0QlpZdFo0?=
 =?utf-8?B?ZzNPTm1QWlBRODlwaC9xSUlLSG9HajhESVhBU1p3c0tuTXA3cFQ5cW1tMGh6?=
 =?utf-8?B?OWg0U3RnUjhUQlE1U3UwUTUxSUhBczR3dkQwQlQ2M1hOWG1jZWJPOTY2S1FM?=
 =?utf-8?B?T3NiazFJc0tyUHJ4WW1RTmtDRy9LNnhCcXRxem91c2kwSnI0YXZISFZGcWdl?=
 =?utf-8?B?Q21kUVI4eTdraEhGN2EzZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3ZIa0FMM3lmK2Nid1R0MXp3cXNQbTIyUjA5M3FwekNjMkpBTmdvbVdwNjcy?=
 =?utf-8?B?K2tqdkk4MWw5Q1crb3pVcjhZWC9ENVh3aHZ5ZVZnWVBEUU5DTDJpbW1ESnh5?=
 =?utf-8?B?Q01SNG4vb0M3bkhyekpBcHk0WFVsSlYxUEc4Q2xwMkhiOXI2U0czMkFzOFV3?=
 =?utf-8?B?QXpKa0VHQlNPVWN1UTUyTWtnek8yS2xkUUNncHdsQnY4cEN1Y3Rpa01sYVRy?=
 =?utf-8?B?OWVRWmVtUlNoL2dCd29wMnM0YUUrVFZ5Z0xyUUNmSG5UZXdvMGJXbVpXR2pi?=
 =?utf-8?B?b3RYMmYxUzhScFVMZHdhVGNXK3c4UnFoS0RSenVtZVUrZjJKM201bFZ3QVVY?=
 =?utf-8?B?dEIyZWI2RW9XT3RhTXJqcm5YNWFDMHF3czdoSGdIK0RSVHJVdlR2Wk1zYzFY?=
 =?utf-8?B?WDAzclJLQmxVOWorMG1aRjl4WGxNVkVWS0lVbHFjRUd5dUQrOEptVHJReWNa?=
 =?utf-8?B?UmpTOUxsSU1LKzBJZlpSRFJhNTNWOFlqbHdZNUJ0RTVLS095ZmFQL1lGWlB1?=
 =?utf-8?B?YzZrVXFMenlWakhQOWVmNlpsSXlnSHMwUDJZWWRQaVRXc3JrSDdpUXpwYlFm?=
 =?utf-8?B?WkZITjI3Qy8yQmx5NEYzS1R2U1lqN0pYUmJRM2g4bUpsdURlNWhDQlZkTklz?=
 =?utf-8?B?VVQrQnRBZjEvUXQ5Wm9IYWhiRUgxWUdGVDJhTFN4S0NnWDhUakR0NE5ncHdp?=
 =?utf-8?B?MXdVVlRZVWlOODRJNERSOVNDUjVCOWNJcFFpYWRtcHFoeHlmRnYzU1F2eWdy?=
 =?utf-8?B?bi9sUmdPamlsZjd6ckRHaDJtcEJMZlE3SDB2bjFyZ1NjcXcrNkhOd1hoeWlh?=
 =?utf-8?B?UnlPVXVNTFNmb24zbGNFUlZNc1N5OXhDcCtYV0pOSDl1RFJhL0taK3ZtTThp?=
 =?utf-8?B?NWVXSURtRUEwQ0JDRnVqTVZKSHZCKzY1dWFDRkpkZ2hpN2ttY3E0ekl6Y01V?=
 =?utf-8?B?bzR3aFRkUDJGWmtZZmRZWTBTNDNyNHZJSzVndXAwcjZYQS9NY2NGUU5VZmtr?=
 =?utf-8?B?dVNPZXZWcHNpRXZQcEFvWjhWR1JiSzFzY3ZWTkcvNkNiUjVCdzdwLzArMXQ4?=
 =?utf-8?B?cTl4bzlCNU5rTWN3S3lsZENMZTB4OVA1K1hrSHpXQnRiRXhEU2xkbzhQYSt0?=
 =?utf-8?B?RkdWVGpiZUJNODdaK0h6OWlqWUVuWXV6Y0ZldnFjNncvTjNaZnlwd1hRMXpx?=
 =?utf-8?B?L2JFTlZkQUF0a1RTa21ZWnJGY3prWjA5bnNHczZUR1g5bXl3NlVaR1dxM3dW?=
 =?utf-8?B?Q0hFQkZPa1ZvYURmZTIwOW1wSGt6TlUvdVVCWjNwcmJER0dTdXB0cFpaLzJ2?=
 =?utf-8?B?S29EZWpHamczMzFEdi9aLzlzWjZCODRaQkpQQk1JZis5WjAzdCtxM2Ryc0tN?=
 =?utf-8?B?UG8xdGQ1OVdzUGdEQkJFTVJoYldWNE8wa1hBQ05CMVhVWm9BOXRVUzR6QWdi?=
 =?utf-8?B?UnBwbGFLNGIzQmZNSnFUYzhDS0F4QmVVd0hqeGFHT3NnbUNXK3Mydm5zem5H?=
 =?utf-8?B?Q3RSaW8vNDdTbk93Q3RMMGFOdG8rQ0w4V2lSc3UvZFZsa1pFaThiMVg5bXBC?=
 =?utf-8?B?bkZPd1grNisyRVJoZkdTdnN6UTJaUGVJU2o3VFU4ZXlsK3QwR2xLSGxYd29R?=
 =?utf-8?B?TjllRzJzYjJuMmFZbFd4KzhiMmZwYWV3bEMycGpia2VuRVI3VlJMTUIyN2dX?=
 =?utf-8?B?Ky92bjN2VG9ib0l0N1NqWGdVdmFJaHdYTTRkSElWbW9oWjBLOEovaHNUYjla?=
 =?utf-8?B?NVo2dmxPSHNPTG5Iblg0Y2pNKzlacFJqRTQ4LzZSOWNsL1JablBSdkdnZWdE?=
 =?utf-8?B?UDA3VW9SS0RUbjg1bVBqRXlza1BQYUdFT3ZpV2pxeE5TU2JrMTRTQUNtMHRi?=
 =?utf-8?B?cGRYZVZScmg4b0V2T252YzJ6YkhWdjM0OFZzSDM4alZONUl4N1k5U295NFZS?=
 =?utf-8?B?K3ZGN0VDYWk2UU91ZE9ZVlBZNStlS3ZRanRTK0hhNnZjMXkySm0vMThHQzNR?=
 =?utf-8?B?dDdmUklYbzl1SFpreFhnZldmZUVROWE3S2lQT2ZRaGdZMG8wVGlGcFJCMFRO?=
 =?utf-8?B?SzUwVEsxM2wwR3ZUUWttdFI5djFncDlXOTJPcWhZQnNzUG9MWlBpZk13T0JV?=
 =?utf-8?Q?lTEAoBrWX2L46FffdqHzSQdtR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1ffdff-e9d6-4121-41f3-08dd148f6d0b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 18:13:59.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nk1obsVc5uEh7GIqP+DpEkP3fEaBNFR9I8Zs6Mi7l8KR2CMOTRl9yrulPX8D+4+g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6550

On 4 Dec 2024, at 12:46, Vlastimil Babka wrote:

> On 12/4/24 18:33, Zi Yan wrote:
>> On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:
>>
>>> On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
>>>>> So maybe the clearing done as part of page allocator isn't enough here.
>>>>>
>>>> Basically, mips needs to flush data cache if kmap address is aliased to
>>>
>>> People use "aliased" in contronym ways.  Do you mean "has a
>>> non-congruent alias" or "has a congruent alias"?
>>>
>>>> userspace address. This means when mips has THP on, the patch below
>>>> is not enough to fix the issue.
>>>>
>>>> In post_alloc_hook(), it does not make sense to pass userspace address
>>>> in to determine whether to flush dcache or not.
>>>>
>>>> One way to fix it is to add something like arch_userpage_post_alloc()
>>>> to flush dcache if kmap address is aliased to userspace address.
>>>> But my questions are that
>>>> 1) if kmap address will always be the same for two separate kmap_local() calls,
>>>
>>> No.  It just takes the next address in the stack.
>>
>> Hmm, if kmap_local() gives different addresses, wouldn’t init_on_alloc be
>> causing issues before my patch? In the page allocator, the page is zeroed
>> from one kmap address without flush, then clear_user_highpage() clears
>> it again with another kmap address with flush. After returning to userspace,
>> the user application works on the page but when the cache line used by
>> init_on_alloc is written back (with 0s) at eviction, user data is corrupted.
>> Am I missing anything? Or all arch with cache aliasing never enables
>> init_on_alloc?
>
> Maybe the arch also defines some hooks like arch_kmap_local_post_unmap() ?

But this does not solve the possible init_on_alloc issue, since init_on_alloc
is done in mm/page_alloc.c without userspace address and has no knowledge of
whether the zeroed page will be used in userspace nor the cache line will
be the same as the userspace page cache line. If dcache is flushed
unconditionally for kmap_local, that could degrade performance.

> As for the fix, could it rely on e.g. __HAVE_ARCH_COPY_USER_HIGHPAGE instead
> of CONFIG_MIPS? That affects more arches, I don't know if we broke only mips
> or others too.

Yes, this is much better, since this issue affects any arch with cache aliasing.
Let me update my fix. Thanks.


Best Regards,
Yan, Zi

