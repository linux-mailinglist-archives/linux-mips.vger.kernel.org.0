Return-Path: <linux-mips+bounces-15609-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8EbqEI+2TWqK9QEAu9opvQ
	(envelope-from <linux-mips+bounces-15609-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 04:31:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B70D7212E4
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 04:31:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=JIPPvrzz;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15609-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15609-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 520BA3008D3F
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 02:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0B63B71C2;
	Wed,  8 Jul 2026 02:31:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8198379ECF;
	Wed,  8 Jul 2026 02:31:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477896; cv=fail; b=m+lq+UamDFM0Nr3vIThhoCEcLOprjbRZzIe1h2fRMjgRlnB86pBG+OWbW/pck8M9moJJZtoUKylg789F8eVGfwnRTYdAUMG/owuBjnyzHxFrvHzUqO353OHhAHNFjaNFOXyMpD447MySIEyixhLFeknnvupDTBG5hHhrQhxsVDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477896; c=relaxed/simple;
	bh=3/LOWg0kwoCIz6pngmBYZw1CgaL+8IEJIqGbJeHc6CE=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=cW+ebdVaf3SwdCwqZvjTPv8uhy3ALTDArq+NwdxBtX65RW4uYrPqnBIQ3uwUmZzj68D3clNsSn776LnUAV/wO/qfd8tTIaHJc/9CK9Ov4Ajw0rcxwLUq0YwIR9l5iP2w0JHHeOt9t8Sq/KfOt1KZkvBHKtwCQ9wSGpl7m7JYCn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JIPPvrzz; arc=fail smtp.client-ip=40.107.201.53
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SonGZCQTfL4B86QLMg28+HjnMm4XXarTlNQe/Bl1VayW0rTNE4KvMGL1vb4/1z68SP5esKqvsDATtGeYj0TSdQqSvEofdIaCNB4RLrof+2OyaAgFY9eAL2CGY1qtGtJOGhFmvfwcr8dsMTgTF5fBfMsPUnejzZzsx705kgVSH3PydNkqdLz7PW3Q/RSjJQ1HmNfz642s9v972prGQI184HXl45fjtGGprYteL/T/JXWkwycIHGHgVcLjhNUsXQ+FMUbPl5VoH/7Z503G9UHOPXXpze6qz0uBA7jbSeH9XZPvRlS3c0Gn7FSSXuDq3EkXMOXZ1QoeKSW85dKB1bExhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttxfngV3H6lKnDvvUfKS5bkddGHszwBGKHpn0tQr5RE=;
 b=fW5ZYoDK593YrhoaL/BRgnDrqzx56QLI7hX7jwS8PHqSWS4ZXTp0vIxBIt3+2CWwzeLMlNzKB7Tjk/N/UhbU85EKfTQY7SX1NwNlUS8NkqAGVnLePBRbxFoqRRDj8wntTR+bZ6oNtASkKtXM3n2DNLg94ysRdMei8tV4o81dv6xGDGx0bRs7m+dHMFFTiyO5kcHHYJJW7gG6je7DXUhK+iTGux39U2wQL8wf0pUrJwX2zFRDDNIkJD6uvKMsWC6VfqLg+G/7Ak7nMZ6Dqbuw/WpjZn/pFDlukEKIe85G3py2Kn0JQO5i+8tmi2nKBnum104bqdq9cOLW1WPAEScz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttxfngV3H6lKnDvvUfKS5bkddGHszwBGKHpn0tQr5RE=;
 b=JIPPvrzzvMNKQT/d2ads8Yp2iQI9LfaFy/tnTHGUQmtOyY4VAtJ2pdMjazY5ualqo57UFco5Ai3JsycxzgYlszh9z8tpjaqawKRFpGSYcmG/jl6q4ZnFSk80Rsk/WVpVH8EzdkCLl62ODFMF5CGmRLFTGaPyLSv1qU7Q9sgANOIYnMb0cRwMG+GFKm3igm3k4gL/Yk83S6Ix0iJJrWEmT0uO7kM/O7pkQFsH6IeEPnZU/PEXJn8vmosJg5e4snOCus5Od3m9aelPdSWJYe/zBcnwFq19Ybl+kylpqq8X6SVAKTSxSyweaoIeieRdm92pQkiPsfVaeFZV1L7G71pAkg==
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH8PR12MB6963.namprd12.prod.outlook.com (2603:10b6:510:1be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 02:31:25 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 02:31:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 22:31:20 -0400
Message-Id: <DJSU57KWRK33.19HLU7QCZY3B5@nvidia.com>
Subject: Re: [PATCH 07/13] mm/vma: rename vma_get_page_prot to
 vma_flags_to_page_prot
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
X-Mailer: aerc 0.21.0
References: <cover.1782760670.git.ljs@kernel.org>
 <fc8ac30d03d29d236e76542b36432bba315aca60.1782760670.git.ljs@kernel.org>
In-Reply-To: <fc8ac30d03d29d236e76542b36432bba315aca60.1782760670.git.ljs@kernel.org>
X-ClientProxiedBy: CH0PR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:610:33::23) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH8PR12MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c05e9e-54ea-49ec-52a4-08dedc990200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	6zKyg7WjKnD8NHUW7mttETO/Y4eH4we/E1sHMS0ytvmyx61z1DwP9ufk6c0tJEUYMPG6+jc8oM/TxoPAmcQ0jmsfCfDpWtLWfo8Ybq/X6Eq2xYl1ozonJjXPHKNxrCL9QL4zoW7v39R/GrOMku2OopmKutnX5y4HRYskg0wH6GkRNZoWn3zetDf7nthvPB4hQ0RvmCndtzlxbsNZLMntn2iHiycbmFQ5pr5XwT7hSOyxodTgR0IEVEIicRrduNzgGlFAIJXV92AcWC12zxAwsk7d6sSVbk6cR8Pu00D+5c7sqR+bWNw4nufj6eyN3GGIe2gOpu7klmj7sZ/gmhe+Kv4zIdcY5ftrpIFvoq1LuM0uc1P+l/q9r5p0GRizZ8L92p7UmF00woumt63jpCJ5xkfRZc1VvcSNY+FDROYGjAqEs7HrbiYSA26DiWXkHnJWz7rhTAM11ps2bLrrhiyP6hSouKyYXmUwGkwg2Mj0cDgQQK0CtJumnF3nxsTpVYsGHc+jH3Q+HBSZj/TeLjA2ee37eibTE714X7n92NPeode/rgqzXyBmWQOgji5Vdno2xtUnN8JGI+D1BNqdAdi6yG31Y63pEgHB0CKTbUehSDFQsgmh/0YYCQJvZnqYkO5F0V7wRilVzsm2VFpv3rzL/pzOCEJXa6opgisfRTMleXM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3M5UnVicVlCaS8xUzU0UHRRNVRKWXBPWUZFWE40UnllR2xOSERnZjVqblRF?=
 =?utf-8?B?Q2dUQVFocGMrZEF6ZnFraFFEVGNicjNYUUZReGN2TVdzdDN3cmJMZy96aG1o?=
 =?utf-8?B?RzBMK21zU1g0RUdIOVlIbjZ3Nk1uNjIwN3piQ1p5U0V5UnRGNmtjTSt2MGh0?=
 =?utf-8?B?eUs5bWtKWllwcm03S1NuTlZsRiszazFtc2t6T3I4Y05TNVFvUWhMVDVYdFFy?=
 =?utf-8?B?dkVQVStGeEJpdm5oNGxIb0lwTXFMU2c3U2R4NUdTWFlTN2FvTnpCWEk3aUNQ?=
 =?utf-8?B?ZGJFNUliSXY3Z2pVR1lETFlmNHhsdm5wT0V5Ykk2U3hsOTlBWFdzNkRxVFda?=
 =?utf-8?B?OXpBbmtURnJLMnh4M2VKWTdKZVlENkRsNVRuQXdWVmRPN2hUL0pGOGxMVEJS?=
 =?utf-8?B?VUVzYlNGalhZeVlqZDlzbnNWMWMzNEdhN3RGeTlVS25hdnFjUmhTckoyNHFK?=
 =?utf-8?B?RTgwUFhtbSt5aERYOWU2ZTRjelhkVE1KN2ROLzhNU251YXJIRTFWTnYwUHRP?=
 =?utf-8?B?b2dRL2FwdGNtUEtzbUJ5enAyMDJIL2FXOXp2WlF6MmhkRjF2RTd3bW1ydjY2?=
 =?utf-8?B?VVJ4N2RPZnNjdjV4VXA0aDVNTTIra3hmTy9yeVN0a3dSMmJHU21ERnVqRXlJ?=
 =?utf-8?B?NUFoQlRrelpNdkRFV0FmN0h1N0dVbm5OQWtRSzZZdHN5K0Q5S1lUV2s2VWNl?=
 =?utf-8?B?ZjFXZ2p6ZEMrQmh2UnVyY2xQc0tucGtZellLOWdreGM1VXFqdy8vOFVJWXd1?=
 =?utf-8?B?dVB2MldGamVTYngzbHBQZFdYL3FGTTJaajFxNnA1SU9HVzBVWmVldDY4cHls?=
 =?utf-8?B?bTNNRml4SFd0VzArSWdpSzN5Z216OHVKSStraUVudlUrNmJEUHZ0U3VNV2Z0?=
 =?utf-8?B?S1lEWEpXMHdKL0RURDdJZEFQTXV3Q21oRlhQY2xaMmhDWFNTYUs5RDhSK3dx?=
 =?utf-8?B?cUVEbE9lUFJEM1Jwc3RjVllPWlFxSE1vcDZBNDlnaGJBbDRqd1JVTTA3dFE2?=
 =?utf-8?B?ZXZ2OVVlN0RoM1NJS04va3dtY2JWbFIvSWF6RDVaeHhDTFlOK0JGNFF4RHZx?=
 =?utf-8?B?UjJ4RVlWYVFkTDFSRTB0YUZldTVaUFJraFArTG8wQXlIKzhLbGQ5U1FCZldB?=
 =?utf-8?B?SEhDbzhKVER0RjBvQWJ6OFZsMmtHTW1wR09YZldpSUNlR3o0SURLSHRNeWFR?=
 =?utf-8?B?eUxiY2xBc1I5QTFJdjMrVXVXVTFVeFZadlo0am5wTEU0YVk1TkVqSHp5S0dl?=
 =?utf-8?B?TGFVZDREWC9LaFlHZEVSNzRYSW5nNmxhNkh2c0czMUJqVUJyUDliRlBIMmdY?=
 =?utf-8?B?ODV2NEF0UTFGQy9RR0pPb096RnRzTUpobm1YVndEeFM5ZlRiOUVJMlBlZWJN?=
 =?utf-8?B?Nnh6SnpUUWN1bGtmZlRlUzhLRGZvTzVCMmtnZWgrRC82KzVCZXNoYUd6Sm9h?=
 =?utf-8?B?NzNYam1LYzR2QUh4ZGNsbHUwRkVGVWhsME1CVFBScy9JN05hMlFmb2Q5Uk81?=
 =?utf-8?B?OGVlQ0luaDJpOGUrNGdocEZhZC9qV0lQOUt2ODBaakQ2Mnc5YTFVajQ4WXJQ?=
 =?utf-8?B?R1psZDZmVGphbnZRc2U1eTR1a3h0RkppaWdpeWMwejJZNXErelhLdXlUTWN3?=
 =?utf-8?B?c3RISU01NXppQ2FtbUJ3M3FTMDd6Sm5JQVpDSHIyMFFNQU5UV2M0UjRqMTNX?=
 =?utf-8?B?WG53ZW5iS0cxN2g2b0xCeCtiQklITko0YlJySlRBUzNucEtwOXJLdE8zS1pp?=
 =?utf-8?B?dlFyZEs1aUhYblhJV0NGWitLSGpXVHFkblRIK2d5TnZIYUpUVGo3YmoySFVL?=
 =?utf-8?B?MlZNWUJzb2QybDd0MkVZVWc1L2ordEJtSE91Mjl2RFJSKzR4SkFTL2FLdHAr?=
 =?utf-8?B?R0N5MWdZQzA0dDdPLzUrc0VTMGgyaWZXOGM1Z2FiWVBDelE2cWt6OEJrUWFw?=
 =?utf-8?B?d0tkamJaMS9iOFBiakVtVW1iYmtIU3VrVkJ6U1c3THIyU2RhWGdBeFo4MG1p?=
 =?utf-8?B?SHg0MmRnQ3kvMVBKQ1FaT1VoT0NHbDdra09hTURYQkZVcC9ta0JNOTFrMUNK?=
 =?utf-8?B?aENJQlE5enZ6MldQWjZoK2VPelliYkRXMmM0YTdRNjR4SmRFMnVkMTFvNlg4?=
 =?utf-8?B?S2tZeVhNTTRMT1JvVHV6WnoyS1k2KzdTN2hDUytUZlFRWWl6YTkvSGFrRGRj?=
 =?utf-8?B?bjdab1R2Vk5hUnMvYzZvRGVBZjk3Q0d4Nnd2bUQvZU5OOW4zZ21OODQvbWdj?=
 =?utf-8?B?OU4xQXZYQzExTmxHenVIVzhSc2N0blhUOERlcis3bUhPQjdsNG4rbS9Qa2U3?=
 =?utf-8?Q?Kwfh2rNfvXERP8o4CW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c05e9e-54ea-49ec-52a4-08dedc990200
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 02:31:25.6540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKvUwlfFwMZciuGBJ3r8u8SzFQpEl+WufaAGMp3OfxQGrThdSXoUxmksrRDhps6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6963
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-15609-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,Nvidia.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B70D7212E4

On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> Having vma_get_page_prot() refer to VMA flags and vma_set_page_prot() ref=
er
> to a VMA is confusing.
>
> Rename vma_get_page_prot() to vma_flags_to_page_prot() to resolve this
> confusion.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  include/linux/mm.h              | 4 ++--
>  mm/vma.c                        | 2 +-
>  mm/vma.h                        | 2 +-
>  tools/testing/vma/include/dup.h | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
Makes sense.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi


