Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 093EE12CFF4
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 13:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfL3M2A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 07:28:00 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:45289 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbfL3M2A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Dec 2019 07:28:00 -0500
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MORIm-1j7I5S1Nja-00Pvkq; Mon, 30 Dec 2019 13:27:56 +0100
Received: by mail-qt1-f176.google.com with SMTP id n15so29534936qtp.5;
        Mon, 30 Dec 2019 04:27:56 -0800 (PST)
X-Gm-Message-State: APjAAAWyYzNHoAQvFyrXhRs0Zj7zHgBWluSFciuTDbD5Df4fZWga3ZGE
        Loa2BDaIBs61tArHZxjRi5usEp/jmC/ljnOYZ2U=
X-Google-Smtp-Source: APXvYqxPg18QcBCheXEg57bO676E88LDtMzW6UpknzYUThTzCz6Q+c1Pcfg/qqj52aosJr397+kYQUCE06+nF/bwaDM=
X-Received: by 2002:ac8:47d3:: with SMTP id d19mr47462525qtr.142.1577708875107;
 Mon, 30 Dec 2019 04:27:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
In-Reply-To: <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 30 Dec 2019 13:27:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0QGtjygLJUWX_1-s1vfCzE6UoOzrb+OZWwjaBdh=RpVQ@mail.gmail.com>
Message-ID: <CAK8P3a0QGtjygLJUWX_1-s1vfCzE6UoOzrb+OZWwjaBdh=RpVQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/10] lib: vdso: ensure all arches have 32bit fallback
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jOHMDkQLbBEOfg+4rjmnhRPt6FJ4ctoN2IimZLo9gAUXDFtD9C2
 75QznJOJwR5UUrrNfkOcZaEg3WOrVX6dRRHBCN15LSpnoAO4a1DXM3dPPOF9fMCVZg1W08U
 +P5H9GFpkCMqD05HKyBHardYwDRQLtjZIMqJVcvMj1m5DqysTXavdXdwWn1/fDto8o4b2Su
 OQU8gXcYKQhlGQJlzPohw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:71Akjt8W24A=:PXGn17DWKzLuFP4vcJpLWp
 6F7QXJChbrcNpMjxvg48EmTZUDNI2VAwov/bQzVFvSnS2FGMIoA189x5cp+m9KbSLQyVCnjtX
 wWbG4yx8cLaZpcXe6T5AzAwg93VUDvwU2ucHqNuUsqi8wtsaogy1zg95g/p9DUPnu9H7iwnfZ
 8jsJa8IHhXne5CBS2Kahuk+i683IrM/G5/KultKGrG6p/DxEOnlIbntXbvJi/Kr3nrCProtNo
 +9YMoqD4ZLTogltmCpGIwGDWz+1IdHWWkTulz5nakoP1H29lJes7MG7yciCC0ajxhvvxBglTj
 j79etS3wzXmucVREnEV8dNnkCQ0pBGtO0bc1dIEDWYIDxzwiL9eY08115KLOed3GYyK2vG54v
 tgXTBJKgGX0NuwergkqwxaQtaImVic8oDwf+w9IBEOINy96Km4Nq/kFwm0MfnRsJ+Yg6l4OPa
 5F3+VuvZm+ZIORPnvVLnc1yMPJEXtU5EaAd4Oo2qUq+wsi9qLMFLjG3clKefd+gn82FLFICBP
 iNeZW7APRpVtTZECe8jSbqAl0eK3WdhEHxrcYzgAzIwpvZEEFtZtKOvUmQud1DlQ+w7/WHcuO
 5A30sotvNv7XD4Nyq87CLUpHcOaHWHGR6EZtNlxvDW8tvefLTIiuBPcwUZH0aVpNuP1B8x9QL
 hqOOuHngHCAPrzhGA+sUIW5E1/rkQPlPlKJjn5va7G/dWWND70mfO+eWmMbzkGryRhv3tnS8S
 5+iIWWhWY/bj8rBvYvs39k2Ywyj+WlP25ZXl4aIHHMe4z1JL0SUerv4caOZ+IhKVf5VBmOYSb
 N0XtwkoK0hiRzWZmPTqPtPLZ9kvlerjFGkVZyC2gytjqDp6mDGYilKut4ZcxKEemb7GQy5x3+
 co0zwMAK3NXUxqXhjkqw==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 23, 2019 at 3:31 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> In order to simplify next step which moves fallback call at arch
> level, ensure all arches have a 32bit fallback instead of handling
> the lack of 32bit fallback in the common code based
> on VDSO_HAS_32BIT_FALLBACK
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

I like the idea of removing VDSO_HAS_32BIT_FALLBACK and ensuring
that all 32-bit architectures implement them, but we really should *not*
have any implementation calling the 64-bit syscalls.

