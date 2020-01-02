Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 319B412E5AA
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2020 12:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgABL3c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Jan 2020 06:29:32 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:36751 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgABL3c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Jan 2020 06:29:32 -0500
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M8k65-1ir5Oi3qUL-004kBN; Thu, 02 Jan 2020 12:29:30 +0100
Received: by mail-qv1-f41.google.com with SMTP id o18so14908036qvf.1;
        Thu, 02 Jan 2020 03:29:29 -0800 (PST)
X-Gm-Message-State: APjAAAV8BPCiPeSM5KLBV8looieXCZJ+AERsxfoByh6+uGLNrvTlX40e
        +kxY54zq4crDG3UnOveQ51eqVxno9qnKf53g+K4=
X-Google-Smtp-Source: APXvYqzptO5odenMl+S0N7s3GQhlwCDgPJBBw4XLujkDNgUOvvmeI6k+bBQkXgHWdkBmH6M+qYLFWJ1uMC5oWigZUtc=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr63056221qvg.197.1577964568705;
 Thu, 02 Jan 2020 03:29:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
 <CAK8P3a0QGtjygLJUWX_1-s1vfCzE6UoOzrb+OZWwjaBdh=RpVQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0QGtjygLJUWX_1-s1vfCzE6UoOzrb+OZWwjaBdh=RpVQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 2 Jan 2020 12:29:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1gHvW2XEMDSHCcdOQ8NSs3iHk9GpujwkWZnnZ0dnw96w@mail.gmail.com>
Message-ID: <CAK8P3a1gHvW2XEMDSHCcdOQ8NSs3iHk9GpujwkWZnnZ0dnw96w@mail.gmail.com>
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
X-Provags-ID: V03:K1:6xdXzRg9VpWyJjPDxnqKeILf/1Ib2ZdGGXZNLurLjP1YEaW9OWX
 MBiMEpDPhR0rFp3y+Qfy0qhY+rWB7mBAVqv9yjoypUyhUUebq/Ee2R9xbqIe9aC7sJxOZ9X
 FXabUM+WPC7UfbKyu6lS0M1ye8+6WCteZ/4RD28MC52NMdEbJ7cmiA0F4Yura0ipln20ceE
 AiITv0xUUHFzWnCanJKLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/iddvcBU3ds=:geESGrCH9H7D8+t0Jy+RCb
 JqS2xbP93oTlRsxVSlcuv+KBl1MfH8lIYs/3ZbNXXxbjAn0K6O4GWvbToDuba7Pmw9KLVqGya
 w43Ogf9yMZZJoSxGFGS5enGKShS+uYNkzmreDQgOUyuGIlownURMOLD+DMrqNScOIK/bFMpxs
 Z+0omHEibdO696axuGji7OV1SxEswIr18PZgt/mFCF6UYnNzX9StuuzaYX+Qnq561DslNVxHT
 WiYNVHMZqiG42tmE7aqNebW5na+fT1lLFX1XLH6QMLdO+RQlUdCJuzX21CkQOpEmisypokgXb
 sruWQ5ZWqlJumxfiRqurYiXz00m+JTivdvDr9KkljXkppPQvZZKa6wTq/k5xcyiJ56/dM87ze
 A6hcpdYgf+7u5jE8hlqryV/2XGxJlicHR796F87buGuYqBBrTP7TZM6Rw+v3ufvQCMyN5Co3n
 VuZTcGcU/2I34NA2W+TM4TWZOmuo138AXFAzHaUzUnZpILM2sbjbAujh5dUpPH587cgZZibRD
 EP74gEOpUHyhjvNWKDFMeV3HLEks19KFwT0H7CnxsfIqCZkUFvc+MEWnUmSPRfwnEaAsfAw6r
 zxrwz+qIogRj1BYVSycbXtJChz1JSP1xoy3vwZC298Sn4hJTNOOde3maLPlHYWUCWTrjghKM2
 czEB32vXGz4qCxkvQW3+MQ5qU7s5evoc3P1Z2LoiC1mC9VKn8xiaUrKEVH108cVw9aFOuI7GY
 Fc6Pjn47kP1kUdke54vCQRGVVXqRTo/2kkVIxQinNCi5DSORVuRHOdNaGJnwUbcFIxp/BXsAU
 OMvngzLJd5v5w2rzOC9eSGUx30qoi190SdFnCbdPFJ7xgnEI0XGSRWqJsZ8b8OT5yGfuc9n3c
 WRZhzr+pDef76AKC8jvg==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 30, 2019 at 1:27 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Dec 23, 2019 at 3:31 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > +static __always_inline
> > +long clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
> > +{
> > +       struct __kernel_timespec ts;
> > +       int ret = clock_getres_fallback(clock, &ts);
> > +
> > +       if (likely(!ret && _ts)) {
> > +               _ts->tv_sec = ts.tv_sec;
> > +               _ts->tv_nsec = ts.tv_nsec;
> > +       }
> > +       return ret;
> > +}
>
> Please change these to call __NR_clock_gettime and __NR_clock_getres_time
> instead of __NR_clock_gettime64/__NR_clock_getres_time64 for multiple reasons.
>
> - When doing migration between containers, the vdso may get copied into
>   an application running on a kernel that does not support the time64
>   variants, and then the fallback fails.
>
> - When CONFIG_COMPAT_32BIT_TIME is disabled, the time32 syscalls
>   return -ENOSYS, and the vdso version should have the exact same behavior
>   to avoid surprises. In particular an application that checks clock_gettime()
>   to see if the time32 are in part of the kernel would get an incorrect result
>   here.
>
> arch/arm64/include/asm/vdso/compat_gettimeofday.h already does this,
> I think you can just copy the implementation or find a way to share it.

There was a related discussion on this after a vdso regression on mips,
and I suggested to drop the time32 functions completely from the
vdso when CONFIG_COMPAT_32BIT_TIME is disabled, such as

diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S
b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 00c025ba4a92..605f259fa24c 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -145,10 +145,12 @@ VERSION

                __kernel_get_syscall_map;
 #ifndef CONFIG_PPC_BOOK3S_601
+#ifdef CONFIG_COMPAT_32BIT_TIME
                __kernel_gettimeofday;
                __kernel_clock_gettime;
                __kernel_clock_getres;
                __kernel_time;
+#endif
                __kernel_get_tbfreq;
 #endif
                __kernel_sync_dicache;

Any opinions on this? If everyone agrees with that approach, I can
send a cross-architecture patch to do this everywhere. It's probably
best though if Christophe adds that to his series as it touches a lot
of the same files and I would prefer to avoid conflicting changes.

       Arnd
