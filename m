Return-Path: <linux-mips+bounces-15452-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nz96MQbTR2pCfwAAu9opvQ
	(envelope-from <linux-mips+bounces-15452-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 17:19:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADB9703CB1
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 17:19:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=mnMlyBtK;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15452-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15452-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B54230068D2
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2026 15:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62F4414DEA;
	Fri,  3 Jul 2026 15:19:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012039.outbound.protection.outlook.com [40.93.195.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B43421FF25;
	Fri,  3 Jul 2026 15:19:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091971; cv=fail; b=PkXB1GJ2crwlm/JFqSTLufFM8XdEpWnyVm9HO6Vam3efe4N2Av2Ex8MOXcWiLCjenpFXRRZIPI7QBo0R479njDHEtFRlcCbRImvPM7rSoSgIY43MsNm2NlSEHTkNt6Kyngge24XCIhYP9k06FLJYsN4evYcVAEQjGcdh5UGDBLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091971; c=relaxed/simple;
	bh=YPa7KdLprzgJKnzrNqkOpWSmYODb/lIws8zy1Jg2mGw=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=VEiNgSKmWpQosmgNuaCOEJmPlqWHvohJDA19znkyvW92mYrZv9ML2dF8GnVcvv3fW/LPm3SFiv1SkCxX7TOcG52LcGYBkAcS847ZUpVbFEsd3p0wWXyoz2Kgwj1NBcHzCnKCmJWh+KTwsZ2engtnDwIwhzUq+26lVIHyWQfki7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mnMlyBtK; arc=fail smtp.client-ip=40.93.195.39
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rd5m6Emj+TW16fmXTB1pci+NBqwXYENjsKVlpGD9ECAMCq4EcFrxnPhVkkMIW4RcBBI34HG37RaG8Led8uF8M2iHrVrQhWK0ccbQVS97v/TAk8XweX7IU+Im+ztTSRWr01bT95TmQVED8847wafdlWo0alwby0VEPrXLaJBYqd1qna8fahsLtay9GBEHQkZelBLdDUBRqRCdp6q5++t3mjkLOshLuIMEObh3eWu3aCjsib4zYzDtSuX1s2ZI4MKmvbl6Sg6FprEiJjqnSItTfENlHySq7y4E2btiZUFnzKRv9ZmvnwdIJ2hTV8ICwEmJ/p5UdY1af2cxKeOf1lphMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJsWbDxlK1lfEc9swedmNLuoU5uhFAQRmSm+tgJfwMs=;
 b=MlVpoqHTH5ZYuGcvTo6vQxZA6Q+ZxE+n0kqcyo0CHUW8OzzzU3R+YG0Xk7iVG7BIY8GscI80LAzKFruvS7JRoWgLCMnnVSCfzPfhQeTaPtlEJn60ndflIMTsW/V/EmUZR2HLExQ/ew5kD1VFvDtf1hFVrbyh8+L9uh7jaFUOPGMYCPEeMZpBIjXcGjWwGAZjmbSjKHVD7RmG1sfNtW7KvaUQu8+8sdTbGYrtz++fAbn+xA3YfIFkluhIzjw8GmvIRLGcxKcCcA5sivFJ0tqfe5BEkgEUbXe84jqVgO73hHpXrCdlAvDAcNowP1n+1b/iWw7bPkEpQ2edrmJoRjCrew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJsWbDxlK1lfEc9swedmNLuoU5uhFAQRmSm+tgJfwMs=;
 b=mnMlyBtKDLgxm2OMOM0mkmruD50fISkEz0+Rm+W8d9qTDm8k5EzC4Q3/8cx1JgWQOS8tPYLdVYIkTY19mOOH12wdO6H9G0SrjIYZE/9oDIZtJiWO1BfN5drpSK7RapWDqpnIAwIgo53cOphJ4MhLrRJv9Y5xq2GkaeWUIDPMrAf7Uv6B439nR/YQdSgOzevGmaTP/v/4/DxTYP9XtMsDyRyqHf+IEvLadGOW7bA/7ZiAPMhnMqJshOpYXFQBXVXCOxGhiHJ9UzunYdxaS+1ZvY7HagMXeCCs77ohgUMUuxtU0WMyOp9GuYgmcxgs0NxNoqKsXfRV4OaEnw5ikaO1Og==
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH7PR12MB5856.namprd12.prod.outlook.com (2603:10b6:510:1d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 15:19:24 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 15:19:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 11:19:17 -0400
Message-Id: <DJP1CGPF8ZW3.3BI3XRFCCYU6D@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH 01/13] mm: introduce vma_flags_can_grow() and
 vma_can_grow()
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Lucas
 Stach" <l.stach@pengutronix.de>, "Inki Dae" <inki.dae@samsung.com>,
 "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin Park"
 <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Mikko Perttunen" <mperttunen@nvidia.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Gerd Hoffmann"
 <kraxel@redhat.com>, "Dmitry Osipenko" <dmitry.osipenko@collabora.com>,
 "Zack Rusin" <zack.rusin@broadcom.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Thomas Hellstrom"
 <thomas.hellstrom@linux.intel.com>, "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>, "Helge Deller" <deller@gmx.de>,
 "Benjamin LaHaise" <bcrl@kvack.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>,
 "Muchun Song" <muchun.song@linux.dev>, "Oscar Salvador"
 <osalvador@suse.de>, "David Hildenbrand" <david@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>,
 "Nico Pache" <npache@redhat.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance
 Yang" <lance.yang@linux.dev>, "Hugh Dickins" <hughd@google.com>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Jann
 Horn" <jannh@google.com>, "Pedro Falcato" <pfalcato@suse.de>, "Kees Cook"
 <kees@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-mips@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <dri-devel@lists.freedesktop.org>, <etnaviv@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>,
 <intel-xe@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>,
 <linux-fbdev@vger.kernel.org>, <linux-aio@kvack.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-sound@vger.kernel.org>
To: "Lorenzo Stoakes" <ljs@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>
X-Mailer: aerc 0.21.0
References: <cover.1782760670.git.ljs@kernel.org>
 <f2e8c32515d328db62279cc8bab8398ea278d74f.1782760670.git.ljs@kernel.org>
In-Reply-To: <f2e8c32515d328db62279cc8bab8398ea278d74f.1782760670.git.ljs@kernel.org>
X-ClientProxiedBy: DM6PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:5:335::30) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH7PR12MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d166c3-9eb7-44b5-2305-08ded9167693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	waK9HC66LHyvBqm/X6oa+SmhtU6o8X1iOE5NifCkoFkl5td3cp7RXlP+HRoyh/cPFfi70qQO5DQzjzA6/Tubl7xExcVdSWQd+1uWXGR2/gZnGhw4MqYnjDvjFzQBfBBDyvbTxCAthTYUGWdeifgcBwOPeuRIdFPiiFRrUf8cI8NyQLgNhYG1d9toWhc/iTV/sMRgjuC0gqZf7KKvfczTA/r5DoDHE8+8uw0r0waNlUYq+kVtsogTd4HMeap1Q/ZGs42D2YrV+r+5WQkQWUapt0DojyhDAdAmhm5LrxJpJK5EtINZouQbNgQHddP19XtOobJmcUt8jShLMIJocHpoBUnvaALynq3QYcf3VBJXViaATppkrRwmpHWnhW9MoQaFLp9BTE3SbavKLcA5+Anm6t+qECfj0oVTwXb2i5QOQvWEe074SxPlzNCClQ6OAFZGUJuEWuCn9futMXAribhavfRqlwDtPIMaz2obrS2xVTK5R2ZKOxYDiTNfSZL85RJTGnykaasKwCuBFvLX3U+DscbIUXiSF/qxXs4R/q6jP3tNiYzOl6jM/E8w+7V/mCisjndwxIaC2DrRoSjttxMZ6IXYMQZBdUWQ0gMF335ajCA/GS4nm1PUrfUwMqdVRVfSiqilkJEQMTsQvGZqvzNXMXkjxvHcG3sxuHOFhqZeEzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGpZaHFMRFpUd2wzWXozWHFHZE9SK1B5ZHB0c01aVldkSTV4eWRWRWU5OWFS?=
 =?utf-8?B?Ri9rM0MzSjdwMlZyTHFkalNyb2wvQ0ZsSTJUSnlyOThOQll3MEFTcDRHTzQz?=
 =?utf-8?B?NEJIUzVUSkk1Sm96UXlNM0ZZNllxNC9EV2dTV3dwN3JhdWdDYWVZSGFYUWt6?=
 =?utf-8?B?ZjVYb29udGpJTFQ1U2tmMzVBa3FwamoyU3c2Q3JyOW1RZW1RNUNaYjQ2U1Iv?=
 =?utf-8?B?WjRNMHUxckZxcnArY2xtMWd0MXVlMWg1RjZzMGZTdjl1QjhqaEVNeXF1bDBJ?=
 =?utf-8?B?aXd4eW83U2IxdzhCV1VWUU5YdXcwQWFINTM2ck84TTlQdkpsMXRDZEZBdEMv?=
 =?utf-8?B?eVh1REs1THArbElVQi9RVzZuQW1wMjZoRjZJN0M4U0NpVW9sS0NQY0tXVjc4?=
 =?utf-8?B?aXhQM2kwUGE5ZzVGUVlOdVp0ckM5MksrWEluNUhYeENtdzVaNmt6MGh0QjF6?=
 =?utf-8?B?WWlVaTVRd0JUR0x1UUtMYklDeEhQRXJDbHNHaDN2Ly9PcHJtRGljelJvcUtV?=
 =?utf-8?B?aGM4RU9YY2orSUMxLzBBMHkvNmVlRkwrVlZMNzRMR09kZ3BlenRyT1ZZN1c1?=
 =?utf-8?B?SHNTY05SUWFoTDdLTy9ycGF1b1BWaWJSSjYzNTF5RFBvZVFwMEZqd3hEV255?=
 =?utf-8?B?bVRhd3dlRWx3ZUczQzN1Uzk3NVM1ZUhMeEszcWZ5eXd6Z0RONU9qaWRwTjc0?=
 =?utf-8?B?RzdrcEduZTZPS0I5UWc2U1ZlajNQVlc0cXJNV1pNTHI5bDZtQzBnRnhYSFRh?=
 =?utf-8?B?SG9vMTNuRittdGxrZWNmaFZTZzNiamlpU2Riay8xRVlsL0lnUTVKQkgrOUdG?=
 =?utf-8?B?SC9SQkRvdkd0L0x1VFR1TnBYSDFoYXNKVG1GcFVOQ1JLNnA3VDI4b2FRVU41?=
 =?utf-8?B?UlVTVHB3YkRWVFhzeFZtc2YrQzZSVDlwRVYwSTFodlhNbm95MkQ5bjBhTCs4?=
 =?utf-8?B?UGZKUjZKODhnTVI4SU1wRjgvZjZwM0t6Rjg2ZnBYcUQ2VSs3d3VUOUlyYklu?=
 =?utf-8?B?Z3NkMUJUQzJpMFY2WmxWRkh1eEhhbDZFOERtdEh5NE5WUTYrbWxUQVQwNmky?=
 =?utf-8?B?NlpTTUwwVWxtVHlJOTl3cjFtSDh0RjMwUlVIcThYU3FJZ0dlOHdTU3hraTl1?=
 =?utf-8?B?TzdlMHlIaUVPT0d0L1c0SzhEWWlpUGdsbWV1UDFmWDNtYzZzYmZWVVhRV3VT?=
 =?utf-8?B?a3M4Nkpscm5tZnhYVjhMVUtNRk9yQXg1K1QzOUFObURza091SlYveU0rM2VD?=
 =?utf-8?B?cDNIYnhWZkZQNG8vWHVEQnFWcFRVTENRNkF2eUVBYzBjT2FLZm5HK1NjQTRK?=
 =?utf-8?B?eW9HNkRwRXBZWllRRGgwODZqTmNXSWpBVVpPaUF4cm1LL05BTVlLcFJWclZQ?=
 =?utf-8?B?eXZRM1dyMjRVbWM4aytMTDkxc2djWVVacFFMQWFzL0JrczlzR2J2ZXhBUjlm?=
 =?utf-8?B?ODU3WFhwZmRWOFlKUDUwcnMrR3MrQWJhOGY4K0lmKy9qOU1rVUhlRUhtVnlk?=
 =?utf-8?B?TWdvanpBN1ZJaEpZY3BCbmt2aDBWd0Q5QzVONm94Z0doVHVnVFRHRlhYR1I2?=
 =?utf-8?B?SjRNVDgyZm9MYzNiRHhNMnEyL2NONDJtUkN0dVV0aGF0cUNsVmovM1Z4dUgv?=
 =?utf-8?B?dHlyb0J4eVlJVXpkME16N0Jqci82UGdKQmkwNEFaVUc2aUJEZ2Q2NTd2QVo3?=
 =?utf-8?B?b2x0SHBSeGkwVXNmQWsvYlZ0aVIyZlJVNW96R0xkZWpHd2EwZkRFVEg0SGdH?=
 =?utf-8?B?VVM2MzArMWF2K3hsbmgySllIaFJmZlQzUVd4SmRhWGZ3Wmw5WTlKRXBCb0JQ?=
 =?utf-8?B?cTVzT1l4UlpWNU42cHpnc2lnSk05QmZsekR6aDJKNDR3SWs0b0tLTjR0dVJR?=
 =?utf-8?B?UlVJdmhIQTRlcFZ2M1VsVHcvWFVyZWFNMzlsSUFSdGVUV0xXREdaYjI5YXky?=
 =?utf-8?B?VU5zV2tHL0VHdEYyREpSd3FFaUtzaUhDYnMzWFpnOGd1ckJqaS96dnBxbE5W?=
 =?utf-8?B?ZGNSaDdEY2dsQnk2RVBYUzMyOU94UzY0QWRQd21hUHFDV25qUG9ObW0wUWQx?=
 =?utf-8?B?RlM4Y2l3ZW1QQWhCcjhmaVdqMU5QRno3QktZbndYNUhWbENBZCtXbm54OXFo?=
 =?utf-8?B?b2F6dk9XOTY0OG84ODZPWnB0L2RzbVpxdm9IM1JYZ2ZPYkRlZUx6NlZmb1lk?=
 =?utf-8?B?MC91eVNkVm4rekk1UVlyQ1J1anQxRmxuZ2IxSlNVdHh4VlJjSmFyM1hxMnZt?=
 =?utf-8?B?QlBTK1FpRk96U3JZUGcvSEZaR1pDMWs3QnRPVWlnZzV0U1lINjZzSE9pOENE?=
 =?utf-8?Q?FLvWesTPpyJ9tzjTvw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d166c3-9eb7-44b5-2305-08ded9167693
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 15:19:23.7516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ve4DjdZRKH5W6DDGg77kv2BkqOMwB0CUDzxD06BnHw7k9x0Ex3i12jMTXkRZN8oc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5856
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-15452-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:muchun.son
 g@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,m:linux-aio@kvack.org,m:linux-fsdevel@vger
 .kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,m:ljs@kernel.org,m:akpm@linux-foundation.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,Nvidia.com:dkim,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3ADB9703CB1

On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> These test whether the VMA has stack sematics, i.e. is able to grow upwar=
ds
> or downwards depending on the architecture.
>
> In order to account for arches which do not support upward-growing stacks=
,
> introduce VMA_GROWSUP whose definition depends on the architecture
> supporting it, and use vma_flags_test_single_mask() in vma_flags_can_grow=
()
> to account for this.
>
> Update the VMA userland tests to reflect the changes
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  include/linux/mm.h              | 21 ++++++++++++++++++---
>  tools/testing/vma/include/dup.h |  4 ++++
>  2 files changed, 22 insertions(+), 3 deletions(-)
>

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi


