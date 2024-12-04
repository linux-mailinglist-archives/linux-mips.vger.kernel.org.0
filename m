Return-Path: <linux-mips+bounces-6872-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E59E42B1
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 19:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99E4E169EDD
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 18:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E10217F2D;
	Wed,  4 Dec 2024 17:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bI/XHq+B"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6946420E009;
	Wed,  4 Dec 2024 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733333620; cv=fail; b=HzIyPp0cgbBmBlOArjRVFiP9FSB43UVIBPPSbnVEa47Bk8DZmsZCc4dpTWr4Wx3iZxPWSswEWtWo6VXrKwKaFMEGTEoq4/T478E1a7vH6jJZUahsFPFmeWAolWf7fdwVWXdfUDUcoHCvpdFWYD+gewpXff8osOjonstPgAQaCvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733333620; c=relaxed/simple;
	bh=kGqjCtsVfgdWh4PRKXiko7GIMYDUwxr0+4YtF+7vL4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tt2PE83YVy9JVvzFp7b4JQ702cISSPvI35MZ3w5i2q1/XLXqqHBpN8Xwsmt6H7RTSQF7FH5itT11Syt1iA/Dp50JDW8NPTTRt4+lGN/XbsIkncEkuPy+FSvyqkMSawZD6hjHn5eZvsCGi4Alq2NK584OIgj3ua5gsu0HdrSJ6hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bI/XHq+B; arc=fail smtp.client-ip=40.107.101.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7uEIURBDJEVx7+sCt1HeG7PjVMKSbdbqVQ0jVCR6DaNxmxYDOKOqkTUqcz6Uw0enJ9zRKE6xsNWh5x/2UfYfEmtVC2UXepzsMmUToabboNSzwAXSrWs+K09uKQ+1oJy0BBUrKM0gN69kztfNGsYG2Ls+ZNP2fE5/p2YheYXHNLfQ7uSNqCXwf1ok7MiYg2jvm2kNNWFjGMZV1joc8jPS5hOM2e9fgMgZXRgFDaI5cWHx+4yZ6b7wugxdIQYFUOhFtm1iV4tc6LgMGZ58B+mCj+roP9y5TIxpABhoFaXf/4LcDvhMDmbUZBzc8zUbAlaPKARx2HH9boJB5MSdSmWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua3X9FPXTwAV1mTMoInu601QP8iign0uyGQjgABr1gc=;
 b=JxAh6dfmcJWZEeQ5b/huLRGHNJu6PcBGWX8jvuy1wql1AIrCkidBDSxIxYt3HQ50JlnP1ATCD+xXTfWEXP2eMs6N+Q5REurw9Hi0l8hYrWwr2h2JT04qWrhsuHqGRJ2jHgvAw8zOisGemMVOJyEbCKbX2HghQ1JEOZk/8tViO5pu9Wm/cfGDhf91p8En1jHvCFo54LHe8DcEXnU7Rs//Jv/nCHPVNcy6epp1z5xFGLJdz9iF0u4A4t7Q1sq3OVv6flIqiCAhes8del37BkY3NFTe+otbbZJMV0aGLnDxK7Wx/RX6r1wAkDiHp3CegTu+rq7JDK9K79SX8v1u7nZb0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ua3X9FPXTwAV1mTMoInu601QP8iign0uyGQjgABr1gc=;
 b=bI/XHq+B8z3NWkeaQMlmIzquypQYbMbUL9WLf+MptbR0ZRcRoFXLHa4pbJx2cFpSND+YAGmFdVAECJMinygiGXByb/NJ8MQC/ug4DXKplTeUPXIa70mHXd959O9LG0z9pZopNisNe1mD7YzPEruTCz+5xq0r60pwHdtCmXJjVyx4KFtHNQErnwXvYwlKwyRmjFXm03uSN98+P9O2Ov/plXJl9GGLVd+YSMZMn8q4ljhEQip4ki+8c43GEOkfZ+AOByaPIe6HE0ZDdPqaxf+uJUe6U3B4atvdjl7Hm7Gc0C+uOdZlRQj9EKX9LuL3D8XYxDVElGZtUtK1rI3lpAxHVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB6633.namprd12.prod.outlook.com (2603:10b6:510:1ff::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 17:33:35 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 17:33:35 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, John Hubbard <jhubbard@nvidia.com>,
 "Huang, Ying" <ying.huang@intel.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Alexander Potapenko <glider@google.com>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Date: Wed, 04 Dec 2024 12:33:32 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com>
In-Reply-To: <Z1CDbrrTn6RgNmYn@casper.infradead.org>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0260.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::25) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: 5718e60c-0149-4ab8-6a2d-08dd1489c7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QStGaWdEeVBDYnNFZ1FWdWR6QjVsT0RxWVFtVTlHS2hMYzQwVm91QWJzQThh?=
 =?utf-8?B?N2hYTjN6Snl4N3R2U254VE1FS3ZoemJZNldtRTdwQmV0NU5FajlEVzZyUitl?=
 =?utf-8?B?SXAzcTdDYmE0bnNiNkFPdjZmS2ZENTVJaUtHM09Kd3RmM3UrYi9qTlRUbUg4?=
 =?utf-8?B?d3hQQ2VDdGU4akVmUGV4Ym1XcmVJSlV1RUVCb3Iwa2ZKS0JqR3RaWWRqa0Jn?=
 =?utf-8?B?S3dsSlRzZ0Z4dldOS3JPNit4ZWJGSGlHS1RjT2VSbVZOTldobENGN29objhE?=
 =?utf-8?B?SUhzTzBHRlJUY21BVitxdVg5UnJ3UTRaZHBvdnBYc3FEanlXYkdOdVhDMjF5?=
 =?utf-8?B?OGFiU09ZTjBIZ1VNVFpHSGZuc1JKcFpVVlQ3c3V5cWN6UGYxVjJQWW9LcXlK?=
 =?utf-8?B?U1FxWEYzMGhKQ2UzbFJyb2ZzdFpkbFMrWFhsZHVmNGpCQXZpYlBweWxxS2VH?=
 =?utf-8?B?cnUzWU9HQzFvRmhyYkFCOFgzZWNmSzkzL0cvMmFpNTRPVmFYSnBFOWtsRXVW?=
 =?utf-8?B?MzBTMGpGMkpwUTIrby9uMHozeG94L0JRcC9TNEJsT2g3eUl1eWVqbW9Gcng4?=
 =?utf-8?B?V3BHK253RmpwbnJzK2s0WUd1RjhUUWk4MndQQWVzQWJrNXI0eC9tc01laTkr?=
 =?utf-8?B?c0YwUldxaTZGZVJLa1ZNeGpnZk96OFA1bkhmc0N4RWYwS2dSVFFvYU9YVHJL?=
 =?utf-8?B?QXhsRmZOYktiREZsZ1REcjBCaEtmZy9HOWE1aHRPWW1kL1oyTE1yRi9qa0F1?=
 =?utf-8?B?a3JndFpKMk0zY0xKWmpaM1BuY3hEQUZtMXY5NTFvUXNHWVdZOFZKTlg0bWJY?=
 =?utf-8?B?NnZoZ1hlc3V4VTA3YzkxQlptWTk4QytSb1RpcWxKckhUbEZoZEt2aFVlTmZC?=
 =?utf-8?B?TjZsMnp6bUxldG5BbkZEWlR6MEpiWFZVOXkrMi91QXQwbXlyd3BKWGwydXh5?=
 =?utf-8?B?WGduNTJuR0N1cnBoRTl6OFRVZFJOUjEvTXljUUM2NjFHOGN5aU1UVG1hdlg5?=
 =?utf-8?B?SFJxT0ovYlNPMk83ZDdPbEtGQThmVmpMOVNyMURIdTRNSHFtOTVEMHlqSTBx?=
 =?utf-8?B?VE9VOFZ4c3d1U0kvZDN6cWhKaVBndXQ0c2N4MDYzc2lZNzlkUndrV2VMSXlB?=
 =?utf-8?B?ZUtvWHZRRnRlS3Z3QWNsT1R0U2J1TVhZV2hVVGFUK2FMMEg0eTRjUnhNdkYr?=
 =?utf-8?B?MDlGZ2Q0RnhSK2UvZG9HbzFMN2pRVFRVdmE4eWVSV24ybGVKN2diNzBvMkNJ?=
 =?utf-8?B?QWd2TWUxbFVUR1Q5REpLZHpwRWVaOU5Rd2tnUnAxeG5rM0FsUmJJbDVka3JL?=
 =?utf-8?B?Ulo1eGZPVjFnN3J6YkJVanJwVm1Nc2hzODlVYjh6NGxTSGdZMlRSQ1lyc05x?=
 =?utf-8?B?L0YvenZ6cXREd3RMcG8yZkF4Z2pRZXRZdnR2bG9kRUV5TEM4aFU2RXk5QlZ3?=
 =?utf-8?B?YUsvOVRCeS9ycTdqVWY3SVBydGNBVjBLelJCMXlXVGpzOFErcHk1b2x4clBY?=
 =?utf-8?B?NmVUNWlDWGUrRzNsVGhPVW01QUNFcnJjaytieWtGSFoyT3N0UnhLNzhwbjRT?=
 =?utf-8?B?UVdvSHgxeERIT25hOXhzS0dhQVFMM2lVVjRvczRDOW03WHUzMlpEZ1JXRy9i?=
 =?utf-8?B?aC82T3NETTJQd1I0ZjFueDBhRnZJdlNhT0djblBmdEtUNmhRMlh6UFZZcWVI?=
 =?utf-8?B?dVo1MUR3WDRUNFJzelMxNi8xRXd1MGRjMjQ2Y24wRVBYUVdIWm92Q0Zod0Z3?=
 =?utf-8?B?aUNHeFByTXR6YXl6LzBhU0hOUjd1ZFJuVWNqRDZ0TzhLQlZwZ3FnRkcweWpO?=
 =?utf-8?B?NmtFOGEwNDBkeHZILzQ0Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWdmV0tqWkd5djk1SWVQVXlramVtcDhHdEFTelZxMlRPdVkwcEhLTSs5dzR5?=
 =?utf-8?B?U0V5REFoT2pSM1ZiZEFteDdwWm81MGVKUVhJQzVwQXJRZjZRMWtWMGp2VEQ3?=
 =?utf-8?B?Y1JER2oyWk5pN0NRdytma1pzd2R2UFA2Vk9hbkJhLzZtTzllM0NoNEVTNTJx?=
 =?utf-8?B?UWRMRTJWd2Y0aitka0pEdm8zU0dIQnU5NnFSS0NEVmluaDN3T2RPOGdjL2h2?=
 =?utf-8?B?SUFiVEgvSGpRaHhaUjJsYmkrZVVMYW5FNE1KWFBlK09MRjNHazZDVlgvSXFP?=
 =?utf-8?B?dEJWOFl4eHU5Q2NIQUhZbk9aQXNORzdjVFg5WFljQWFHNGEzbS9JMHduUmFP?=
 =?utf-8?B?alA2Vzd1NE02TjhJYmxrdmxZSzQ5T1h1QVA5TWxXMFpBSk9DVXVUdGwxZHJV?=
 =?utf-8?B?djhQb3AvL29lWURkN0h2TGdqbERSdTcxYkNLVXl0ZVdRelFsVEdwUnhkY1ll?=
 =?utf-8?B?MGtWaE1QeVBtRFMwMXFWSE14UW9DZllwbWROSndRREVGWGptKzFBZlA3bTZj?=
 =?utf-8?B?ZUdnQlVzdzhtWVNWR1VMMW5EN0lDbmVWR09jeU1DajMrTmxCL09LMGsrbHFF?=
 =?utf-8?B?VVIwZTNscElvUExMdHV4azRCN21TUU5mbzY5SjJmYmRpRUxHOXg3dUlNbmNq?=
 =?utf-8?B?S1lTZVBycVFvOXhpNDBjd21MNnZuSUJhQnRIOWV3STNLL1JpVFVoNUYxNkNu?=
 =?utf-8?B?dFp0QTFkYlVjZ3JFY2Y2MzRFYkZjb1BQQlljRDcvSEtpdkM5TGNrVnpxL0R4?=
 =?utf-8?B?NWVZL1B1OHVVcVRnQWRRanY2SExDRG13ZGtESkk2WDBFWUR3UXpMV0svaDU2?=
 =?utf-8?B?MVBIcjRZQnlZc2dsK0hkc3g2ZGgyRGY2bzAzUUI1bjhuOUFZTjBOR1NxNHdz?=
 =?utf-8?B?TlQrY2hzcEpDSjNFS2lWLzFIV0k5ZndLVzdDZzhOcHFVeHBzbkp3U2RST2dz?=
 =?utf-8?B?N3ZMVWxiMkgxVTdnVXF1Q0dNZW1MemFZM3RyaDZnWU5nQlJ0QzV5OXhrOWN1?=
 =?utf-8?B?L3RmRHVjRndlL3hHS3h3MnFEZ0ZEeWdIKzRraXlycWZWblFYQ203dEt5R3ht?=
 =?utf-8?B?MWZmSGVOMTJ6NjNZZUI3NzRFT2J3TytyQkFmYi9ILzh3OVV6VDFGY0RsRUJJ?=
 =?utf-8?B?bGtTb0sybVlycEUyVEtJNCtmV08rYytSSHlPdXZlL29XK1o4bUJHbHVsUUhn?=
 =?utf-8?B?dGRMN1F2MFR0Y3ZHLzBQY05BMjdKSGNIRWZrZE1KQ1piSDgwK2YrSWkwUVBy?=
 =?utf-8?B?cjVJVUo1WE9yOFFsK09MVytVbTRFd3BBL0U4NXFLWVBCRTBjU3pQNEVweTh2?=
 =?utf-8?B?ekFrSG1mUlpSRW5ZQXc0VGhJclNMZ1lTeUpSTGFjSWQ1TFlpVi8yZGd5QzBM?=
 =?utf-8?B?bVBTWktjSVRsOGJlbUozVDdpWkZ2Ny93eTVEZms5VENRMld2alpCbGIxK0hI?=
 =?utf-8?B?TnMrNWFpTUpmNzZTcTViMzk5dmxhNko4UU1KU0JQVUxhRHdkVnM5V0tlTE5E?=
 =?utf-8?B?NTBBb0Uyc0ZmSWRWRFVDc2IxdGJsRnBDVFF3UXZSbUt6bmczWHQ4V3g5L1hN?=
 =?utf-8?B?WFZ4eERrT09xWStTYmtzWXczYm5OdGRVb21sdE5JS1RERnRKSUtEd3lLK3VF?=
 =?utf-8?B?K2psZGlQbE93b241UnlVTy9YUG85Ykh4U2FvTXFqNnE5Z1haMVRFSlhtcm5F?=
 =?utf-8?B?ZzlISlFFTGpSM0llZzRVL1B0MXRZUnp5SWlQMm9TQW9PVEtvZmNjNkNEN1B6?=
 =?utf-8?B?R2lIWGlYQ25idjBKMVlGcnNNVDZIalU3SEo0WEhuNzRnSEd4WmR4SnNNYThr?=
 =?utf-8?B?OFJ5RnZHWk9ZRGVZOVdTMVRrT28yVGYxSnB6MVhnNWJHZko0ZVYyUDhVNmVH?=
 =?utf-8?B?M3dJTjc5cUppT1JwZXdiVEJ3RHpMdGdYNmZUYlJuQzgwclFma1JMNHVSQ1E5?=
 =?utf-8?B?d3VTZlJMMEdnZ1daV2p4c25CWmNLSU50R0UvMElRWlo0OUd4YTA0RFJ1SGlh?=
 =?utf-8?B?M0pIblplV0FScnBiSlhVVUN0cUFocmZvMExlSDROeUdFWElKUjArQ3BmTjVz?=
 =?utf-8?B?L1ZXbm1yRUlMNS9lZjJwYXZibUJUanpxT0w1QWI5Y29acWxtUHkxTERuL2Vr?=
 =?utf-8?Q?HwyJw/pO5bCEhK5WHMEKmic5S?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5718e60c-0149-4ab8-6a2d-08dd1489c7a1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 17:33:34.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0o6weGPmUpICDnPmuTMe/xrMXZzTxn5HjUa6dOszaXbbpEz/LQk/mwDgLAaBUT0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6633

On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:

> On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
>>> So maybe the clearing done as part of page allocator isn't enough here.
>>>
>> Basically, mips needs to flush data cache if kmap address is aliased to
>
> People use "aliased" in contronym ways.  Do you mean "has a
> non-congruent alias" or "has a congruent alias"?
>
>> userspace address. This means when mips has THP on, the patch below
>> is not enough to fix the issue.
>>
>> In post_alloc_hook(), it does not make sense to pass userspace address
>> in to determine whether to flush dcache or not.
>>
>> One way to fix it is to add something like arch_userpage_post_alloc()
>> to flush dcache if kmap address is aliased to userspace address.
>> But my questions are that
>> 1) if kmap address will always be the same for two separate kmap_local() calls,
>
> No.  It just takes the next address in the stack.

Hmm, if kmap_local() gives different addresses, wouldn’t init_on_alloc be
causing issues before my patch? In the page allocator, the page is zeroed
from one kmap address without flush, then clear_user_highpage() clears
it again with another kmap address with flush. After returning to userspace,
the user application works on the page but when the cache line used by
init_on_alloc is written back (with 0s) at eviction, user data is corrupted.
Am I missing anything? Or all arch with cache aliasing never enables
init_on_alloc?

Best Regards,
Yan, Zi

