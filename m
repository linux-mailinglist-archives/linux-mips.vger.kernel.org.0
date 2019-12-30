Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C196812CFCE
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 12:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfL3L6T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 06:58:19 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:46813 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfL3L6S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Dec 2019 06:58:18 -0500
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MLAAs-1j3yVH10x0-00IAEi; Mon, 30 Dec 2019 12:58:17 +0100
Received: by mail-qk1-f172.google.com with SMTP id t129so26064714qke.10;
        Mon, 30 Dec 2019 03:58:16 -0800 (PST)
X-Gm-Message-State: APjAAAVMiyVtXV/+kbCMWFGoHfQnRzBjT9l92VEp+9YnGivmbWc1HQH5
        teSn2LW2cHeUgkdSy+Xlw91eLAadFyXfFzKjc/U=
X-Google-Smtp-Source: APXvYqwReU6KI+hEZNY1rvE7ncOKdyI/QwFC2pLA7OkGLJknUDKQqjXFuqpjgMyzRIXnVBzHyY0P2OQTFMUGAvc4FCU=
X-Received: by 2002:a05:620a:a5b:: with SMTP id j27mr54486692qka.286.1577707096044;
 Mon, 30 Dec 2019 03:58:16 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
In-Reply-To: <20191224135404.389039-1-Jason@zx2c4.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 30 Dec 2019 12:57:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
Message-ID: <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9VNsB/0hV+uE9zUbhnqLZ6nurlkV2+Py0P0PFGmNrhG80WpHmRM
 X77X2nwlZHYi/To/p16EOLRgfwnnqAnGvcMG/VZEHeXKRArVYQbC1hhx3cd2nvbeq6KOpQd
 u73ajuKjYbjn2ONuh+c0xo49lcdBaFuws7Lp7hgZfpx5Mj0f4VYKeFeHsQO3lrsV23Mf523
 RKuU1siU/zZrRLLKCB5Zw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kso8zCSd2bA=:jMb7H0gBZZ4sMXVuHy6w9T
 Lr6JTxyoKWk0SgMA2EJScqQoiA2ZFX8e4JY5BYQ5Po6b6w7AJTj48dZoVZRo1v5Bpl5rNKPoQ
 AmzCEGoH7LcpphD6i1u9+Fn3l2xl0DHlhmo6MJIbyIa1OmubDodffmSmCslji+AdMx/fIJx37
 gYj57dSYaGatpCulyfNvJVrf9BqjXfeEKZQhRdhsEU9P5eXIfIBaG6zAhyT+uPTbt4g7WfpE9
 LXZ6qJIInFy6bPvMjkXyolibuCND42XmXRvsm1RyBPyo5t71KlrSWch2dTpMRwx5HlzcDkxfe
 7Qxx2b3iWm0iYhGXAeS7KryFPup3svVRxq9uReEBfFnyE54iSvTJPHJk4gPF26KGZUC8P7QRG
 8LtZCHia9xQHnvZi9YSjZfbp1qBen7EcRoKtLHgAe1zeh+PFuqk7NmuqjRa+n2vaApIaTY2Gw
 JSQxibZ6fZjppy+SkEgtgUbvjNRne3oUogcATAGMo4E40VGV+wnXCu4n+sV6K/Xo3KhKYA6QD
 yTOlDwOYpOUTQRyj058qETqz5WTSmCc9wzv+7U8IpvSd/JCJ2Rxdoknn+vQ8LPrbrmdFZyFQt
 fth8nAg7OmKhVCpcLUaMl8EcDbh6xrFetTOS0iW0oDvfueMSvDSokrUxD5Ncs/kRyFhb5eGKe
 k4QvZuxIxVLEsRkK1F5wP00fTjND2G9k5vaW2CZrKJitsf7JznJZRi2deMrMf84A893S0LipT
 rDpEmEW4OgzHWsWLmwS8JwyhgHdOhw6lkf56NxRFnM9c+cHGcb02SNubkZs+NpUc+Nx2H3iDI
 bvW/YdUxvsbgRMqb8RIZGG9m0jaing4rbcQTp5j5fZmMmoByWZNkPLjaSWODrHO8kMMJB9JDV
 R3JehtGBI1ymV1mYOMMw==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 24, 2019 at 2:54 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the VDSO falls back to 32-bit time functions on kernels with
> COMPAT_32BIT_TIME=n, userspace becomes corrupted and appears to crash
> shortly after, with something like:
>
> [    0.359617] do_page_fault(): sending SIGSEGV to init for invalid read access from 000000007ff790d0
> [    0.359843] epc = 0000000077e45df4 in libc.so[77da6000+de000]
> [    0.360319] ra  = 0000000010000c50 in init[10000000+2000]
> [    0.364456] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>
> This can be reproduced with simply calling `clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &ts)`,
> since `CLOCK_PROCESS_CPUTIME_ID` is not exported to the VDSO, invoking
> the syscall callback branch. This crash was observed with musl 1.20's
> clock_gettime implementation:

Thanks for the bug report! I'm not completely sure why this fails in
this particular
way though. I assume you are using musl-1.1.20, not a musl-1.2.0 snapshot
(the version 1.20 you list does not exist), so the combination you are testing
is supposed to just return -ENOSYS here to match the behavior of hte
system call.

> --- a/arch/mips/include/asm/vdso/gettimeofday.h
> +++ b/arch/mips/include/asm/vdso/gettimeofday.h
> @@ -107,7 +107,7 @@ static __always_inline int clock_getres_fallback(
>        return error ? -ret : ret;
> }
>
> -#if _MIPS_SIM != _MIPS_SIM_ABI64
> +#if _MIPS_SIM != _MIPS_SIM_ABI64 && defined(CONFIG_COMPAT_32BIT_TIME)
>
>  #define VDSO_HAS_32BIT_FALLBACK        1
>

I don't think this is the correct fix, it may actually make it worse
by changing the vdso implementation for clock_gettime32()
to fall back to clock_gettime64(), which would appear to work
correctly before y2038 but fail afterwards.  How about this one:

diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index da4627430aba..0bdc6a026be8 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -93,9 +93,11 @@ VERSION
        LINUX_2.6 {
 #ifndef DISABLE_MIPS_VDSO
        global:
+#if (_MIPS_SIM == _MIPS_SIM_ABI64) || defined(CONFIG_COMPAT_32BIT_TIME)
                __vdso_clock_gettime;
                __vdso_gettimeofday;
                __vdso_clock_getres;
+#endif
 #if _MIPS_SIM != _MIPS_SIM_ABI64
                __vdso_clock_gettime64;
 #endif

That should ensure that no user space can call the old vdso
functions on a kernel that intentionally breaks the actual
syscalls.

      Arnd
