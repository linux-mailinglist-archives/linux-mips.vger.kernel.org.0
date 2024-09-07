Return-Path: <linux-mips+bounces-5390-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1139700E9
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 10:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 547111C21A4F
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 08:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749A91487D1;
	Sat,  7 Sep 2024 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnlLb71x"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF7E134BD;
	Sat,  7 Sep 2024 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725698001; cv=none; b=t6JeNEWNn588sch5m3ADLPJNR/8FYgVEvyLI2nKLYAfpEeCvCuuWDBXtBSE481NyKVKh0/eZrLGE7P30PntT1DxVmnl5+m41ZDjeKs0HzIyxgLl7rPf7uEzyMqkzX2yFTNUOAofnqyTmT+n/YjzUZNrmCP8BY4IYFNtFK7oj+JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725698001; c=relaxed/simple;
	bh=u+uX1McwKP5BK8XQmU+PXHl98+FoSw3Bcucds2dN+dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxRf4eFXT2Xery0SzmavANNRfortkwsu75ZFT3p/S6ICOwtQxLi6IRkaCk+MCMkDn605X4qbHxfVTUlmABU1govAXr4fDrebGz7s/gbzjMAEQYBORtxet9O5P4z6fstv7weUXYMegEPsRlQxcIZ693ZeQE9OLQgsf9J3N/oa31A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnlLb71x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2336C4AF09;
	Sat,  7 Sep 2024 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725698001;
	bh=u+uX1McwKP5BK8XQmU+PXHl98+FoSw3Bcucds2dN+dQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cnlLb71xCoe+LwDSKHLu+SAFDTXAZTH/hmvRuLNA50FuPFpQKiyYhfaxxqqqNhONf
	 /538MrEoA/xrfbDEPNIvFWKTCYrLMmrMi5VrLdjlUVlsQNkj0R8hATfkFiwMXfTJ1+
	 lOI62A81KIJ8WIJvBwf8NyGKhkR+Qhgh9EICXinHmefcNYp+rf1iR3U0E3EYHSG4+Z
	 sVaKDLE7o+zVIqp88HIQcLN0fT+8lw61EnzcGOTu87EjcEKttssbC286D0VRc4Kvzc
	 3E6gAYYOdAhCCUsi8pbwD5mA8w75lFyUPAEL7cse7H+LyPmkmFJLAu64JXCPbLTP6H
	 e+mGjam/r8JWQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c3d8d3ebbdso3666868a12.0;
        Sat, 07 Sep 2024 01:33:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUy+2CkdXqhQrmiM3WoAV5n1nutGPFozQEZppt7OvvzCX1QCIBuBcI5yaOeXyaxd4CImXfHMBYmCZNG6Q==@vger.kernel.org, AJvYcCXXQBc15gxpdk/0tkmapV9UcpQg1celUp8ilRY4VzkpK37JkBLIMgNL4osznqoYZTvfLFdWLVUpp08YOK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTfEZubHe1YdfeJz3/+DqKOC/sqgzA+TRHyiaIrlIAVt3ByXpi
	yyCVak/459ib4yjdIt/F0JGfIkAWYLX6sBeAIwJfyGaaqHZsCDkFhjMfaSg2UrXOU1DsARm/mUV
	dwANTT6edTcd/17yvMfUoqmS2ECY=
X-Google-Smtp-Source: AGHT+IFsZizcv4SWg/uc4wlWEYG5dAogoRVM+IMfx6S10F6ncEDAhujg1s1ypzSz68Wq2OEYPS2U6E3IM7nuU3g2JxE=
X-Received: by 2002:a05:6402:5208:b0:5c2:2b1f:f75a with SMTP id
 4fb4d7f45d1cf-5c3c1f87bf5mr14240990a12.11.1725697999525; Sat, 07 Sep 2024
 01:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240907082720.452148-1-maobibo@loongson.cn>
In-Reply-To: <20240907082720.452148-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 7 Sep 2024 16:33:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4miZqRDWw5SkfdJJRxuV_4obnqLWHc6zdgGC09xE5rRw@mail.gmail.com>
Message-ID: <CAAhV-H4miZqRDWw5SkfdJJRxuV_4obnqLWHc6zdgGC09xE5rRw@mail.gmail.com>
Subject: Re: [PATCH] smp: Mark smp_prepare_boot_cpu() __init
To: Bibo Mao <maobibo@loongson.cn>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Gleixner <tglx@linutronix.de>, Naveen N Rao <naveen@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Sat, Sep 7, 2024 at 4:27=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
> Function smp_prepare_boot_cpu() is only called at boot stage, here
> mark it as __init.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kernel/smp.c | 2 +-
>  arch/mips/kernel/smp.c      | 2 +-
>  arch/powerpc/kernel/smp.c   | 2 +-
>  include/linux/smp.h         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index ca405ab86aae..be2655c4c414 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -476,7 +476,7 @@ core_initcall(ipi_pm_init);
>  #endif
>
>  /* Preload SMP state for boot cpu */
> -void smp_prepare_boot_cpu(void)
> +void __init smp_prepare_boot_cpu(void)
>  {
>         unsigned int cpu, node, rr_node;
>
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 0362fc5df7b0..39e193cad2b9 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -439,7 +439,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  }
>
>  /* preload SMP state for boot cpu */
> -void smp_prepare_boot_cpu(void)
> +void __init smp_prepare_boot_cpu(void)
>  {
>         if (mp_ops->prepare_boot_cpu)
>                 mp_ops->prepare_boot_cpu();
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 46e6d2cd7a2d..4ab9b8cee77a 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1166,7 +1166,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>         cpu_smt_set_num_threads(num_threads, threads_per_core);
>  }
>
> -void smp_prepare_boot_cpu(void)
> +void __init smp_prepare_boot_cpu(void)
>  {
>         BUG_ON(smp_processor_id() !=3D boot_cpuid);
>  #ifdef CONFIG_PPC64
> diff --git a/include/linux/smp.h b/include/linux/smp.h
> index fcd61dfe2af3..6a0813c905d0 100644
> --- a/include/linux/smp.h
> +++ b/include/linux/smp.h
> @@ -109,7 +109,7 @@ static inline void on_each_cpu_cond(smp_cond_func_t c=
ond_func,
>   * Architecture specific boot CPU setup.  Defined as empty weak function=
 in
>   * init/main.c. Architectures can override it.
>   */
> -void smp_prepare_boot_cpu(void);
> +void __init smp_prepare_boot_cpu(void);
>
>  #ifdef CONFIG_SMP
>
>
> base-commit: b31c4492884252a8360f312a0ac2049349ddf603
> --
> 2.39.3
>

