Return-Path: <linux-mips+bounces-15875-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RzVoDmyjVWoerQAAu9opvQ
	(envelope-from <linux-mips+bounces-15875-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 04:48:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA46750781
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 04:48:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=cOUZIdER;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15875-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15875-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EA753052076
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 02:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FB237BE83;
	Tue, 14 Jul 2026 02:47:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010053.outbound.protection.outlook.com [52.101.193.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF6825B0B8;
	Tue, 14 Jul 2026 02:47:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783997224; cv=fail; b=icqZe4oexqvQ2SBo4B4j/ETVJuci5dHTtdNipWbVhYJpGm2+rw3d51kvWBDhJg3Jr8ghzHpIsxS0SxlkudT3OR42by6FAvnYIbF5HfF4HYSLcvVlJ9aLSNa2g4lRyOTyzfQdDiMClPeBVHAdGiwHxO1lPS6s3gonFRibyPPJscc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783997224; c=relaxed/simple;
	bh=kwYMbZ806XgnGs8EYrEIizEvO0EoBk6CbaP1ZoTAhEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nUOsoBhFCvRxHmNGctmimN6z/JTkCL9NJiALHA1Kqd4lHMXOi/JPjvEsGaTZfP/mn6bHLUmIYVw2AvWzo7uqTNsrna3HbL1FDqIxWXavqMHeJX51tn7Sp+5oMHoIkOPSPTNl2lRJMiS1wgL5EDdOfOFC2JFB1t0VR9M2YrEnpHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cOUZIdER; arc=fail smtp.client-ip=52.101.193.53
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE7+KsZQQV1iRbogED6kqqSbDBxNJ9jxwKu6XWPkG0GSZpmms0KWPis52BtvJqzhNm3aVdPulkpKsoPHUa3sDTle/ffziZX5Tzvp2fjYbQ8QogoLbiKfaqLC4C+3omLaXUbL1ULP/Cd6/F97Wc2yhMwuYSOgRusDfJQ63oHxXg+1xLcV20CGNSVgiBYwWqJGkiRg+F5xIedh++c8CtdW1tD0j4dnjjP1677QRkrTAWgaraxePJ/n5W9c9xEImb1G+mjIR78zqQrSxknpkgB2Lb6N38UkoWwqzfG1D1iczM/Q+RhTEg5IKwBh5I/K8YvAEoZdl3VzUKix5yCBQKR7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feoIft/TLZO5dAhIHPg4039QYB9mwrIWxTuA8pa59uw=;
 b=TNhPwswseZss5Gych3ttTHKSW12ot+F8D8thV0U87mPrelQWF29y4bKvaQrTeHlqH4bsW7V1FSO7LOVymiqo3jvA1gCOsddKoFgpne2EBdNX5k6ZA/R5xv5OWJr7nHOjjqlzyYFk2fJuhh2Zxc0UZsl0YloQNYYDwBV9m/G0mhxRf99ksaT9vVNiYHhMRniWNfXRxkC9VTZ6VimMnvKKWeq2361+pHdRa2T3Ra3j7biDVZXAX5ikfxjUyodDWcit31WlMdKD0iORbie28nhbE+OZIA2f1Qq3GmlNowFIBgwjEZ8hKVJOgUwnSCh/JJXA3AxBvxvcdij21UZEq0iCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feoIft/TLZO5dAhIHPg4039QYB9mwrIWxTuA8pa59uw=;
 b=cOUZIdERf22OunYxGqRWV0nEc5kxavp7gwUfCeG0vobu5aBFf74lQYoucZmsfnAGgzhISe+WUE4j8bv2KJVSxSVdTAiZ+XUDBar7iVDqZHYFgULe1wlG/+IJUwdxYx8DO5Og2GP98TaOXI3hcH9AJWVUeWiTk7v8n0TWq+8E64MTfW6HNB99hA9/VCDvtzCwgPAHFQqK6jri8k5D1xlfQNyG2umuf/mJJHitSR8nzGK60xO5LTp6ZHdtzTY6wkPNOKWCwRTvBOdC+p32lzC9cOa+7CEM4fBZePtZTMIouAnuRqZ/J1CStrJEfX1TyglwiCT2JarokvOS6rk1JSkMBQ==
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 02:46:48 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0181.019; Tue, 14 Jul 2026
 02:46:48 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Helge Deller <deller@gmx.de>, Kees Cook <kees@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 12/13] mm/mprotect: convert mprotect code to use
 vma_flags_t
Date: Mon, 13 Jul 2026 22:46:45 -0400
X-Mailer: MailMate (3.0r7017)
Message-ID: <E797FDEC-48B6-4D64-BEA1-3A15D5379652@nvidia.com>
In-Reply-To: <20260711-b4-vma-flags-mm-v2-12-0fa2357d5431@kernel.org>
References: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
 <20260711-b4-vma-flags-mm-v2-12-0fa2357d5431@kernel.org>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BL1PR13CA0280.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::15) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d9eb02-44c9-41a4-6336-08dee15226a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|18002099003|56012099006|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	g+UbA5RRGDxSjnEBQGbFA5Nzzl9skoKxx2Ji+Y63lvF4XNPGle/YwlqvU87ExSpIfBBaroYHg6lwNRb+5FCqrRqLVDR4t9PoC9WMLwUdLRWqGyDFmicU8MjQI5dj0efQlbPBN1wzsk84ZWFx3o3fv3AyLSQbPXCx6h/lKFHvSfJh+Ck88TCsk83Exfr/eIp0PcomRtd4IHCU2LDQhOgyMSTJNV7cmlhpglZIYp+CgjD98xGL48CaSIbbiXTfr98jdRv809b8lJeGCGsyLM0pkdLobMewUTSaTjEPhKJig8rbhQHuc7Rpf2Wru0+5MAk1nfANNL14YOXM9/0Dldugd/2kROMLLgi17TvpwM85cjxorQ2nz6tOWxtG0I/XrGoT0hz//aR68s+aA7JaFASLTzJbMJI+JdHPdCKVKAS+jrxTMWXNNyzBK3hZuYJxkvbS2M6OMTMOJQMbArU56BU4IDYjBZOSFYUqbE8OeDtX+3HYm+9ANCBEat87DXmbxpAXKqewMRPrioM7q1OVYfIsCqjzB1gXX8Mnk48PtCsFhgdsd6e2ZCgxR+13ebcXjRaVn9FcANGXXwfea0VikL3pjLFdOK32EMb4nYEbn3S9SeHG8twJ3+2lCzOKnUkhlDNqG5P8wh7BvMcN/VwZx76N5NMrEJ646i4OPLrXe7Hs0ig=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(18002099003)(56012099006)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vbCWyyx2FA82sXVNPKB4JfuJPnluc8V5q7vTn2rk1np1pMisQ32P4fICD6IT?=
 =?us-ascii?Q?kT7J1blQ86FTj8QsK1YzTa1LVrY4sTJ7zO7uaj+Fwko08P5G6oY0BQo2yd/D?=
 =?us-ascii?Q?86QyOmE6aGFVbsYcLRYea2MG8seNkNkfd1pNaJca9hy2nk8pOtxqybMpLoBk?=
 =?us-ascii?Q?XSOGei0I+fqqhMDaJl0E9I5QvWs3RKynjdueNGlm5ipdo278MEaNzckZiNf4?=
 =?us-ascii?Q?8jtv2IJd0BMb8aOkXurh3K8c2Mk/yQYDBEpQnR5b0QSxTA1zZ2ad74k718Z0?=
 =?us-ascii?Q?QiHLiT+8Ac4rikcXSUXVRNPllSxDmHZfTUnnWIiF7eF16kDx6RcfAZ1khrGP?=
 =?us-ascii?Q?+DYZfqcfdKr0iIZvfXqq8XLQTcW7LA14SZTl4tUCpIGqTXQc+ooGD2yWdqtD?=
 =?us-ascii?Q?uMlM79iQPCMxwoYSWvqQcyBJNPYzO4npwa+4ROdFtRaviwrQnLSR83RHCCYQ?=
 =?us-ascii?Q?ReOEI4nN8CW5nscd0F2nXoBVpjTvKU9ZZbn8Zs8L/nBUKboPVca/kMoScLaI?=
 =?us-ascii?Q?og6X/ilIrb+dqldrr7x2uz180DmriJXMafQjuQs67TICNF2crG7lsEIrxywj?=
 =?us-ascii?Q?fw0vMBAXddMjgECGOQ2wHCKgoaPKNaEZlhdWX16ZGXTCQISzQ2b0wBbShW87?=
 =?us-ascii?Q?7SLNOs+rDcNZqzRDlBXaS44ZTizjlzzIerNhRFLSCxC1j0V7RwU4gJrWZcil?=
 =?us-ascii?Q?PapVxG+LFW9ITOm9YNTnqzai7nfl4oE4/oU1mCEe2HH0Gql/1UVM0oBFNlUy?=
 =?us-ascii?Q?AaT1MR8xCYznZphoXZ/lQ5F4fCJAr3pfGPP/W1bsc6SSFmcQnHMA0BCBy40u?=
 =?us-ascii?Q?uagioAk/r8buuFRdvBc/lIndPfRWSWZlZ+RtupQ3NlVBPQiJriDgmXUkHRla?=
 =?us-ascii?Q?3oqlfHERHZ0oOYfSXbUyfQsBgu8ihE+QnsmW3Yk1lhf0im7PW060Gq/K171T?=
 =?us-ascii?Q?Jam47U2XbImLlFkDaF5xqvdkVu8qjuePtYbaFLni/ot9ke9dOVwhKAEpN1HO?=
 =?us-ascii?Q?hN5+dDC8CyKXuq0ebVz7UrLcusBTHWp9Tc3I2kft5CNz/o3JMuBx7QGfzZU6?=
 =?us-ascii?Q?AH0rXEdeBaEadZakzs71dO3Pf6U8pCpmN3RQM3LM6TACQxOgal9wgR2osEM5?=
 =?us-ascii?Q?kW63q0DqjF//S0CM+p8wimC6BoujtnjB6NUoUHcfnBUdUbsBaXPzO/D3p+F9?=
 =?us-ascii?Q?/7kJ7kq7VzL4Z/Kk8YWPwiXAnYbuBFca5lKQQchHTQzp6MR59B6jd1Y/tiuW?=
 =?us-ascii?Q?qT5PJy/v/awW88y1hEKabOlLdl2yYkm2mW2YoFxOiLK/zfufgl7qUuhuN/P2?=
 =?us-ascii?Q?JB6N01+w8hGVjNrQvir77M56la4FC31hAEfv6ESNd3ClOkMBZ/6WoIxSdQmG?=
 =?us-ascii?Q?nswstxJC8yQZKEd4JetK9nisacGAzjQAYb1xRxZGfRpujPVBCgo5NwbraYNi?=
 =?us-ascii?Q?bJ07R5kxdI4Ry3tfeSA9d5CwtWkWbguGr5zMA+9rDuFcvWhHCW34Ub83A5Sc?=
 =?us-ascii?Q?kMK/qMa7G0DD8+I6fhqW8TlyzLtp28m+16x+SebPd8PSIQeNJteD2HEc3eR6?=
 =?us-ascii?Q?byJb05MwIgM9eI5Wx7ko1UcvBAl2AaRXPH3WlvO9qJ89bsJBh4b/lYWYZ9aA?=
 =?us-ascii?Q?We1RsTwRCiH0tB0yq4Ah2NxIvNAqyp2Q6NIZbhjBfe5vjIYIOyZvMSsWS0nf?=
 =?us-ascii?Q?L7UeJ0+jSXn5FYXakjzK0aA4WT7zLlUu7EBFT5kv/NvBy/T/oqlTBCRFt5aV?=
 =?us-ascii?Q?+LnaLHJPaw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d9eb02-44c9-41a4-6336-08dee15226a7
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 02:46:48.6918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7pmpah1sUuBVKsr1lh5nsapbyM94r/p/x7AVSFyuwMEnfxfSNJnSrS1SOk6gabX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:tsbogend@alpha.franken.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:jannh@google.com,m:pfalcato@suse.de,m:muchun.song@linux.dev,m:osalvador@suse.de,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:usama.arif@linux.dev,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:jani.ni
 kula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:zack.rusin@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-aio@kvack.org,m:linux-fsdevel@vger
 .kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,alpha.franken.de,kvack.org,zeniv.linux.org.uk,suse.cz,linux.alibaba.com,suse.de,linux.dev,redhat.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,linux.intel.com,ffwll.ch,pengutronix.de,armlinux.org.uk,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,poorly.run,somainline.org,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,chromium.org,broadcom.com,epam.com,gmx.de,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15875-lists,linux-mips=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[99];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BA46750781

On 11 Jul 2026, at 14:45, Lorenzo Stoakes wrote:

> Replace use of the legacy vm_flags_t flags with vma_flags_t values
> throughout the mprotect logic.
>
> Note that we retain the legacy vm_flags_t bit shifting code in
> do_mprotect_pkey(), deferring a vma_flags_t approach to this for the time
> being.
>
> Additionally update comments to reflect the changes to be consistent.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  mm/mprotect.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>


Best Regards,
Yan, Zi

