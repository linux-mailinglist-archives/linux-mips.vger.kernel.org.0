Return-Path: <linux-mips+bounces-15647-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9EEGK1IHT2pRZQIAu9opvQ
	(envelope-from <linux-mips+bounces-15647-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 04:28:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE1072BEE9
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 04:28:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=bz5IKidz;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15647-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15647-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD6FD30210CC
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 02:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A51330337;
	Thu,  9 Jul 2026 02:28:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D087A2E06E4;
	Thu,  9 Jul 2026 02:28:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783564102; cv=fail; b=tlpbIcPANXsiMXy5iJ06PKTrz787c8SRaFHM7gH3VAjP1GcIjZWIo9BuHPMTyCow9tUdENZnfwpyM+tFggSeQLBMjl8TZeEXFDK8ibVOG4VDUC07H1i/tkXEImWiGNfXeZbqfxxkMqWmVKNpvRWSwbIfxF1+sFnB1aOKMf0ifew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783564102; c=relaxed/simple;
	bh=628hE3qKJtKmhgz1J5dqnmQSJXhpojgwSEt0XJFiwHk=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=Vm/x+6xBFJbi3VSssHfYOjGEuz7jGt0qXTfhQEsIGMFppWdjPHNDbN405Ragin8uDZqEBu+eO1rPQiNjr/N0EFZP/1Ygl0U20N+hIN2o9qtPec4ReaO9/a2Y26TNHfys4pFEgXquYG4wz3rfKV5oOohc/bXWbQowpOSTdOFFOcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bz5IKidz; arc=fail smtp.client-ip=40.107.208.43
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOJJj7rmx60PJSWTNzmJhpej3sKFS5Wz0lJyPQb5rMSve7PCKTFTIEQRyzvrxznC2DbuldrKOnvAKU9jqmPxJWQntoKhXg07xNTS5g9vCvdt+IgIYPJqK3AiSmLbbOyBkkn6b8zt53Ft5+JJpdycLFNpgJiPe/UOPFKv3kMMAXjhP9r+o7zcJFDtQoYFwKpKr6ZDaeScx/TEUs2nnAUUWEgoVp672imEF+mPjXx5I/8tYGeAr1IMtPhWiUn2x89iY6ggjMo1B351Xkxs1t9FJuUH5Hpjg21G0jIWKkIAyn48n9kCDMCGHalzg3ZWOtRMzb4YCaooM7vGRNBq1UcszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=628hE3qKJtKmhgz1J5dqnmQSJXhpojgwSEt0XJFiwHk=;
 b=sZ826dWvoJR0CQ61f3y+brnuYXkfl04ZcglwMw+BPJmSZTUXxsjb5KcakHxBlOed2S0bYLpG6GoZv19gn0CUFc8vdaWxjyynM229HQOu4ejImMFB69UXvhsxuPH8ZPA8lI8EA5C/udW+KtxkWVQdL/iyZCA2TqyJumPa+fF5rKqsovCiF+rVvN3HBm2R2Eh3mzVThdA+EGJs9mzQRXPukCuyOZIb6R9Yu9+MExQUbhncldCXh0F35bVZTtNq3jXR1sD/+4bAPzE3m1agCEBGkpuuZz4rk640FTvxEXLpGBISN73kYHU157Us2EiDYZGz4q/Q3w2PFPgbL914OQDcJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=628hE3qKJtKmhgz1J5dqnmQSJXhpojgwSEt0XJFiwHk=;
 b=bz5IKidz0aU0mhB4xRGwF2vFDP73iMiXQqknrJ5piQ94nra9oZVGFVmgDe6LIAxnbohuh5HRTYE7Nb+sgJjBiU11MeikVvzjdlL7gLMg9FB0voeTqK2vX0EWDvU4yK8XINW2Jcme270SiUwpeTTBjJeVR5I8HQOI6beO+PCgz7QLFyngV63D6DqDjxNBNCsLbSVkoDkvXpDOA9khZOgGBmvxDCZH4TCPrJ2qRBHGlV/SfOiIftDwBLNpnTBNvEWKH3osMg8sqSjD59eUOJ546U6ZafLqbMDSUgdR8iT7u5ANT8ENEFWf78eWB65Tg1Cf+6Ou3uIZQjOx4iYueE2Mvg==
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB8185.namprd12.prod.outlook.com (2603:10b6:610:123::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 02:28:07 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:28:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:28:00 -0400
Message-Id: <DJTOP760MDDG.2KUSKD8WVVKJ5@nvidia.com>
Subject: Re: [PATCH 13/13] mm/mremap: convert mremap code to use vma_flags_t
Cc: <akpm@linux-foundation.org>, <tsbogend@alpha.franken.de>,
 <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <l.stach@pengutronix.de>, <inki.dae@samsung.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <krzk@kernel.org>, <peter.griffin@linaro.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tursulin@ursulin.net>,
 <robin.clark@oss.qualcomm.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <dakr@kernel.org>, <tomi.valkeinen@ideasonboard.com>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>, <thierry.reding@kernel.org>,
 <mperttunen@nvidia.com>, <jonathanh@nvidia.com>, <kraxel@redhat.com>,
 <dmitry.osipenko@collabora.com>, <zack.rusin@broadcom.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <oleksandr_andrushchenko@epam.com>, <deller@gmx.de>, <bcrl@kvack.org>,
 <viro@zeniv.linux.org.uk>, <brauner@kernel.org>, <muchun.song@linux.dev>,
 <osalvador@suse.de>, <david@kernel.org>, <baolin.wang@linux.alibaba.com>,
 <liam@infradead.org>, <npache@redhat.com>, <ryan.roberts@arm.com>,
 <dev.jain@arm.com>, <baohua@kernel.org>, <hughd@google.com>,
 <vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <jannh@google.com>, <pfalcato@suse.de>,
 <kees@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
 <intel-xe@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>,
 <linux-fbdev@vger.kernel.org>, <linux-aio@kvack.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-sound@vger.kernel.org>
To: "Lorenzo Stoakes" <ljs@kernel.org>, "Lance Yang" <lance.yang@linux.dev>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.21.0
References: <380f761d35a3faa4370f8b3f92e3d4af3d4c7110.1782760670.git.ljs@kernel.org> <20260702134947.25189-1-lance.yang@linux.dev> <akaJx8Zt8kazlrjq@lucifer>
In-Reply-To: <akaJx8Zt8kazlrjq@lucifer>
X-ClientProxiedBy: DS7P220CA0110.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:25d::12) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: d08dc437-8440-482d-c719-08dedd61b611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|7416014|11063799006|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Z/tjc06LNUj/ulqvzkhbzEoBDPqp8rufyAQcTElPkkRlF0B8T5Lbv7NMmcJr2fLtFbSsJgLgtFQE7voqnqaki+sE2P+d6Zq2TFmjE3fxJChyNDeTmhCtDvTiZO/XKngfNniy6jwmycUEa9vLkF/v2tAPyDLh4KOe8cIEtY8vtgAgmXR1KyNJPJW6VdDsUdKzYzL3I9N8Bgwyf2BDWdf+/jn3SJxXVHol2dODQXVmawEDDxxYe96QGbU8mg1IlAcDPVqgvY1CTNKIwHqWXo3HmmWXSRLC0lN2jN6ij11QBSyuVAY95RX+XdDCdiLHzjRN2nUcFafDKEwUJXECHDVv1pFmO+mPI2ZeDGU4uOG2KYqabOpq0AZ9U02WcOV+U5RXGj/0o58kNOZjIZXq8fjCkZno1LUGZ6pSljvH5R5tf+KUa5bZzEfGxC8fqYD4G4sHmVG2ZTvIDgG8RQNuqN5pIDhbPgMDHHgQn8uVdJYhWdGmCTbKhWOOB+jIlOYBfDORJ3fvm3BXCRyJ+MUAz7yvTyXwBlTV+Czo/rvFJC5g+vcpCcbEUWiElMspJ2ZW1nBbO8EFIAa9cdCLclSyU2JwoTl9+jG54SN7IHjyF3ozn47MSbc135KTOEkZcoJ+kUIaiOnk6eDkiLfNe8mpH1guZ6PqDK6XGo3FvG6Io0XdOcc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(7416014)(11063799006)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0drdVdBNTVMRW1PY2NGdUlvZm5yTDUvUlNxNm5CRXJhcG5NTHBVQVgvZDZi?=
 =?utf-8?B?S2hVcjdVcWJxZ2swZUZjSC9ITUkrczBKTjlWVlJ5aWVWRStvcWVvNU92b3dJ?=
 =?utf-8?B?YmlQNm1CQ28rNitYUzB1TUMrZFJCanluTVhwTGJEa1F4SldlMlQvL0hVNXNN?=
 =?utf-8?B?RnROemo0ZmdrL25FcUtHbWRsaGNLUzBvYjI4WThVRUVqVkIxeEtjVGZjVU9L?=
 =?utf-8?B?UzNRTUh5a3BUZjFFcnM0WU5Eaklzb3RwT3E0Y1JSZFEvdDRtWi9XOGJ5L2ph?=
 =?utf-8?B?RUJLc0hLREpIMCtZS0Y4eUN5VmJZUk5OZVZWOW93anpkbTBwUzVCek5icDNr?=
 =?utf-8?B?bE1GZEhhcEdtYlk4OFlwWFlobU9ZMFVBNW5hWWtkemRBb201UXN6ekQreW5o?=
 =?utf-8?B?b01oSGphdWJIOU91OGNFZFM3aTVxOWRPOXl5OGxDVUFBdmV4Zkpqak1KV1c0?=
 =?utf-8?B?T3JDWGtZV0p4aSt2Z0pxT2ZYQ2V2eGtTVlJwOW5YNGJ4dUpudGhxM1hhRkFr?=
 =?utf-8?B?ZXd2cTRpNnJmVWZTSGk2Ylg0QTlJS2pwbEx5YTJIcjBxVjNHbThZWVFMTENK?=
 =?utf-8?B?elh2Nk40WFBucHgzd01vNWl1MlRvTHpueEFQZEdVVjdGYnBqNG5lZWRQNTdT?=
 =?utf-8?B?YjVzMWgvNmw4bGpIVUUySjE0NHVzUzd0NVloT3loRDYzVWdsNEJ2ZTJBV242?=
 =?utf-8?B?K3pJZ2d2cHVHZ296RDBXMHdycFgxZEpFV3ZveW93YXlQZ08vNUlnRm05Sjd3?=
 =?utf-8?B?dm5EOUx2NTZQVEJ1WHAzZnF5cUhCTEkzUk9XNk0yek9VUGhlR0ZzWFNOYzNJ?=
 =?utf-8?B?NnpKckl1WTF5emJNT29rZDRXU1pJemFuVGRRWUJBRXZEYXNESUIrbVRRalhq?=
 =?utf-8?B?TVV5MUJzR1ArUWJoQ05FUm5CeHhGRHJLVEU0Z2lOMkxrQmNiQnQzNGZxN1hw?=
 =?utf-8?B?Y1BmcHU1MWdZMkcvY1ErMGtFWVMvWnBnTThGd2I3emdLOFZYSm1oSHhUS2R2?=
 =?utf-8?B?eVpNOFp3NC9EQ1hDRStsMnZLSmdObktmQjVFNGo4NzNZYysvYTYvcHlUenFG?=
 =?utf-8?B?WFJlaVFnbDMrNnN1OEdYYjE1YzczTzVXdUJ1K3BESk90K1FURFlVU0xZMU1Z?=
 =?utf-8?B?RGJWRUlVTFZMZy9vbExnRW5DcVREZytCTDZoMVNFaTNvYSs5Mm5DeUdNSzdL?=
 =?utf-8?B?N0NyWVZpaHNLdGlLYysvWk41MDZ3YXdUOHE1SUczODVNeXIrMis1Vjh0QzA0?=
 =?utf-8?B?Y1lBakpkZ0ZHR3pJRjlTQWJKWFhTcHJwdUJKS3JhZnZiMU5oUVpnZERjM2VR?=
 =?utf-8?B?bmgxSFlnMTVaSzVyYnIyYWVKUzR1Y01hSUtyTTFNUmxZTUJwcmV0ZmhxYXFV?=
 =?utf-8?B?Vjl4aXI3L0FDOTFkZUVQL25oUUFyZ3RmRlBPdkR3MUpPditUenZhS1hxSWlr?=
 =?utf-8?B?SGVFSlhrb0xCU3NsZ0JVVmlPekxKbFdzaXd0MWx1SDM2VHhYcDBQdlNBWjRE?=
 =?utf-8?B?QjcrYnY4R0dlQklVMFllNEVPVjFoOFh0WEdnT09yajZiOTcrQkYvSGhWcXdz?=
 =?utf-8?B?bDBXVlpXU1R6dlBEbm1JNnRXUWdLWEQwQ0lRUDB3L0QxZWtxOXFxNHVmb2ZK?=
 =?utf-8?B?VHV6dUh1d0hpbFVVY1lyT1gvVHBmZ1h0NUJreWJjTjZjWHlqbFNQTW96M2Zm?=
 =?utf-8?B?YjI1TVZrYmhFRkRuSU9oY1lKK0lmcU8xQ3E2UDJrZmMwbTlWVFhCVE9WUkdN?=
 =?utf-8?B?a3VKaW0zUWc0eXdoWDh0Q3dhekxVMUt2Vkl4MUNRUGlmNDNsTVJDVytwRktW?=
 =?utf-8?B?c3VpRlQ1b0hyTitNRmpsSTBYWS9WVzN3ZkFBQ1RvRWE1SXh6dWhPdGxWNjFN?=
 =?utf-8?B?bVdvQnFVSVhxbTRSVy8yckJ3aW9SWlFtRGUzaHAvR3dYd1ZTUjdQTGJRUzFN?=
 =?utf-8?B?TmtYeFRRSWNhTytJNGhpclVLcitvcnJOd0VwLzQ5dlBOYURLYm1wVEFVTDJh?=
 =?utf-8?B?WWhETDBzRzJXcEwydmVaWWF4VDVTMGtDbGY3RlpnUGRabHdRMmNmTDVrbFFC?=
 =?utf-8?B?L3VibzBteDdUNmNkZXdWUlQ5ZHFXMm9XWTl0NHVCY0VBaGRkdEpLcmdlaVl6?=
 =?utf-8?B?d21mKzM1M3FMM3VPcHdMbnBYUFFsbGhXWGVuRDA4MHlqV3BHZStzWkJjUjdI?=
 =?utf-8?B?Q3dwbCtuNHcvaWpmWVV4eE1IQmFGeHpQUytIWkxyMFRNK3VLVkJSZTNOam9J?=
 =?utf-8?B?c3BEWXpUQnNyb1dTVFVWR200RUNLL2hXTXd6Y0VVY05VNlFxclpqVG8wa21J?=
 =?utf-8?Q?o/F5FtLy/Vhx3E1ynX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08dc437-8440-482d-c719-08dedd61b611
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:28:07.1996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwvHZWQC9MdnD6g3v08vrOQ4XTKGoKoqxeyCnkhEi4z4/RE9HfeCt5vBm/x1LNgj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-15647-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:bra
 uner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,m:linux-aio@kvack.org,m:linux-fsdevel
 @vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,m:ljs@kernel.org,m:lance.yang@linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CE1072BEE9

On Thu Jul 2, 2026 at 12:07 PM EDT, Lorenzo Stoakes wrote:
> On Thu, Jul 02, 2026 at 09:49:47PM +0800, Lance Yang wrote:
>>
>> On Mon, Jun 29, 2026 at 08:25:36PM +0100, Lorenzo Stoakes wrote:
>> >Replace use of the legacy vm_flags_t flags with vma_flags_t values
>> >throughout the mremap logic.
>> >
>> >Additionally update comments to reflect the changes to be consistent.
>> >
>> >No functional change intended.
>> >
>> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>> >---
>>
>> The vm_flags_set() cases below spell out vma_start_write(), but the
>> vm_flags_clear() cases don't?
>
> Yep as I said elsewhere, implicitly taking the lock is terrible and me do=
ing
> this is completely on purpose to get rid of that :)
>
> But I haven't been clear enough clearly, so I should put the argument as =
to why
> that's ok in the commit message.
>
> Will do so on respin.

How about also add a comment to vma_clear*() telling us a lock is not
needed and why like you explained a lock is needed for vma_set*()?
This asymmetry could confuse people.=20

This patch looks good to me.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi


