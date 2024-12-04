Return-Path: <linux-mips+bounces-6877-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F12C89E4681
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 22:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5A6C16AA09
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 21:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DD218D626;
	Wed,  4 Dec 2024 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XzzER9Q9"
X-Original-To: linux-mips@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A76C18B460;
	Wed,  4 Dec 2024 21:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733347277; cv=fail; b=b//B6CqsJNRbRFS2XF3LvWgAi/MA6xHPOPLoB3Ym1X3ov0wRTkZiAyL1dtxnMOFCWeWflxJyItcGyiI2PZdpvkITy6vB34br/Ljjq9SHltF91t+ssaFacdqTPF6G98ggAJrIrE6VSz2rDkA02ifBQiZbeRTTiCEoceOafyzPpPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733347277; c=relaxed/simple;
	bh=Bk8nneg96T8sljNPC1LQKPUwQ9jg0/rj2k76w7WxI3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PBAKlMGDpJhkcNzX8XPeTYyPlRZ8zxC6kur+x40bWuqnHKgWCDCZt+fvlu0ciKfSZ30Hy7JEw47I802Uor8flMl+pCh/Wo8UsrsQWrPLIAYOCVvVam+QivKYTbami3Qc3L8LuTK9VEYdAv/lDgrysXc1/2f0VIyfuQzjK16ZUe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XzzER9Q9; arc=fail smtp.client-ip=40.107.102.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dcu6NIvKaeMrY3VJdQjY+GXfffi0Nw8M/feCBIQBprJc1jtC3+ceRzgMtTXFAdMQU+xjKEAlaNrLWihGsibWsASvyJEIt08jdTcLoWGFtZkfxcfd4hhAUEbXfQsVugHR+go5swCUipKV8Vx9aZYrGwCy6bgb7kJ6K08iHdYWivhtxYCg32h4yYZgpEO857ifbkfTHm3M9+W2FMjG8zaV+LJloQqXzh+23/4sIOBIdv1Q61lWBXVy8gRi2B6ascdvUhhzJmqfn2JEvPV90VmEwXRL6rujXXKwVjDdev6KeDznvoEPuqqh/RXb7xaI7TJi0PZd0IlnuIcO1XUmu1RNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsYuWKLSKFONDOYYcVUa3mmUdxnlFRmrkln8M14C7BA=;
 b=ARe9llk/E63Z3wOM/2Ppu+T+c/QLiOJUvzK3uM4h2r7iySguda/yQ1Pp1EE84TonlBzQWvhVjXuUszS8Orsk+5umxwjMnWV/nUb+REqrzmrHjqzI0P8hAXgpe7BNVtA1Uaqqu33EiPHNEmFzRcxc8PMRbRo1z+5Cd6mVTLfzwU48i4jP9b3Z8J/niSaS3VvQObOpeFWDQfF1WUGMLHcR+44z2Lr9l7hAVoMgp8dGFDukoR9OFJjB3miqPjK1VYEzPajlbOXr7npDgPqgg6K97sTXtsfuwHWfBx0vdJLUs0zseXrMd87G0TucuiT5Tz/H3Dbdpcs3AWSZaZj8/K/Klg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsYuWKLSKFONDOYYcVUa3mmUdxnlFRmrkln8M14C7BA=;
 b=XzzER9Q9Vdf9M+76HORyBV02MF3UN5UjKXGWVaXftLhweRP9Ioy5Yb23iWw8mk52Gc1bGeIaDAQe/nSU2EvzBFcqwW+q2YBZO3QaYU1GwYlTtCOi8TMszMktUWbUn2WDAfSXK/kRv/Ug1I6YxuDZP+wT27WHeSPu25Kna1tR6LZW4D3lD7MblGCpUre3VnRly2z/aw+HXSFIGW4rXNTq61RkDE1HD2Te9LTQyQFfULMwhKWnPUEc7UxDG9s7cdspITsSUF/oyoYPmB/6LpWOwMAXiiZVKA1Fo3/bVsgg4v8vSbHFC8mPLTsF5witvvTb/2lJIXaewmuRHw3BElSxhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 21:21:11 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 21:21:11 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>, Kees Cook <keescook@chromium.org>,
 Alexander Potapenko <glider@google.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, John Hubbard <jhubbard@nvidia.com>,
 "Huang, Ying" <ying.huang@intel.com>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Date: Wed, 04 Dec 2024 16:21:08 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <EB367D67-E3A3-4590-A1DF-B1B3204B3F2A@nvidia.com>
