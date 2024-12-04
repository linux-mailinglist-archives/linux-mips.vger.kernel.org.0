Return-Path: <linux-mips+bounces-6876-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D969E436A
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 19:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76276164E4F
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 18:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3632391B1;
	Wed,  4 Dec 2024 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fV1LvaE1"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6DC17E8F7;
	Wed,  4 Dec 2024 18:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733337014; cv=fail; b=V4hm4rInrA76VFJoexTEjRBzvhAeP2VfxxhMH24kUUEorwqhjAXlfcQNiEgeU3v926aT3azsJvyCrfDoYvmoNcTCKK/CtCiMZMkJFvPvO1ZUApstsCyfEFzjueJQHp42DYBF0SSwicgjBL8Ojpv4JCxB5nzXGLWYIBU6fElt0ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733337014; c=relaxed/simple;
	bh=rBSa0z0TOxjo5ge7ClFu5obN8du2C9ZMN8aYu8QKewI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SbiOrjE7pWvBxb0NvQhCalCLzco7vM3UTPJsO4PvBttFZOZV5IiGa3z+Mn+eHpy86B0b7e+U/ELS6/c9NMMl9DnrxTYV7bS2IR4huD0Jy6EgQ/hYBQSqcsQUKwtg5guV0JezPa4Pby9rxgX37qgN9pkAjZjjZH7lLC2rguaDaw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fV1LvaE1; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apFHOEnPC7OUqUqrYevzFKEqfnUEE3UUfXUv7ClpqsER7X22suCfOdymHRk9ytKWbIEXaaLCMFw5MP2IhntxecoCqymkXBa1eIgls8Oe8i+VfizB3AV8qs6vQ/kV2PgQxhO+06JiFXE8a53xfYhRgeIAwbUToMEIunenjwyygtihGrG8CAFEHnedM6YUAoVfHeY/pLR67LvZzKFHLYGfPn1eGyW2MxPBosOmx9LUngbXG1sGw94jyT/oV1SLMh0GJCbgW/jBe/htZ4LdlSDpXz4DOevdK5qf388uombAK8tYYL7iRNhc3+Yxkpx92nwVp4dD9QLs62yrcMCIKoZ8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRgbkanLKWqw1QGyP+5fpSJrOsxKK52Eibl/Gqq+M9M=;
 b=TYp08PIgtYgeUpphriHjzG5n44n4PCeaiFmYapABcv7zOEZjEZGsDpRSjk4y0IefK8YyiWlz0ejcOz7lcFJfyUkInWOAseg+Fs+kf+2JqbXT3fio+ZcfsPdPt3hhUcbgq/GJ8j7UQ0QqCbbRuoOGkwW4tM9QJjUgX+m5CsAzVMKSR+IPhUx8gqS34HhlVcJTVTSkLdbSVNKZYRoLpQvTcb+8fv9rLYS61uXhstZ8WXGUvJ9sPH/dxmzGCoQhQugehMnn6vl65N0xJjCV4sBAeptq6gfwEhNX9KhglZe73m/mrnTyGweIs7a7O5uQ09Iu2wqGa9FB9Qx3OLNUN60esg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRgbkanLKWqw1QGyP+5fpSJrOsxKK52Eibl/Gqq+M9M=;
 b=fV1LvaE1Vn53HtvRRvuZNatA1kHs+9LVz6nHEKUdzwv/rvumdTudfc+vL73l/DvTsEqHwYUkitG3fcFYjjjl/rc6sCKMrKjhw7o7EYZBVhtyrUzEckcYjSNJBgBmzDN+VlkrgUezg/q3ildlqbsX9MKuFJqF8D3y76Tq5spavD06WDGVt8QumNcv8tbdMZ1RvbK12a+PzY0F6hXgl1h2tNhYhzfmF7kOE9ilINwKCdp41GU8zVe0RdQzAN66IUltLTpMCMc+7uG6tp5CApxfpLPdtDjonsuHeDM/MgtDh39NB3K0+xjk7u+nT32KgcRNLEiK4eZKltUKHgIKl8/VJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Wed, 4 Dec 2024 18:30:08 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 18:30:08 +0000
From: Zi Yan <ziy@nvidia.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, John Hubbard <jhubbard@nvidia.com>,
 "Huang, Ying" <ying.huang@intel.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Alexander Potapenko <glider@google.com>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Date: Wed, 04 Dec 2024 13:30:05 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <995E365D-5B83-41B3-A46C-6493D203A761@nvidia.com>
