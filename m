Return-Path: <linux-mips+bounces-4033-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4C91CB3D
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2024 07:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFF771F235A9
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2024 05:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F942262B;
	Sat, 29 Jun 2024 05:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="S5B3LFyj"
X-Original-To: linux-mips@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011038.outbound.protection.outlook.com [52.103.43.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A07A1C17;
	Sat, 29 Jun 2024 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719638497; cv=fail; b=CXVFfVf9etXoK65v2nBB3c/FwgxLgFpVBc1MU19YQyAC30VBxZwv1pb+7uxMYmcJzhvXVs6yso+BqwleeBWm0CBVGFcqpBLeNflIWt7xBBI2E5OvcI1vko8xhyzoJ57qbz9YsHMIYSRBW7pzUKEsokH6Pq/Nf5sETXQ/IiPvbAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719638497; c=relaxed/simple;
	bh=hC6UsuXwMlqinmL8sZqQZ7tGFx/oKPLCxIOgr2BygBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y/bHjiGke+LVdxIsGK/yLbrrqWIElgE1tNDZSZQSRIZZWcvHGLvCrdiSI8DAaLs6CggrygrJMcm9S8JFA8Mvp8xIDBoz0FdclxsV9dYUbjU3Yp2mXatwhBcAQ7P6B6cSfPf+smoT9T/HinBPea0uxoOzZdggVJsBeKr3s0xlX2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=S5B3LFyj; arc=fail smtp.client-ip=52.103.43.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayoDwyFjZ5+eZWfTNhD3gudvcrV61KjeDnuaQH2nxI2pu8F7kY2bygNF5rs1Y8pSkMVd3gE99G/OAzDQt1R1oiz1Desvs/Py3U/gkbzmIGApwRgci4w+x9y6bl92uLPizJFW98xWoW+swB52O9RsQQwSub6fYGQRhFwVXHykF11Z7KO8GGdQmFrwcGP+fWAMeqFmN+hkT8UJrBQRjljI2phK0qvg6i0+2SRtAOpvN11PKpIlLNCe1VwzB0opKWHVdOzsX7MO4SSGh8t+/65u0tLSkIVXtD65O8xUmGbi1WTGeJH0OgYDvaZ5dIApe7NSn0XxYrrxH2rwTseDuJoz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3qMJqTr9v17BMsBA09IKe7Otlo7vpPPWcwj4cZ2AhE=;
 b=EGjFTeZyVRygPny9EgIoBYVv6/cBckmFGPKwECGshFwL8lUvR8UyFZERkHbiJa5WWFm7cRzwpLVn0/n/nsGmD2hXovzZ6dN9lhEynZAM+5TK1xDEbOFo+jopOx6LaYkIdW2xGy+F0ksU6vsiyIOq3b/K24kKfCo8HJPMqZ62owhBshpx6Sm4MZFxnjpBuGiPXiIMNfd/TVXVQ9m0+bY5ykMLQwNfkqlthfAmPk+XM2LNT2XhGgYT43x3ntIWEIcnyYt/K1kxQoJISQ9FajQyTp7B/ggy2CM7EuvDBECqGwiFxNMl8Io9C03uo92e2yPK4fMpAY8ijXZTbE0/GHHjTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3qMJqTr9v17BMsBA09IKe7Otlo7vpPPWcwj4cZ2AhE=;
 b=S5B3LFyjgNqS1DbS7TBZXEs7rgbNAz+ckahHw4vt1vvzSdCKNmjeHU98yTcGMvSRKH/ock+zSurDfacQHlkXx8QkCTvNpIhgdWVHI4wCFtVYCbUfdXVFUvcJxkFgdAIEZonrpBr5wFSorjhj+HuCACtZlNpezCL9QzYvosoENgdc2eJoHLqaFs+n2izIdSKMHoalnzZR8qesiX3NaPkfajLCmqkuAkAnx9Oh+cBFSKpOJ5/m3iQNz7ArYI7ulNzvprfp+JtvMXrX8bCXuGo9F54FlB5rczJEf4IxIsZWOEpG9Cap6jKEAxrrVivV1l5vklh6hETw/pL3X0DSTWlaiw==
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:77::8) by
 TYCP286MB2382.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:188::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.28; Sat, 29 Jun 2024 05:21:30 +0000
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c]) by TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c%5]) with mapi id 15.20.7719.028; Sat, 29 Jun 2024
 05:21:30 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: tsbogend@alpha.franken.de
