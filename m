Return-Path: <linux-mips+bounces-6894-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926B9E5D2E
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 18:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B042188323B
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 17:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B57226EC8;
	Thu,  5 Dec 2024 17:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oIYKvrFf"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A67422147D;
	Thu,  5 Dec 2024 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419980; cv=fail; b=qFfLSFYeMts4HpByRfkid9mMVZkFoYPdq69Oug2wAk8ZscD3OCBe0BGPcNAOdnpkv4DjgMBCQmCFpjRXkKk5QJ0DiC7tiCYmQVUsRaUeU8if4PZaT2crYiLozSNF0xAB/+ZXqQEwvdS72GFI2Se0ZjZ+bkp+Kwv00SUwwPhAWkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419980; c=relaxed/simple;
	bh=WyBaw1w/WhfrMwXJVMucUysJvWUa5IA8zy5IrYnVKmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qXcl3QhbTN1tTc+Mx7OjZWRwRPH4linN+1jJ63iEyPe2OI7gnTVQq6Mg/6lergmzJhbaGpckRzrAPh4lZ3Y2HyviPhbMCQH6MaFUaXQXtLpCrA0IoBRmz4ESKV6dg5O97674vMr4j2GsNj40dzUruiJHTAUOlVEAgrW0NtRetgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oIYKvrFf; arc=fail smtp.client-ip=40.107.244.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buR9lwlmJqKnz7EuukbzyRYW0YP5l+q4QwrsLgt69Pg9hAae45ZLPZoE8c6SZhu4cfjh4alFG3yPkO2mvb4rxV0cyh1g9i3accdxaUKaGusDsI8EXsnVi8vhFW910tIj4/lwBjjnLKzSs+6lmn9aee7StV3r2ZLKONT9W+oUiPRszp1d9J19SaaGKZkW8NCGD7RpHhiD8zH2sP9OyNskl9QHvbbFXOwzdRxdf9rt3iwXl667TYBc69AczGhhE7JRc6QTTAcqKVtyd4eOiPMmYTL5ttOuQ+JCECOpXtZTY1TS7EcdaRLtUqEEiKjNJCm2h1IukRgiBCV4oNpGmMD8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RD68RHRBFpYK2dpzyxz/Bv978YFS8hyIveg+8Pjp81g=;
 b=CJPrO7UDZ1q/mPdOjd+ENQTTGb4VArWm3BPLe/+ZmcLS670aTuzz6Hltv4T7QcoAvtszRwbgjcoEB9i3dNuAsUmeOx4SUs015ysdWjdTa45dAbdQLi9TjxUdgDtNYxkoiRwvYrmuuwesx5D/WuRQO07gx02gjqd0D87SvO2BSxtxdtZpFT+FtOXXRxa+G0k4UpxiNia2tPLuSorzPorrEhQK4odoY+0xzuUAzmhT91/ymiHdsu9nlS9xvwkGObwGyg2CSLYz/vd+xg2Qi8pOuBGJjMUmzH4UXY9wcoHigj3LBVHvprsyA/DwBJE5T8p9PYeMnw7n2y+pneUI014qjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RD68RHRBFpYK2dpzyxz/Bv978YFS8hyIveg+8Pjp81g=;
 b=oIYKvrFfYKkom16T6RA/khWUboJVj5Zbpdjp8cWAqZiWorTCyj8sM45oktWVtu0eNR6UP9rlsOrJbwYvTkFOcFNuC2ub605NQm6lhab0tnULj9luP5B6MdU+HXmHQqGUPu4N261TJvuIUqzu8dnbbzOHK8O7QVdUUytnfHPbbIGQqN4BapAj3eDXKjzZUQql3ijUK1JhHccu9y1zLtEFV3GHUaT5RB+SJmD6vecAqyrWgp1pca3mvQzdaNCHMHtwk4V+QzfuOVlXIFCcKrhiOGsElpaByOHNFacIYZ+uw1OR6DKswRlUQMczMqfEtyqCsH9c5l2gYNbLDdbw6gJawQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA3PR12MB8024.namprd12.prod.outlook.com (2603:10b6:806:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Thu, 5 Dec
 2024 17:32:55 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%3]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 17:32:55 +0000
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
Date: Thu, 05 Dec 2024 12:32:52 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <EF8F5058-83CA-45FE-8721-08224B489361@nvidia.com>
In-Reply-To: <CAMuHMdV1hkwajxDWk6AWj_QR_qPkEni0u=tnQWdt1-M83NE0ig@mail.gmail.com>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <B65776A4-D434-4D9F-9C42-1C45DAE5A72A@nvidia.com>
 <CAMuHMdV1hkwajxDWk6AWj_QR_qPkEni0u=tnQWdt1-M83NE0ig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN8PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:408:70::38) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc01005-c9c4-4770-1b54-08dd1552da44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDhvUzduN1pXZEV5bm5xZ1VKR2lnR3NtdmVsZ0M0MlN6dnZ2clZjNHRHNzY4?=
 =?utf-8?B?d2svSnZnMlBlOGpGZmwwVnlxYm9nNk95OFYwa0tDSWhQeHJudUJBcjRqeEFX?=
 =?utf-8?B?TTIrdldCT1JsUkpOUGlYNXZBZjVzbDhVUjZuRTBhZ3VibUxudHpKa0w1amt5?=
 =?utf-8?B?UHhHSkR3cWdRbEhZRXZ1bWV4MzZHQjBRZDRQWG5pWW9XUXlvMnFEU1g2alFw?=
 =?utf-8?B?enhJTWZUdWlyVmw3MlJabGdIenZGUEErUXgySUJXYjdKV21GV2RrQlJZZE9E?=
 =?utf-8?B?Tm5NYitiVUdVY2czREM1Z256eWt1OEMzTmtrdGFBekNpaHY4ejFWcVZ3UE5X?=
 =?utf-8?B?L3dEQzRvYk9kVDFGRmhDa0V0Zk1zSTJoN3g2YnBkbUc0anR1azFBVDMzYWl2?=
 =?utf-8?B?OU1aek80MnhiQVNFZVlwL1pxK2N5cmJsMk1tTjFRMk9UU29mcjNKSVp4YWUr?=
 =?utf-8?B?cTl0c0hHYzFid3Nrc3FOeGZKY2J4dU9VUGpkS0FjYnI4UGJtaVMxa1lCdjRZ?=
 =?utf-8?B?Zm1lcWZBODlhQ3JnSkdhc3ExRDV3QzRXS0YrV0tBaEE5ME5CZmFhRkNQeko1?=
 =?utf-8?B?KzhQcTVjUW5aSm8wdER3R0NmNkcyZTFHc01sa2dYK0hWMHh2VktLS0Nsc2dl?=
 =?utf-8?B?c0hnZGhzV1JVdjRKU2hoWGVZcnVnUXdBWTNuSnFmYXREVGNBV0pSUW53OW5H?=
 =?utf-8?B?bUpEZHp1TjNoQ25hbHl6ZlVQSy8yZ3lCZ3ZCUnVPMWJWSlI4M0phOUtXNDR4?=
 =?utf-8?B?ZGYzYVpPMUswaEZtMkRWam1PenNaYXNqYVNWNVJqYmJ2SytYS1lDWjM5cjZH?=
 =?utf-8?B?aUl3eWVDSExHSHJObzl2cHNXcDVnTVJ4QndHNTMrWHFNT0hRMW9ZV0FreXZs?=
 =?utf-8?B?NlU4YWxGWmwzTXAzU3Z1c3Y0MFZ1TTlUbzY1SFdyMkdiU0RQSUFZMWtaTlZ5?=
 =?utf-8?B?NzFOZDV3SDk5cWFhSkNFSnB4b1BpNlJEU0QvSzVjbjZXdHZJRlhTajBCOU5J?=
 =?utf-8?B?V3QzNFF5b25rbVM1NkN4ZFd0R3psV0xGODV0ZDdhQndkZnRzRmZINlJ5bU1q?=
 =?utf-8?B?aXZpOVR6bUZrYVNEdU5DNFRCOXhjS01ERGFTZjdNTzJ4UHU3RndWL3VEaEZI?=
 =?utf-8?B?a0ZnZFJOUXdSdHprbU9mdjJlczVHblVsWDB2UGxzZmcrbFR1QStIQUxXbWZH?=
 =?utf-8?B?S2tNK1ExSEZaN0JMdlBKTzF5M3dsMDBBYmdRbkNpMVdTck1HT2phaVhBZm5N?=
 =?utf-8?B?VmREYm1PWFhFQ3hQNXdWTkgyVG9aWUlQQXN3ZkV0ekw4MlQxV1NjS2d0SmNO?=
 =?utf-8?B?YWFXeHlQa01NTnliNi9ZYUdud3c3dG11VG0xd3l1MWFkY2VqZVlqUW5xWlR6?=
 =?utf-8?B?MjJMUUVsYjl4Q0V2bVVOTWd4eXlramxLYURTS2pyZjAwVEd3OXgxWGcyQ2hn?=
 =?utf-8?B?NVkySWltZ1lsYUx1YzN1d0l0RUdTWW5qNHpYY0dpcUVyRzQyNFN0NU91L3VH?=
 =?utf-8?B?bVJNSjV3R3E2cGQxZ3BFLzhjUSthelk4eUxjdnNKTXFONk5ncnhWOTlyYWYx?=
 =?utf-8?B?YmMxSWo1S0d3RnVLZElHVSswNFRHTG9QZmlYWWZWZE80VGpmTlFKWlREek5k?=
 =?utf-8?B?ZllPS2tSbzZTbWJZZkZScitzNlo4NVJVd1AvemxHL3RLRytvbnJLTndvNFB2?=
 =?utf-8?B?YmdNSFJNRno0SUhWaTNUOFlnZUZ6MEFGaG9kbUVaYlQ2K0krWEMyU0dieko5?=
 =?utf-8?B?TnRTaDFhZElLTFBOWUo1dW02YnJBS0FtWWpjcSs5QzFsUmtsd3c3K3c3cTFm?=
 =?utf-8?B?TjFjQk5tem9tVjVmcldVUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGptWGhSTlJWTmxvMXAvTER6YkF5VlFVb0VzREIrbW1EYWdGQmsvMUc5N1NG?=
 =?utf-8?B?djZJZnJTd2VOSnFoSUJ4RVhTNXY4NnBSczJURC9Oc1Yvd2lQbDdtR0hYSWdI?=
 =?utf-8?B?ZDEvYzFNcXV4N0x5cEFhMkQrY2VPTkU2V1NUYkovSCtqTkE4RjBnblN6bzBK?=
 =?utf-8?B?ZWJVckp3NldaL1pvbElCQXBDekQrVGNnWHAvQnk5WnFCRzVGUDdUWXFmczhR?=
 =?utf-8?B?NzVmMDFLeEZvV2xPWkFiNThzN2h3WTFzWkVNQnVCUWFsbHIrWUJJVitjM3Mw?=
 =?utf-8?B?cFJraWswdkNrK1BHQjQ5d2swL0FlTmxEeWJJTWY4VFg5aTdTcDZ2RFdTM1V5?=
 =?utf-8?B?Z00zTzZqUk16MW02RVV2OXpWcTNNY05SaVRPRW1ucVJySFNoMzZvWUJmOFll?=
 =?utf-8?B?aXpjQlpPT2YrZE9BS3J5SFNtUUdDTldZKy94RG5wV25kN3NBVHRIM2RRRzdv?=
 =?utf-8?B?TUVLOGkrM28zT2hUMHo1ZlRWSi9ZczBqc21XV1dxVmZ6dzJtUDdWZEVETjZR?=
 =?utf-8?B?U29iM0lKM212VVZOTHpYZmoybXZGT0Voak5GaWxkeTJ2ZjVjWmxveGpLNjlC?=
 =?utf-8?B?N08zWG5NdUQrWnFOSGJRRnFpeFRmNGF6L0hBSU5mWEZRQkt3cVpCSVYwUW5T?=
 =?utf-8?B?OUhmRUk3OGw2QzFUTGhmbUpGWkU1SEtvWmk0SzRVbDdaOHpMQ3RKK3lROE5L?=
 =?utf-8?B?cVJmQ1BkbjczcmRuYWx5UTBUcGVjRkdJWWlGeTZieTZqaDE4TDl0V21hUk4z?=
 =?utf-8?B?RjdjdzdlR1hoOWFlcXVHL01OL2tpS0FZQ3JLN2k1Y1NwUzFJUnBPSm1kS3p6?=
 =?utf-8?B?Z3lqczBETHFVQkNQSlU4aXZqbm1zZ1kvc0wyOWJqYk1tNnRpZ1VCZkk4ZU9y?=
 =?utf-8?B?bHJVUGZXaml6bkhTbldrT2xZRm9zYUJQNytQY0x2RkYwMzVOaUtTeFFLdTJs?=
 =?utf-8?B?VHpsdzZwRjhNeUQvNmU2S0F0TGRpTjYwZDBuQUVqQ3RkTGxaWThZaThOVERH?=
 =?utf-8?B?RnA4Y1VxUHljNEprSVJaRlRoYy9zZEovUjZKN2NGN0k1OGxJVTZsMmppVi9H?=
 =?utf-8?B?UGM0VGdYbnhkNWhDSlhGQjhnRnl0UzFOTEhpNzh4Y1QzWEFGZ1NMUHBpaHQv?=
 =?utf-8?B?YmhZNGRWNk5rSUF0d3grcFRpT3BTdVRVemFoN0Jad2g0NG56czljQ0Q3c2F2?=
 =?utf-8?B?bDRneWpBcVAxWlNySmJBTXNHcWtsejE2QjFlaXRxSmIyZzdwSk1GYkQ0NE1O?=
 =?utf-8?B?a3R4TFJQLzlTT1kvcThWZ0dmeDAxU0lTdWtrQWxZQklWRXBQUXV2UHdBREtO?=
 =?utf-8?B?Tis1a3ZrZ0loUjNMV1E1SmhtU1ZDK1ppWVNXQjgvOGZHOGRqL3ZzN2lMRjdE?=
 =?utf-8?B?NnRrbzVDSXlnWktwMFJOVWhUekdBeTJnVnVIMXNDcHE3ZGhiVzR0dFROckt1?=
 =?utf-8?B?aVF4b0Z6cjJMaGFXRWw4dnJMU3BvTUtpUU1EZGE3NEdUWlcwT3ZRR1ovcDZr?=
 =?utf-8?B?Nk9lU1pIUmhGVWl0ZnVPR25CMlZkeVV6VEgyaXRWb0xWUmZacml4SkVZVVJp?=
 =?utf-8?B?dm9JR2ZrcEZmMGNFYTk3cStqOGEvaUFhTmRQcWI1bmlNemxVRjU4OGI1ZFdF?=
 =?utf-8?B?bDgwYkRJY3lLdGc4dy9UZHhqT2ZhcWwrTUl3ZUxJbFBwQ3NMZGkxS0JuRXk4?=
 =?utf-8?B?VnZTQWdraGloU1hPYjhaSXVHMFl3ZDVINjhTUXZNS0psSzZvTnVIMjN6d0Nz?=
 =?utf-8?B?dlZ3TFdWMTNSQzRwMlgrWjF3NmpPNmRxVHlmV0E3dld4WFZuVDJvSFJiSVgw?=
 =?utf-8?B?bklXbnloZHJGTnZUQW1pYVNKY0tlNSs0NFlLRHJiWDV3MUVjYUdIZGJnclFK?=
 =?utf-8?B?TU9OMGkxUXRKRUZEN21hK3Z6TEV3QnRJSTZNQ211eTI3WVZEaDQ4Z3RIWnpL?=
 =?utf-8?B?Q0VCQXpWaGU4bEJOY1o2U293T0h1UC9CbEhWTEd2MEdJbjhXNXlKQWJaY3dm?=
 =?utf-8?B?V0U4c1k2cVpaQnEzaSs2SHg1akVOSnN3cUFWUjl5MWdJci9YQTZuUzBmS0dK?=
 =?utf-8?B?SnhaaHlFSFZCM2FKU2E4KzF0VUlRV2xQLzM5anRENVVJdVBpeTg4ZVV1d010?=
 =?utf-8?Q?N6DA0Ffdy8Fy/HhCsy314yluc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc01005-c9c4-4770-1b54-08dd1552da44
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 17:32:55.1484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTQn21v43l4QsEuCtNWfwfXfFW5BmRQ98xqkopYAcseyddflvK2t1CRjbQpZ5x4C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024

