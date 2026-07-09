Return-Path: <linux-mips+bounces-15643-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BIxJLAIBT2pYYwIAu9opvQ
	(envelope-from <linux-mips+bounces-15643-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 04:01:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7572BCE2
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 04:01:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=od7I2D7X;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15643-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15643-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D4893026769
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 02:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522E92FD675;
	Thu,  9 Jul 2026 02:01:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A405733E;
	Thu,  9 Jul 2026 02:01:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783562493; cv=fail; b=Vroc7v+T69T/HGEjD+Qj3mzCBITf5wq535t3vojl8Qp8nEsM0pQQoYuhuNXIvIwEGa8OGDk/kbBoQFK+n9TYwKERRYxFqbaTFbdv8KDlJk/ErliAJ3MC+RicyusTOcicm6bYdEhEt5gpau47NZvymEiSTNlQ5apb0U9pM198D+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783562493; c=relaxed/simple;
	bh=TYCUwd0iWnLOy1Ft5bhU83mfdyP/viPV6LbdCa//aBk=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=W4YsUArKsk1hKz+rT1wF3EpDUowTr9fCjfFaxwnWdgL6LbeYeA28OLpzMsfTO94g4p4Ga3kNyPiwbmqAr4PIMz/9TxqN5tupoBCqj9tMpFTl2vp3Gh9+3p+T/IbUwqYj4jE3wo4I1LTnqHlVWLyZWQueUICoTW1ph+IIMNYs1no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=od7I2D7X; arc=fail smtp.client-ip=40.107.200.9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWkBxyic9jZ9aB0TEIr+uABUzsEMKvavL3RBJFfzjokb5uTCtDL/pSJr3NisBdW/7DQKhPSqqf1orgV0zZwHnu3R/IzFLqS0fP+9iYtWAqjXVUrPaf0UmZ2rMyMZzlpKL8un3KH95QR7NFPYSV2RrWYcHxqWF+3z1ENKZB6lOY43qhbyxdWmlX5ucLKfsU9owS4Es+6bc+4TNVdBuetExN73/N8+aFZ8UD5jdw/Vw7GjvaUcseoa32+nPBP9P5YuOtdP1nrJCPIP7kboqvHc55FGS8adxWI2AOGPXmUmxy6DwEax4VPAZUv9pAinsATo3yHoqEjBX/6kJFAPRE0Jjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmvlPdta5CG/qbDEpWZ862t99nVjshVFU+ZOfIMLCC0=;
 b=OAjkV9iY1AdhdGALcaGLONsK9N+JG6WMDwOJFvhhfppAfopn4etcqY9zszFhylHk7c9MtQmTI8d9YjV6DynjTRJVhoMWOUegNMzTWg6x/TD+z/rbJo1690D1/nMSh1vd/LbXGxtsgwRpBCb7WO/4+Bizc2ENUTjukhv+xsmaVr0NUiMWrBPkqZrBNXdNWIkpMNPWChhHmG1OAmmkQNf6q+pSFf1KnmKrg4kbAugfGoeOFisSZkL7vfdilrv7VOlVd7SOEWu/SgVMZAprtCfFYzNN3qYSIRzIXINivrwcqKlRMnI5LYWIAkO7JlF25kaMFW/6u1XyAutiVywG31OubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmvlPdta5CG/qbDEpWZ862t99nVjshVFU+ZOfIMLCC0=;
 b=od7I2D7XbbZWMNgTLDO37C98Qbzj9sJ7+2++EPsZIMwD/MYc6RMTB7G5YZKTGe7jBhTVSp3bJgoczXi147UkGjOXkd1WCasn9yv01DHfGmeAKhbOR/IDSoIZHhW1sVyHcu6wWYsYJ8YNp6lgBfS10cCwXY9llGaj1ARXYmJqn9dMuJTr2MfDCLTjlJCDyb3CExU6gaCadUltIcAHu4ENPvaOvk6IL4DaI1LDpczQr1t5Skw/M8+e/bEzosepeKfaUV2F9V0ZP6sZ+RH7TIpCM3s/NJC/KcYu20fey2xCBl8XiUVtchfubHtT+mLr84VlPyWRhJRykohtNpwpToEw9w==
Received: from DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) by
 MW9PR12MB999208.namprd12.prod.outlook.com (2603:10b6:303:301::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 9 Jul
 2026 02:01:27 +0000
Received: from DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a]) by DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a%3]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 02:01:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:01:22 -0400
Message-Id: <DJTO4SXFAKEV.1GVVCX3LZ6R0M@nvidia.com>
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
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH 11/13] mm/mlock: convert mlock code to use vma_flags_t
X-Mailer: aerc 0.21.0
References: <cover.1782760670.git.ljs@kernel.org>
 <2db16db81538355ca65f778c246d2381c673cad4.1782760670.git.ljs@kernel.org>