> +static __always_inline
> +long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
> +{
> +       struct __kernel_timespec ts;
> +       int ret = clock_gettime_fallback(clock, &ts);
> +
> +       if (likely(!ret)) {
> +               _ts->tv_sec = ts.tv_sec;
> +               _ts->tv_nsec = ts.tv_nsec;
> +       }
> +       return ret;
> +}
> +
> +static __always_inline
> +long clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
> +{
> +       struct __kernel_timespec ts;
> +       int ret = clock_getres_fallback(clock, &ts);
> +
> +       if (likely(!ret && _ts)) {
> +               _ts->tv_sec = ts.tv_sec;
> +               _ts->tv_nsec = ts.tv_nsec;
> +       }
> +       return ret;
> +}

Please change these to call __NR_clock_gettime and __NR_clock_getres_time
instead of __NR_clock_gettime64/__NR_clock_getres_time64 for multiple reasons.

- When doing migration between containers, the vdso may get copied into
  an application running on a kernel that does not support the time64
  variants, and then the fallback fails.

- When CONFIG_COMPAT_32BIT_TIME is disabled, the time32 syscalls
  return -ENOSYS, and the vdso version should have the exact same behavior
  to avoid surprises. In particular an application that checks clock_gettime()
  to see if the time32 are in part of the kernel would get an incorrect result
  here.

arch/arm64/include/asm/vdso/compat_gettimeofday.h already does this,
I think you can just copy the implementation or find a way to share it.

> diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
> index b08f476b72b4..c41c86a07423 100644
> --- a/arch/arm64/include/asm/vdso/gettimeofday.h
> +++ b/arch/arm64/include/asm/vdso/gettimeofday.h
> @@ -66,6 +66,32 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
>         return ret;
>  }
>
> +static __always_inline
> +long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
> +{
> +       struct __kernel_timespec ts;
> +       int ret = clock_gettime_fallback(clock, &ts);
> +
> +       if (likely(!ret)) {
> +               _ts->tv_sec = ts.tv_sec;
> +               _ts->tv_nsec = ts.tv_nsec;
> +       }
> +       return ret;
> +}

As Andy said, this makes no sense at all, nothing should ever call this on a
64-bit architecture.

> diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
> index b08825531e9f..60608e930a5c 100644
> --- a/arch/mips/include/asm/vdso/gettimeofday.h
> +++ b/arch/mips/include/asm/vdso/gettimeofday.h
> @@ -109,8 +109,6 @@ static __always_inline int clock_getres_fallback(
>
>  #if _MIPS_SIM != _MIPS_SIM_ABI64
>
> -#define VDSO_HAS_32BIT_FALLBACK        1
> -
>  static __always_inline long clock_gettime32_fallback(
>                                         clockid_t _clkid,
>                                         struct old_timespec32 *_ts)
> @@ -150,6 +148,32 @@ static __always_inline int clock_getres32_fallback(
>
>         return error ? -ret : ret;
>  }
> +#else
> +static __always_inline
> +long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
> +{
> +       struct __kernel_timespec ts;
> +       int ret = clock_gettime_fallback(clock, &ts);
> +
> +       if (likely(!ret)) {
> +               _ts->tv_sec = ts.tv_sec;
> +               _ts->tv_nsec = ts.tv_nsec;
> +       }
> +       return ret;
> +}
> +

Same here.

> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -125,13 +125,8 @@ __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
>
>         ret = __cvdso_clock_gettime_common(clock, &ts);
>
> -#ifdef VDSO_HAS_32BIT_FALLBACK
>         if (unlikely(ret))
>                 return clock_gettime32_fallback(clock, res);
> -#else
> -       if (unlikely(ret))
> -               ret = clock_gettime_fallback(clock, &ts);
> -#endif
>
>         if (likely(!ret)) {
>                 res->tv_sec = ts.tv_sec;

Removing the #ifdef and the fallback seems fine. I think this is actually
required for correctness on arm32 as well. Maybe enclose the entire function in

#ifdef VDSO_HAS_CLOCK_GETTIME32

to only define it when it is called?

> @@ -238,13 +233,8 @@ __cvdso_clock_getres_time32(clockid_t clock, struct old_timespec32 *res)
>
>         ret = __cvdso_clock_getres_common(clock, &ts);
>
> -#ifdef VDSO_HAS_32BIT_FALLBACK
>         if (unlikely(ret))
>                 return clock_getres32_fallback(clock, res);
> -#else
> -       if (unlikely(ret))
> -               ret = clock_getres_fallback(clock, &ts);
> -#endif

The same applies to all the getres stuff of course.

      Arnd
