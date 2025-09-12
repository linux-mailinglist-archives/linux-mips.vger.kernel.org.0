Return-Path: <linux-mips+bounces-11254-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8FBB54891
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 12:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43476174DF2
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 10:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B92288CA6;
	Fri, 12 Sep 2025 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Iv4suKXi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73241537E9;
	Fri, 12 Sep 2025 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671192; cv=none; b=RQZxK0UVS5fH5+fTekmOusP3iQeguSpp9mHCuxdF8Et1l3U2cRXdpq5CZykKi99Dp0vqeaRI7ecujqiP4dqNe7oj6kw76wB11ZYM6cRy2z6wi9w+q4N4FfkfoiPNknHp8y0JZ0YSXPB5uX5FwO136xOQky2poBN8Ws5WrLmXGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671192; c=relaxed/simple;
	bh=wXwHzs3cuy4XVADNPAdl5sfqQoJprLOTD7qqu5IX6ek=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sh5xRQPeE9/tL/2KtolEgIf+rQ+aIPSCKiUewdw/DtVnF1Ml4SZt2Tqvzycgvag8yXX9W+b3nmi1Bf/gc0MKeJt7Puh4osimmzBEjgq+e1Eu8jT2V1poMW25/aQFLpK4B2rAfBGB8VYpQ3R1kgqX0ELO7SsuH0xiFQvLtpmL1cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Iv4suKXi; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 58C9wovj1383935
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 12 Sep 2025 02:58:50 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 58C9wovj1383935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025082201; t=1757671132;
	bh=wXwHzs3cuy4XVADNPAdl5sfqQoJprLOTD7qqu5IX6ek=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Iv4suKXiAxoLsxR2i11aAdvhMLL0LO5cMcs1CvBme2/ey9ISbE8mmgQ2f9bOYVhlv
	 2l1qElf6X9ZwESTueasD9/lDo017OlrdCm8f2y4ckj3NA9QXf4T5BYDKS6pLCC2hQE
	 8q+SZy2Dwf91S5hGoA2CP767WUCArqI8deJyBK171k0gbhXOuRszd/TpSl98B8Gicy
	 pmBmXN/1mNCAHsS+pgcVurnG5yieK0YeNEr4nImgCKJ7mZJmOM5odOCX4B0Ck3SN+E
	 blt70msFBUwxUp3/M097HMDT54EEYk5VaHutWeDlQ5yVo3/5b/ggpIM2UrfLYw+JHB
	 /PgINChn3uJzg==
Date: Fri, 12 Sep 2025 02:58:48 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
        ksummit@lists.linux.dev
CC: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, imx@lists.linux.dev,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Richard Weinberger <richard@nod.at>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
        =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "Chester A. Unal" <chester.a.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
User-Agent: K-9 Mail for Android
In-Reply-To: <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
Message-ID: <E986779F-C7AA-4940-9508-08601EE2FDD0@zytor.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 10, 2025 10:38:15 PM PDT, Andreas Larsson <andreas@gaisler=2Ec=
om> wrote:
>On 2025-09-09 23:23, Arnd Bergmann wrote:
>> High memory is one of the least popular features of the Linux kernel=2E
>> Added in 1999 for linux-2=2E3=2E16 to support large x86 machines, there
>> are very few systems that still need it=2E I talked about about this
>> recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
>> and there were a few older discussions before[4][5][6]=2E
>>=20
>> While removing a feature that is actively used is clearly a regression
>> and not normally done, I expect removing highmem is going to happen
>> at some point anyway when there are few enough users, but the question
>> is when that time will be=2E
>>=20
>> I'm still collecting information about which of the remaining highmem
>> users plan to keep updating their kernels and for what reason=2E Some
>> users obviously are alarmed about potentially losing this ability,
>> so I hope to get a broad consensus on a specific timeline for how long
>> we plan to support highmem in the page cache and to give every user
>> sufficient time to migrate to a well-tested alternative setup if that
>> is possible, or stay on a highmem-enabled LTS kernel for as long
>> as necessary=2E
>
>We have a upcoming SoC with support for up to 16 GiB of DRAM=2E When that=
 is
>used in LEON sparc32 configuration (using 36-bit physical addressing), a
>removed CONFIG_HIGHMEM would be a considerable limitation, even after an
>introduction of different CONFIG_VMSPLIT_* options for sparc32=2E
>
>Regards,
>Andreas
>
>

It really sounds like a self-inflicted problem=2E=2E=2E getting your custo=
mers switched over to the RV64 side is probably the best you can do for the=
m=2E