On 5 Dec 2024, at 3:19, Geert Uytterhoeven wrote:

> Hi Zi,
>
> On Wed, Dec 4, 2024 at 5:58=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>> On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:
>>> On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
>>>>> So maybe the clearing done as part of page allocator isn't enough her=
e.
>>>>>
>>>> Basically, mips needs to flush data cache if kmap address is aliased t=
o
>>>
>>> People use "aliased" in contronym ways.  Do you mean "has a
>>> non-congruent alias" or "has a congruent alias"?
>>
>> I mean if kmap address goes into a different cache line than userspace
>> address, a cache flush is needed to make sure data is visible to
>> userspace.
>>
>>>
>>>> userspace address. This means when mips has THP on, the patch below
>>>> is not enough to fix the issue.
>>>>
>>>> In post_alloc_hook(), it does not make sense to pass userspace address
>>>> in to determine whether to flush dcache or not.
>>>>
>>>> One way to fix it is to add something like arch_userpage_post_alloc()
>>>> to flush dcache if kmap address is aliased to userspace address.
>>>> But my questions are that
>>>> 1) if kmap address will always be the same for two separate kmap_local=
() calls,
>>>
>>> No.  It just takes the next address in the stack.
>>
>> So this fix will not work, since it is possible that first kmap and seco=
nd
>> kmap have different pages_do_alias() return values.
>>
>> Another way would be to make a special case for mips, like below.
>> But that looks ugly, let me think about it more.
>>
>> diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
>> index bc3e3484c1bf..ef3c6f0b9159 100644
>> --- a/arch/mips/include/asm/page.h
>> +++ b/arch/mips/include/asm/page.h
>> @@ -95,6 +95,19 @@ struct vm_area_struct;
>>  extern void copy_user_highpage(struct page *to, struct page *from,
>>         unsigned long vaddr, struct vm_area_struct *vma);
>>
>> +struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma=
,
>> +                                  unsigned long vaddr)
>> + {
>> +       struct folio *folio;
>> +
>> +       folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
>> +       if (folio)
>> +               clear_user_highpage(&folio->page, vaddr);
>> +
>> +       return folio;
>> + }
>> +#define vma_alloc_zeroed_movable_folio vma_alloc_zeroed_movable_folio
>> +
>>  #define __HAVE_ARCH_COPY_USER_HIGHPAGE
>>
>>  /*
>> diff --git a/mm/internal.h b/mm/internal.h
>> index cb8d8e8e3ffa..d513fa683aa3 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -1287,7 +1287,8 @@ void touch_pmd(struct vm_area_struct *vma, unsigne=
d long addr,
>>
>>  static inline bool alloc_zeroed(void)
>>  {
>> -       return static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
>> +       return !IS_ENABLED(CONFIG_MIPS) &&
>> +               static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
>>                         &init_on_alloc);
>>  }
>
> After adding a missing static inline, #include <linux/gfp.h>, and still
> getting compile failures, I gave up...

Sorry about that.

Can you try the patch below (it compiles locally for mips and x86) to see
if your issue is fixed? Can you please make THP always on in your config,
since THP is also affected by the same issue? The patch you tested only
fixed non THP config.

Thanks. I appreciate your help. :)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 6e452bd8e7e3..d9beb8371daa 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -224,7 +224,13 @@ static inline
 struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 				   unsigned long vaddr)
 {
-	return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr);
+	struct folio *folio;
+
+	folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
+	if (folio && alloc_need_zeroing())
+		clear_user_highpage(&folio->page, vaddr);
+
+	return folio;
 }
 #endif

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c39c4945946c..6ac0308c4380 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4175,6 +4175,23 @@ static inline int do_mseal(unsigned long start, size=
_t len_in, unsigned long fla
 }
 #endif

+/*
+ * alloc_need_zeroing checks if a user folio from page allocator needs to =
be
+ * zeroed or not.
+ */
+static inline bool alloc_need_zeroing(void)
+{
+	/*
+	 * for user folios, arch with cache aliasing requires cache flush and
+	 * arc sets folio->flags, so always return false to make caller use
+	 * clear_user_page()/clear_user_highpage()
+	 */
+	return (IS_ENABLED(CONFIG_ARCH_HAS_CPU_CACHE_ALIASING) ||
+		IS_ENABLED(CONFIG_ARC)) ||
+	       !static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
+				   &init_on_alloc);
+}
+
 int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __us=
