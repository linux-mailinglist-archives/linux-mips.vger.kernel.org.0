Return-Path: <linux-mips+bounces-12637-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D57CE5AD1
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 02:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4F9D300954B
	for <lists+linux-mips@lfdr.de>; Mon, 29 Dec 2025 01:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6362221E082;
	Mon, 29 Dec 2025 01:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZuXxQnT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B25722128B
	for <linux-mips@vger.kernel.org>; Mon, 29 Dec 2025 01:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766971557; cv=none; b=jucbI0T+VrqDJzYUpcEoN/GycHoFNdo9hyOrRHATJ3cb6uMwEVhrmvhKo1o7Dg288emhYugcVAfwac+4DDLfUBf4CgJOzZT5dZrt+z9rkxIo5Djp/T6MxNbjs7nqmniz+GQmwFHAs+9aJk5He2COvU6hiZpRB/noIy5FoHPpzNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766971557; c=relaxed/simple;
	bh=QcHUIuYE7RQs56jGjmqpy2oUOjx983YRYnPBuaD4boU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvwFvRm6sU8ABb4hVriDwxfFoKVz2PTkKVpSADDbh68JM/E9yU0vfmtGnsyibTfcFnZUntFMDO2mw4utXrsefThf/xgARVsdu0h/2Whdiqi4pJBeDJi+3QI1durHs1+oK9k07jMkdYDCJMaHz9SYvFflAUXf/0zuCEdr5wvI1Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZuXxQnT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23047C19423
	for <linux-mips@vger.kernel.org>; Mon, 29 Dec 2025 01:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766971557;
	bh=QcHUIuYE7RQs56jGjmqpy2oUOjx983YRYnPBuaD4boU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KZuXxQnTWZjo6Lof5URsYlUjW0kwpYMb41Lqh7FwvUUm9w1vnlBjwPxtNvEcQ4tet
	 xmbWdsyOlecjZiWdQ3OFYCXytV323wGrcpIwVCzMSP0WxMEv4p/59MZY+eJkJWKz/9
	 rHd0dU5C4eZqkItfe0w2njo8Ppk0fIVPjJIAtf9k9mvQgTl6eAaFB3RhXp4Ouin/m2
	 8Xo6lYrybspCjJYNWuiBoY18l0zZprRiO3vj4+HjBHpxL7iGOgtyhyQVt1xe5ngKuk
	 BeergKRsgklh8YNSbG3a/Qk9qDKSXVlKWvaYLTpqByfmGWpzi+yyXyI2KK5D3PZ9XS
	 AAjY/KtRm5xHg==
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbc305552so6952050f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 28 Dec 2025 17:25:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWezcvaxJOqx2cWna/HHnz5lR1hi6wtXLGSI3lswXoF+5DEHvtXYQgfxbu0rqxydxe568TOBeJQeLtf@vger.kernel.org
X-Gm-Message-State: AOJu0YxjBdzvKIRdh/S2rkJfXbIsbQsYRGF+Od8d4j2OLRZ3yt86Abkp
	nx0KRte6GkrWkHtjquJsMs/lZRTha2TokZFUaFXDRmsCOOW4CXlTdOGbAamKtI+EVYMCH28fhMe
	l5nPRLib4prYcHNJoRV3MJ3MYpzeptME=
X-Google-Smtp-Source: AGHT+IH0/4lM/7b5Nef4Fb6rn6mJpOxGdWgk9AqK9LZQSl+6Va320QICtWgPPv8KCBU6m5HaJgurTChUGp2fBhZ8S4E=
X-Received: by 2002:a05:6000:2308:b0:430:ff0c:35f9 with SMTP id
 ffacd0b85a97d-4324e50d989mr31524498f8f.48.1766971554637; Sun, 28 Dec 2025
 17:25:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251228124001.3624742-1-rppt@kernel.org> <20251228124001.3624742-6-rppt@kernel.org>
In-Reply-To: <20251228124001.3624742-6-rppt@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 29 Dec 2025 09:25:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSMLhnqQeZB=oEwLGzXfJwxPh+vJvTuz-OFGrwJi5uPSA@mail.gmail.com>
X-Gm-Features: AQt7F2ovPXIqQiKDAgz2Iigjc3UdRKj7ty_Tsln8fN_MKzmJJ5LWRy6ejtLdRVA
Message-ID: <CAJF2gTSMLhnqQeZB=oEwLGzXfJwxPh+vJvTuz-OFGrwJi5uPSA@mail.gmail.com>
Subject: Re: [PATCH 05/28] csky: introduce arch_zone_limits_init()
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Michal Simek <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 8:41=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
>
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/csky/kernel/setup.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
> index e0d6ca86ea8c..8968815d93e6 100644
> --- a/arch/csky/kernel/setup.c
> +++ b/arch/csky/kernel/setup.c
> @@ -51,6 +51,14 @@ static void __init setup_initrd(void)
>  }
>  #endif
>
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> +{
> +       max_zone_pfns[ZONE_NORMAL] =3D max_low_pfn;
> +#ifdef CONFIG_HIGHMEM
> +       max_zone_pfns[ZONE_HIGHMEM] =3D max_pfn;
> +#endif
> +}
> +
LGTM!

Acked-by: Guo Ren <guoren@kernel.org>

>  static void __init csky_memblock_init(void)
>  {
>         unsigned long lowmem_size =3D PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET=
_OFFSET);
> @@ -83,12 +91,9 @@ static void __init csky_memblock_init(void)
>         setup_initrd();
>  #endif
>
> -       max_zone_pfn[ZONE_NORMAL] =3D max_low_pfn;
> -
>         mmu_init(min_low_pfn, max_low_pfn);
>
>  #ifdef CONFIG_HIGHMEM
> -       max_zone_pfn[ZONE_HIGHMEM] =3D max_pfn;
>
>         highstart_pfn =3D max_low_pfn;
>         highend_pfn   =3D max_pfn;
> @@ -97,6 +102,7 @@ static void __init csky_memblock_init(void)
>
>         dma_contiguous_reserve(0);
>
> +       arch_zone_limits_init(max_zone_pfn);
>         free_area_init(max_zone_pfn);
>  }
>
> --
> 2.51.0
>


--=20
Best Regards
 Guo Ren

