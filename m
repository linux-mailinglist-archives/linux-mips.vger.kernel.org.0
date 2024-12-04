Return-Path: <linux-mips+bounces-6865-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 491DE9E3E27
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 16:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F9216637B
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 15:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CE220ADC6;
	Wed,  4 Dec 2024 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oek4KcgZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F17B199EA8;
	Wed,  4 Dec 2024 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733325863; cv=fail; b=SgtNh8ptUIv7PdfG2p+8z53mpfx6CfZp/OAPF8l3WFX2cNrBTxP/S0CJ1GL9qBY3uaeYeAcT4Kag2Dujj9XmkyBF8iEj69qrxjb2T3OQt57jvzpvTLAR/DMa1kdh3Q/pxdHkkQBPOHhBB+ikwmIPd3fZY8Hvhj/W8cYe6YR7FG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733325863; c=relaxed/simple;
	bh=ClVXa0OFpy/37o7Vaf0puWaOwdaU+GYbjeqbVQwtrB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BNWr4zKJohVTvH6rqOby3sHGiHjJz5eWKGNalr5Fs1m1WS++45Is40rdDN1sW6THrnc4eBcwZQKhI7UQmiUaeSCNReyyMHyADAB2Ag6gXDIkVmUgrj5Og12ZfjYgWRfhVczg31bMDa75FtAWceh48jy5d1uTjHufetY0CvSAQ90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oek4KcgZ; arc=fail smtp.client-ip=40.107.220.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzmpWuO/JVZDig2gs++cKwf1glgCFgQA4QxNdbqFD8zVVm03K6o0XE8MAF5R2yYoq+o5G46l+hTJfOfLVtiByYAJoKJVwAtNuRI/7geb/TDMNQ+oFzRwP8zjOUFIN17CrPb5xnu4eh+p5zrqk8d+/pb0UC3Yfen7wQt/7ffJa7CId9Nytv/IaO4A+2fGe9kTlmjknE3+akLUdlrdNqWfg4J9r1HwoeKXh4WmZempXo5oXyMqvQcz3wzF9wRrKLZBn6DxF8WVmsCIMuxfieC656SrvmahAgI8Ur1vW3e2qxePmr9/z1bZ6b6rieJAGz7gz4A1ibnHYNlvpgMBrL+/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJWC0Gy5Z1q9u8fivrhfYmWX8mnBCMqDqhiyKtQVLbs=;
 b=fs028+98Et3LB7PWUy4OlUrySxrCyB1LocYQOvJkfZ+Gfy4Fk9Bqtbr5jfNltNnZ9vJig8dlfLvEoHHQfWN7Jk/5NXjXJ8nG2beT4XIcbZd3smtR2SI8eTumTSB3jmR9QM3dIp6ibdwTk9JJ4N089ABJHR4H7QJhpn88pYYcjqDJweeLHDftkM9y1Bf3gMDP/4ulGUGbZxJhINKsrPRDP2lYjlXQo5bYnLu3BAuP7YfnjpBjafkbssNbtfZGs0ZVkmr2G6aM56iHaSaz38OBNuEYTFjouGW0nht0pYIhPHn62RY7MXGajVknAg6Wd2Jv4/lzrQTDTFTv/ZNhvN/t4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJWC0Gy5Z1q9u8fivrhfYmWX8mnBCMqDqhiyKtQVLbs=;
 b=oek4KcgZm6IlCE1us7h85kPGmbJwZeecL0+eCX7TKrNUAQAkK7nlwLyV733e8y2QBR5FCZcw5h/oPfm1Zy90tjYM+CMiWSciBStkccK7RzbRvpPnQUDk7Ct7oux/UIQIxVPO59M+Qjean94HxZMJm2Vme4KK6Wll7c1x3Vu1qpLMG6rcukpc2GHjrVjWszk57krbfZMYm+sTYKDQz6px17qaDccKH95JiZ/Uvm0V+TcCBBucVg3B0y/m4xqYqgjR0KEW4kk1A4RBRsv7s/NWzCQmHIRKMEAhASd1rse9lt0Cja9QpCEC2zfKoHBHhYUo7eoiLSu1f77W3o6XttH9eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB7293.namprd12.prod.outlook.com (2603:10b6:806:2b9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Wed, 4 Dec 2024 15:24:17 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 15:24:17 +0000
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
Date: Wed, 04 Dec 2024 10:24:14 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
In-Reply-To: <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b67721-537b-4e92-18ee-08dd1477b7e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWhXZ3ZvYnN3bytpd3F1QkxybU9JamhMbklDazBYdC9TUWp1a29GRHZWSGhD?=
 =?utf-8?B?VmE1VkoyRUF5WjVEamNQODV1VlJOdHdIOTNTalNkWFhRdHNGZ29rZkVXeWJI?=
 =?utf-8?B?bGtZWTFZdlRmamdtbDBBQXJOMDJ3SW5JVi94MzlDYXA5ODZhMlFZNE9qY0Fr?=
 =?utf-8?B?YlhnNjVOVU1ESGVVL3VjVEhQZHE3VTdFemFKWS9lMTFwRDZyRSttZ2RXOXRR?=
 =?utf-8?B?RmViaERwcFJWUjlEU3AyMVZVM0czK2dqOHpOT2tXU3RuUVQ4UGdjNjNHa1Rw?=
 =?utf-8?B?WFZ4SVlRVDZtQ3VQV2RBS0QrbWpyY004VjZ1S1NBSDYwKytxMGVTNXV4dms4?=
 =?utf-8?B?c3BiRkNTdWNBRWkreTd6MGw0L0lZSzJBV1h3bzY3a1FNSlNrazhhK2hLVXZj?=
 =?utf-8?B?V3ViOTJlTEN2OXU0eG1zeEFmRTEzSklwWHhhd2xtZDVtUVhKa25KbVk5TUU0?=
 =?utf-8?B?OTgrUWR2MGlJdStOZm5yQkdVdXJrTGQyck5zclo2c1pLMGlPdFJDUkd3OEYy?=
 =?utf-8?B?WmQrSUxVRXRCOWNmenlQZ0VJWHVGRFhISUE4NytOckFXdUQ0dzRUemwzYjVH?=
 =?utf-8?B?dFVNOHNhZVU2S1psWi9YWGJnSWp1ZjJFWlQyZTB2Nm9keEdtdUFRYnFnVXg1?=
 =?utf-8?B?RjdUTG5wdXRFM21rbE5iNW1iR21sV095b0RNYUU4NHJoM0dlM3NXeW9QRW0r?=
 =?utf-8?B?cGxydityakRjMHVHNVJ1N011VFViZmFnY1c1T2FaMXh6YjJiU2gzUExVcWpJ?=
 =?utf-8?B?YjhnaGU0TnM5d3BIWmFGVFIrbTJEVXg4eVRjRWJHWGhtNDkwOGdQTHU4NjBP?=
 =?utf-8?B?VVFYcEQzcU1xMmN0YUV3c3pZa1hPZW9nY0I3ZDl2QldTT1lEQUpWQlJjSGgv?=
 =?utf-8?B?MWVjbHVQVm5KVnhMOHp4L1prS21mSjVZNjRFYUljN3Z4Z0d6dzJXMUF5QU9D?=
 =?utf-8?B?Z0FpU1p5U3FuYTV5Y2lHRi9KZHlrRm8rVmpsbC9idUlQT1dNVkNKcTdYcU9U?=
 =?utf-8?B?NVhkNC9qaWpiSUZYdTYwYXFMZUJlaFVCNnpIOS9uNTdJaHB0eFJjSTd1THVw?=
 =?utf-8?B?TmQrdXVldjh4RjRUdjRldno2ZWNlRmVnaS9JdEovTGhqSGpjbzRDU1hLQ1hW?=
 =?utf-8?B?N1h1dEtmQUpHZUNXRDB6M3lURmFMMjZzUHZmMWh5UXlqZXZvYUphVGxiOW5N?=
 =?utf-8?B?ek5TdWRjdlpIUlVqaC80ajZZRGYraTBmU3ptNEpXVk51aTMwTGViT3gyeHE0?=
 =?utf-8?B?ZXh1dDhOVUR1cXRKNVpmdCtDUk5udFRLSy9IYXdNQmtkUFNaTEc0Q3VCSld6?=
 =?utf-8?B?UEgwcHJ0eEgzM1E2N3ora3RkSXp2TjhuVTdWVTUyQUtKaHF2eU8vZlpzY1dv?=
 =?utf-8?B?S0ZKVE9UTzhXSTdDR2wxWXVUQmxSSzNHODd1V3NKTjlVTzlSOUoyL3lnRFpZ?=
 =?utf-8?B?RTcxcFo3VzlVTkg0cC9JazM4YzgyT1RSWXBHNCtKSzh4b1RZSmx1Z0gxQUtx?=
 =?utf-8?B?KzZGdENoK2RNTno5VDE2Q2lkeDlkUTI5blcvNnlmUVFMeHNkczVnd3IzOGhI?=
 =?utf-8?B?S3BrTHV2bExxdXZIYytrYUhHR1RjellYbDZFV3FtKzcwTktXSWpLSVpPTEtm?=
 =?utf-8?B?WHRPUmhFdkUrb1NVWW56bUk4NHdqLzhlUVhqaHF1OHVJWmFxLzJtak16N0li?=
 =?utf-8?B?RlJHcHRiQ05ISEZTRGhBaHIxa3pRc204TFVSanFvbXFOdVIyWjB4VDVRZkRp?=
 =?utf-8?B?bWR0Z0FHWFF1Ny82NGFHVFpKT2w4UnRnLzMxY29pay8rZlFtRWswcHM5bzZI?=
 =?utf-8?B?VWlZck0vazRJMWM0V0E3UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QStUNWJ0RTc2Y2VSbitRalJJUGJUZ0RvQzBtWG0wMGtFSUFkZWg2Ym13RFlS?=
 =?utf-8?B?OTVGRHNnQnJTQWxxdGdMcnpXMnNTRXBIUTM2dXBELy9vWmVDenpGUm5SekJy?=
 =?utf-8?B?bVNCTWhCbjRpaUkyc25hNVgxeG5XVElzYnpnRkpTc0RxdGQxS3RNUXNGNzly?=
 =?utf-8?B?ZlRFRTU4ZGZzYVJHQmIwUTZpdjNOQXBHSkhrYm9RVGpmRTNmUENXMXdLRE5y?=
 =?utf-8?B?emRZcXlaWDJFbUU3aHFRLy9qLzFZWkNtbEE1NDFIdkR5c2RCZUkxcmxvbWtF?=
 =?utf-8?B?NUtDWkFUL01WL3N0MG5uU25PNnMxL0FnODV3S3RXazRNOUdRcU5yUXM2VWF5?=
 =?utf-8?B?cGpmZ2t6bDdnY0JGc1IzYmw1OUgrNTNydUxuY3g2K09ob3BpOHNaN2M0T2Vs?=
 =?utf-8?B?WHV3U3M3SjhrSHErNEpNVkVya1ByMDhEV242TFNYeUN2Q285SjV3UDRWcFNU?=
 =?utf-8?B?VWhCTVowUXU0NlZ3YkN2WlBMR2ZsOGJuOHJIVW8rSUwwKzB1NTB2ZXYrVXY3?=
 =?utf-8?B?N3hjdzdjelYra0VGZENuNDdxTUN4QkgvWHQ1T24xbWpDRUZCL3hOd1ZPY2Jv?=
 =?utf-8?B?c1lCb28rVFlmc3RISm4yYTF5MFFlZ1Q3VURsZmZ5VU1qdGRPdEhxbjZtUms4?=
 =?utf-8?B?SGhEUFpRaGtua3ZOOWplTnRYT0toaWhlbW9JeUk5VEZLNThwYTNKTndKZEs0?=
 =?utf-8?B?RElteGhyT3doSUFUYkltMmdkTWdobWd6dlJvamRXV2laQVBzMmxLUHYvMnBK?=
 =?utf-8?B?YlhQcUJBampQVWprV0dsSk5UeGxvSXN6SUJWMTZhOS9JQ05QM2xNMENMWEVQ?=
 =?utf-8?B?MGZDZGlHRGFuREVsekpsbHhGY2lCS2I0WDMyVG1YVFRvK21yODdrWVFuZ3h0?=
 =?utf-8?B?MUM1Qm9FSVcwWGZlT0prYWovNFR5TkVLZkJBR1luRVZEaFN3OFc3UGZVSitY?=
 =?utf-8?B?SW1SdDhGclM5Ryt1STh6Ymk0cmYvMzZnL2ZlT3RRM1lNSFNLNUVjVGZEQzR4?=
 =?utf-8?B?Qm1UYnhsMW9seC8za2FzQkdVVFhLY2p1endPRTBaQWZFMFZjY1NGajNxNW9L?=
 =?utf-8?B?Q2E3MzhrbElPekRiMmRPQVZLOENpK2g5elVuQTJzeE9UV09wMDVJdFEvdlZE?=
 =?utf-8?B?ZEsrRjJwZlVQcDh2eUxYTTkreFJMZGlzOVJLQk10LzA3WUU5ZzloYVZiY0Nz?=
 =?utf-8?B?NWRGdWVRelY3RzZNbkMxOE5iWU8vYWtTdHVNaU5RVXZSL0dBbk1lMHpTcnZU?=
 =?utf-8?B?Vy84aFJHUUY2VVcvcFRUYjZvY281RVdhNjRwV0gxQlJIdk1kL1BhSnlyRTNn?=
 =?utf-8?B?elV1VG1zdUNwd0I0ZVd4djhBMktxT1BnUHRyTmJibGs5dTFDR29BN2xyZlFr?=
 =?utf-8?B?RTY5dk9Sai9sTXBveVZmVjRMaDl4UzBwTk1ER2RTb2lQWlBqeCtRbk0vL3I5?=
 =?utf-8?B?SkFYOU1NY0dmT2EwUDFEV3FzQTdOVFNvcWdjOGNlRW45cGhGWHA1UWVZMFBW?=
 =?utf-8?B?N2llc2lwdXZiTGJ6UzVUV2gxeXdZM1hNbG9mU2h6WWFBSkxrUE1MaTFkOUo3?=
 =?utf-8?B?ZzJURS9qbEZvTE1lNndpYXNubkFkaHMyVm9kZjBiYUlPWHFXRGZiQ09udDho?=
 =?utf-8?B?NUp1UG5HYWhJbFFpQnlEdHdGVCttUVB0Y1Z4cjdzMDc3YnBSeFpFb3NLZzhh?=
 =?utf-8?B?cHU1WEVJWUZBb1JwWlBNQkVMVEJHNVA4NCtzQ1V5WGNCU1lvV2hsdGJVcm1F?=
 =?utf-8?B?SFI3VCtia25PRHVQTFUxQnZVcWVoT0ZBSmEzRWpVci9jTUdpOVlWcE0vRCt5?=
 =?utf-8?B?dmxjRXJ6cXluQ0d5eEFhaksySjVkT0JHSklpcndIek43WVB0ai9NeTJDZlRn?=
 =?utf-8?B?Sy9JWW9zMEtYMnY2eVhGUnIrZTNzMjkxVVlBTWVIVWZlZHhrMnROZkVOQkxH?=
 =?utf-8?B?dmlQd1NKaXVBV1FIcTFJcTZDQkRWSkR5M2NHQTdDWjBIMlZZTjZwWXYvSGlm?=
 =?utf-8?B?ekhtTG5kSDV3YjI0bVlQZUxaM3BCOGcxMWx1T2JxemFOUmpEWUExQWcxaTA4?=
 =?utf-8?B?eTRIL2U0b1pWWm8yVlIrbFR5Ym10eEV6Ui9GWjRsYXAwaWRISDVMS0VYQW5x?=
 =?utf-8?Q?rN1gxJIGxyoT7K7T7izSAQcEz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b67721-537b-4e92-18ee-08dd1477b7e2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 15:24:17.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSDfsEKjLpnt+oJxwDbr6krc2HWPebX/gQs1QftuWGB9m26ud/k6Jp4BdRDYJhBY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7293

On 4 Dec 2024, at 5:41, Geert Uytterhoeven wrote:

> Hi Zi,
>
> On Fri, Oct 11, 2024 at 5:13=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>> Commit 6471384af2a6 ("mm: security: introduce init_on_alloc=3D1 and
>> init_on_free=3D1 boot options") forces allocated page to be zeroed in
>> post_alloc_hook() when init_on_alloc=3D1.
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
> avoid zeroing user movable page twice with init_on_alloc=3D1")
> in v6.13-rc1.
>
> This causing a panic when starting userspace on MIPS64 RBTX4927:
>
>     Run /sbin/init as init process
>     process '/lib/systemd/systemd' started with executable stack
>     Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000=
000b
>     ---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=3D0x0000000b ]---
>
> or
>
>     Run /sbin/init as init process
>     process '/lib/systemd/systemd' started with executable stack
>     do_page_fault(): sending SIGSEGV to init for invalid read access
> from 00000000583399f8
>     epc =3D 0000000077e2b094 in ld-2.19.so[3094,77e28000+22000]
>     ra  =3D 0000000077e2afcc in ld-2.19.so[2fcc,77e28000+22000]
>     Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000=
000b
>     ---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=3D0x0000000b ]---
>
> or
>
>     Run /sbin/init as init process
>     process '/lib/systemd/systemd' started with executable stack
>     /sbin/inKernel panic - not syncing: Attempted to kill init!
> exitcode=3D0x00007f00
>     ---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=3D0x00007f00 ]---
>     it: error while loading shared libraries: libpthread.so.0: object
> file has no dynamic section
>
> Reverting the commit (and fixing the trivial conflict) fixes the issue.
>
>> --- a/include/linux/highmem.h
>> +++ b/include/linux/highmem.h
>> @@ -224,13 +224,7 @@ static inline
>>  struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma=
,
>>                                    unsigned long vaddr)
>>  {
>> -       struct folio *folio;
>> -
>> -       folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
>> -       if (folio)
>> -               clear_user_highpage(&folio->page, vaddr);
>> -
>> -       return folio;
>> +       return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma=
, vaddr);
>>  }
>>  #endif
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 82f464865570..5dcbea96edb7 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1176,7 +1176,8 @@ static struct folio *vma_alloc_anon_folio_pmd(stru=
ct vm_area_struct *vma,
>>         }
>>         folio_throttle_swaprate(folio, gfp);
>>
>> -       folio_zero_user(folio, addr);
>> +       if (!alloc_zeroed())
>> +               folio_zero_user(folio, addr);
>>         /*
>>          * The memory barrier inside __folio_mark_uptodate makes sure th=
at
>>          * folio_zero_user writes become visible before the set_pmd_at()
>> diff --git a/mm/internal.h b/mm/internal.h
>> index 906da6280c2d..508f7802dd2b 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -1233,6 +1233,12 @@ void touch_pud(struct vm_area_struct *vma, unsign=
ed long addr,
>>  void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
>>                pmd_t *pmd, bool write);
>>
>> +static inline bool alloc_zeroed(void)
>> +{
>> +       return static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
>> +                       &init_on_alloc);
>> +}
>> +
>>  enum {
>>         /* mark page accessed */
>>         FOLL_TOUCH =3D 1 << 16,
>> diff --git a/mm/memory.c b/mm/memory.c
>> index c67359ddb61a..88252f0e06d0 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -4719,7 +4719,8 @@ static struct folio *alloc_anon_folio(struct vm_fa=
ult *vmf)
>>                                 goto next;
>>                         }
>>                         folio_throttle_swaprate(folio, gfp);
>> -                       folio_zero_user(folio, vmf->address);
>> +                       if (!alloc_zeroed())
>> +                               folio_zero_user(folio, vmf->address);
>>                         return folio;
>>                 }
>>  next:

The provided config does not have THP on, so the changes to mm/huge_memory.=
c
and mm/memory.c do not apply.

Can you try the patch below and see if the machine boots? Thanks.

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 6e452bd8e7e3..bec9bd715acf 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -224,7 +224,13 @@ static inline
 struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 				   unsigned long vaddr)
 {
-	return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr);
+	struct folio *folio;
+
+	folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
+	if (folio)
+		clear_user_highpage(&folio->page, vaddr);
+
+	return folio;
 }
 #endif


Best Regards,
Yan, Zi