er *status);
 int arch_set_shadow_stack_status(struct task_struct *t, unsigned long stat=
us);
 int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long sta=
tus);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ee335d96fc39..107130a5413a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1176,11 +1176,12 @@ static struct folio *vma_alloc_anon_folio_pmd(struc=
t vm_area_struct *vma,
 	folio_throttle_swaprate(folio, gfp);

        /*
-	* When a folio is not zeroed during allocation (__GFP_ZERO not used),
-	* folio_zero_user() is used to make sure that the page corresponding
-	* to the faulting address will be hot in the cache after zeroing.
+	* When a folio is not zeroed during allocation (__GFP_ZERO not used)
+	* or user folios require special handling, folio_zero_user() is used to
+	* make sure that the page corresponding to the faulting address will be
+	* hot in the cache after zeroing.
 	*/
-	if (!alloc_zeroed())
+	if (alloc_need_zeroing())
 		folio_zero_user(folio, addr);
 	/*
 	 * The memory barrier inside __folio_mark_uptodate makes sure that
diff --git a/mm/internal.h b/mm/internal.h
index cb8d8e8e3ffa..3bd08bafad04 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1285,12 +1285,6 @@ void touch_pud(struct vm_area_struct *vma, unsigned =
long addr,
 void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
 	       pmd_t *pmd, bool write);

-static inline bool alloc_zeroed(void)
-{
-	return static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
-			&init_on_alloc);
-}
-
 /*
  * Parses a string with mem suffixes into its order. Useful to parse kerne=
l
  * parameters.
diff --git a/mm/memory.c b/mm/memory.c
index 75c2dfd04f72..cf1611791856 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4733,12 +4733,12 @@ static struct folio *alloc_anon_folio(struct vm_fau=
lt *vmf)
 			folio_throttle_swaprate(folio, gfp);
 			/*
 			 * When a folio is not zeroed during allocation
-			 * (__GFP_ZERO not used), folio_zero_user() is used
-			 * to make sure that the page corresponding to the
-			 * faulting address will be hot in the cache after
-			 * zeroing.
+			 * (__GFP_ZERO not used) or user folios require special
+			 * handling, folio_zero_user() is used to make sure
+			 * that the page corresponding to the faulting address
+			 * will be hot in the cache after zeroing.
 			 */
-			if (!alloc_zeroed())
+			if (alloc_need_zeroing())
 				folio_zero_user(folio, vmf->address);
 			return folio;
 		}



Best Regards,
Yan, Zi

