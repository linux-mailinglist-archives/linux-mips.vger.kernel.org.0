Return-Path: <linux-mips+bounces-15610-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i9FeH9a3TWrV9QEAu9opvQ
	(envelope-from <linux-mips+bounces-15610-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 04:37:10 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE6F721336
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 04:37:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=MFprGJWi;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15610-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15610-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 786083016529
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 02:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92843B71D6;
	Wed,  8 Jul 2026 02:37:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011018.outbound.protection.outlook.com [40.107.208.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728BF420896;
	Wed,  8 Jul 2026 02:37:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783478226; cv=fail; b=S/6l8lRCMo5Rci6kXyt9G4xLLwwDvtv7CjBg9glatKuLSaeGgcDfyFabrvwbW4jAJeYvzoVN0mi5P0ANejvFh7101hDoGfARXY6t+EyX1pVLOa3qBmYWtN0myWx9mmxab0XcPYaVxIo/7CbWJgZMCjtOFZvtG9gVFVt7YPhIJ/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783478226; c=relaxed/simple;
	bh=XwZdwsiNlV8/NU3ORoCclx5CWuo3ru5AZuyHyAmSmzo=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=QIBvGNlFHLeRbOSGmPmnRub6q0VsasA0Sh4ysuwSW+y+34SQYEPPUtAc/Kcyd6g4UmOXMZUPRI8/zjcpgMp4jZoGWYu7dUK3V671mLMgf6sYEo9Ubrd4mqI9BT9hUFgDA3MSqSC0b6vL2mxyGOsvuGzdELdIPYHHky4B6dM6ZNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MFprGJWi; arc=fail smtp.client-ip=40.107.208.18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZZQ8cZA52MWgegKfOITVQAgcN0oUlLjyR474Ros5iq2rFKdnOuXb6pKZjs/pNJkxrBfi6ocQQapdwKi+8/reZbLST6nD8Jm/g6yDjDQA90L4Gu488H+gbkFtZctzwyW9ACwFMNctCUQz3rb6BJT5AIr91tV+/E+WocFTaXbFjDUKJVJS2kAj8+TrLEYoN//KBVVrYWBttNKHguWgWro/ws1CdBSiTZLeVJOr8G0buTR8DeSa++48RHv2468LoqnC7rU73jQ2BDV1CfXANhRCb4u4M9eXF+/BGOG0eLPaJ49T2NQuzNV2M4O10feAMyr/BGpcPgkafLvYBvQwZ7tbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jf+DSRZPaPiqa23Z+NsIeIObG2sHTY0/CEuDSTYjg9s=;
 b=nQ0P4/sdSXmiO0ZHr6pihPNjCu4cIgzODYN8EZ9QDLERGTyPhtE2VCqPaqyb1VpvWEL3Ux/zAU6jewidQKTqA+lAj6npH0mvZ+0f3VtbSE/4OmVa6qfMVJcXkXe3T9nf1giwt7gyg2yd6HRm88814Tm2nEDgPO7xNZAyaVd3pBObvJecy/3AvUeWiA1tFyoh6GYy/pjI+GDRw1/a1yOMVOuv3DDRyhcUvexi0mF9HGCEYG4xDk9X8zb74EAK70QxBDptG6fuoTw0+fw3iUHE5q3jkDJVkS8kKfegJZIjT9MoOa+dlImbJT/SfY4ZQmyMYxV+XQuAxJG0cVAu8zAX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jf+DSRZPaPiqa23Z+NsIeIObG2sHTY0/CEuDSTYjg9s=;
 b=MFprGJWimBSpaXlX3i+O2/ZtL/fCHs1830SG75uwTc7F2hRMC3ncWb0JVlaaHVw/5hZW6q09BGuO3WhI8/sOZeQ7AO+D9CajqiB+24XtXHRarG62ZqCgB9uAFlnXlWyBTCLqWMfQlWpvz8a090qazpfvO9gxfqfSpFL99yPS5lBI5rvU/SFJdKATvfn429MzTUUbTzsxhPfQBEJcF+NzRZ4+7GGvLEVBadjnPBCkTDSl6lHNA2V6pikinctkgMQPNu3IleNkM9/978FewuMGSj90RnXTOMmMdo/rpYiR991nr9PKuGj5R6vMtBTYaohBDdVb0G3MmQ2Ou9MvIJZ0fg==
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH7PR12MB8778.namprd12.prod.outlook.com (2603:10b6:510:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 02:36:59 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 02:36:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 22:36:51 -0400
Message-Id: <DJSU9FF2QXT5.14Y23MIT6POO3@nvidia.com>
Subject: Re: [PATCH 08/13] mm: introduce vma_get_page_prot() and use it
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
 <3bb8bdc4788230c33102166d56cbc5abfad9d4cb.1782760670.git.ljs@kernel.org>
In-Reply-To: <3bb8bdc4788230c33102166d56cbc5abfad9d4cb.1782760670.git.ljs@kernel.org>
X-ClientProxiedBy: DS7PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::20) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH7PR12MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d82f526-25a1-487f-f722-08dedc99c8a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10070799003|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IJg6EdRPZd9WVhujhgKnpJbCHuanEdRyEYJF1H/xR2IHNf4l16FKVIz74HfuoPctZTTfQSnfqG6NPQ++2PeSpebhCKhQRv+JRvBHJk5mdG0k9mYrctd0PPrQksvnJL75lKRzA7lc5xX5fuvCHXP0BN42CFzdSzbq1sgz8k7zet65CVVALweguWZP1V1pHN7JOEaY95FaGbkUD42nFTISX3PKBMyu9R+EdMImtjqn/nF50ILLPajW+5NxPVUdHxVdVtQoz0twBmrQXO0y30cmwh1RR0ls3/ojVSnrh1dgaoa8X+TtrWmwFQ5jYR5L702/JkC5lvexOIHam8V1zjUVZdRpL+dUNuJbEEjz88KTAF6bVIU5RNqCYfIW46t4BvWyPopNp0MtIYE4WYGymFz69uG/bwuSNcABIyUrOSEx+H9QM03TN86PpEVh5N0sseX9Hx9Tlu+ZI8RySDwyqLCPHP6TVCjx7wF/m2acj+8sMKDafToLdnE7bq17YmQKwf83DJlYp5N9SqQ8QsR6Tpb0TUNhLsjPESr1mLSqyrPNCzyrYBTMpv+nD1XO4HWnoUrznAlFcflPdhKTWK3hWVSA6ykBoS/HMAAC//awczhM706YzLgU27Ep9YUxhatBS60GijbURnHgECNTDXPsKIIrRRldoQdyz0vWOeSy63vByYk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10070799003)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek5CR0JZK0h1R2ZwMjFselVxakFaTUxTVUFmb09RbTYyeVFqdnpBRFQzam84?=
 =?utf-8?B?TEk3N3krL0R1dUlqUWFZSlcwbC9aWDVwb21EVW1vdmJlNDRiREVjN1J3WHlQ?=
 =?utf-8?B?QnFHcFE5aVBxZkU3QkRmaGs4YnhSVDN1VkpiYlA4WTVFM05Zc2FuRW9WcTJh?=
 =?utf-8?B?QzFVRUlqVEhWUDByeTNtd2FNQzFReGtTcW5FdGg3bGY1ZnhUMmhqQ2hMMmJp?=
 =?utf-8?B?c1prZFRJR0FORlNhV3pJNWhQaVF5K044dWFCdFYveWdaWW5tYUFNYXR4WTNu?=
 =?utf-8?B?UlFMdHYvc28zajh5ZTc0Um1qR29MNlZrTXpteW1JWHVkMWFoMUxuay9keG4z?=
 =?utf-8?B?dEZSS1Z4ZFh2bVFFM0M0Zk5WbGZsc1JJamZ6c2ZILzF1bndLOVd0bkQ2WXNu?=
 =?utf-8?B?eFdEbXJ6N0hiTnNXbVdBRlJVeUYwK0lSL0VuSU1GamU3Z3NoQWZZNkFyNUFr?=
 =?utf-8?B?Tm5XQzA3WlVIeWkvRmdtUlduTG16QWpFRTkxOXl1Q3RsWWdpTVp5bGlrRXZD?=
 =?utf-8?B?VDlRVkowNUxkdytMUzc1aVlLeFphUVN4ZkwzNTJQNUJrQkJqbktiZDIwYVRS?=
 =?utf-8?B?dWx2NnIwNzhTcG94OXdsRjRFZXRiK3BFVVlQTnRSYjVzUndtN09Ca1VJY1lU?=
 =?utf-8?B?dXpyWlBpUkVxWVZ2c2hwQUxBTTFMMmtqZFlhRWdWZ1RsYytTVWFNdUxDbWtX?=
 =?utf-8?B?emhLRFgrZEF4enovSTVMVzgxZVk4Vm5YRjI2TmtQM003M1c2aUk2YThhVEYz?=
 =?utf-8?B?N0hrbDJEeFQ0dDVKWkJRTTlCTTlsa1RwSmxHTTFieHRnVkpGTFhGMDVFYXRi?=
 =?utf-8?B?ZUs4RDZZaysyRUlnaEt1NUxGVGtEdWdLZjl6ZVRZU2NDQWV6RFZXRUhoaWV3?=
 =?utf-8?B?T2JGRjY1ZGsweDhvVjF3cmIrYzl6SXhHdWFhZllJTmNScE1tRldVNi9lMkV3?=
 =?utf-8?B?Y3JDMkhMTVU3azNSdEo3N2hjNHB6K1NIRS9iR2U4Yy9RcXlXaTMwQTRQN3oy?=
 =?utf-8?B?OE5ESW8vQ29HUnZINWNBUnVZMytqUWx3VzJ3Uk5LeUNhYXNJZWV6SGlBNVov?=
 =?utf-8?B?Y1VVNXhBNlVRTFBzUWU0OG5DTlBSNS94MTdVMmRSUVdhWG9OQjIrYVgzQ1ZY?=
 =?utf-8?B?eDZhTzNNTmhBc251NVlXTDdCMjZQbEJUNUJCQlJmb0NJMnRSNi9ndVk0aHoy?=
 =?utf-8?B?YTYweEdlL2lYZkpWYmxESk1sd3pzeUZDOXNyMDlUT3ByUTBpY1hYM2VZb3Rk?=
 =?utf-8?B?aUVyNnlSeHFKWHhMYm5nQThwU3VnMUE5emNoN01uUG1kM2gyS0M4WTltN3Bk?=
 =?utf-8?B?dWhUVE56RWpzenM4ZXh0c2kyVGNiQ3JJZStOWTVPOGhjTW9MYXpBTnEydjZK?=
 =?utf-8?B?WTlWcGphS3NLOG5oNFo4Z3lDalNxNk43R2R4d2VVWlJVd1pOTVpLRWk4TUpM?=
 =?utf-8?B?dGpWR29CUjBrYzNNK01VdGNiSkZaKzhoVi9tb3JPWmptY1k2bU9tNUZ6U0s2?=
 =?utf-8?B?dGM1SVRzb28vTzFoanhzTndLRnVFQWhLWVh5SWhhY1djS1Z0THRSaHh4VU1C?=
 =?utf-8?B?MC9xeWVzRktiZklCd0dHSERod21hZmZzNmtsMUo0WklZTVM3blhVN09MUnZG?=
 =?utf-8?B?ZFJJaS84RVdYeS9BV200dTdGWGlrS2JyZWh2WUYzR090QTBLc0FzczFJN3lO?=
 =?utf-8?B?THpseE5BczFIYkZrRWdiQUZYb0pmQkZwTHRXVUlodXlicEE5T1ZZRVpHUXZv?=
 =?utf-8?B?RVJXTW9tTFBmYlZZdEVqN3dxcHppY1Z2YzNOaWVmYWk4RmQvVjBFY2tObE9L?=
 =?utf-8?B?SzZNeE1hWitXWEFyQzF1QktWVmJ3RW5oYWdEWlNuUzRrNmlJVFF4MXE4cmNW?=
 =?utf-8?B?UU5icGxkeEd5QlhteGFwNHNibGdjakxxN3VWZHdTaDdZc1pOa3JMYWRCTmdo?=
 =?utf-8?B?aGhLRTd5VW5McWZNYlk0SmFPMDgxVTEvZmpvNTBnQUY2UkJYMXJndWMzdjl3?=
 =?utf-8?B?RzZRTE0yNmxwWEU4d2FQSmtKdzhPU2JnUlBOS0FlVWxJMnlCaVFXbHhRN0J0?=
 =?utf-8?B?TzBlNWlyeHdZN2NLeTRWQ2Z5VmxuSGdqOWl5b3pKam82WFNEZFM3aXRUeVNV?=
 =?utf-8?B?OUxPc0phYW45OFRNeDM5RFU0bVIzVFBLOE1EektZWFNqdTNIL1haVnVOQU16?=
 =?utf-8?B?QkFyRnFnTms0USs5aHVlUXE5SnhzNWVrNndNcFV2RGhFN2pFdzk0WXR6NzFk?=
 =?utf-8?B?M2g5QXIvTVdrbTgwTWR3OHp4MTBSMTI2QU5tMzRmNGQ0bVI2RUFIbmsyR2sz?=
 =?utf-8?B?Sm4xaUFwbE1ES3VyaXpiYlNCWnRYTlB4aytRU0owd0o1TCtTQWk2WGVka2FS?=
 =?utf-8?Q?LvwN1dCgX2BEQ5HTa+droSbfjCAPGhBcCpwLn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d82f526-25a1-487f-f722-08dedc99c8a7
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 02:36:58.9074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjtQ2+h3pQ1C67hYZ/v+qccBEc8nzPfsA30B/zApM/vuVLU11R9L28Lb6VkAqY3Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8778
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
	TAGGED_FROM(0.00)[bounces-15610-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,Nvidia.com:dkim,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFE6F721336

On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> There's a large number of vm_get_page_prot(vma->vm_flags) invocations. Ma=
ke
> life easier by introducing vma_get_page_prot() parameterised by the VMA.
>
> This also makes converting vm_get_page_prot() to vma_flags_t easier.
>
> Also update the userland VMA tests to reflect the change.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  drivers/gpu/drm/drm_gem.c                   |  2 +-
>  drivers/gpu/drm/drm_gem_dma_helper.c        |  2 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c      |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.c     |  6 +++---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c    | 12 ++++++------
>  drivers/gpu/drm/msm/msm_gem.c               |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c       |  2 +-
>  drivers/gpu/drm/omapdrm/omap_fbdev.c        |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c          |  6 +++---
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  2 +-
>  drivers/gpu/drm/tegra/gem.c                 |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_vram.c       |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c  |  2 +-
>  drivers/gpu/drm/xe/xe_device.c              |  2 +-
>  drivers/gpu/drm/xe/xe_mmio_gem.c            |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_gem.c     |  2 +-
>  drivers/video/fbdev/core/fb_io_fops.c       |  2 +-
>  include/linux/mm.h                          | 10 +++++++++-
>  mm/vma.c                                    |  2 +-
>  mm/vma_exec.c                               |  2 +-
>  sound/core/memalloc.c                       |  2 +-
>  tools/testing/vma/include/dup.h             |  4 ++++
>  23 files changed, 43 insertions(+), 31 deletions(-)
>

Acked-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi


