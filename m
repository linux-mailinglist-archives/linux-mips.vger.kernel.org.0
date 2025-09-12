Return-Path: <linux-mips+bounces-11252-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E122B547C7
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 11:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0500A56490A
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 09:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159C5288537;
	Fri, 12 Sep 2025 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="K2KSDbGz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA362848B4;
	Fri, 12 Sep 2025 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669537; cv=none; b=hd+zAs40qeJrV/fQ/ZWCKmyTLkKquLjIfyHwwfuofFwnEbInARi9ke7IqOde9SNg8XFIOv7iRnpYvSoU2dMnG/xBrUbcLPjcNJccYazJgymQyr6PrKhsHBQRIa5gE7hpKm2UbLeJV7Ie1sJ0vvexB+xCweifR7blJAjfBQ+d8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669537; c=relaxed/simple;
	bh=Ce7fdp+lyhbKwDMukdlU8c7lTw0HSqaCFWJYr1TtJQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAj7ghouh19AuXBoGPZoLccZCCLpXmpAeP/6XifERnyZE2kAidKudM7imTeirNGxx3zpIWQ8CfsfBo3MayM7bw26Fv+/o3xYCEz6jnwIoeAMOys6jjIMKSjiEJYNNwQUEWwUCFkhMuX3lYFDC+//8mCcFeFcOknaddePp0CBqxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=fail (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=K2KSDbGz reason="key not found in DNS"; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4cNTj20s27z1FXSX;
	Fri, 12 Sep 2025 11:32:06 +0200 (CEST)
Received: from [10.10.15.10] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4cNTj10dkrz1DNGn;
	Fri, 12 Sep 2025 11:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1757669526;
	bh=MdbRNQz00X6py3J27RP8bnCKWb4q1OzSckJ7oG7jAxY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=K2KSDbGzkvWBOxonsgdVaz4kyPUEDqqg6zdhMLv2aF3Nzko04CUw7JvSMaWWK04Lm
	 vNC1Cj2uBTKc8xdM9glCOdIXQssxtmJblCCyQc2Hi8GbcgeoJPlaNNtX0zy4fREEW3
	 r6UBaNcudI5k5SPw01Hru5aQU4tI1O1+rPvNEGW9haH4Jy2D6mmjs1dPo7LscCkHqG
	 0exPIQ+bH57TWaUThA+auuuCXOn4ogST+BxKsuMBMtASfRMsOGVWUUlnDa9TIfd9b/
	 3Pojb/BipKi+V2g4K0tvCJ/Ey32+ia3F6PZBK+f4oAwOhtLZwlnW83e9G2I0Ng81Ss
	 PBZ0wbaihaoyA==
Message-ID: <a393f6bd-ac30-4861-818c-ba0b558df4a4@gaisler.com>
Date: Fri, 12 Sep 2025 11:32:04 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Richard Weinberger <richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand
 <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
 <363853cd-7f10-4aa9-8850-47eee6d516b9@app.fastmail.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <363853cd-7f10-4aa9-8850-47eee6d516b9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-09-11 09:53, Arnd Bergmann wrote:
> On Thu, Sep 11, 2025, at 07:38, Andreas Larsson wrote:
>>
>> We have a upcoming SoC with support for up to 16 GiB of DRAM. When that is
>> used in LEON sparc32 configuration (using 36-bit physical addressing), a
>> removed CONFIG_HIGHMEM would be a considerable limitation, even after an
>> introduction of different CONFIG_VMSPLIT_* options for sparc32.
> 
> I agree that without highmem that chip is going to be unusable from Linux,
> but I wonder if there is a chance to actually use it even with highmem,
> for a combination of reasons:

I would definitely not call it unusable in LEON sparc32 mode with
HIGHMEM gone, but it would of course be seriously hampered memory wise
without HIGHMEM support compared to with HIGHMEM. In NOEL-V 64-bit
RISC-V mode it will of course not be affected by these matters.


> - sparc32 has 36-bit addressing in the MMU, but Linux apparently never
>   supported a 64-bit phys_addr_t here, which would be required.
>   This is probably the easiest part and I assume you already have patches
>   for it.
> 
> - As far as I can tell, the current lowmem area is 192MB, which would
>   be ok(-ish) on a 512MB maxed-out SPARCstation, but for anything bigger
>   you likely run out of lowmem long before being able to touch the
>   all highmem pages. This obviously depends a lot on the workload.
> 
> - If you come up with patches to extend lowmem to 2GB at the expense
>   of a lower TASK_SIZE, you're still  looking at a ration of 7:1 with
>   14GB of highmem on the maxed-out configuration, so many workloads
>   would still struggle to actually use that memory for page cache.

Yes, we already have patches for 36-bit addressing with 64-bit
phys_addr_t. Patches for CONFIG_VMSPLIT_* are under development.

Even with 192 MiB lowmem we have being using up to 4 GiB without running
into problems. Could you elaborate on why you think lowmem would run out
before 14 GiB highmem in a VMSPLIT_3G or VMSPLIT_2G configuration?

And even if 14 GiB highmem would be hard to get full usage out of, for a
board with 8 GiB memory (or a configuration limiting 16 GiB down to only
use 8 GiB or somewhere in between) the difference between getting to use
2 GiB and 8 GiB is quite hefty.

 
> - If we remove HIGHPTE (as discussed in this thread) but keep HIGHMEM,
>   you probably still lose on the 16GB configuration. On 4GB configurations,
>   HIGHPTE is not really a requirement, but for workloads with many
>   concurrent tasks using a lot of virtual address space, you would
>   likely want to /add/ HIGHPTE support on sparc32 first.

That is an interesting point. Regardless of workloads though, it still
would be a huge difference between having or not having HIGHMEM, with or
without HIGHPTE.


> When you say "used in LEON sparc32 configuration", does that mean
> you can also run Linux in some other confuration like an rv64
> kernel on a NOEL-V core on that chip?

Yes, boot strapping will select between sparc32 LEON and rv64 NOEL-V.


> Aside from the upcoming SoC and whatever happens to that, what is
> the largest LEON Linux memory configuration that you know is used
> in production today and still requires kernel updates beyond ~2029?

The maximum I know of for systems currently in production has the
capacity to have up to 2 GiB memory.


Cheers,
Andreas