In-Reply-To: <2D6F1B31-A261-4983-B0AA-D45C07E21CFB@nvidia.com>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
 <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com>
 <b2142993-e77f-4998-ba87-0d51629c0f6d@suse.cz>
 <2390F919-D502-4428-B8CE-5154D30112C4@nvidia.com>
 <2D6F1B31-A261-4983-B0AA-D45C07E21CFB@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0315.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::20) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c47519e-733c-4de8-0d9b-08dd14a99366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkpXRG02N0ZUUWhZQnhjOUxEeG9QRUE4R2M2NnNOYU9SWmZkL3IzNGNZTFhU?=
 =?utf-8?B?MjlISWgxOWJ5RzdTZG1ycTdweE1CcHM2M3lVZDNrRmM1dkNQNkIyWlFuVERO?=
 =?utf-8?B?MHFuSUpXdkYzV1FObXF6NVdyNlFrdlQ1bG9IdDU0L3pnSGhXWCt4czI0U1VI?=
 =?utf-8?B?UkRWaE45N1g3NW9FZjIwRm1yVXJjWlcyaFdMNlBuOTZtS1hDRTEvU3NNZDFN?=
 =?utf-8?B?aGRheTBpaTkrdTZFTktuQm5abVpOUS9nTjV0eFdja2dITVRLVktvOVpYMlYv?=
 =?utf-8?B?aUc0TEdNMWtUTkdRVHFwdG1ieGNwT2hWMW1ON2IyS0FOZFExUzBLOWM3Tncx?=
 =?utf-8?B?UlVRWjBBaUJUUmNJZzYrNzZuN1IzUUNhQWVXbmhTZlBGQzBCMHViQVRSZEgv?=
 =?utf-8?B?ZnV6MTZqclFzVFRNVGpWV1BXWlJJODN2QTJ3MzlKTndBMTBYd0VIcFJrQit2?=
 =?utf-8?B?ZEF5NDZiODd2VlZTWVhOaG9NVGd5WjRpQi9UTXRuc1ArSHpqcE14ejcrWlJj?=
 =?utf-8?B?Uk5lNWlrNHY1cGxGZ2JLeERGQjhOSEhJMCt3RVlsT3h5eE1oV3dub0hKTlRl?=
 =?utf-8?B?M3JFMldKMzI4dk0vSHM2N050anJnaVo2L3NEOStvRW1lZEhOVjhQQSthc2lM?=
 =?utf-8?B?U3Z6RENaenBGQnorZ283ODNNcnd3alZuNVhBZGwxTmh3WmpSeC9LYit4M1lW?=
 =?utf-8?B?djNoK1dnVnY3Zkh6MXNXemQxa3FiNFQ4MjFobnJBVlk3RkxiSDdpODdCYnVh?=
 =?utf-8?B?V1NWTWFjaFY2NGRXZ1JsQlhrc2lDc2FoOGJvVVpVbytZeXZpaGJ6NFdvK3VW?=
 =?utf-8?B?YnFWWTkzTC95V1VubHpzb2UxWFVMZE9OTnVPWjUvRGxuWEdvWWVsQW1VQzRw?=
 =?utf-8?B?V3Z6RXA3OGZOSnkxSlNzZ29mY0ZaMjVubmFERnYvL2dWWDN0MkFiZWhudEw1?=
 =?utf-8?B?dUQ0SnBHY1Y1Z0p4QTBIQnRLVFdCbkN6dVNlS285K1hJbW5vTUp4NUhUK2ts?=
 =?utf-8?B?OS9CSnNoc1U1ZWh3Sm1BWjlSOWNFRk9oN0NwNjF3NkRIaEFvVUpIYU9uRFJo?=
 =?utf-8?B?MGRiTXNYRSs1VzNPREFHL3p1ZzZrTXZDRkM4QUJidVhlTnpwa0xOcEhwRWVC?=
 =?utf-8?B?MHJ1TVRDTFNIK1N1VWVkUnBsdFVaU21mMWNZSnEyWHN0eUh5akl2OFRoMDRO?=
 =?utf-8?B?bmQ5QTA4bFNuc3JGMDhKWmZ1eDlJeld3RUxJZDYzU01NWGZwOXBRbHg1eHVS?=
 =?utf-8?B?dUdzNnpEZ2hLaUFZSE9YMFk4UlppZ0MrK0JQNUxWbEJpdDEwdWw5aDVZeU9j?=
 =?utf-8?B?aSt5N2JTV2VrVXUyeGNCN0NINjFKdk5BcVgvSGt0TzRyejltVVFXSXZ4Y2dK?=
 =?utf-8?B?SHBYQ0s2M0dXVytadmdSK0lmWjdjU2xWNllaS01yRnNVKzY4SVRDRFoxaUdM?=
 =?utf-8?B?TFp3YVBUV2N6bm5kU05vVWIvODRXWEMwRnFpdGVMdVBxV2NIUW9mTlA4Yzdn?=
 =?utf-8?B?NnI3RlpsZ0dONG9URkc4bzBteWlESk5Pd0pFL01PRDM3M0lJN2hiaDdlRnFX?=
 =?utf-8?B?ZS9leFhkVDBBc1ltd2lzcDVYSWNobVF3NFlzeU13dGQyandRUXZtTFZKdlps?=
 =?utf-8?B?WDcrTjYyNXhmME5XaVF3WXl0U2cyUzFKNmdUck41UFRKamRaeVVPYkcxL2xk?=
 =?utf-8?B?WnlnZTRUN0lDWlFWa1BRaXplbjBUNHM0ck0xeFM4WURkVmhlRHo0NFdoNGFV?=
 =?utf-8?B?MHRxdWhUVnFnNlBJVkRrZ1hqVWsxcG1zdWhtbC9oWjdvT0NtVHl2dHNLa2pr?=
 =?utf-8?B?SEhVbXptdjhoa0IvQmZ3dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2hNYzBwZlVtRjlsYkgzNFdOOUFnNTVhVldwckpzUDN6ekJPbXI1RURHLzVL?=
 =?utf-8?B?S0I3blFzbzdJSWl3RGNzckNhQ1JMa3JvVFJKTDZGNDRURmpvZE8wdWRMeVhS?=
 =?utf-8?B?MGNpdkJJR2ZsUkNGQmxBN1ZQNndDc0pRYjRmc3I2ZWtLY0dONVMyVGhxWUE0?=
 =?utf-8?B?bmVNYlhEdXRHa3dNa053QzhkdmZLSlFGZ2Y5NkdVcWhXR1ZjdHlKZDQ4UzF3?=
 =?utf-8?B?VHcvNEpFWVZNRG9La1JhSlRNSUJhQ2FjeVV3bEpYZjZKZmVQRnNLNFRMTFdi?=
 =?utf-8?B?OWFaejRGcm9HZ0pneFhqV21hU1AzTm5ibVcrQWo1NjZ3OTRadDFsK2VGaEVr?=
 =?utf-8?B?UkJKL3hvOERKMnRtS1ZPbzR3ZzdKdE9OMzhrYStmQUlZby9pWnZzWjhmNVJj?=
 =?utf-8?B?QzcwREZFL2JyS3gzOFhyeGsveDNQWWc1R0FCd3hxSlFHWk1zaFlpcmxyMm1O?=
 =?utf-8?B?dDczeWp1ZHBadnQ4d1hTbEEyc0w0aEVHQ3FuV1MzdFg1VTM1VlNzVjI5Y2Rq?=
 =?utf-8?B?bXBheXBpNkF0cmg4MjhXZCtHME0yV1ZxVDR5NWNJY3dxOUtmMUNHN3NwUzJn?=
 =?utf-8?B?eXFOenlkTFQ1V3IrZ0hDc0YxbEwyUWlNdFFyUTlyS0hKbE1KL0Jia0VPSFBV?=
 =?utf-8?B?RFhVeTBYQ1V2R01jUk80dStLdmhqZ3hLQjhMd3hUU2FXL1hSU3hHbFNacjBv?=
 =?utf-8?B?UEpjWWRpaFBqbmpNbmtLVGhTc1MveHVrcFBZWFl5bCtReXEveklLbm1Ya0k4?=
 =?utf-8?B?emhMVks2WENaRGtMZXpJaGF0TURYanZqbjBxbCtMZlJ4VGVGRHpNKzRlekdB?=
 =?utf-8?B?UWRINTVVVU5jSVdRdk9oWUNRMGVXS0FkVy9DVklVa1BqVloybHpBSFp1cGgv?=
 =?utf-8?B?c3krRkM3ZVdmZFVLZTN2SUNSeWVnYnZXSzRUVWgyYlRsbGswcHpTczAzZnIx?=
 =?utf-8?B?Nm5aUFZxajYyU0FGSUJZMGo0NklHUGdsWktFc1BCQTdUb096TEhacjlONzJQ?=
 =?utf-8?B?OXVJaVU4TkpiOTZJN3BCT0VzenEvOUZncDhvRVkyM0Q0WjJCTHBlanNjUUc0?=
 =?utf-8?B?ODVlcm11dHM1Y05LNzB4TmhXVThyQ2wzN2QxL3pzUnFjVjR3MDc3NFBrL2J4?=
 =?utf-8?B?MFMwMUNjeE13b2pQSFNpeVhXL1FuaGhFODZsc3ZUaG1IR0FxeXp1S2YxRmFG?=
 =?utf-8?B?SGxsR1dSYlVZeXJ2SlZNeDZBVXNROHl3MzdrOVZHK3ZRMW5SZlNxbXpycld1?=
 =?utf-8?B?R3Y5dXgwRXpmZ2JpWlBtVG9Iak81NEsyb1RJdE5jcU5NUnlhc2ViNTErbnAv?=
 =?utf-8?B?VUR6SlA1UUZuaWdqYUNDb1lFdm9HdHB3YjJtQUlwRk5CeENvS1hjWUlCeFdC?=
 =?utf-8?B?cndLcVNqRE1UVS9ZZWdoek13Q1VKdGY5UUFYYWsyeHhWZEFleTBFdndHWi9O?=
 =?utf-8?B?em91eU02WjY3bE4yYURHOGovUEhsdkdsQldVTkZUNm1hUlh2RXdLMlBocmpz?=
 =?utf-8?B?TGJwWUZydHg0K2Ewc2NJeGNKKzUySVpwazk2WHhtbUNkemI5MU9lYVVENENh?=
 =?utf-8?B?UmhtSGlwUFQ5RnZiZWxRalh2YXFkQ0pBNU1ubE52dFJEOUVIbVFqMW1yNkdK?=
 =?utf-8?B?UDJsSlNlWUh2b0d2R1lLM241QmwzcmordkcxYytLaDRVQ3R0YkJJQW9wNklh?=
 =?utf-8?B?ZTJiWVFRTWlLdDc4ZUxsWmFWd2liZ1ZPdlJ5WlJkUUpLTlZ3OU1RTEZYUFpX?=
 =?utf-8?B?REhHakRjcnc4OWFvejIreDhzZDhzRDRxdEtNSlhHTlRjWlJsWUpWMzdwZFcr?=
 =?utf-8?B?RVFaS2lkcDNuNDZNZ0dWcFRZczJLcG9wR3AwNlZSTHpQdDluK3dsbm1jTDhi?=
 =?utf-8?B?M3JtSW1pOXdNUDFlZUhqRnFMVFNUOGgwV3N1YVRlbWxmU2JSM1lia3NpNkd0?=
 =?utf-8?B?YnRiUXlBWFdVdVRwdXV3Myt6M2xFM29zMEl6SnNqK2gwSlpQdUdvMEFQdWNO?=
 =?utf-8?B?WWtudDRvMW5XMjdNRGtldUxWc2RzeE4wYWJ5UEpST0ppbzRkNGI4U1oxZGlS?=
 =?utf-8?B?dnU5ejArd2tTVTNtZXZIMG41Uy9OWjFVY0d0WnQ0bVpSNHBLT21YV0E3dE4r?=
 =?utf-8?Q?uq5bUs8Uylz6KpNhgM1Hk873j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c47519e-733c-4de8-0d9b-08dd14a99366
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:21:11.3030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EG6SWCfRrMxet/rpkYJLlNsoo/xMD8S+a5Wz2QQ6/gDR5ED7BAtli2lz+HgQbiOz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452