Cc: arnd@arndb.de,
	bhe@redhat.com,
	fancer.lancer@gmail.com,
	gregkh@linuxfoundation.org,
	javierm@redhat.com,
	jiaxun.yang@flygoat.com,
	khalid@gonehiking.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	namiltd@yahoo.com,
	yangshiji66@outlook.com
Subject: Re: [PATCH V2] mips: kernel: fix detect_memory_region() function
Date: Sat, 29 Jun 2024 13:19:01 +0800
Message-ID:
 <TYCP286MB08959EDF4C5BD304E3A292C5BCD12@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <Znp3JKF6UUn2YuvL@alpha.franken.de>
References: <Znp3JKF6UUn2YuvL@alpha.franken.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [bYHs47TqnFuc7g72RQa4v/m5ChGlXCcI]
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:77::8)
X-Microsoft-Original-Message-ID:
 <20240629051901.16559-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB0895:EE_|TYCP286MB2382:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf198f2-4928-4f91-dc75-08dc97fb5550
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|1602099012|56899033|3412199025|440099028|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info:
	ncML2fzK9D6aECuZkdt6UEm03zhqZOJHIHZcw/1z1fcg6dWRDebjuiZEjvga3ejOZQIYpfX9n0yb6pPWVePzXLCmdxduIQEOHu85T0+QeO9rQSzsScgVfyhJxj4kK17pHsXFWMPd9Tnmc4uFdLYMyHV8CFKnUYwPExZUIBbTYG0gu6bCXY+zWBxoSSKNnqqhH1giuDboOJ4LtxBG7k3LWJV2GJ8tPDPzqvm4aoHTyJdlj3xvUNAQbqr/X0e6NpnUVj0ciIqcSYdgI+76Ry3U+aO4dbYptjsMo98siDDElIw5rs+EKsxgPDjRl5AJAGCzbOFYnIh1r4hiPKs5WYTKhia5nrMcAi4wwjYA7hJaB5OQWl6X3a1JQpqzuCTQSoWZNEh5RWq+lFykZ0rjv69daR9FOdGI74a7kFASf/N4daxA47fkPqlaXXacqR+ueMY/cysTqDMdIPbvfNjx0KHKxfN1k7WG77bTy7kMr956sADNHsrV4/CD8OYzDm13hK2fVYsC1SRIEgxtD8a+dXrywOI1ItZmT9ABOYRkJElv7xcZ2HvDzWU4bxW5/2pBAAYS4ZkcdktmZrEqnX0wAOXuGVEqcEtovudDQWLva/OcHf8FiMtBKDA08/LzgL+ZI1QytTvkXe8HABy15Whj5wFZlqkp2itJ5R2kGCBN4flj32XtodHExVeVlLNDKxPQ3ryt2TNEAf0JoHefznfsTfcxcbItsXuAvrlkv3Kpv2hFGapuUe/3aW06xkXUJN78GcwKjZl2M7f5LyRVozSrXnFUjQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2wlzAmN2WSshZcRAMitPWX7fn2DYcABZyiuHrjyEdP9FdwqeBXkOes+O63LT?=
 =?us-ascii?Q?eL4ty05GF6fZk3B6NMF7tsaNpHFQ1IaEFcV8hp+IhefDxyZX4yvtRaiYwGb4?=
 =?us-ascii?Q?nePd+yEFmFw3X3Q3i7hinT1qP4z+BtXqYxTlHe6uAr+Ew5c31psP7QnOvsrA?=
 =?us-ascii?Q?6xTgAYVvDBILx8G2w6FqL3P/UCQlQ55u1mszwJtkTQOF9pr4jDGwbkgjFXJm?=
 =?us-ascii?Q?YOeSZ7Y3EO51lOSa44fmoyJd0LWz9RKzxnDMX/OksER51d9aTs3IOObnbtRi?=
 =?us-ascii?Q?KzQcW93M+1cLvZYYvJi8RvgLcn1jHigWD1wRQbrWNwp9thkrYTJUUvuk201A?=
 =?us-ascii?Q?+zoa4PC1FJwqVBW4rkAYvA8/SJ11v0q5JCFIA/eCxzDoF9T0GncQGCOp6lB4?=
 =?us-ascii?Q?P9lIHGY6BpxapH44HjGwMlvE7+RDPniXhQThiun+pHNy2nKT2FkafUbbh3fd?=
 =?us-ascii?Q?kCEI5CBXR0D1s6bndoM776feJTfgGjtGgW6TRdL5ElMLaOtlahb6XLUkKHwp?=
 =?us-ascii?Q?OJ1WCpYADfN3bpwt9cjg8KnQe73TTTLWm75Vg/EalarsE5z323abHwLhzkPh?=
 =?us-ascii?Q?sG7f7at6z2uWuGdASs7ZYFXcT/uE5yGsIPOmQXbUACSGf5kSsPcUZ/SXJfO8?=
 =?us-ascii?Q?taj9oSg/twXVVaI7BAzdzmycbb0HzwKlVw1jYsZeqGqbW4191OzFcjR1P9Tl?=
 =?us-ascii?Q?4CrL1ivTRnqmbuR77Gx/VzfCvpRh8oXCcSk4atu9k7DU6jNXG9cas8Ghsxhn?=
 =?us-ascii?Q?bKw0ZiKt2NCEiAKPWQdKdeOy/uWbQOCMwY8G52HjjvrNq5X+xMkrCbcvXcoN?=
 =?us-ascii?Q?9zHNXuQ8t2sBfO9bQbObFr0In5ordi2ssSfjqW+JiFs+g/mS07iT0urdpRxR?=
 =?us-ascii?Q?rmYpdsfyRQggTn/mo9JXXJF2qw/5al1Hi9SG0NY1G106nfhZF1h4eZ8L1oDk?=
 =?us-ascii?Q?9qWRjy19k/YP4AM0s2Gy8Hnz7koEZuNx08m1CuF8xCD0Mlhmo+3S3jdtpdaE?=
 =?us-ascii?Q?UKxW2WbpysCP7+xF7VpTmwh3jf6pRqaYLIY6vfo/90Q+3BYUPV1sXB6+l18r?=
 =?us-ascii?Q?h/g3nq9kMRmSuK7Zs6lOslI4GMBvxOUL49KDJ6sYciQQsgwRdcpYlJzseQ7w?=
 =?us-ascii?Q?jeWBa+ZaCFrfxzayVqPnUzt1hf64RQU5XNP2NzW1aFyDfM0O8m6OlImgHEks?=
 =?us-ascii?Q?5keumP+neLBRtGrRYoHIV2HOEghvHXfrcU/sxyIJkAUoAl/2VBba8A2A+WPh?=
 =?us-ascii?Q?VxAwuNvOiZWqrkwBcvko?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf198f2-4928-4f91-dc75-08dc97fb5550
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2024 05:21:30.6071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2382

