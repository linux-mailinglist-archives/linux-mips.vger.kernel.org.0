Return-Path: <linux-mips+bounces-6738-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C83BE9C6D81
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 12:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 257A0B26FED
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 11:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247D11FF618;
	Wed, 13 Nov 2024 11:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYopuWQz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F01FB728;
	Wed, 13 Nov 2024 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496391; cv=none; b=qr4WUEOu6DitnrhPC3VU2QGV4LRUAhCcj9xYLBOQofkx6+zK665033KSvkv8O4V7HCmZlS6MnQWRBZGDSSzU0ehPhSdDzQfYJJ0xo7tbyDmb1Zr5LgmF28+hSFDxhLHXd3eyyOV1JlLCzSe593C9kMuhckleBPiXO1kjbG9bHkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496391; c=relaxed/simple;
	bh=cZILNanLfCaDjqDKjC5An13SYmBYDLw8gaG3ryaYg6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BS7kjgx7FI8pRUUPK6WNhc7e5zOVR5Ke0RI4HgHN++uY043N67qevua3dDOuiLoBlxGxXVFZhYwxL1Cafg4HnyHX7KiocQXQsZ4AbPGAyRR9JjME/73X08U3E9oaebpAtLOVsm5l05LG0O34uPMVa25XibHgHVJu914ENhJL/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYopuWQz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1CBC4AF09;
	Wed, 13 Nov 2024 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731496390;
	bh=cZILNanLfCaDjqDKjC5An13SYmBYDLw8gaG3ryaYg6s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GYopuWQzAvZzN4vreyWiIJoMPYePZGscw/oEgYJIMv50m9ssM1BNVrBTEb7EPcmFo
	 1b3Wypu3G/uvHsfUrBaT5Nv87qGcp0p9Rpm/i26bZ91t+SHZEsILUXAie6KroSk5eQ
	 4Co+2goAf/R7DLqmSqh6a0qp6f1Zy5TRATZpT4trQg9W4CQd13de6gsf+md7Jeg2Z9
	 VZo/CJOg3NGkR7IiKekqsCF379uyXdpSYs//E8n8UutyO3qRbkMp9oq5PveSydQy+I
	 b8RahcMwNh/hXftWj8AXMDcDXLY1ZZOkZoO4ya/qx9Bi16x8a3jJu6gasQwPHrtRCE
	 MkFbAjNd/j4Pw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so6659211e87.3;
        Wed, 13 Nov 2024 03:13:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjkIT1qRuZ9637uqq+tBxLrkOfV/pmVgvBWdBiCmqXCplvTQu7WM8xNxVm7gkzvl0osAIPWs0u+fI3N5w=@vger.kernel.org, AJvYcCV6AH+0qFyXzbPRYxxlkPQn6J3h4s10GKi/fGcCTxRezHvdjZM7qWEnnb6NPw1weJwpX94l7OotYD2x6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHW3dEt04vWaNL2doaPaM/9EgHzOEDq76JMXUHBbpSVxqI9Uo3
	6Ft2NYMlLVqr3q9Jfyjy8/JNkC92kGMYHp2uRCmcKkOlCwLMTD5fkSXDu+LoJ0r4tL50jzmScjz
	AjXUM6VW/THuLVDg2RK3bEbrhXfo=
X-Google-Smtp-Source: AGHT+IGWAW9FyhFGJKNfamA2fHdBOtfFT+XIg5SBvS/zpL5Nksdb/xzHDBzLVIkqnGo0HUYEVan85AQLaeNZAr5KdWI=
X-Received: by 2002:a05:6512:ea8:b0:53d:a270:5b4e with SMTP id
 2adb3069b0e04-53da2705b83mr689079e87.9.1731496389438; Wed, 13 Nov 2024
 03:13:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113064028.2795128-1-xur@google.com>
In-Reply-To: <20241113064028.2795128-1-xur@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 13 Nov 2024 20:12:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQgKN2YuHpZ9Ts1oNgY4pMCrqmwZzjQaaUUAOdT8A0dbw@mail.gmail.com>
Message-ID: <CAK7LNAQgKN2YuHpZ9Ts1oNgY4pMCrqmwZzjQaaUUAOdT8A0dbw@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: move _stext definition to vmlinux.lds.S
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Klara Modin <klarasmodin@gmail.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

This patch is necessary to avoid regression in my kbuild tree.

Your Ack is appreciated.




On Wed, Nov 13, 2024 at 3:40=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> The _stext symbol is intended to reference the start of the text section.
> However, it currently relies on a fragile link order because the existing
> EXPORT(_stext) resides within the .text section, which is not guaranteed
> to be placed first.
>
> Move the _stext definition to the linker script to enforce an explicit
> ordering.
>
> Signed-off-by: Rong Xu <xur@google.com>
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Tested-by: Klara Modin <klarasmodin@gmail.com>
> ---
> V2 Changelog:
> Incorporated Masahiro Yamada's suggestions:
> 1. Refined the commit message
> 2. Removed unnecessary comments
> 3. Use a standardized way for _stext definition
> ---
>  arch/mips/kernel/head.S        | 2 --
>  arch/mips/kernel/vmlinux.lds.S | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> index b825ed4476c7..e90695b2b60e 100644
> --- a/arch/mips/kernel/head.S
> +++ b/arch/mips/kernel/head.S
> @@ -67,8 +67,6 @@
>         .fill   0x400
>  #endif
>
> -EXPORT(_stext)
> -
>  #ifdef CONFIG_BOOT_RAW
>         /*
>          * Give us a fighting chance of running if execution beings at th=
e
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.ld=
s.S
> index 9ff55cb80a64..d575f945d422 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -60,6 +60,7 @@ SECTIONS
>         . =3D LINKER_LOAD_ADDRESS;
>         /* read-only */
>         _text =3D .;      /* Text and read-only data */
> +       _stext =3D .;
>         .text : {
>                 TEXT_TEXT
>                 SCHED_TEXT
>
> base-commit: 06513ddaf77b8f49ef8540c92d92c9ef0ad49426
> --
> 2.47.0.338.g60cca15819-goog
>


--=20
Best Regards
Masahiro Yamada