In-Reply-To: <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:208:32e::9) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 8665f7b9-a14b-45ef-e0f4-08dd1491adfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmVRU1RvRllidDdLUUV6SHd1NTdJT1BhMG5mUDdrcEVUUTJDMTBwRExLK0xu?=
 =?utf-8?B?aFc0V2pWS2o3bzl4RHNQclFqNXRDa2VQVFBMTU54Z0hHSmF0NEhTaG5Fa2Iw?=
 =?utf-8?B?TXNwbG40U0UrN1hUOXY1Y3BmY0YzNktyOS9EeWtuTE41bTUvMGFwdWUyeUgr?=
 =?utf-8?B?OVdCM3lycGk5TTZ2anE5NjZBRGtEaktsSU0rbENueCtWS3VlMXlrL3FRK2xQ?=
 =?utf-8?B?WG1ocmZjUHg4RkJsYVc1TXhXdlJzeVF3UmtxdkttTThrbGNRTlhMZE1tOE90?=
 =?utf-8?B?V0RnejZiMEY0K2RWelgzaWcxckd6a3JBaHRMTy9WdlJQTjRITW1INFduVFRr?=
 =?utf-8?B?K3UvQTVzYXFUVkFVVlZNZ1JOSlZLcjhSZ0M2MHAwVndYMk1ydmNGSHdZREdl?=
 =?utf-8?B?eXpVaW50clBBVDRIMTVZcHh6NXZEbStWMEV3N3hVSGEwNDhvWldBSmFuK2Fw?=
 =?utf-8?B?WFRoNHZoQldiV3c5Y1ZoVzVwZlQvT0MwZ3RwNS9CSE5JQUg5bTF6dU10cVY3?=
 =?utf-8?B?WVNBZnRHZDNMOE5zN3RrT0krUU9rNlpBWGY5NXM1QjQ0MVVlZktiQ25oWWcv?=
 =?utf-8?B?T0xHUXlsUGQ1WFdET2x1YWcwSUFqdWVZRzh3M2lrSkppTktqMjk5SXZFZWx4?=
 =?utf-8?B?a202WW9EZHNOdUZNb2wybHBXaTBVRUxHYm92WFR4R2VGVzU2V1BqL3BNQ0cx?=
 =?utf-8?B?TUF6NFdtQkt1cXk0OThlaHlaZDNDd2RyNzBEVFhjalc5WTZpbG1UNkJaV0Q4?=
 =?utf-8?B?aFh0MmUyeXJNVWlCWkdaTVVENEpjNHNkYkF1Nk8vVjdhbXJGeEE3eEphdGI1?=
 =?utf-8?B?Sk5MK21vRU1YWTExemFyZXcrWU1tcEJPZ0E3OG1WQ2g2SEtCV1REQml2OFY3?=
 =?utf-8?B?dEIzT1k1aFRabHlObk9NZ2FGM3pLakhwNVoxS0QvR3NiKzk4RjZVcmdEOVk2?=
 =?utf-8?B?T1h1bitjVkN2cURJdU1DYzlpL2E4TU0yTDhIWWlkeVlvMktCc21sTE1XT09u?=
 =?utf-8?B?WnJQRDF6NXQ3VVlJZkhUKzVZUnh3N1RKWnFBa1ZBbnp4TTVsaG9VTVJ1blZW?=
 =?utf-8?B?Mi9wR1NkSnR6M2xZbnJaRVZ3ZHRCeEF2SDFVeW8xaVpuQU5ERnRMN3Z4Vjdv?=
 =?utf-8?B?dGd1eVA0MlhXWThRWE92Tnh6SkV2V2tBYmpwU1NRVVZrVzMzcXIxZTRvVVBp?=
 =?utf-8?B?b2NPVHRNM0MxNEk0ZGlMbHRYSEZmaCtnOVd2ckVZUzk0akZNZlozd2s4K2gv?=
 =?utf-8?B?aWQ2ZjJ3SUdiazdpU3htdWxOMmxWRlRtTWZwc1kvMzYvZ2FVZ3VlOWR4dGFX?=
 =?utf-8?B?a2VoT0poUjNmVUlqSHRKSzVMMzNnV1F1RUxSRGw3Z1g5RXpleXJ5RFplaW9F?=
 =?utf-8?B?aEt2VklWcTdUM0xLZWZzYmMrMTU3eE55bXY0T1JvL09GbFdGWFVLTFBmbFd3?=
 =?utf-8?B?TnFMTG9EeUhBalBocllhUXRLR2RpeU9SRXlEaUZCaCs3UUFCQ3VJWDdiWDhv?=
 =?utf-8?B?dno0QU84clJTM1ZNb0dRL3Fkci9Vc2R0dTBDaS9vS3BpQzR2ckR5c3JzU24r?=
 =?utf-8?B?akM3aktmbEZvZWxlOEg3cEROVXVYblltR2QrVklocGZqN1hlOWZSTkJXYXdM?=
 =?utf-8?B?eGpOUmJ3UGZ6QlFHbXg0NjhtZjBHTmFSL2wwOXFXU1NOSmtlWnZoMWdSSDky?=
 =?utf-8?B?NFE2bC9ZQTJpNk1vWHdzSC9jOVh3VmNiRklJN1FIVy9SclVLMFNVZDA0aXM3?=
 =?utf-8?B?b3VhZWhMdmZ0aWFaek5BM0VmbGtuNHRQTGVCL3RYTEhMTWY1Zm00ekprS0Rj?=
 =?utf-8?B?dDJnKzR0dXhDSzByUHV4QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0kvQ0VKaEpCck1sdEdnSy9IczBKSUw0OHlJdTZMWE1ybVZSOTh0L2dpUmp5?=
 =?utf-8?B?Y1pSek4wNkNiNlhiN1RRL1R2N1FBa2RZTzJFd1EzYmg0UFdJZUhoalRhNnI5?=
 =?utf-8?B?SDFoVEFwRlNRMGhad2g4LzNyTlBGNW5Mc0diSnk5NXB6NnE0cWhVQzVwQmk0?=
 =?utf-8?B?dFNtV0dhRzZMRS9UemRQVGU2VndVbWxRSFRXTEc4Mm1KSUZHT25ZNG1mM1pl?=
 =?utf-8?B?K0ZWR3FGbGRudDZwRE1pSWsvL1Rja2ZpeHFFeGg0Um8yQW53bi80TEJ0c0Vx?=
 =?utf-8?B?WGEySG9jd0xmMnVRRCt2eWNCc1d5VkloRnVKNVFYMVdVTnVWQUM5ZVdTRUt6?=
 =?utf-8?B?WEJNUWwyTnAxVjBBYW5HbU0xZEs0WXVEQWQzRkFyVlVxZTRmS1V0OTBiSE0z?=
 =?utf-8?B?MktucWVzZjYvN0ptYkliYjk0MEx4TkNuQ0dCNXB3Tmp3aWp2V0ZNOGxKZ3Qy?=
 =?utf-8?B?VURDdXlPM2h5SjJzNFdvZCtmdnJ4ZUh5TlJsUG9oS2VIZUFIVTBESnI2VExp?=
 =?utf-8?B?Z3hVVFJFYnhuMWtua2NoWDNBQ2F5SXF1aURoSm4wRWZTYTBpeUpNeGYxU1p4?=
 =?utf-8?B?clBjUDhOK0ZKKzFvNkpTZC82a2Vpa1RsYzBXUkVla1RqV2xxT05ndnV6N29J?=
 =?utf-8?B?K0E5cnUyM0NaN1R6WkJteERhQjJGTFBOZ0lxTnNneXo0eEdWZUdyWitSekZY?=
 =?utf-8?B?VzRMUCtyKyt0VEVyMXgyOW5ZRU85VFFVZk1uVFdKU3YrVHhBY28yTW42MEox?=
 =?utf-8?B?RjFzTmZkb0twOS8zNXorQkJwNlVrTWgzc2ZxVHZ1YjRtVE5uTEliMGphVkx2?=
 =?utf-8?B?c2lJdUQ2OE5rN3ZhTWlUZ3puVzZVbmtXekdGamJIUkM4UzI2bTlWc0dEbDlU?=
 =?utf-8?B?VVd4M3dvVDJJQlZyTlBPS2VDdCtIQnVOS3BydTltM3pBckVMeml2RTRTeXUy?=
 =?utf-8?B?dEljdklDUEc4WGUyLzlpbnI0RWVHQWtIaDJva1FDMFhTOFMva05Eb0Y1bG9o?=
 =?utf-8?B?QTEyTHdHUzQ0RkhWMHlGeS9acHhPWlBjSnpPVTRhWHcyaUFDV2pVUWFwbFVK?=
 =?utf-8?B?VUxmZnpxR3pEamQ0NWlUOWtIQWlzbzZJTzBsU2NUdzEra3dpZ1JoamlWV2xn?=
 =?utf-8?B?SVpvWVZvVU4yVGtLcFFZNHZicTVEdHk1bWF5czBGRXNlZk0wOTFKNStUbDJG?=
 =?utf-8?B?ZFFhb2F4WXJkVGJxTzhkWDBJTE9YRjlYY0duS1lEZmFDMzNZR1p0N3NjQnky?=
 =?utf-8?B?NlRkUDRlOTJMMWJJckVEdWFLbjNhQU1TaC9UME5ReXAzQWxsWnZ4OGJvSVZ5?=
 =?utf-8?B?a0Y3QmNDS0xmT3R5dVBZYkEybEl3WFl1eDVCbFJ6cnFLRnV4WlhkcjUvMHVl?=
 =?utf-8?B?cVJDMVIxSUoxVFRMS3I3WHJMVmJXdldMUEdGUlRNRllLZzFNNzB1dXladDFJ?=
 =?utf-8?B?VDVCb0pYcm53QWQySUI1MUlsZi94Ni9GazZaOVM4YXFhMEpYUG1JYStZaW9a?=
 =?utf-8?B?UTlvRTJzeGN0YkZtWCs4aGtxaU5PdXJqV1NQQ05vN2t2VzZ4UkNFcW9aTlIr?=
 =?utf-8?B?ZGlxc1V5Ymc0WjhxeFJyRkczM0lEaGNoS2RLTUNqVStuaGU4NTNBckhIUlI4?=
 =?utf-8?B?TlhLcDMwUGwzWlpaeGVwV0p4Z0diR0wvWCtZN1doRVkvVFBNZTczOGh6UVEv?=
 =?utf-8?B?SnJ1bTN1ckpXYUhxdDlpNWpyd0tzczcxTUQ0My83cEdQcmo0NlhxZlpaMGpF?=
 =?utf-8?B?aWpJK1pWUGVIR2ZnLzJzTE56R3ZtMjZVT055QjdSY29MY1BtT3RwZVVHc3Nl?=
 =?utf-8?B?UXFLaG5mU2htRzJ0WENIZzIxRy9wbkNFeEJ3aks1SWVTM0l5WCticDhQVGFU?=
 =?utf-8?B?TnRjSjJiNVZLOWVCMzF1TTVvNGxOVUZrYWpNOHllNCtvZTNndW93T05LZ3Rt?=
 =?utf-8?B?V0RGSkNnYS9yYVFpQUVsSzJpOUllWkRNNzFtQXNHdlJLNTlxcHFhc1J0N281?=
 =?utf-8?B?QzZiUitnUzRHTXVFK1NPMSt1aVpKbUVvdm5KZlhOUjIxQWljbXhXYnNtc1hp?=
 =?utf-8?B?NkUvZE85ajVHNkxsQk5SN0djYTFUR2ZLN2p3azR1Y2ZWaXNqZCs0SFN1ZE5F?=
 =?utf-8?Q?qHNr1g1DX7fQz2mg+q5zesG5+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8665f7b9-a14b-45ef-e0f4-08dd1491adfc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 18:30:07.9394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFvNQYsu/jF4fwKqGFAuo8HEYD54hko4NV6duHCzcVE22yrbu8rIH0M+H6Qj1TWe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898

