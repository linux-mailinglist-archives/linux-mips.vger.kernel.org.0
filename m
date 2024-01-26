Return-Path: <linux-mips+bounces-1179-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CC783DBCE
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jan 2024 15:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2343AB2716D
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jan 2024 14:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C79720309;
	Fri, 26 Jan 2024 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+dC337r"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B0A20308
	for <linux-mips@vger.kernel.org>; Fri, 26 Jan 2024 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279081; cv=none; b=iWP+JN2n0xBe8xKen7vY3ypNZTVM4S9k9Rrs+K7tN7uEZUFXYXBmL0FDG9FwoUJHGEO4PqFCP7Q9gImYNQGGFk5ggGu/ny33VcM8B1eFXjoekise8MrCTRZRrRXQqmnALC2wWMptx3WryhoKFYqDGiV46r9yJFcJuRG+dQ1SBT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279081; c=relaxed/simple;
	bh=DKTjfpYWrVvu0IXm3vpLvQrDRbxVIpG/D/y3NVKG1Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V5E0Jsl14g7R5fbv/7EYRaED8eKhNfYDRIv85s8xUIH+kEbgvOumxIY8j0HchRpq252tlF8IYlOXKG0wd48d4puXHR2Xy2aEf+YdRR+4R9hRf2k2J4Tv7wJBhRaIHzuGMWGbFbNwSlKmBDqWKD8MF3MRvCgSP/HHI2DN4IW4wR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+dC337r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2D7C433A6
	for <linux-mips@vger.kernel.org>; Fri, 26 Jan 2024 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706279081;
	bh=DKTjfpYWrVvu0IXm3vpLvQrDRbxVIpG/D/y3NVKG1Lg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d+dC337rc7gIx/L9IG2+Jtomn2mQy54iuwX+6a/pZJDxKwLTefLIV4ii+djvN4OBq
	 BWqWQGQQ9CWxdPUkLF4ZsD3vXWxbqKy3mgqGekpEgXgKw24KkYZ+3XyZ9zdA6P2NHW
	 UlXPshatSmayryVBPBJJ3sRY3PEVqD+9BLfqTTDDyy0uUGCBiMzt6WNpzVA/P6dsR0
	 cmC5DuXKF2lIgTa5YmWdyEhNZXdRmTB2IWJ1FI53JZ0Ze04eo47+3vvlVpnJD9AJmQ
	 iAnub0fd0Yg86FBFgEmMJVbiY1XTwW6BPODaw1rMxxNh3LbJrr+d4Np9tCAjNPY0BO
	 hJLpM0cKqpfxA==
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40ea5653f6bso7517295e9.3
        for <linux-mips@vger.kernel.org>; Fri, 26 Jan 2024 06:24:41 -0800 (PST)
X-Gm-Message-State: AOJu0YxzNHYFFmKKYHjpYiWw9fXmnFnw4iprb+JsbuuIcIgJF+VaBcDb
	cFYQJqcKC1jyoQB0vP3mKklfllFULwidAoc+1AC1b2ExjUyYkZtf/0LbLoSSnzS+VZfXc/vhFti
	L5e7T06x2F4n0BD8GezzokMdDoBI=
X-Google-Smtp-Source: AGHT+IHso7TfQRiHwJeukga+1FLOHtL6aB/A8aqTOGsbQJDeziiEhjw41oN+sIsXxGObwqFALwLiRFsPl6uj/9lTYD4=
X-Received: by 2002:a05:600c:1c1a:b0:40e:71e3:139d with SMTP id
 j26-20020a05600c1c1a00b0040e71e3139dmr948275wms.154.1706279079774; Fri, 26
 Jan 2024 06:24:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de> <20240123014758.12718-1-huangpei@loongson.cn>
 <20240123014758.12718-2-huangpei@loongson.cn> <ZbOFkEikUQbvg7OU@alpha.franken.de>
In-Reply-To: <ZbOFkEikUQbvg7OU@alpha.franken.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 26 Jan 2024 22:24:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H71SLi5LU_YmaPb2GdeGmsqy8FY7N5ZDxvPYrpVWazELg@mail.gmail.com>
Message-ID: <CAAhV-H71SLi5LU_YmaPb2GdeGmsqy8FY7N5ZDxvPYrpVWazELg@mail.gmail.com>
Subject: Re: [PATCH 2/2] MIPS: loongson64: set nid for reserved memblock region
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Huang Pei <huangpei@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Paul Burton <paulburton@kernel.org>, Li Xuefeng <lixuefeng@loongson.cn>, 
	Yang Tiezhu <yangtiezhu@loongson.cn>, Gao Juxin <gaojuxin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:30=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, Jan 23, 2024 at 09:47:58AM +0800, Huang Pei wrote:
> > Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()") reveals
> > that reserved memblock regions have no valid node id set, just set it
> > right since loongson64 firmware makes it clear in memory layout info.
> >
> > This works around booting failure on 3A1000+ since commit 61167ad5fecd
> > ("mm: pass nid to reserve_bootmem_region()") under
> > CONFIG_DEFERRED_STRUCT_PAGE_INIT.
> >
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >  arch/mips/loongson64/init.c | 2 ++
> >  arch/mips/loongson64/numa.c | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> > index f25caa6aa9d3..000ba91c0886 100644
> > --- a/arch/mips/loongson64/init.c
> > +++ b/arch/mips/loongson64/init.c
> > @@ -103,6 +103,8 @@ void __init szmem(unsigned int node)
> >       if (loongson_sysconf.vgabios_addr)
> >               memblock_reserve(virt_to_phys((void *)loongson_sysconf.vg=
abios_addr),
> >                               SZ_256K);
> > +     /* set nid for reserved memory */
> > +     memblock_set_node((u64)node << 44, (u64)(node+1) << 44, &memblock=
.reserved, node);
> >  }
> >
> >  #ifndef CONFIG_NUMA
> > diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> > index 8f61e93c0c5b..6345e096c532 100644
> > --- a/arch/mips/loongson64/numa.c
> > +++ b/arch/mips/loongson64/numa.c
> > @@ -132,6 +132,8 @@ static void __init node_mem_init(unsigned int node)
> >
> >               /* Reserve pfn range 0~node[0]->node_start_pfn */
> >               memblock_reserve(0, PAGE_SIZE * start_pfn);
> > +             /* set nid for reserved memory on node 0 */
> > +             memblock_set_node(0, (u64)1 << 44, &memblock.reserved, 1)=
;
> >       }
> >  }
> >
> > --
> > 2.30.2
>
> applied to mips-fixes.
Oh, I'm sorry that I found a very stupid error in this patch. The
comment says set memory on node 0 but the code set it on node 1...

Huacai

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]
>

