Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C05C22D825
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 16:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgGYOdB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 10:33:01 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:59704 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgGYOdB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Jul 2020 10:33:01 -0400
Date:   Sat, 25 Jul 2020 14:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1595687576; bh=K+ObGPhBCBIghSTkK89aQbGjHSVPXNygWfDYBW9wc3U=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=fEtcjr24TN6HnqL9MWmytl8OgmXju88Ram2SLx3dG9JyTW1xa4T+RUIP56zbqV7w7
         UlmQ9H0f1rtmpddU/+2m3BVa6LAUelDJOmnboEbbjXNtpEPsjsWZZK7z7JEo9MsBbv
         +zn9QILdl0A8Bj87MV4aonM0gUFNCdNK4JG6Qg1HP38UkXvh04cP/FZrX11cMMTzaS
         Ua/eG5sn7reh9TK9SFMJJjUQsqGMqducb/t5r5E0v7cKx/R6z2MDxnIl6b2G511q7X
         KZikAoFPcbNVwvr/BcV7YCU8qaXkfO+BWYWvwAdG+uElR5jj4W4yvN1dWllerBuPd7
         AZJl2UukfrkRg==
To:     Romain Naour <romain.naour@gmail.com>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH] mips: Do not include hi and lo in clobber list for R6
Message-ID: <1ASmWH5c3covyVGVn1zArosoLlRC98vkQ6Ww4wFSchBjH8_jrScPAdXVD08qeStKkFOA-SGqKIPZ80zib9FmHiIkRvJ4uiWaPKvorjdodDs=@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Romain,

From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Jul 2020 15:25:33 +0200

> From [1]
> "GCC 10 (PR 91233) won't silently allow registers that are not architectu=
rally
> available to be present in the clobber list anymore, resulting in build f=
ailure
> for mips*r6 targets in form of:
> ...
> .../sysdep.h:146:2: error: the register =E2=80=98lo=E2=80=99 cannot be cl=
obbered in =E2=80=98asm=E2=80=99 for the current target
>   146 |  __asm__ volatile (      \
>       |  ^~~~~~~
>=20
> This is because base R6 ISA doesn't define hi and lo registers w/o DSP ex=
tension.
> This patch provides the alternative clobber list for r6 targets that won'=
t include
> those registers."
>=20
> Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail t=
o build
> for mips r6 cpus with gcc 10 for the same reason as glibc.
>=20
> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D020b2a97bb15=
f807c0482f0faee2184ed05bcad8
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/?id=3D24640f233b466051ad3a5d2786d2951e43026c9d
>=20
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  arch/mips/include/asm/vdso/gettimeofday.h | 45 +++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>=20
> diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/includ=
e/asm/vdso/gettimeofday.h
> index c63ddcaea54c..6192d94928b9 100644
> --- a/arch/mips/include/asm/vdso/gettimeofday.h
> +++ b/arch/mips/include/asm/vdso/gettimeofday.h
> @@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
>  =09register long nr asm("v0") =3D __NR_gettimeofday;
>  =09register long error asm("a3");
> =20
> +#if __mips_isa_rev >=3D 6

You should use MIPS_ISA_REV macro from arch/mips/include/asm/isa-rev.h
instead of compiler definitions.
The main reason is that __mips_isa_rev is not defined by GCC for
pre-MIPS32 processors, so you'll get a compiler warning like:

"Warning: macro '__mips_isa_rev' is not defined, evaluates to 0"

MIPS_ISA_REV handles this case and is always defined regardless of
the actual ISA family.

> +=09asm volatile(
> +=09"       syscall\n"
> +=09: "=3Dr" (ret), "=3Dr" (error)
> +=09: "r" (tv), "r" (tz), "r" (nr)
> +=09: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
> +=09  "$14", "$15", "$24", "$25", "memory");
> +#else
>  =09asm volatile(
>  =09"       syscall\n"
>  =09: "=3Dr" (ret), "=3Dr" (error)
>  =09: "r" (tv), "r" (tz), "r" (nr)
>  =09: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>  =09  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
> +#endif
> =20
>  =09return error ? -ret : ret;
>  }
> @@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
>  #endif
>  =09register long error asm("a3");
> =20
> +#if __mips_isa_rev >=3D 6
> +=09asm volatile(
> +=09"       syscall\n"
> +=09: "=3Dr" (ret), "=3Dr" (error)
> +=09: "r" (clkid), "r" (ts), "r" (nr)
> +=09: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
> +=09  "$14", "$15", "$24", "$25", "memory");
> +#else
>  =09asm volatile(
>  =09"       syscall\n"
>  =09: "=3Dr" (ret), "=3Dr" (error)
>  =09: "r" (clkid), "r" (ts), "r" (nr)
>  =09: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>  =09  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
> +#endif
> =20
>  =09return error ? -ret : ret;
>  }
> @@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
>  #endif
>  =09register long error asm("a3");
> =20
> +#if __mips_isa_rev >=3D 6
> +=09asm volatile(
> +=09"       syscall\n"
> +=09: "=3Dr" (ret), "=3Dr" (error)
> +=09: "r" (clkid), "r" (ts), "r" (nr)
> +=09: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
> +=09  "$14", "$15", "$24", "$25", "memory");
> +#else
>  =09asm volatile(
>  =09"       syscall\n"
>  =09: "=3Dr" (ret), "=3Dr" (error)
>  =09: "r" (clkid), "r" (ts), "r" (nr)
>  =09: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>  =09  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
> +#endif
> =20
>  =09return error ? -ret : ret;
>  }
> @@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallbac=
k(
>  =09register long nr asm("v0") =3D __NR_clock_gettime;
>  =09register long error asm("a3");
> =20
> +#if __mips_isa_rev >=3D 6
> +=09asm volatile(
> +=09"       syscall\n"
> +=09: "=3Dr" (ret), "=3Dr" (error)
> +=09: "r" (clkid), "r" (ts), "r" (nr)
> +=09: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
> +=09  "$14", "$15", "$24", "$25", "memory");
> +#else
>  =09asm volatile(
>  =09"       syscall\n"
>  =09: "=3Dr" (ret), "=3Dr" (error)
>  =09: "r" (clkid), "r" (ts), "r" (nr)
>  =09: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>  =09  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
> +#endif
> =20
>  =09return error ? -ret : ret;
>  }
> @@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
>  =09register long nr asm("v0") =3D __NR_clock_getres;
>  =09register long error asm("a3");
> =20
> +#if __mips_isa_rev >=3D 6
> +=09asm volatile(
> +=09"       syscall\n"
> +=09: "=3Dr" (ret), "=3Dr" (error)
> +=09: "r" (clkid), "r" (ts), "r" (nr)
> +=09: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
> +=09  "$14", "$15", "$24", "$25", "memory");
> +#else
>  =09asm volatile(
>  =09"       syscall\n"
>  =09: "=3Dr" (ret), "=3Dr" (error)
>  =09: "r" (clkid), "r" (ts), "r" (nr)
>  =09: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>  =09  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
> +#endif
> =20
>  =09return error ? -ret : ret;
>  }
> --=20
> 2.25.4