In-Reply-To: <2db16db81538355ca65f778c246d2381c673cad4.1782760670.git.ljs@kernel.org>
X-ClientProxiedBy: CH3P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1e7::11) To DS7PR12MB8371.namprd12.prod.outlook.com
 (2603:10b6:8:e9::18)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8371:EE_|MW9PR12MB999208:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e843c55-46b2-40aa-cf91-08dedd5dfc14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	nolwAH/HflNqhOdXfVNEHXPWmfYmrb2CHJpKakonkCCOujU+GP08qzoQfxKM6395PRh3Rlu6ff7zE1UGkwgFip6rFZfhsdXXAKdzZxdD3Q2b1ePyBS4PgqLLt3Zs5/BxVplOKwXz4AObxQ5FChdOaUtzFflALbvvd6xN0UFh4VFqpwtSZ1eo4JNsxCmUemtAvGKGkBsYMisbJUCWaNm5ppyYh0/HWLD87b1oKhTBSxl5v8qHvEclurMsqVHWOhKYZRLncnvz9FCrF8bl4/p3IGyctB/ck9AiSFYsT80RVQHMUPtMuq1euO9Z+rfCXzx/X7EJp5DktH3dYYJxTGMvrpjsQgZiH5erm/ADnCrwEzTJpoIGsJaQqP6Um2r+DAJuRz0nrW9kVR/0+Pno41jPrnUMPpB1KxJHYLvEq0L+/zfkDeMx5i35kiHiIWp6Az3Nlr8/76pajbyCfzL2CT0iB5rjpEaOQqKaAUMkv7v+2Tk8mN0sC0UvGZYppYX22/CAwFky2APeipdh7vBxKsTif5SGbEHvrGRkNGlat9dBWRU4V8+Rwj0g/SWJ0FhEQP8xzfb8salZTUqVPcMjZwM6r1vjdItZHgHGgl+KLC8CMB88QzebrhVYG+8fHRN5snAjh7vkd+YfeOdB6jFpENk3L0oaK1+Nh+CyM6AeUmsRQpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8371.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzJxZUhHdG5PNThGZnNkZW0xOFFwSXBtcVBvc0FaekgvTzN2YTd1OG1UQlRa?=
 =?utf-8?B?enlibnhOblo0N0x5czVua0tidnNHa1ZlNXc4dEtJOGhtQU1KbXJjRHdKdnNp?=
 =?utf-8?B?OHcxaXFUMTRPYmhOSHE2cjh3U2VocGUxZVM2dzFIbXgvYnQrbnIyb0FxVkJX?=
 =?utf-8?B?VnpQQ0hwRE1UeEYrTlRBNC9LNDJtV2tMZ0R0VUlUbHAxK3pPSHpQSThtRkFu?=
 =?utf-8?B?MlZHUEt2cTJZU25yNXhiUThVU1pkVENqWUtiVGF1bUxwVytRQlJOZkNCd2tQ?=
 =?utf-8?B?SVM4M1FaQU05T3BlQUlETDJ4bHJWV0Y4MUU5SXNxQ05nOFMzVUQvNnNoNXBT?=
 =?utf-8?B?U1luS2w3UjVKTFN4OHpHV2kxKzFxaDdFSEdKRmdEM0tBZXNkT0dMS3dUV1BC?=
 =?utf-8?B?SVJrL0ROODRxN0hsSkN2TDNadlFueUhDZHVXM1FrNkN0Z2FGY3VmQnJzWUp5?=
 =?utf-8?B?aUI5VHlJdTBoY0NPaWMweGVkaDBEN3lYQ2hGekV5RjcvRzVkWlhhY0hid2s5?=
 =?utf-8?B?cnhtZVh4VHdHdk90NXlqZEFGOXdrUFpJeEFWOXFMdElVRitHL21FWGxzZlBJ?=
 =?utf-8?B?b3QyeVlnUTZZQlh4dUhwdXBxUURJWGNzNnRNaU5rakxRVUtyZFV1Skl4aWlV?=
 =?utf-8?B?Q0c1dW1MSGxvTkxhMVVIajFlRGk1T0JtTlNQTmhqT01pU2R1TytvUXR3N0VZ?=
 =?utf-8?B?ZkU0TExaancxL255ZEdhc0h6YmpsT2kwNDZZYVBOTUtOa1VGV2NBS0pKd2FH?=
 =?utf-8?B?T1JsRUFnQkVJMVUvaC90WXZqT1VYRmt0UjloWjJrZ2FmTEp4YTdOKzV5eHVV?=
 =?utf-8?B?T3JjNmptazh5UVZTNHpPYUhuRlpkTENLWWpLTG5rSUcxdXVyNFd1YzlxN1dQ?=
 =?utf-8?B?cGJzaUw3cFovMDRMVjVYK1FKU05kVDU4N3VpTXJXbUJxS1ZRcU1vVHBUWGZR?=
 =?utf-8?B?NFlkMFlVQWpjVlRWN25qUEtMYThUZWFpb3BIekdncTJXb1MzOFhyWDh0b1cr?=
 =?utf-8?B?U2JmZU1wT3ArbXd2SFU4UG5QOCtONzNlbW0rZE9qWXBuWVJ0VkJQbFYwT1pC?=
 =?utf-8?B?YWJQWFRRcGtyZkZtTUR5SXE2Q05tV29XM3RPZWYvMjhHcDRreERrZVliQVo3?=
 =?utf-8?B?VkVHdGxvSGlHaHRMVDBwZGpaMStpeStkRUg1VHozbURxV1BRYmpBVXpEcmRO?=
 =?utf-8?B?cDloM0pLYm9ZMmtTSytiM1N5bXBPUDJhOFpxSnpjeGpQRkoxZnIyMkt2NTRp?=
 =?utf-8?B?NndJWGhPS2lPdWIxQ0orcGJ0NTdFNzJnSjMxWVZKYXNZMjMrblQ1N0Jpdmly?=
 =?utf-8?B?NjMxOE1xVkxGckZPUElmRkV5NFk4Q3A3aWJEZjBRbkJxc3N5NDNDTlhORXBr?=
 =?utf-8?B?VGtqQ3hBWFp3VzJ6djFvOWV3Q29xVXdVM0N1Q2U1bFZDK1hhakNFdnlKVk5X?=
 =?utf-8?B?U0xOdkVIbUZ6bEZ0bDdQT1QyaFB2TlNqZkxUUk1QRm9TUThMVjN0eTVWbWxm?=
 =?utf-8?B?S1pqWXJpOFl1ODI2d1I5VXNDNVBXNHpvWGRuWEVWNU0wNm1ydUJRM29xdFc4?=
 =?utf-8?B?WnFNb25ZL1B3Y0tZalJidTB5VVlrVys2bzVLTkV4OTRpWW5RODIyTUJOTFN6?=
 =?utf-8?B?NmJ6dEFWRXlMaDFkY2VTbnIzOVdjR3JxK3pGSElhdXhnSWtOa2crQjV0YVEr?=
 =?utf-8?B?d3E4TXVRS1JnUTAwVVhGMTVxSm81WWd1dlRHOTRPbExueEh3YjMvUWdjM1dX?=
 =?utf-8?B?UGMyYUZoVDNpRUhjVVJIVWJweEs0TlpPWlgzd2U1d3ZsRG1sTlVGc254Q012?=
 =?utf-8?B?eCt6a3pxNCtwUHNyb29oVDdGZjFsMmpjRjhsN1RPeEJXVHhCYkx2Qk5OZHVy?=
 =?utf-8?B?NVhraTg2NzQ2T0tPdkIxSHZsOFlaTDdxL1hZMDEwMWFteWpZWmFxcXM5b3dC?=
 =?utf-8?B?N2xJWHlDRTZRL2lkNVYrUGFGekpZa1B4QlFlMlZ1d3dFTkU0WkdCSjMyYTEz?=
 =?utf-8?B?T3ZIVE1uQU8wM0Flb0hTblZBeS94OUJSWHJ5ZFZDblZIY0dDOVdNakY3SHNp?=
 =?utf-8?B?Z0ZIZXUzM21yRzdZSDY4bVNmQThHRjNyTTNpckVydWZxOXFibVo3TklDNlBH?=
 =?utf-8?B?V1NYdDlnUmxERmN3Z3prVGNYUGxTTEl1bkJoY2Z6a3JneDZHMWNhVEUxUTRS?=
 =?utf-8?B?d0RTN3R3aWZDTVoySXI3T0JGU2czVkhtQTBWSThPRzJKaFBkU3AzVDVQSUFv?=
 =?utf-8?B?Ti9iMkM3NzN1LzZvR2pLNTBvTTIvM1BhNklWNzQwelRDUWZQd3NKT0JGaGJl?=
 =?utf-8?Q?iDkNqQFDSUjGYd2EiZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e843c55-46b2-40aa-cf91-08dedd5dfc14
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:01:26.6249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZQmpIPqAHsK78b5WJ2whqNc26k65qhjctGREyCduoZER/FcZ/+pHaLhaV47Mpuc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999208
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
	FREEMAIL_CC(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-15643-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09F7572BCE2

On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> Replace use of the legacy vm_flags_t flags with vma_flags_t values
> throughout the mlock logic.
>
> Additionally update comments to reflect the changes to be consistent.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  mm/mlock.c | 86 +++++++++++++++++++++++++++++-------------------------
>  1 file changed, 46 insertions(+), 40 deletions(-)
>

LGTM. What confused me when I was reading the code is VMA_LOCKED_MASK
and VMA_LOCKED_BIT, since both share the same prefix VMA_LOCKED. Before
looking at the definition of VMA_LOCKED_MASK, I was wondering when to
use _BIT or _MASK. But it is just a naming thing.

Anyway,

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi


