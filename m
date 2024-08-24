Return-Path: <linux-mips+bounces-5054-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E695DC8D
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 09:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCE852845E1
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 07:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDB714D702;
	Sat, 24 Aug 2024 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwXI2gRf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A60C1527A7;
	Sat, 24 Aug 2024 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724484825; cv=none; b=dpJ0D60BlpuVkfEogv4qpV3ec1jmvHXqm4mfiZccbUuuhGWBaRkg9MOaoIobXAOsl3vu2P29ngBzU8skh4phwFX49La6B7qvG7/PO5peWDyNnetKjeJZEwwy8N9vCq5m2OM12zwthKCx6OSruppzYEbHSNDzhK60zh4KI3Bc9Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724484825; c=relaxed/simple;
	bh=EcYyVNOicmYEOAbzRdp5bWeN40hV/0zddQMp+f+6Pp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=vDymIG2Rb9eg3TTpC/OWkOT//sLv5fZTFjDqmm9PJcVx/tkROLGdpD9BuVHqckqJrqpFblWn8mmFabKF84qJ2on+bxhDohJDnsjjJyW09VkB3jMB1VbQMFgrDLLXaw7wHNQqDHyBnIMYJ8kv2FeGVOOxUem0VmaILy+M4AqSxII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwXI2gRf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7142a93ea9cso2084250b3a.3;
        Sat, 24 Aug 2024 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724484823; x=1725089623; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=roY7ejJDsm7RbtW8+wK6NY3B77JXn1SsTq2WjfTzyc0=;
        b=BwXI2gRfJRfvna9ig2Zlef+JUsTxPONoXhqY7cBKJCqZqFRTra51Gq6ivPXDfC5XWr
         BbFj2JikQz9+1RO1UZKyODNduecbwZcvQj2ZLE85Ei7czjGE3Tm3bTQK4Rq+rLABCAAb
         5TB0SyynvTURadyNfVhWs8CiWKxc+jKZ+MeNueIp7pg4zIu30t79h/wQlKSZKF4P7PC0
         q4N6g9LZylEp4KMNjZvR/OJ3hhnr9KT4u1YNw1qaQjvY9AUH2Ddx1nkWMez/VgEbTJv1
         B73sL2ZEYwRL3o+CkPCJ5nWw8HkUjKbcM2AGKpeh33Xz1jNg7zjgWcHlskajSKAU/aVQ
         cFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724484823; x=1725089623;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=roY7ejJDsm7RbtW8+wK6NY3B77JXn1SsTq2WjfTzyc0=;
        b=sP0/IqY2qw7iBittGDSrKmhGuCSnpkQ4GpeTuCRNLEd+enoM/3VsWy/EZcvtB2hD/h
         Q1Ch0dqilk1AwuQ2thELk3eKfE2S4oAkVsZoWh1iPlS84feQYRLm53s3WF8fnzl/KJB7
         uO5GCxGQpSjmYxuy1cgc8gZlkuM4SLzrNRltDXpV/GvbYrnhbVmzs1rtNF2KUNrzLu11
         JOAFinaqFxPAl/0vjPjWMU75PnQJQAh16a74Q+QLorFRreL4x9PfzRXfar/EF0unOGld
         uEfj7goHc+2gx+olgSU4OgyjjsQs7wru7SkSLpPl3j7t9M51ko5Ygve6leBcLLg1R2VT
         RdiA==
X-Forwarded-Encrypted: i=1; AJvYcCULtlHfE4tB33MurF9NC3hcCbHYKQWjrl2KGCRYqCrrpA5kokrgPViqibhxMFNMn93QGonDABxhQ6qP@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ/G5FvA5l4heMLgQODMK9MySeCjSdo4ZHpHbFDN8pN/hiA4mN
	f+g4883V5EVA/t4UNgh4cunvM3uL+XPuu4YpYceFvCWuFOcSvUo4xsFDhyZMV1/YxLwIa99JTWW
	H1jxv+9C6mzKybqToXtrYS0sUQ3rajA4F
X-Google-Smtp-Source: AGHT+IGcSTpz30UDcYZDmmZXLCLJsqhJQOXCrdTdv96nQxMY3XHrgti9kb/xZTgYicbcgSf1NQPdZM0lDfphuhQyIx8=
X-Received: by 2002:a05:6a20:cf90:b0:1c6:fb2a:4696 with SMTP id
 adf61e73a8af0-1cc89d6bac4mr5243457637.19.1724484823302; Sat, 24 Aug 2024
 00:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEwRq=qhHBh5jKdLGb1r2Qem0jia=xcVdevihYfjdrLSYiZuiA@mail.gmail.com>
In-Reply-To: <CAEwRq=qhHBh5jKdLGb1r2Qem0jia=xcVdevihYfjdrLSYiZuiA@mail.gmail.com>
From: Vincent Legoll <vincent.legoll@gmail.com>
Date: Sat, 24 Aug 2024 07:33:31 +0000
Message-ID: <CAEwRq=on1DUHwjkBxNzS7UfRrpQT=k2C943ZrjK7NJDHxijZkA@mail.gmail.com>
Subject: Fwd: [RFC} arm architecture board/feature deprecation timeline
To: Linux Kernel ML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I screwed up the first message, HTML email from gmail.
So I hope this time it will be good.

FYI: I replaced the various ARM MLs with linux-mips, and
removed the personal addresses, because they already
received the screw-up.

Hello,

> == Kernel features ==
> [...]
> === Highmem ===
>
> Most Arm machines are fine without highmem support and can
> use something like CONFIG_VMSPLIT_2GB to address up to 2GB
> of physical memory. Machines larger than only popped up
> around the time of the Cortex-A15 in 2012 and for the most
> part got replaced by 64-bit chips within a short time.
> In addition, there are also a handful of Cortex-A9 and
> Marvell CPU based machines that have either more than 2GB
> of RAM or a very sparse memory map that requires highmem
> support.
>
> Linus Walleij has done some work towards being able to use
> up to 4GB of RAM with LPAE (Cortex-A7/A15 and later)
> machines, which I think still needs to be finished before
> we can remove support for highmem.
>
> === Sparsemem ===
>
> There is a new discussion about removing support for
> traditional sparsemem support, see
> https://lwn.net/Articles/974517/.
>
> This also relates to machines that currently need highmem
> support in order to use all of their RAM even if the
> total size would fit into the lowmem area, e.g. on
> Renesas R-Car SoCs. In theory it should  be possible to
> move the indirection layer from __page_to_pfn() to
> __pfn_to_phys() and support discontiguous lowmem
> that way, but I don't think anyone is working on that,
> and I don't know if that addresses the concerns with
> today's sparsemem implementation.

It looks like the highmem feature is deemed for removal.

I am investigating the loss of some available RAM on a GnuBee PC1 board.

An highmem-enabled kernel can access a 64MB chunk of RAM that a
no-highmem can't. The board has 512 MB.

That's more than 10% on a RAM-poor NAS-oriented board, probably worth
the hassle to get it back.

I built & flashed a current OpenWRT snapshot, without any modifications,
wich gave the following output:

dmesg-owrt-6.6.45-custom-nomodifs: Linux version 6.6.45
(builder@buildhost) (mipsel-openwrt-linux-musl-gcc (OpenWrt GCC 13.3.0
r27140-ccc06f6716) 13.3.0, GNU ld (GNU Binutils) 2.42) #0 SMP Tue Aug
13 10:22:33 2024
dmesg-owrt-6.6.45-custom-nomodifs: Early memory node ranges
dmesg-owrt-6.6.45-custom-nomodifs:   node   0: [mem
0x0000000000000000-0x000000001bffffff]
dmesg-owrt-6.6.45-custom-nomodifs:   node   0: [mem
0x0000000020000000-0x0000000023ffffff]
dmesg-owrt-6.6.45-custom-nomodifs: Initmem setup node 0 [mem
0x0000000000000000-0x0000000023ffffff]
dmesg-owrt-6.6.45-custom-nomodifs: On node 0, zone Normal: 16384 pages
in unavailable ranges
dmesg-owrt-6.6.45-custom-nomodifs: Memory: 441424K/458752K available
(8180K kernel code, 636K rwdata, 1756K rodata, 1256K init, 227K bss,
17328K reserved, 0K cma-reserved)

And then after adding CONFIG_HIGHMEM=y

dmesg-owrt-6.6.45-custom-highmem: Linux version 6.6.45
(builder@buildhost) (mipsel-openwrt-linux-musl-gcc (OpenWrt GCC 13.3.0
r27140-ccc06f6716) 13.3.0, GNU ld (GNU Binutils) 2.42) #0 SMP Tue Aug
13 10:22:33 2024
dmesg-owrt-6.6.45-custom-highmem:   HighMem  [mem
0x0000000020000000-0x0000000023ffffff]
dmesg-owrt-6.6.45-custom-highmem: Early memory node ranges
dmesg-owrt-6.6.45-custom-highmem:   node   0: [mem
0x0000000000000000-0x000000001bffffff]
dmesg-owrt-6.6.45-custom-highmem:   node   0: [mem
0x0000000020000000-0x0000000023ffffff]
dmesg-owrt-6.6.45-custom-highmem: Initmem setup node 0 [mem
0x0000000000000000-0x0000000023ffffff]
dmesg-owrt-6.6.45-custom-highmem: On node 0, zone HighMem: 16384 pages
in unavailable ranges
dmesg-owrt-6.6.45-custom-highmem: Memory: 506352K/524288K available
(8187K kernel code, 637K rwdata, 1756K rodata, 1248K init, 251K bss,
17936K reserved, 0K cma-reserved, 65536K highmem)

The lost RAM is back usable.

Is there an alternative to CONFIG_HIGHMEM to use that RAM chunk ?

Thanks

-- 
Vincent Legoll

