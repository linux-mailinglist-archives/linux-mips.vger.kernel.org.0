Return-Path: <linux-mips+bounces-6875-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6679E45EC
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 21:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8451B2CCC7
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 18:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD1218452C;
	Wed,  4 Dec 2024 18:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UR4kd4d2"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1748F239190;
	Wed,  4 Dec 2024 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733336184; cv=fail; b=kguUlFBf+9y1x+XniXMx/5hLlmV6h7ChCrSHJK2O2TwGiKMhUTH42fN2owARmCYhaz2sUKqZifdQgrOi8IgujRTAV+HUP1dbPkSyf+GFH/tKcivnUjVrYV071POqRku4kbf9R2uoBJiwGFml4W4LBMFH+zdMWXQ1J3icUknD0RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733336184; c=relaxed/simple;
	bh=3l8oKeYvXOJTV7kFvD7V6NcyP3kvVe8TpaQVoHbr8BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JLB+/g23pcsatyaUwlf2V8AqbebuQSdj7rly2UcPm8oHRItgLfWR08olJvM3hx38p44H1Uf8+XT6/qpK64uvnbJtfjNyavT7bsv4OUe54Kf+tNTb8rUBpqIQ8yssevUXg6vw+egrF8hbY8Bxwun2bkThAkaaANJJAKeTwU55yNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UR4kd4d2; arc=fail smtp.client-ip=40.107.94.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwK1G7PkcSfJbeoZncxAbTNf/QbwTcIbP7+GBeOj4L9nlKab8w+X1nkgFtaqOZGi3QmHCBM//WvIuSqaopdV6RrRDYG/V5d883esj81HMpe21suidY+zedhyUsPgIbJcolPAdya5zaeGuwWefYp+/bqJIeIEVJQzHcMl3Y5NeeLxpCR5kjsuB3eknTJ26Nox2OVgfSO4oQIZHQ43EER40QdAsRkO+K7eD8t3lfGTT/Jf63Doy00GRS2oX+RDU8q3XZXO4qshzVHI/Odcx9fwARIOxjwLWqXh/vvJLc/6MoumoDHQxF1ycTt6DpucoWvUTZDonjJ65TBmC3vQvij6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2Az1os5Ok1D5jCTIoinZXy1w7rJqczrkMPTeKI/ZB4=;
 b=N57/V88DBveuWh/E7RGFR960eSBbwv8HVwFDXWtB4xtv9oKK419cJLQsP5MTCld1DV/+t289DUgQ8Bgjh502F2rIZH7vbY28lxxUSO8qbHg4B8RPkUF3Iq7EZQhAIJe6qqG8MUnEacm0UkNuc1hBpaEvr3AJoPpe74dq2ej5+ENbxedRrdbF2tF3BTBk1vvusPSHEh8aRhUrytzoRU4cxPni56lCzkUu9dr45ij3uGDejMt89K5un3WSyYK9yrDULUp2FxiRDU9P1AbdwYCOIQdg8hq/yPBOPZPl5uL5fbkYlOxZjDdAvOn6dBMKp6XnIuRsfYVU91AI9MooD6ZWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2Az1os5Ok1D5jCTIoinZXy1w7rJqczrkMPTeKI/ZB4=;
 b=UR4kd4d20ara00MssO0TsNSwqLAfVfn7R/G6ziHBB29lQKhtDJTQvT0KQOxBYlXk1pbVBx+BNpm5MFuzPmVun9peeggLvDO9p1Mpo3KXSOOLaFX541V/KDeINEyxaKIibvJeodAqm3wYzvbvyHt8RHE9R0qh+PGxxaEG3431JuLbXdUaGN5nD/0LqyBhdvpJUlEupgV3s+vvHrYIjGInCxVwbQUv4r0KL4HaJKqXLvXzCzx5eFQdVPIVfDeiqsZbJc7rOm+eeW8z/eQthyr9pIUSn3tDpX1qAimupRd+kFU5a36RegHcYQRBaSMzTrD5RwZr5e61gK0u8B0HILhPgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY5PR12MB6550.namprd12.prod.outlook.com (2603:10b6:930:42::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Wed, 4 Dec 2024 18:16:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 18:16:19 +0000
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
Date: Wed, 04 Dec 2024 13:16:17 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <2D6F1B31-A261-4983-B0AA-D45C07E21CFB@nvidia.com>
In-Reply-To: <2390F919-D502-4428-B8CE-5154D30112C4@nvidia.com>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com>
 <b2142993-e77f-4998-ba87-0d51629c0f6d@suse.cz>
 <2390F919-D502-4428-B8CE-5154D30112C4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0013.prod.exchangelabs.com
 (2603:10b6:207:18::26) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY5PR12MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: 469658e6-970c-4877-019b-08dd148fc03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eURuYVJFQ2lteDQyQlFSeFFEak1CelcxV1YvemZVSXZ6RUdmT2JQSU5TWTR0?=
 =?utf-8?B?R3JKQ3NWaVFYbUNMSFFsYmtpYWlENDdpUDkwb3FMRDllc24yNmpOTkVEbVlD?=
 =?utf-8?B?NDVBQWFnTGpvSDdkVkgveXI5bHRhaWg1SGF2YnBucGxsR2R3Q2dZbDV3L0NG?=
 =?utf-8?B?ZWNPTUJrWWJvcUQ0Qi9KUk1kRjBwalh4ZG8vbU5OMW9aZWRvR0M5SitvTjdG?=
 =?utf-8?B?R0JQNUwrdDhwd2RZclVFRHhvYzg2akxoUUxnbnhibFgwVENsbHFXS0UyMzE1?=
 =?utf-8?B?ZGM4VlZJVEUvT1lINy9mdTdLSXoxQUtHcmxod2ZiWE83OGsraDRWa0V4OW1C?=
 =?utf-8?B?UEJGa0xWMnR0TGdveDFxZzZ4ektCUnN6dGtQdG9VWjVTdEJzRGVzQ3ZCaTR6?=
 =?utf-8?B?dDRrZHFxZ0ZMTUZjTUtlUS9IU2RzTENiZmJaWWUzNW9FL2ZpaEF0d0Z5SWds?=
 =?utf-8?B?VENJTXdpNnhTalFnNmovRmFLc0ZTTTdDcEJkeW91WXdkNTU0WjhueEk5ZHNL?=
 =?utf-8?B?VkJsUHNKKzZmdmU2MUtoSkZxN3g4OG5ZQUxZYTNyVTZ6OHNsSGN0NEJoNCtu?=
 =?utf-8?B?b2NuRXJIdkI2UEYwWWRsTmpsVUd2YUlFRklqOWlzVmZweE9ZV0pJaUcrV1k3?=
 =?utf-8?B?aThCWklyL3pHcVQ3QXlyTWI2OFZGY1IwSjJTNWtvL0l3aWJ4U1hhMFRvMHBz?=
 =?utf-8?B?V005Z3l2R3FpR0dBbCtlejdQWUN3VFZxUzY0WkNOQnBqVWdGalc3VUJyKzdM?=
 =?utf-8?B?dEZERWUwdkxHQTdyVDFTKy81cjJKSGJSQTg1TTgzdmpqTEN0RUVUaG1nNEhu?=
 =?utf-8?B?Nkh5ckV0aEVac2tKdXpGbHFzQ3hRQjVmamxoWlUxMTRmVVNBdmdZaEg1SlNx?=
 =?utf-8?B?MlM0dnNSSUtKOENJazgrQkFTbGJvOTBtYmxKR0Z0b3Y3ZFVxWENPMTcxeC9F?=
 =?utf-8?B?dlRCZWlwRk1nOGtBRnY4N2hsTzdsUVFTWGNINjMrMlBFZFhRV0FYWHd5RFB1?=
 =?utf-8?B?YnBpQlBwOFBEVTNFb0pmMzMwTHFNWjU0cG01a1pmSU1ESVg3T1lJRXBFcDBL?=
 =?utf-8?B?RGdMN1pXVkloZVNTT1RyK2N6TisxUlVSNzlUQy9ITS84UVlhMEw4bzdOTENy?=
 =?utf-8?B?SHdyMFBnSTl1Y1pPOTNLWnkzSHBYa1NXdW5QRHMwM0tMeXZOVEVUVW5FeXU5?=
 =?utf-8?B?d2dBcHFNU2FzZUlqZFNUQjNCb0IrbkR5Q1NjOU5zSmFsclZ6R0NiWEd5WDI3?=
 =?utf-8?B?OFFhekwrQVhhUkNsZ2pTOHp4VU94d2lqVjZjMmJuamxtRE1UMEwzQjBqWElv?=
 =?utf-8?B?Z0pobFFYR0haNGF0Smw4NGpqenVZckhIcEZBbFdTc2VxSHZHYTUxZllxZitQ?=
 =?utf-8?B?czhobGZlN3JzVFlTSEtMOGNBaXhZanJUQTdTM1BPMXptMDlVVVYrZFpFUE5a?=
 =?utf-8?B?YTlQYjUycGNjQ0dTMXdnSFVNTkdBZzRadDMwZndoS1M0VU05Z1JYazNld3hG?=
 =?utf-8?B?SGVsZDBodDJIQ0V6TFpSTkpmelRNRzJGZi9PZU9MbHNRRC9qM2l2bGp5M2Rl?=
 =?utf-8?B?TG03VVJNdng3bkxOekFaUHlIbTF2YTV6M3BMRGJVdkduaFFhallDenBUcVRm?=
 =?utf-8?B?NmRObGNzaGd0T001VzlBMkFiZnZBeERjZHlFSXhpYi83Vks1NEdlM2o4dGJU?=
 =?utf-8?B?d2dqY1dDR3JhWXlBN3RqcEs0anZUaXJ0aGtyeE1iMzFGMlpYTlBsUmlqREVo?=
 =?utf-8?B?K04rSjBvWkx0cHpjZlhsVC96SmxkeXRGMHFPUCtzcG1zY01TUzY1MHBoYS8y?=
 =?utf-8?B?Vmg1UkZWbDB6VFBZVXRIUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0dHcGZqd3BtQVFmQklyU3lJT29UN3RqT2UyTkhzWUIwb2VVUk9DU3V1dWdM?=
 =?utf-8?B?WmEvMzhlUHNiTk0zMHowbVp2bUF2VmZaZlI0bkVoeitYRzJ2ZXhSUEMxQkFk?=
 =?utf-8?B?TzFPSHhtRWtvSy9aRDFWWlpBNzVwZ0c4SEllMTVzbkcyZG5Id2R6UkhJeDRH?=
 =?utf-8?B?Wm1BeEMvbDdFNlRuOUM2OUtYcGpVT1huUzBkT1FwY3I1WkdsMWlNR2llK2d1?=
 =?utf-8?B?bmtjdVR5NXg5MHdwTEVSK2NnbDZzS2g2c3lGZkNEdFJzL256SFJ4R1RONU1l?=
 =?utf-8?B?RXdGYXlSb3pESzRxTmVreEIvOVRWUzg3cGNGanh2ZGtmc1NVd1pCcVIrQVd0?=
 =?utf-8?B?UTZ2Z2Z0dGpDMXdmVWczZjdwZkZUL1NUOStSckp3RkNBUGVjWUFsUTg5OU5Y?=
 =?utf-8?B?WXN6NHdBdjlQSS9BdHZVOEZvVVZkMGJ6VUVieFFqSHhYQnhFODkrY0w5SU43?=
 =?utf-8?B?MWs1OW51QTVUOW8xMW5GampPeERTcWc2UWlBZWgzcUU5UmZpaDVNVEFlWUJ2?=
 =?utf-8?B?dmI2Q2RiKzNPaGVOclBoYTRQRDNKVnI0Y1lVQVZqdmxOVnBZNSs2UVNiaUJz?=
 =?utf-8?B?R3JaTlF1QTA4ZVNUSmRDTDZ3MEpQbkQzR0g4MnV0MDV0Ny9DdXZlSEd1RUg3?=
 =?utf-8?B?andPa01rVFJ3eXc5eXVXV1ZLN1g2S1dsUFRmTFFKeXVIbmpLR3RnQ0FGc3Vk?=
 =?utf-8?B?RE9FdzRhV3AwRGRuaHVMQUJacmFsK0pUWDNVaWVyZFdiZVVlblV3Z3haMXNL?=
 =?utf-8?B?NTVLSGVMSklQYTZVdUJNTHV6UjRyUEJvNEczS29hdU8zRWc2ZEtJcjZ4Y2Jl?=
 =?utf-8?B?ckxsS1VMTEo1a0JoMEpNdmppOXZRY0JDbzI2SGU5ZTdwekNIYm9zMDZ4N3h6?=
 =?utf-8?B?cEFqazdNNW0xNWhwYjZteWZvSTZaQi80L0I5N1hrN1NCNnB2d2NNRThUWHdo?=
 =?utf-8?B?dmJ3MGJpN0d6MTFjMW5udlNKY1BxU2JBRmduWGl2RytuYUFIVEhnTFd4YjZt?=
 =?utf-8?B?N1NDUnZXOEZOYkovbTJRMDBodzlCUUJUa1lqSWVHdCtobWV5MzZUTjNpWGZz?=
 =?utf-8?B?Uk5mNWJ5UjU2SDBoZERzUlVhUFZhMk5MOGNBeDQxbFhEaFVXcmM4NjRVdHh5?=
 =?utf-8?B?aW1ScCtxUnJvQS9wSEh1eFlTMUoydSt0K1NQK3BvWTBFSXd2UDBLbEtsaEJi?=
 =?utf-8?B?Slo5TEJHOTl0aEZCOEgzQUYxNjRVV1Z6bFhINHF2RTZQRjhTWDB6SUZtaHJG?=
 =?utf-8?B?Zm5wa0lGVzJyNTI1Q25zZjFxaCt5eUNMRzJNam9EUmJ1SXdlUldoRzZUZzRG?=
 =?utf-8?B?RWVudkRzWkdzY21ENW4weDFsZnJiSzBPU1dISWw3L1pDU2psNTVNUVI0aHdq?=
 =?utf-8?B?NFh3YnVxR29kQzF0RTJRSkFSQ0xmdWprbUhLS0pjVnVXNVZuNHJ4RllSUnpj?=
 =?utf-8?B?RFEwV3lxZm0wRWNGR3NzRGxpNC9wczlQaFBheEQ1bFBva01hVmQ3ZnZkY1JJ?=
 =?utf-8?B?TG5rME0xeUo2eW5Yak1hMm45OVdvbk4vUDZRcjIzQkYrZ2lsRk4xN0UrVklD?=
 =?utf-8?B?dTNUbDdvaGJDSEJZTExrWVhhTVhnY0VKNmdmczdjcGYzb3lZaC9ROTVSYkFW?=
 =?utf-8?B?OHVhbU1MdjRFMWVVc1hPY1hLYXA4QUdyYi9Pcm9HeERPZlcvV284VnRWczJx?=
 =?utf-8?B?SEtJM2ljY0tjZGVRL1k3MFZLRWx3QzE5Z0d4NzlIekorV2JveXpxSnJ3NEJk?=
 =?utf-8?B?TGpuMVp3ckluTlpBNGFxdXBtSTIyb0VTWEl6K2doQWFFN1RZNHJWd2trTlpr?=
 =?utf-8?B?SFNLV3pwcnlvSFE1cDM4RHNTL0lYWCsvMEpZdm4vWm9vNlVPeWZWRWhlM01F?=
 =?utf-8?B?NjdyWHRKRUd0QW1BcjVmcndQeDBkdFBScTFNRWdpalp0cnNzOUVkcU4wUTFw?=
 =?utf-8?B?Mm1qWDB4czd6YXNFL0d2YXFzRjArWW9pcUlMaWZSK3BzdzhHNFd0YUNHOTM3?=
 =?utf-8?B?bWovcTBZUnJyV2FrYjdFQ2YrTUQreHdTSk5sZzV2UDlCdHRBRGFTVTRub1FG?=
 =?utf-8?B?Z0NsREI0YWliUE9PMmFyVnk0bER1TFMrcGR1cTNGNTJSM2E0d2lod2VnaEtI?=
 =?utf-8?Q?muz673OJgq5p1IoHNIpRHgcQM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469658e6-970c-4877-019b-08dd148fc03d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 18:16:19.5635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxlJ/KCI/TOpC5srC0DGR/kyDf2VyXW6Uw7GUeOHRlHJode5AZtm7ZJ4EnazXBd0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6550

On 4 Dec 2024, at 13:13, Zi Yan wrote:

> On 4 Dec 2024, at 12:46, Vlastimil Babka wrote:
>
>> On 12/4/24 18:33, Zi Yan wrote:
>>> On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:
>>>
>>>> On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
>>>>>> So maybe the clearing done as part of page allocator isn't enough here.
>>>>>>
>>>>> Basically, mips needs to flush data cache if kmap address is aliased to
>>>>
>>>> People use "aliased" in contronym ways.  Do you mean "has a
>>>> non-congruent alias" or "has a congruent alias"?
>>>>
>>>>> userspace address. This means when mips has THP on, the patch below
>>>>> is not enough to fix the issue.
>>>>>
>>>>> In post_alloc_hook(), it does not make sense to pass userspace address
>>>>> in to determine whether to flush dcache or not.
>>>>>
>>>>> One way to fix it is to add something like arch_userpage_post_alloc()
>>>>> to flush dcache if kmap address is aliased to userspace address.
>>>>> But my questions are that
>>>>> 1) if kmap address will always be the same for two separate kmap_local() calls,
>>>>
>>>> No.  It just takes the next address in the stack.
>>>
>>> Hmm, if kmap_local() gives different addresses, wouldn’t init_on_alloc be
>>> causing issues before my patch? In the page allocator, the page is zeroed
>>> from one kmap address without flush, then clear_user_highpage() clears
>>> it again with another kmap address with flush. After returning to userspace,
>>> the user application works on the page but when the cache line used by
>>> init_on_alloc is written back (with 0s) at eviction, user data is corrupted.
>>> Am I missing anything? Or all arch with cache aliasing never enables
>>> init_on_alloc?
>>
>> Maybe the arch also defines some hooks like arch_kmap_local_post_unmap() ?
>
> But this does not solve the possible init_on_alloc issue, since init_on_alloc
> is done in mm/page_alloc.c without userspace address and has no knowledge of
> whether the zeroed page will be used in userspace nor the cache line will
> be the same as the userspace page cache line. If dcache is flushed
> unconditionally for kmap_local, that could degrade performance.
>
>> As for the fix, could it rely on e.g. __HAVE_ARCH_COPY_USER_HIGHPAGE instead
>> of CONFIG_MIPS? That affects more arches, I don't know if we broke only mips
>> or others too.
>
> Yes, this is much better, since this issue affects any arch with cache aliasing.
> Let me update my fix. Thanks.

I notice that arm64 has __HAVE_ARCH_COPY_USER_HIGHPAGE defined, so I will
need to look for an alternative.

Best Regards,
Yan, Zi