On 4 Dec 2024, at 12:33, Zi Yan wrote:

> On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:
>
>> On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
>>>> So maybe the clearing done as part of page allocator isn't enough here.
>>>>
>>> Basically, mips needs to flush data cache if kmap address is aliased to
>>
>> People use "aliased" in contronym ways.  Do you mean "has a
>> non-congruent alias" or "has a congruent alias"?
>>
>>> userspace address. This means when mips has THP on, the patch below
>>> is not enough to fix the issue.
>>>
>>> In post_alloc_hook(), it does not make sense to pass userspace address
>>> in to determine whether to flush dcache or not.
>>>
>>> One way to fix it is to add something like arch_userpage_post_alloc()
>>> to flush dcache if kmap address is aliased to userspace address.
>>> But my questions are that
>>> 1) if kmap address will always be the same for two separate kmap_local() calls,
>>
>> No.  It just takes the next address in the stack.
>
> Hmm, if kmap_local() gives different addresses, wouldn’t init_on_alloc be
> causing issues before my patch? In the page allocator, the page is zeroed
> from one kmap address without flush, then clear_user_highpage() clears
> it again with another kmap address with flush. After returning to userspace,
> the user application works on the page but when the cache line used by
> init_on_alloc is written back (with 0s) at eviction, user data is corrupted.
> Am I missing anything? Or all arch with cache aliasing never enables
> init_on_alloc?

Hi Geert,

Regarding the above concern, have you ever had CONFIG_INIT_ON_ALLOC_DEFAULT_ON
for your MIPS machine and encountered any issue? Or let me know if my reasoning
above is flawed.

To test it, I wonder if you can 1) revert my patch and 2) turn on
CONFIG_INIT_ON_ALLOC_DEFAULT_ON for your MIPS machine and run some applications
to see if any error happens.

Thanks.


Best Regards,
Yan, Zi