On 4 Dec 2024, at 13:16, Zi Yan wrote:

> On 4 Dec 2024, at 13:13, Zi Yan wrote:
>
>> On 4 Dec 2024, at 12:46, Vlastimil Babka wrote:
>>
>>> On 12/4/24 18:33, Zi Yan wrote:
>>>> On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:
>>>>
>>>>> On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
>>>>>>> So maybe the clearing done as part of page allocator isn't enough h=
ere.
>>>>>>>
>>>>>> Basically, mips needs to flush data cache if kmap address is aliased=
 to
>>>>>
>>>>> People use "aliased" in contronym ways.  Do you mean "has a
>>>>> non-congruent alias" or "has a congruent alias"?
>>>>>
>>>>>> userspace address. This means when mips has THP on, the patch below
>>>>>> is not enough to fix the issue.
>>>>>>
>>>>>> In post_alloc_hook(), it does not make sense to pass userspace addre=
ss
>>>>>> in to determine whether to flush dcache or not.
>>>>>>
>>>>>> One way to fix it is to add something like arch_userpage_post_alloc(=
)
>>>>>> to flush dcache if kmap address is aliased to userspace address.
>>>>>> But my questions are that
>>>>>> 1) if kmap address will always be the same for two separate kmap_loc=
al() calls,
>>>>>
>>>>> No.  It just takes the next address in the stack.
>>>>
>>>> Hmm, if kmap_local() gives different addresses, wouldn=E2=80=99t init_=
on_alloc be
>>>> causing issues before my patch? In the page allocator, the page is zer=
oed
>>>> from one kmap address without flush, then clear_user_highpage() clears
>>>> it again with another kmap address with flush. After returning to user=
space,
>>>> the user application works on the page but when the cache line used by
>>>> init_on_alloc is written back (with 0s) at eviction, user data is corr=
upted.
>>>> Am I missing anything? Or all arch with cache aliasing never enables
>>>> init_on_alloc?
>>>
>>> Maybe the arch also defines some hooks like arch_kmap_local_post_unmap(=
) ?
>>
>> But this does not solve the possible init_on_alloc issue, since init_on_=
alloc
>> is done in mm/page_alloc.c without userspace address and has no knowledg=
e of
>> whether the zeroed page will be used in userspace nor the cache line wil=
l
>> be the same as the userspace page cache line. If dcache is flushed
>> unconditionally for kmap_local, that could degrade performance.
>>
>>> As for the fix, could it rely on e.g. __HAVE_ARCH_COPY_USER_HIGHPAGE in=
stead
>>> of CONFIG_MIPS? That affects more arches, I don't know if we broke only=
 mips
>>> or others too.
>>
>> Yes, this is much better, since this issue affects any arch with cache a=
liasing.
>> Let me update my fix. Thanks.
>
> I notice that arm64 has __HAVE_ARCH_COPY_USER_HIGHPAGE defined, so I will
> need to look for an alternative.

It turns out sh, sparc, arm, xtensa, nios2, m68k, parisc, csky, and powerpc=
 all have cache flush operations in clear_user_page() compared to clear_pag=
e() and
arc clears PG_dc_clean bit in addition to clear_page().

So __GFP_ZERO cannot simply replace clear_user_page()/clear_user_highpage()=
.
I can add ARCH_REQUIRE_CLEAR_USER_PAGE for these arch and use it to decide
whether clear_user_page()/clear_user_highpage() needs to be used regardless=
 of
the presence of init_on_alloc.

I also wonder if INIT_ON_ALLOC_DEFAULT_ON works on these arch or not.


Best Regards,
Yan, Zi

