Return-Path: <linux-mips+bounces-11527-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C5B89FE9
	for <lists+linux-mips@lfdr.de>; Fri, 19 Sep 2025 16:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFBB9188225D
	for <lists+linux-mips@lfdr.de>; Fri, 19 Sep 2025 14:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B8631326D;
	Fri, 19 Sep 2025 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ag9MS/xY"
X-Original-To: linux-mips@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02C7313D67;
	Fri, 19 Sep 2025 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292492; cv=fail; b=TiiE2rkUjV1D90ocHrCKcFUKDo0QW+Px38CDyfZvfzM2IN+w7UWbpo9XHMX9AVwKWE0pVF1nHSNbcBXxhyEECb3agwlDfQRFwPvG2SkM1g1vM36aq3Nsn0EDj3UYCLoNrlQ3GoRyV/K6SGUJZSAA0XYutxma7EH/Ux6x/gPv8KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292492; c=relaxed/simple;
	bh=J28esX182dTjTfuBJNfdpEWQKICDnMOMHN0mZqbvpIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ePyNE67XCra4igRYkQASyeBTIM5ilNglcd2gGs/LnZiAq5XDRi4oulqXOj8pPi9pyrsxA1FOpxYUTZROaTzdodQNrxKEUsko8aQSFuOypnuWrpoe4FY9TqJTQrn4tG7QPXzc8genaX92oJ/WWuODZykhQqgf/lmTUTahs/JRNI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ag9MS/xY; arc=fail smtp.client-ip=52.101.46.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaN7L4HK7HTJ8wE3cpvl3bZMdnXaiqVVaYmzlp6OjCa++//ABzmB3HIevVyRoZ2glHksLP1bDjdupbll/f9wI9iy8CzhGrILAb4w4xkgQP7UGIH5/r4NYv3lEQICGEnDJX/RYNdSqvXGeZBD65N6kQ/w+YJkaVNVAmC/3Xa+AOUJ9miqQjWs6CWDdD11wxQj3atEss1wdyCuEL3l1HKhcKpeyEkVvhsY4dNx5JgG4LyU9wDTMU1as6APrWmxjoqmBewDZcyvE8pUcp5hgfgXCy3+Q5KoqUjajyqlBs0AupIKSmBvBAxcXulbPlF1BMsGseutrxbF+5QC5ief0D/kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J28esX182dTjTfuBJNfdpEWQKICDnMOMHN0mZqbvpIk=;
 b=aegeSTMClCi3a444/HFQn6C4k/undhMokwMY6qNg5XjbZ+3HNR87zuSgbskXt3gudhIX1uSce1PPN10ghdsFrZAVnKn5IWiPDRTlwrM5vmSP+Mj41N4Mz4TuYAFmv2wTLSjr0RgOWAHs6M17o0q9DAjN1aza/vWqgEMxdkEADG/bwxIQ6sk2g6z3HVBQT0VR5KOE40Ges8hs382uac3W/HqH0Iwmcz7vVq0xzqowlMgdEjYmJ97LVzed5ZrsQiU9ba1RDFwnTun2YvIAGgzSwXEsihpktylkPMdDl5SwF6rsWirk3vIDcd4pYT7V96QoIJ+PYtEJMSh1zUEAkIF1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J28esX182dTjTfuBJNfdpEWQKICDnMOMHN0mZqbvpIk=;
 b=ag9MS/xY018UY37z+IzW8jCiq/drbWI61LyKS2ZDQum3p3RzL73pTdRlzKa6PgvleOdX5u1t9K1tQDYs+3y4hRBY5zfgQz+hcZr0sC/O9Y/rmZPI5LveYFUZgKQpuG9FEWL2alTpl4avwXUbRLOV13hZ1DZIZGBCvCLMbKAIXAybgy3X/AkSIYmf3IaX7A5LOoEk7GqXu+G7BkGTWwNrHEPmgSdyDH+F/dwCfOjX2HNDIiSEzvIoAmCD28iyY9MbvjxJBQQ+NKZ6CJH5EfSSyxdSHZ/gdbMm5bIxC5hanVuNdKUMw4BFqZlx4/mYKeoMp2ZjnWciLCIDxDIkBW7bxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DS5PPF7B9F1F8E0.namprd12.prod.outlook.com (2603:10b6:f:fc00::656) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Fri, 19 Sep
 2025 14:34:38 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 14:34:38 +0000
Date: Fri, 19 Sep 2025 11:34:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <20250919143436.GC2132010@nvidia.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
 <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com>
