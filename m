Return-Path: <linux-mips+bounces-12648-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BF2CE8918
	for <lists+linux-mips@lfdr.de>; Tue, 30 Dec 2025 03:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 138293016708
	for <lists+linux-mips@lfdr.de>; Tue, 30 Dec 2025 02:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E3B2DF6F8;
	Tue, 30 Dec 2025 02:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTueJwvK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F951DF25F
	for <linux-mips@vger.kernel.org>; Tue, 30 Dec 2025 02:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767062061; cv=none; b=TbMvJxOjofAeuEMFWKCVd6TzzNYuAaYUXDM+RtLWKbbpK39/BDoKKiP0AXWHWA6/XjOK1cpomDBkswWpvDC/UTA5gCxuOXj1gTqyz5OgqV/2wZaSaodqU3QaI3izF5Gi18BWFRVRnl6rD7k8/sJDFHVW+uIWOsraMUY3q+f7odk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767062061; c=relaxed/simple;
	bh=tbiVlc2zxd/Hd/8ZMCla20UsigPsy1AsKHU8fIaytkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCjGHUENJJs7NAvgBp2wt2NgynhRM6MNUFXBh/hgInp1g2B2Hc0Y8LenQI0N1v0Qo8qVOJSB0l36WMMQsl2PMjZxKNb5qOTmbzDwHgck+F3dMaBdlqwzd86J+1psar9SYHIaiCsKt8/ET1QrGoZ0/xGiscF+wX2kTCBsU3/LvR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTueJwvK; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37b99da107cso89313211fa.1
        for <linux-mips@vger.kernel.org>; Mon, 29 Dec 2025 18:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767062056; x=1767666856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvnAKeKTX/FwUaSsy4+elj2P3M21g4QJ79qJjAoq/J4=;
        b=MTueJwvKGnTC3g9o5kke30JJ4hAzScMtXa297rpgxjxkrFUOKtIEcDY0s8Ru8wM5io
         7jhANRc3nOeUbbzzVDwtyJ+q1QFGQC79WD0GNo3b5t4KKluzaGz5+JKXzrUq8YoENZxh
         GvFFHrulgJOzfDzrrzf6ITWhQ2XchasJZT5Yd2WaNb8qg2aaZJyXJKDofLgOesn5F5iY
         3WbsH+pewxEag1u/PlTHACyOEyI5KaAGxsLd5M7KXY59v/LRJ+EHVowmhFS87m2/v2+1
         mMkXPbOtC2NGZqQV8AvJGlwAel+UUXozHSOnQsQ17l0h+OB2Uhi9a7N9pQV2SS6PmSYz
         mBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767062056; x=1767666856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CvnAKeKTX/FwUaSsy4+elj2P3M21g4QJ79qJjAoq/J4=;
        b=eytQQ26nOusomjO7cQoKCpGvVBcPjg6nqIC9Hd6BCeAt5EnFjeGiJOFxzo+TiMnWQd
         v3H0XkBVuFTfQxkxpaNSb4UbieBdYgs0PT/IEXm0+zE6kZYkl0/O0aMY+D/TyAiI9yu7
         2FerUvq66iVgQhfu02xYEeXR7AnEQEGESjkah0If6xrD7sLJisjAxYPQ9uqTgKqITimr
         vZyXr3WyDg9Lr0p5gMBr+S0aK51Ozju3Vzy9zkZNvmBWuoMNOMIlKMC6Gi0uuhw4KcmX
         DI66fYpSJrrRByICFVuV5Qz6vptHYaqumuB8ksOluVB7sHuaSDXFTBmHWTrDs8CDyA6C
         bPVg==
X-Forwarded-Encrypted: i=1; AJvYcCUBk1FgdTbl/Tz6UyIhnBNSEPqhDH6EVnpzF2VBwsWzzH3Ff238/eoqcZllIhAzfjVoyv7LDz4dfVmC@vger.kernel.org
X-Gm-Message-State: AOJu0YyTd54WOtRksvb1rIkrAe80muUx4J/dnprUlDdCN+31xvqpb/K1
	P0Wq4jNNoqFdkks2TUTJAYXes1mc1DhWSlUdnz7OGKKndBC6y3BQaZupq51HwmTUlxLOwJcCeIM
	GpsxcHRVC+LY7M2RRRYiKH6S0GcKmZjM=
X-Gm-Gg: AY/fxX6z+HC+2Q4mTEzAtoBS4E+77G8IBybi8KuYRUbL+6hml/JvY/FDEsnW6+sv6ji
	KqNL2c85qBvwkF458ZaLK4zGctI/4XTwlfmYb3X2Kr4hJ+Zzark2c+NRwOBRo+CXVlyqUorGJvq
	pliUILn34OHPSm7Kr67bNzIP9PgNedmkZ9DESDhZ5wI9UTv0x0F+5B565FYToym8ma9kU8pszsc
	0e8gBZwIc9n/s2FE6sWnoHRXURiLMyFUu3iVzFJnMpAILlYsyzyVrUOYZB7tsoCHwJqBuyt0BEJ
	Qq3T4bw=
X-Google-Smtp-Source: AGHT+IEpsDXVuqegKL3+G4FTK5QRmSxY5X7mP/337bKOdbRE09z75UXGjJNcMLWBkYiDZO9O1+E8slXftGg7KXITZsg=
X-Received: by 2002:a05:651c:1507:b0:37f:aad0:4082 with SMTP id
 38308e7fff4ca-38121318ac9mr91444541fa.0.1767062055878; Mon, 29 Dec 2025
 18:34:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251228190443.2479978-1-rdunlap@infradead.org>
In-Reply-To: <20251228190443.2479978-1-rdunlap@infradead.org>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 30 Dec 2025 10:33:39 +0800
X-Gm-Features: AQt7F2rOPVeDuxEWB5ZZX2mU4JycqsYdzxVB8roRKPRdRvGu6jMgoSRb_vLTOAE
Message-ID: <CAJhJPsX0azc=P+YXCrc4zT5MDz-rhA3NvJhz3xYeCpnaA=_TqQ@mail.gmail.com>
Subject: Re: [PATCH] mips: LOONGSON32: drop a dangling Kconfig symbol
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It appears that CPU_HAS_LOAD_STORE_LR has been outdated since about 2020.

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>


On Mon, Dec 29, 2025 at 3:04=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> CPU_GAS_LOAD_STORE_LR is not used anywhere in the kernel sources,
> so drop it.
>
> Fixes: 85c4354076ca ("MIPS: loongson32: Switch to generic core")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
>
>  arch/mips/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
>
> --- linux-next-20251219.orig/arch/mips/Kconfig
> +++ linux-next-20251219/arch/mips/Kconfig
> @@ -1408,7 +1408,6 @@ config CPU_LOONGSON32
>         select CPU_MIPS32
>         select CPU_MIPSR2
>         select CPU_HAS_PREFETCH
> -       select CPU_HAS_LOAD_STORE_LR
>         select CPU_SUPPORTS_32BIT_KERNEL
>         select CPU_SUPPORTS_HIGHMEM
>         select CPU_SUPPORTS_CPUFREQ



--
Best regards,

Keguang Zhang

