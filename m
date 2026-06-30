Return-Path: <linux-mips+bounces-15366-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id So1rBc3cQ2o7kgoAu9opvQ
	(envelope-from <linux-mips+bounces-15366-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 17:12:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1846E5C88
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 17:12:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=sYufEBUR;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15366-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15366-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50D253030E93
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 15:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BD433F5AE;
	Tue, 30 Jun 2026 15:10:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E231D372;
	Tue, 30 Jun 2026 15:10:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832210; cv=fail; b=ZXgqJgYSF0et949ZlthOU4L7t96Hce2B4VvbMip878r4F0vmXjTEFo50ousj8jAq6US6RFjgFAI9p3ob1dh7H3RKd0MtyhzJ3ZvBavR52Pglq9mwSILahDmcYyjT3zxgoCWb0EgodLA7tkONDh1b5qS8v0Kqjg2W7TEtddxfAhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832210; c=relaxed/simple;
	bh=YjhMD/X8efnDY2WF7veY95gMjgkKm0MmsYu8IKrkECY=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=HPtFkKmZ34EdoVknEd1IprRPW0e8AdITJx+I/Kswp9oU/dwvbYozaMjmi0aRtdL99Kz6nEtnaAI2oGjlM/7me8W9+g5Qxkh6KzPz+GJqS7D+xLMELhBUroKuyRuFCldPEZizLggKx0O8RX2LBbCyiY6+iHwe6lYjX76vLUbuNf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sYufEBUR; arc=fail smtp.client-ip=52.101.46.58
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iP9bh3XjRxU1vdlXRbKMD9i06YGwBrYWhLC8ZCTV/WkM3VAhnzc5VXTsgcVfa59tzuEyXufQfLBrlJKiRzgF/yOjW8QSyap1KYTsv6X/9jTpqkDcs+x1a3tOYy0ZIStDKMshqlM1vJi029XJbUiKc48uE/m5662u3UilBE7+J2RyDcy4srddMjI8noIEHc05g6nN/2ASZD39txL68ct12mvqc7+TpCwu2MDDO/yoJvjN8nMmnZowIWxSn1aoj0khN9xEn6GoTyemMyA16ZgVJPLeOFrJmH79DlbOapFbeb09g4wDan7Waxz0gM8+UBQp04G7S3uB9PIRmvzmoXXymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoxaXJsILjU7jh80C1WkESw+OFwhH8/Tpv2coL+xT8E=;
 b=YB/F4pZtNrmkPxw/tRPV1REk1I6y0wRs718Griep8Kyxe585eDh6kesp8bgDAgYNBGMIfGcqISmU/xE5JxZ5R5KwxDaZKCU2L0qmWvamXAtOvW0GklCY8XWsQhWlJuKUjthre+gkP0Wsmt1l5YYOB6KOtu4z6DWSi7S2X9XOjEWxmcRaOL4TZLC4yPN3sp9WhD+p4djOfBYAlYezBAnFdx1rPDEzdTGlXgAteodFOzB+qtY4XMbZfFj22I//R+N2lXr4NypSA8TnnMx8EStIjUnIepSzJLmZsjKmEqo3+D0ol6hKCPMHtKj4rDvElyDko4hKvCYKvu+MlVjhhn7Qpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoxaXJsILjU7jh80C1WkESw+OFwhH8/Tpv2coL+xT8E=;
 b=sYufEBURKFZymRK3+8C4mnt8zdWAPa4JwHgBQzD6jaNAGXgnqmy9elZ8lxdkAc6nQUok6vtduK+y0ZVX+QIwCqS4wvRlA+u54bK9NterRLTqMgfweHu+1++dfN22QgUW+X1LwdBD/QjdfV4H0tNh2MvtDBKFVWzk7OY+zAkLheua3ZMRtG4uIlhz79dY6S92UEplqahT9ysOrmyeQUi6uporvMJo+4DiWFp8sQt1fAHXbhzC6oIA+AabSfcBIuCtFNSrNlHkLjksnu4FtXtqJAEgAwC2P0hEBB8CtYvrYsLLo4G+uPkRI8x47I2MJiO05NAT31IoiTgT4085ko4srg==
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SN7PR12MB7202.namprd12.prod.outlook.com (2603:10b6:806:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 15:09:59 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 15:09:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 11:09:56 -0400
Message-Id: <DJMH9O7CWAWX.5E207D1UQL27@nvidia.com>
Subject: Re: [PATCH 01/13] mm: introduce vma_flags_can_grow() and
 vma_can_grow()
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Lucas Stach"
 <l.stach@pengutronix.de>, "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Lyude Paul" <lyude@redhat.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Sandy Huang" <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, "Andy Yan" <andy.yan@rock-chips.com>, "Thierry Reding"
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
To: "Lorenzo Stoakes" <ljs@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.21.0
References: <cover.1782760670.git.ljs@kernel.org>
 <f2e8c32515d328db62279cc8bab8398ea278d74f.1782760670.git.ljs@kernel.org>
 <DJLTDCPWMXDL.4ICZ77A1LPZZ@nvidia.com> <akNucoP3eaDN2_Vz@lucifer>
In-Reply-To: <akNucoP3eaDN2_Vz@lucifer>
X-ClientProxiedBy: BL1PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::34) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SN7PR12MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ba0c9a-ab30-4465-4f4d-08ded6b9a6a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	oJiFFAY1O1XOi+MaYZztPsDKyPeuL2ihjhq2EovLixzr8+9G5MQL5kZqvqPRN0HTISwWv2Cb+KyDnchA0tkycwebBRXF4SBNmXVvHZ0jXLk4OiWdJaf9/EqEmhs6gpXEIS0LAjp2GsPd3fEeUi812PL+ggQIntyQyokgEO/5TFpebHEIqHyJMyk39tanhjyagdmoPex1u6MXuTRvfNESuBPqeVRarXswd2hEnFVKPk2SiYf5NsKV1k1aBPfNPMFiyPZxnXM5D8M92yWYQph8JN+iaX6jXvbv1a52zIJpAM5qz4672oNMMSqBwWVTbND1wEALjZXUQLF1wANHnR4DsZOnhY+9VnBKtbBmFlUrMNiEjfDic8NnBYkHrurUSZd9/s12NOqF/YhxdqW/n6kwFaMcujtq66Ucdc7vVPhAOwU6v5HDNHIpq5pcL0HrFpzpr3aCjRsAg9FB7YcawGOKaPoADuEjuQjBuo1tPTNpJra02DlFZ1hIUwdufJGFb8SDisVWGl+5RWvRh+HNKjp3A3ewX7wY+NtpJWhWkZ1z+dv8T+26iwmI1XvmgtAXB1hvcxeENaiy4E5QEHtZC9z1p6IwK3kWI2OCK409mSJNVN+uhth7xocnZ5yRCNqgV/aJ25ot3ruVYXNujVj8nPPzb61lwV+1fEzmNDLto35Db+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXM0WCtReWtGUVBJTWR6TmdrK1BDRTE0Q0UxbVQrN0YxTWJVV0JtRjJQVENl?=
 =?utf-8?B?dGZja3VaWW1OWkZmMEgwZkFDWGJ4L1BvRkQyWVl2MWtaWkI3aU5PYUIzcjZt?=
 =?utf-8?B?L2RGaGlkWW1uTVVLVVJtM0tMUGdPUHpEU3V4TWc3N2xEeUp5d3hNOHdmSng1?=
 =?utf-8?B?VGt3UEFSU2ZVY1M3ODRvS2ZvT2hxUjMwVmNiejI2SW5UZzQ3UnQraTJRalVP?=
 =?utf-8?B?OWc0NHVmOXlLdmlwUWlMTGlhUHliVkpPSFY0T3dtUElyMWgzdE5zSVhrKzNu?=
 =?utf-8?B?OEViV0FUQ2JWTmZQcG1IV0xROWpUOVg3ZU1RVnJYMVNBd2xjMG9kTTlwWWg2?=
 =?utf-8?B?M2FxcjFjU3pILytIUk05NnBhYXdtU1AyWFBvY0tGR3NHWDF5MkZGNHVRNzhz?=
 =?utf-8?B?VW5GSnlxeDF2SUxCNTVxeEdYOUxVTXNVZEdqYjd5MHlUV1ljNDlwYU91Z0gw?=
 =?utf-8?B?OHhjMFI2a2ZhYlZ5Y0IzK0RoS1BTQ0hITUVVbThwK1duaTNMSWdOdkFSVm9L?=
 =?utf-8?B?MWZSbmxQQ0FoSlZsSVhXZGsyNFBpTU9YUDhQWWk4TCtTL0s3ZDdWWXR1emN5?=
 =?utf-8?B?V2lnNml3dFdTaENOZjV6SjRxSjZobEpkVE9nNktPWEFjL0d0UURhaGpOVERM?=
 =?utf-8?B?V3hRWm9jZ2xvNDUyZlhFSUh6V2RaODhZTVdUeXBhL1gxdGJqT215UXFpZWdn?=
 =?utf-8?B?VFlGdzhkTG9Td2xsbjdBTnRPTnhXWC90TVNHZzM4L29QRitRUFhQNkZVYStN?=
 =?utf-8?B?d3hkMjQwMnU4NXZvSDkwRUZwa01ueVZsNGxrL3NwTkdWR2hhL1lXdVZmcmhC?=
 =?utf-8?B?TkUxYklISzFmRTcxNzZ3VjkwcEJWQjlpblplazdNSzdRVXE5RnZCN013OUJy?=
 =?utf-8?B?UnF1V1o2SE1mZzBmaHhyc3VYWDF1aE1NaGM5WjJjNENreXRPTUxLM1VEV01N?=
 =?utf-8?B?V3NpdVl4VTkzU05wRWdGdkRldnhqcDV4WFUyNFNPZ2NOdVV6NnpZd09sSWh5?=
 =?utf-8?B?UTdySHp1OStGQjZwNG9MVm03VklkRi9IMWVOR1NONjRTSWhySUdldm93WjFT?=
 =?utf-8?B?d1RqT2lQQWlkaDRHQmxxOS9Ob3MrUU5wL0pRdVlGYzV2RGJQK0tvV1RMQWl6?=
 =?utf-8?B?dW8rM0RjUGg2MHZablA3aklscm9kMnhudlVKK3BTSmU2QlR2NzFFL0xUd054?=
 =?utf-8?B?NXNuVmhISXdxeFM3OU8yaGhtaUtjVkVTZTd1OWtvSWV3OG83d2VQdXplL0dF?=
 =?utf-8?B?OHg1bm90UlpIWVd4WkNFN3FtNEJmRTlvbUIza3FiaEE5UU9NNTFYZjNGcE9r?=
 =?utf-8?B?bzQ3L1RUSnNocTZCNDU4NDVXdFJ5UVU0NzhPWEZpY2xQWm9HcXlFeFNyb1d0?=
 =?utf-8?B?UTYxMFQ2dms0cWtTRkp2bWVqQnZqWkIwOHdHSStlL0dNNEpRRzJWd2RVSzNn?=
 =?utf-8?B?WGg0TWVaS2FBUHp3QmtYZFlLSUtRQkVBRUl5SThoSXhtUEpaSThqNUl5ZVZz?=
 =?utf-8?B?YW5PUjNpR2dkbjZSTHFtN3JEU1FPa2pqRi9xRWRuYUVGUXBzNmpvREx6VDdJ?=
 =?utf-8?B?WDFqdU1GSUVTN0pYUU1GOG14TjhEQ2xLMXdLaHl5VG42bmZ1eEIyQk5hN0Ra?=
 =?utf-8?B?Z1BsTWRxYkVsTG96V3BXb3lTblRoZUJFOEkxV1lmQzhWVDBpZGxNeTBTM1Fi?=
 =?utf-8?B?L1J5R2k0elllRzBaU3I4T1F0UGFqQ1lrbUsrMG9naEtXNStqeHp2UnEvSEV5?=
 =?utf-8?B?Q2J3dkp1ZjJiUWhBWHdZSnloT2E5Z0RkYWg2V0c2Q0FHVzZXaENkMkIxWXZn?=
 =?utf-8?B?RTd2R1ZxaVNrRUZ1dGhNVUU0anpkM0tGbDI2ZFFaUDNScHY0WXFUOCs4L1Uz?=
 =?utf-8?B?K2NqeFdZdTc1QTBFQkNseCsvbWtGd1dtdWo3QXZBcWVMVEcxNmcyUnh5N1lB?=
 =?utf-8?B?Z2h6ampNeU1adXNsYjVNYUV2VVpHTnV0RG9OSzA2ZDJEQ0JDelJ6dWlZdmt0?=
 =?utf-8?B?WS93OERIYXdibnErL1NuRFF5MTcwVHVGRDg3bklLbitxUnVYNkxRaklkdGpi?=
 =?utf-8?B?SzdockgxNGZPYmtHMEttblVTblVzY3l1Q3lZRmYwTHFXTjhRZDVzMzl6cXl5?=
 =?utf-8?B?Ukk4RzNYZ1lXZW04VC9JV1pDTWNUT2Z5WVpCOCtDeDRHdlJWaFhaQTlDZHpH?=
 =?utf-8?B?ZWxJck5FQVJOTUZhdnJhNldMVnk3UVlkYUdnaTZteXd1Ri8vZjNodExPZkcz?=
 =?utf-8?B?VEx0T0FMNGxpWGRoVmxJRnF6N1QrY2xKRWU5Y0FuRGJ2NjVrQW5wUTJicTg1?=
 =?utf-8?Q?VXmBPftHdX8EVsIops?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ba0c9a-ab30-4465-4f4d-08ded6b9a6a4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:09:58.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnAYTkFnPevWfBepW6Rd8YtqtMSRQbCTBTdlMJEJeNmkdtpxg3jlpUgR9RhMt7p8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-15366-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:bra
 uner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,m:linux-aio@kv
 ack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,m:ljs@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,nvidia.com:mid,nvidia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB1846E5C88

On Tue Jun 30, 2026 at 3:38 AM EDT, Lorenzo Stoakes wrote:
> On Mon, Jun 29, 2026 at 04:26:18PM -0400, Zi Yan wrote:
>> On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
>> > These test whether the VMA has stack sematics, i.e. is able to grow up=
wards
>> > or downwards depending on the architecture.
>> >
>> > In order to account for arches which do not support upward-growing sta=
cks,
>> > introduce VMA_GROWSUP whose definition depends on the architecture
>> > supporting it, and use vma_flags_test_single_mask() in vma_flags_can_g=
row()
>> > to account for this.
>> >
>> > Update the VMA userland tests to reflect the changes
>> >
>> > No functional change intended.
>> >
>> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
>> > ---
>> >  include/linux/mm.h              | 21 ++++++++++++++++++---
>> >  tools/testing/vma/include/dup.h |  4 ++++
>> >  2 files changed, 22 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/include/linux/mm.h b/include/linux/mm.h
>> > index 868b2334bff3..cf7df1569052 100644
>> > --- a/include/linux/mm.h
>> > +++ b/include/linux/mm.h
>> > @@ -472,6 +472,7 @@ enum {
>> >  #define VM_SAO		INIT_VM_FLAG(SAO)
>> >  #elif defined(CONFIG_PARISC)
>> >  #define VM_GROWSUP	INIT_VM_FLAG(GROWSUP)
>> > +#define VMA_GROWSUP	mk_vma_flags(VMA_GROWSUP_BIT)
>> >  #elif defined(CONFIG_SPARC64)
>> >  #define VM_SPARC_ADI	INIT_VM_FLAG(SPARC_ADI)
>> >  #define VM_ARCH_CLEAR	INIT_VM_FLAG(ARCH_CLEAR)
>> > @@ -483,6 +484,7 @@ enum {
>> >  #endif
>> >  #ifndef VM_GROWSUP
>> >  #define VM_GROWSUP	VM_NONE
>> > +#define VMA_GROWSUP	EMPTY_VMA_FLAGS
>> >  #endif
>> >  #ifdef CONFIG_ARM64_MTE
>> >  #define VM_MTE		INIT_VM_FLAG(MTE)
>> > @@ -1563,11 +1565,24 @@ static inline bool vma_is_initial_stack(const =
struct vm_area_struct *vma)
>> >  		vma->vm_end >=3D vma->vm_mm->start_stack;
>> >  }
>> >
>> > -static inline bool vma_is_temporary_stack(const struct vm_area_struct=
 *vma)
>> > +static inline bool vma_flags_can_grow(const vma_flags_t *flags)
>> >  {
>> > -	int maybe_stack =3D vma->vm_flags & (VM_GROWSDOWN | VM_GROWSUP);
>> > +	if (vma_flags_test_single_mask(flags, VMA_GROWSUP))
>> > +		return true;
>> > +	if (vma_flags_test(flags, VMA_GROWSDOWN_BIT))
>> > +		return true;
>> > +
>> > +	return false;
>> > +}
>> >
>> > -	if (!maybe_stack)
>> > +static inline bool vma_can_grow(const struct vm_area_struct *vma)
>> > +{
>> > +	return vma_flags_can_grow(&vma->flags);
>>
>> Would it save vma_flags_can_grow() if we do below?
>>
>> return vma_test(vma, VMA_GROWSDOWN_BIT) || vma_test_single_mask(vma, VMA=
_GROWSUP);
>>
>> I find these two functions when I am reading mm.h.
>
> Yeah but we require vma_flags_can_grow() for code in mmap.c, the majority=
 of
> checks of this have only vma_flags_t to work with not a VMA :)
>

Got it. I think I need to finish this series. :)

>>
>> > +}
>> > +
>> > +static inline bool vma_is_temporary_stack(const struct vm_area_struct=
 *vma)
