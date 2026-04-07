Return-Path: <linux-mips+bounces-14085-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCcvO5n/1GnOzQcAu9opvQ
	(envelope-from <linux-mips+bounces-14085-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Apr 2026 14:59:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4B93AEC02
	for <lists+linux-mips@lfdr.de>; Tue, 07 Apr 2026 14:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFF433005583
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2026 12:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6BB3B634E;
	Tue,  7 Apr 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osDYjs9R"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7DA3B2FE1
	for <linux-mips@vger.kernel.org>; Tue,  7 Apr 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566742; cv=none; b=J6xcGFaRNxfO6AVbloq7wz5H8Hd5aRCWvKbr65GDbgd+Y/hlGDfwF+nmldN0oAyRdrwl7gygu4/oJPG5Fhgs9ok2YarwP07tbfA+KcX+asCet7usPVEhI3GomOxXvTHlNiMtO1aCSplBRD71+b2RfNa+Jnr/3VZXfgXuEDWOfgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566742; c=relaxed/simple;
	bh=HX9ND+BGPYb0eaJfUip3SH/E9M4DJQIUBZfcue/+9cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PpXI6KKuLmyGALlge5yavm8qsp9aWmq9nbAjeu+q876EmLNKUzLLXk+ySV4Gn+5CXll3uwzJGEKA0b2tpyDzZOlFz+CPUFnDH+C2kL2s/b6fVK3dH6iQ7CcJSmqDj66e30WKo+uSZkVu+GdimosqsnNNmPclMpoFF4EcdMXsyIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osDYjs9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A355C116C6
	for <linux-mips@vger.kernel.org>; Tue,  7 Apr 2026 12:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775566742;
	bh=HX9ND+BGPYb0eaJfUip3SH/E9M4DJQIUBZfcue/+9cc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=osDYjs9RM67qMKJ2wW8pEaTCpaBWbW3cjD+vmgGXMP0NLbPsiZBRk8uLwsZzXg+2K
	 s7+6/K9GgJ5XN5ugeSsH/XAqHN1fscfOXY7HaoEpr06bd+BWwXkzvy/V2h4Gls/N88
	 jJFZGRQ3sv6qgKZMx0xKvUzfAPZD9gHZoTbL6liXGCv+LyAJh+KfEn3OghwLqKtiIU
	 EaAQUjoI11usT/GCZRkXsgeCVSwKpyldjwU1yO08LGHTv0EsxHGcoWDgDeysS4C7Tw
	 olLaqBrZzBG+pXIB8ngaL2b6Yj3D6UIHm9nxIIsMRurv+fQig0krdjLqaTNlpXyjnS
	 EzdJHYjxlLeEA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9c11eba219so578735666b.2
        for <linux-mips@vger.kernel.org>; Tue, 07 Apr 2026 05:59:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYLQ6wptuOCen8GYR8uvHdXbEuZ2NVNe+a58PrJm4NWnvjiAWfDoDdDw5mOH2NoLsZ6cFWm1mTCw3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWGMmnv3hWva+tcufuoR0HDQMuzwV4zwmJbv4/yS7Jffhq0eW
	30w+OJqn62BTnXyp0HC11Gkfn+HuqdkYf6hC47146AHcqdX3efcAgZOIB76BpibGeViIDJkETvu
	OdC5IIy4kUh8j17fjaqAH/84q/Qz4D7Y=
X-Received: by 2002:a17:907:c19:b0:b98:6c41:a798 with SMTP id
 a640c23a62f3a-b9c6743b213mr826867966b.20.1775566740609; Tue, 07 Apr 2026
 05:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328225738.51613-2-xtex@envs.net>
In-Reply-To: <20260328225738.51613-2-xtex@envs.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 7 Apr 2026 20:59:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7O4LZFchu1mif+qbV-XEhoDS3p=V9mJBhkSyE9EkmFsw@mail.gmail.com>
X-Gm-Features: AQROBzCbN1VTCjFeKk_pzuAemhQKahaalnCYcFxwERFCpQ7ZepBLKaNM5kcNLkM
Message-ID: <CAAhV-H7O4LZFchu1mif+qbV-XEhoDS3p=V9mJBhkSyE9EkmFsw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Increase default mmap randomization bits for 64-bit
To: Bingwu Zhang <xtex@envs.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Kees Cook <kees@kernel.org>, 
	Matt Redfearn <matt.redfearn@mips.com>, Yao Zi <me@ziyao.cc>, Icenowy Zheng <uwu@icenowy.me>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bingwu Zhang <xtex@astrafall.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14085-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,envs.net:email]
X-Rspamd-Queue-Id: 8E4B93AEC02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Bingwu,

On Sun, Mar 29, 2026 at 6:57=E2=80=AFAM Bingwu Zhang <xtex@envs.net> wrote:
>
> From: Bingwu Zhang <xtex@astrafall.org>
>
> Increase mmap randomization bits on 64-bit from [12,18] to [18,20] for
> better strength.
>
> The original default, 12, means that ASLR offset has only (1 << 12) =3D
> 4096 possibilities. On average, it can be brute-forced in 2048 attempts.
> If a service is configured to restart automatically or can be started
> easily (e.g. execve a suid program), then trying for 4k times can be
> done in one day even when each attempt takes 20s.
> Increasing it to 18 makes brute-force much more difficult and leaves
> more time for operators to find out attacks.
I suggest to keep ARCH_MMAP_RND_BITS_MIN and only increase
ARCH_MMAP_RND_BITS_MAX. Because performance is important by default
and you can change mmap_rnd_bits at runtime for security.


Huacai

>
> On 64-bit platforms, virtual address space is cheap, so the
> randomization bits can be increased safely without disturbing userland.
>
> In 1091458d09e1 ("MIPS: Randomize mmap if randomize_va_space is set")
> where mmap randomization was first introduced to MIPS, the randomization
> range was 256 MiB, equivalent to 16 randomization bits (if 4K page size).
> In 109c32ffd89d ("MIPS: Add support for ARCH_MMAP_RND_{COMPAT_}BITS")
> where MIPS begin to use ARCH_MMAP_RND_BITS, commit message claimed:
> > The minimum(default) for 64bit is 12bits, again with 4k
> > pagesize this is the same as the current 256MB.
> which is incorrect. (1 << 12) * page_size is 256 MiB only when page size
> is 64 KiB, so the strength of mmap randomization was reduced by 4b.
>
> Fixes: 109c32ffd89d ("MIPS: Add support for ARCH_MMAP_RND_{COMPAT_}BITS")
> Signed-off-by: Bingwu Zhang <xtex@astrafall.org>
> ---
>  arch/mips/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index e48b62b4dc48..c630dab44419 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3063,11 +3063,11 @@ config MMU
>         default y
>
>  config ARCH_MMAP_RND_BITS_MIN
> -       default 12 if 64BIT
> -       default 8
> -
> -config ARCH_MMAP_RND_BITS_MAX
>         default 18 if 64BIT
> +       default 8
> +
> +config ARCH_MMAP_RND_BITS_MAX
> +       default 20 if 64BIT
>         default 15
>
>  config ARCH_MMAP_RND_COMPAT_BITS_MIN
>
> base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> --
> 2.52.0
>
>

