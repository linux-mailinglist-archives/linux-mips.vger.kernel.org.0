Return-Path: <linux-mips+bounces-8944-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F311BAAC475
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 14:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 580A750115B
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 12:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEE627F198;
	Tue,  6 May 2025 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2ZdmGIN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0549B27CCF8;
	Tue,  6 May 2025 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535483; cv=none; b=ZHYDOiWhu2zKwp7AORBYMWXXi3kXO0CY2Jha63gdYx02+WlVaK9zjQVb7uRcqR6fEsn8QFwwpyPs05E4324s8zyBGQKEiyNrKuF+bxMwLvDJAzK4h/zfyzc43/DpJ7u5yYAOUalPXWADEjx/HMzAXk6aPUplKmYfDpyQ4vac0cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535483; c=relaxed/simple;
	bh=H0SEZ9WB4xhV5TbaYSyDZUJy1aWHvlTBHxG17B0bm24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IoS+AP6z8TFpxcp9QUXHQzneWOE5X+yrn2RvyXG403hdbxpN/bQaoqF+2zMfL78dfbJ5Ft8jBcEYT8+R7B01jQrs0NoRTRfw+SkJYGGvgYDnZL89P7QOX8wYOnwvaLTPS/K3H/9P+H/Cljl+R3swKMBta/BDo/2FhBBtw6wo0QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2ZdmGIN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEABC4CEEE;
	Tue,  6 May 2025 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746535482;
	bh=H0SEZ9WB4xhV5TbaYSyDZUJy1aWHvlTBHxG17B0bm24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F2ZdmGINuBbqeQLAAqY9yUdzvQDbeoDN0y9PvivK2zzCrLF3f/ceDUWxXAFA5xREF
	 2TCtfRlMHUF1E49eAkdPCUyIIq5QLHAEt/xt5WdNQgOHxL+q2j31dPi/xgR5lPmoTg
	 PYEKxu+jAab8hmQxawiOHmT1uiBFCHzDgvW4YCM6o/TfYYVtHaPdexaqJLqeOpm2Aa
	 nnxa7P6gh2b617WsdSTuUe/mAbLCRU1/fCeIaKGoA/Eyx2Yu/8oGUvwi8MBk8DUDHq
	 Ppk2MBLgZzEYCDVqrQyHTuPR7m3V0V1/owouuH5lPEcvlZPQI7ozE9Y19HRj2KUVLV
	 4+Azm2cTrlK6g==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso295662166b.0;
        Tue, 06 May 2025 05:44:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/FWsA2zZBW4FrgYkc1jGPQ4iKZLxtFs3Y6E+Evl6VQhSR9Rxfn4HokXGNVJh1rLBg9J2HU64ruttHpw==@vger.kernel.org, AJvYcCVKk/gnWBPCq4IY43DGQpl+//cTCzgfMMwy1T10LBrDcnFv6TFqGClFFR2goSIlz+CwXEYg1AWCIOzFKp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysap71WrirqJOq6HrGKQevpZd+H4Kuse4jAum16plp9miYTdKx
	vEAOr/cONMC6NlpBHef2ZBKJ93JAg1nJfiXCtPOWRA5tr39oI2cvos8KahoYW+NSexmX9FjZtH0
	nh+Vsydn5JfA5ppvTH6xLQn8ah3g=
X-Google-Smtp-Source: AGHT+IHklnCEM4zX9tVK7mJ0Jvq+N2fRluy5DDj+GJ+d5MiG2zXt6dYl66zo2iJ7gQGKoyqG89rZOONITlAPvHbrFTA=
X-Received: by 2002:a17:907:2cc2:b0:ace:68a5:ec50 with SMTP id
 a640c23a62f3a-ad1a4aa5e10mr989834066b.45.1746535480991; Tue, 06 May 2025
 05:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-hotplug-paralell-fix-v1-1-86f222cb6d90@bootlin.com>
In-Reply-To: <20250505-hotplug-paralell-fix-v1-1-86f222cb6d90@bootlin.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 6 May 2025 20:44:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H54bTCatqbabhOuvr6O-oOBa-Z4TGyvoT7uGnTjR6OfDw@mail.gmail.com>
X-Gm-Features: ATxdqUFDBcBt3yREYIx3fOjEduzeOSnNAhurv-1usrE9TF8EDe3_4gEDWdJmAWM
Message-ID: <CAAhV-H54bTCatqbabhOuvr6O-oOBa-Z4TGyvoT7uGnTjR6OfDw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: SMP: Move the AP sync point before the non-parallel
 aware functions
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Gregory,

On Mon, May 5, 2025 at 8:58=E2=80=AFPM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> When CONFIG_HOTPLUG_PARALLEL is enabled, the code executing before
> cpuhp_ap_sync_alive() is executed in parallel, while after it is
> serialized. The functions set_cpu_sibling_map() and set_cpu_core_map()
> were not designed to be executed in parallel, so by moving the
> cpuhp_ap_sync_alive() before cpuhp_ap_sync_alive(), we then ensure
> they will be called serialized.
set_cpu_sibling_map() and set_cpu_core_map() are the most obvious
functions that need serialization, but you'd better check other places
to make sure there are no similar functions executed in parallel.

Huacai

>
> The measurement done on EyeQ5 did not show any relevant boot time
> increase after applying this patch.
>
> Reported-by: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Hello,
>
> As discussed last week [1], this is the patch that fixes the potential
> issue with the functions set_cpu_sibling_map() and set_cpu_core_map().
>
> Gregory
>
> [1]: https://lore.kernel.org/all/aBVBHFGH2kICjnT3@alpha.franken.de/
> ---
>  arch/mips/kernel/smp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 1726744f2b2ec10a44420a7b9b9cd04f06c4d2f6..7901b59d8f60eddefc020cf2a=
137716af963f09e 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -374,13 +374,13 @@ asmlinkage void start_secondary(void)
>         calibrate_delay();
>         cpu_data[cpu].udelay_val =3D loops_per_jiffy;
>
> +#ifdef CONFIG_HOTPLUG_PARALLEL
> +       cpuhp_ap_sync_alive();
> +#endif
>         set_cpu_sibling_map(cpu);
>         set_cpu_core_map(cpu);
>
>         cpumask_set_cpu(cpu, &cpu_coherent_mask);
> -#ifdef CONFIG_HOTPLUG_PARALLEL
> -       cpuhp_ap_sync_alive();
> -#endif
>         notify_cpu_starting(cpu);
>
>  #ifndef CONFIG_HOTPLUG_PARALLEL
>
> ---
> base-commit: 3b3704261e851e25983860e4c352f1f73786f4ab
> change-id: 20250505-hotplug-paralell-fix-25224cd229c6
>
> Best regards,
> --
> Gr=C3=A9gory CLEMENT, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