>> > +{
>> > +	if (!vma_can_grow(vma))
>> >  		return false;
>> >
>> >  	if ((vma->vm_flags & VM_STACK_INCOMPLETE_SETUP) =3D=3D
>> > diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/inclu=
de/dup.h
>> > index 5d7d0afd7765..6f5bcd7fbcd8 100644
>> > --- a/tools/testing/vma/include/dup.h
>> > +++ b/tools/testing/vma/include/dup.h
>> > @@ -245,8 +245,10 @@ enum {
>> >  #define VM_STACK	INIT_VM_FLAG(STACK)
>> >  #ifdef CONFIG_STACK_GROWS_UP
>> >  #define VM_STACK_EARLY	INIT_VM_FLAG(STACK_EARLY)
>> > +#define VMA_STACK_EARLY mk_vma_flags(VMA_STACK_EARLY_BIT)
>> >  #else
>> >  #define VM_STACK_EARLY	VM_NONE
>> > +#define VMA_STACK_EARLY EMPTY_VMA_FLAGS
>> >  #endif
>> >  #ifdef CONFIG_ARCH_HAS_PKEYS
>> >  #define VM_PKEY_SHIFT ((__force int)VMA_HIGH_ARCH_0_BIT)
>> > @@ -315,6 +317,8 @@ enum {
>> >
>> >  /* Bits set in the VMA until the stack is in its final location */
>> >  #define VM_STACK_INCOMPLETE_SETUP (VM_RAND_READ | VM_SEQ_READ | VM_ST=
ACK_EARLY)
>> > +#define VMA_STACK_INCOMPLETE_SETUP append_vma_flags(		\
>> > +	VMA_STACK_EARLY, VMA_RAND_READ_BIT, VMA_SEQ_READ_BIT)
>> >
>> >  #define TASK_EXEC_BIT ((current->personality & READ_IMPLIES_EXEC) ? \
>> >  		       VM_EXEC_BIT : VM_READ_BIT)
>>
>> Why are VMA_STACK_EARLY and VMA_STACK_INCOMPLETE_SETUP added here but
>> not in mm.h?
>
> Yeah urgh oops my bad. It doesn't really break anything but I'll fix it i=
f a
> respin is needed...

Sure.

--=20
Best Regards,
Yan, Zi