On Tue, 25 Jun 2024 09:46:34 +0200, Thomas Bogendoerfer wrote:
>>  	for (size = sz_min; size < sz_max; size <<= 1) {
>> -		if (!memcmp(dm, dm + size, sizeof(detect_magic)))
>> -			break;
>> +		__raw_writel(MIPS_MEM_TEST_PATTERN, dm);
>> +		if (__raw_readl(dm) == __raw_readl(dm + size)) {
>> +			__raw_writel(~MIPS_MEM_TEST_PATTERN, dm);
>> +			if (__raw_readl(dm) == __raw_readl(dm + size))
>> +				break;
>> +		}
>
>you are testing memory, so just use pointers. __raw_readl and __raw_writel
>are for io regions (which should be ioremppaed before usage).

Fixed in v3:
https://lore.kernel.org/linux-mips/TYCP286MB0895F65439037ED134FEA7DDBCD12@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM/


>
>> The detect_memory_region() has been broken on 6.6 kernel[1]. This
>> patch fixes it by:
>> 1. Do not use memcmp() on unallocated memory, as the new introduced
>>    fortify dynamic object size check[2] will return unexpected result.
>
>hmm, so there should a new way for doing memory probing without
>triggering this fortify check. How do other platforms deal with this ?

I guess __builtin_memcmp() should work. But this patch also fixes a
potential wrong memory size issue[1] by fliping magic number and
double checking it. And there is no need to ues memcmp() to check
an u32 variable.

It seems that other ARCHs directly read some registers to judge
the memory size. However, the theory in mips ARCH is checking the
overlapping memory address.

>
>> 2. Use a fixed pattern instead of a random function pointer as the
>>    magic value.
>
>why is this better ?

Just engineering experience. Byte 0xaa/0x55 has the largest information
entropy and is widely used in memory testing. Most codes in v2 patch
are copied from 'arch/mips/ralink/mt7621.c'.

>
>Thomas.
>

[1] https://github.com/openwrt/openwrt/pull/14282


Regards,
Shiji Yang