X-ClientProxiedBy: SA1P222CA0124.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::12) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DS5PPF7B9F1F8E0:EE_
X-MS-Office365-Filtering-Correlation-Id: cb084d64-d3dc-424f-e7ba-08ddf789a94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PtZOYs11Ja47HOlN9334CMLfyFyUTg8tdovrMLTzuSMIhIgroLTR5sRjiAmQ?=
 =?us-ascii?Q?vIr2Tyg9r2FmYhSEcZKAqdd5a/eaHrUPGgkd6n9c1YbFemL90GEC8socAsf6?=
 =?us-ascii?Q?ssPqxrdGMfeUAKM8TgayXlrPmbJTx9KVxYKMnA+kcSRVHIZZLpclUwDBQsW3?=
 =?us-ascii?Q?GzX0/Lnc4glR6OD6d/Dv9BW0qzv2ta9V9lxF1+dQ+3ed/kZEwH4K22yCTDS+?=
 =?us-ascii?Q?gj4OPEXEs8SDO4kbmNd6vJtSChRpBIOcGVTVcVyW3TAquIfau/4NeesOwOZ8?=
 =?us-ascii?Q?ILKl8YvmcgesFLBDbT/RKw/HlrTqJFXZCy+WnhcW9nf7Hq8vaKSObPF0e34m?=
 =?us-ascii?Q?RN3tYj+C50A+/ntB7e42feHfVP/NbtMwgUitcTuhAgQ1QaWPbQpQsC2RtXhD?=
 =?us-ascii?Q?/hJITAUksYUefnh/4Ldz5Ack9MDQGDwR1GHMKKJWro2x2GA8WBr5Vy+/57ak?=
 =?us-ascii?Q?mluWN+uvgYtP6yuw6yyoYJ5VozSDSK4KQ1Xu+fZnLp2IAqI1I/z7u/kGpFFZ?=
 =?us-ascii?Q?/mayuizqHutxeVkTT3iqk8ox8OPb2A+S1r/ly/KhtvrSQ2nH+Gmnla5exM09?=
 =?us-ascii?Q?nHQHoq6vgLaWMw16jkmyMa/WYagPP1Kk4xR6bWvBrkLitBW04gbQ8CQYkF36?=
 =?us-ascii?Q?AJu7ctP43exuooSf2zkdvxuMfUOUtiVZjdx+L1INZtr6Q3FI6KGB2ABEe5AP?=
 =?us-ascii?Q?djPJH8IGbrZ/rXVtIzjMU0cdFBrF63tCZ8p1kXdarE0l1EU74Gqzo/cRTI8n?=
 =?us-ascii?Q?gkehG2c+OwrjUT7B2nRMmJ0Tm0+BH4/dska2DLIvn02wDFiqVX7cmmz7dXgz?=
 =?us-ascii?Q?b2GBTXwmLU/K/ckiGTG7NyGpHCijAI1+LJZrxJD8ExbB4wCKSx4CXjzRxpA0?=
 =?us-ascii?Q?oUoNVkafWe4bqagbYau9WTDPl44fkBojgANJCZcWqF6xsnRZ43WxW8nv0Ynx?=
 =?us-ascii?Q?9DDICi3ysGeEEYmvmjujGSarXcb2nVDoKkaf2w9/3WQnHO7MUssReBqtGBa0?=
 =?us-ascii?Q?h3Ywx6PHsvGWQU9y/eIZZBxlSFsbIVT5MqcjBSyeg1j0FgAsfp/QUTKY6LBw?=
 =?us-ascii?Q?hZ1cvQr+oVma+ZGeFoj/5s/h21B0ZlkPYd/BBsSVe8alAxjdkC5i225Qm9C6?=
 =?us-ascii?Q?B4V3XiLNganXe/el7irxnk61BqpRIyML2Qc3jOLKG5KpIpR9apUSH4LumEIe?=
 =?us-ascii?Q?B/TSZYN38qQtteJVZZApRafBXzNCdp/Pgt7R2uatwvw8WrVhQI4Oe1jzGO9o?=
 =?us-ascii?Q?tAd0EtGdkwiqXgeak8zNv9jBMFDDE9nu/GkYMCtFjF3fRXlYEVouxT90Kr16?=
 =?us-ascii?Q?DdU4JR1kZ1U7FXqP6jhQhGsIDm7GP9Nvf2czE0hTut5i/OHi47ppX8HygYvs?=
 =?us-ascii?Q?w9v8ujq1LmCoSrQuiK7BXCX6yISXBgVO+IxOnWjLhkPAhFHkWovyiIiwsm0s?=
 =?us-ascii?Q?46AXp5uG5mA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U+qH7Fd2TsJQKkFmu932eakzZFtuWMxdK367CywzPI8harCsAXQeg/zAKpSb?=
 =?us-ascii?Q?Azg+VKo3ldYRuoyF4sEJbKIK46XsNuY9lFlL41lPkEflK36J2F9dste6T/i7?=
 =?us-ascii?Q?AoGom4C3jETguK+FgzkUVsCvJ64UFebVVDwI2sSAXPGietVK8N5/R1C+2r++?=
 =?us-ascii?Q?iqZ/ejYsmbVepXhkPfUvqyoImNT172muOlqgITcqlTtj9YqnQCYgShKfum4a?=
 =?us-ascii?Q?x/HZmjpe+Dh/sXkrDKYlsUX+vjO98qQcXqhMGeu2/P+z/04ECWIpIjg2+2sk?=
 =?us-ascii?Q?QMitHnrRJ/eWYPNU6yOzPfbCq91WsjZ8zmXqgQAyQf0Va3nP7mv10HzFSMB8?=
 =?us-ascii?Q?x0VsnMOzhsYu1biuJBGY10dMkFuqGY4y5KAG+Ub7Z5Rmv504J2dyeqak3bIM?=
 =?us-ascii?Q?pe1JPR0nEuumGhlDKHKDtoyhpX/75Tbv74R8BH4it54pxPdi5Ay0ive3Imog?=
 =?us-ascii?Q?mXgiTy2BmmzTjf8nk96FURSZOS7UnyD9UGtk9KBvE5KwgwgKGHwaqv7uLElT?=
 =?us-ascii?Q?AP1aJPOwvYGWSK4YEggro5VL9ZMfslDBCojf/iEGwcQj1RMYZ+euH/iqLMgo?=
 =?us-ascii?Q?4DlQyJ8VFGUnZWNG/isENAtMNjiqP1jDZA03pKOSA0q/VzxFTDNzI7ruif6K?=
 =?us-ascii?Q?WncgpHUTjbYH/pFcux5Q/czZZ1caWPTB0L2ALNzu9E9wb4TUlO6JQmZM+q1I?=
 =?us-ascii?Q?QHknP5m/RIY8Z1hkk2DkZi4wWpRPL12ruk+TfXPmr2lETMwN0IBqgy/2k4jo?=
 =?us-ascii?Q?k6WsxDU8DcxWeua++v+R/jC/3XaDW6PmZ/m9gqI+EANT9aRQ+Yi47AbZubNq?=
 =?us-ascii?Q?ZR9XPh46uE1Rh832fMIjB2KlTUTgVwDBgBu2GhWhP1p++Wo4Jtoa/sZ6LAp3?=
 =?us-ascii?Q?flpUjQ5kNdGJgb9G8Xrbm23jCHZ8CGUhPfn6kP0B/rsyAQiWpZOCML0iVfZy?=
 =?us-ascii?Q?uzhtBEwV00/+32GbvZZ63+yzMoFNol11aGFWtz7ezr5YuD7Le8iT9ZqfJcR8?=
 =?us-ascii?Q?R2JrFRWxaugQvjICjRe5yPuoQXmmybgrCeUdyX5adicYYz7PZDZ/pPh7mRx5?=
 =?us-ascii?Q?bWgtTcKBQi4TogGF0roG8dCaUF+hERW/9zICymjQ2elZfbzJTa9wkoFr8eVV?=
 =?us-ascii?Q?+9ejk0nRGoHFxdtVftA0YXGR938Cvrr4LmhjeSzGuUBMvwRyGteuYCPJIL0I?=
 =?us-ascii?Q?+BewAHdh/dPnMu/J1DaefakWUQfLq/Gh6Nv3esWYQ++s9QFzYzpfGe+aNb3W?=
 =?us-ascii?Q?aHHw7MCER7wgT5ka5ijVTjyqq7w5yM6oZBEQhfTTgkdyCFUFToCRjCC1krxm?=
 =?us-ascii?Q?WAX6ZPpNfYmwV3vbj0SSfA7eB78U+PA3m3o2UtuJcA1WyPNbWVnSyZ8hoL2v?=
 =?us-ascii?Q?woGcWnSPVgGDXQJseIfxqofhuDPs7w9yXgnSr7r5H1GcEKJFuLZWvNSl7a1u?=
 =?us-ascii?Q?0YX07TWCLnK280eBKRXmMxa1ac/+9Ob6/BgMug6vUrJBAyjk2IJtegHr7osE?=
 =?us-ascii?Q?VkzbaeO5PgkcGBbzYXAwfdtrg9XXcSR37Fd35GVa05CUUkQBTyoPHSh2fVAo?=
 =?us-ascii?Q?ETfSNhZL82ProUr9fVK1nnUvvPJJn8mv7JlduMMP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb084d64-d3dc-424f-e7ba-08ddf789a94f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:34:38.1272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLjv0KWNkTMkPQKwt0u+xmJShecgIQeR6fHB1yzmKmB0FXsQ6Q1oQTkLPlYcdApA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7B9F1F8E0

On Fri, Sep 19, 2025 at 04:22:20PM +0200, Arnd Bergmann wrote:

> SAM9X7 in 2023 added DDR3 mode with up to 256MB according to
> the datasheet, no idea why they chose not to support more,

Quite possible the internal SOC wiring only has 28 address lines. :)

I am right it sounds like we can drop vivt cache support with highmem?
vivt is alot easier to understand if kmap isn't running around
creating virtual addresses aliases!

Jason

