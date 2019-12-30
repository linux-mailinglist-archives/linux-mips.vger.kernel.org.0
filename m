Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50D6612D2BD
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 18:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfL3Rde (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 12:33:34 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:37937 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfL3Rde (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Dec 2019 12:33:34 -0500
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MzkK9-1jhdsr0fD7-00vbkg; Mon, 30 Dec 2019 18:33:32 +0100
Received: by mail-qk1-f178.google.com with SMTP id x129so26721548qke.8;
        Mon, 30 Dec 2019 09:33:31 -0800 (PST)
X-Gm-Message-State: APjAAAV2I5nNpjzrKpgBX0QEjGZNOJgwWCRvECvta8YIfAhOSm4seh9M
        J2br8rxqUqO+0RYPHC+ao9XaajFRSUfP42YAHUQ=
X-Google-Smtp-Source: APXvYqxKINRpkvRH6EBh/J+WeJ5uKpylQLt1tiUNftYq6EBCtEzFj+MnUdDIAwsWxMfIcfzkX2Wcqlxk6wiZkq2zM4Y=
X-Received: by 2002:a37:a8d4:: with SMTP id r203mr55775890qke.394.1577727210961;
 Mon, 30 Dec 2019 09:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
 <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
 <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
 <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com>
 <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
 <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
 <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
 <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com> <CAHmME9rnnoFwh=EHAgdQFM+c33D9mgCoVML_+d=Js=pXPnsxKQ@mail.gmail.com>
In-Reply-To: <CAHmME9rnnoFwh=EHAgdQFM+c33D9mgCoVML_+d=Js=pXPnsxKQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 30 Dec 2019 18:33:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1AYGbgf6mmL-863+PXPBQw3AAtp5wQPL5duLCONGhHuw@mail.gmail.com>
Message-ID: <CAK8P3a1AYGbgf6mmL-863+PXPBQw3AAtp5wQPL5duLCONGhHuw@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8IM0V8Y/q3McjhFS/A8QrouIL0hpI1xLdp7oG2RXB93t/A6G+dW
 sYHnNteRk5/tud1M6RbyXPIcIwxsE4Y+XxoSPEgpzybLlIq5bYA7oFgd4kHbRubIYLe42+A
 bZTBrp3oQmleATCjUDkmPuhpr15D/trDhHS4ws1JaUbttN27rieCf1t8/C9FzThhYntYabQ
 kOtgKDFEYtH4XwAwcPz/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F4k7UMF7Zo8=:5nID/7csWIqJEzalu1WUYl
 OK8feV/XQ4YuVno2rabIIm+gUqio20YtDRtvgX3I68/1hyLfFUCOa1TDjPNUk0LFzxpEu0ZDa
 ciVQZDT/w/BaG29XrfaihSMIxC63o9Vc+GgBPohXf7hbDPy+CZYvzeaEFurGRpVzXd4Sts6pr
 0Y7A3GpyCBdbZzz9eQeUd+kjx1F2VYTegDecdd5PWMC075g2jLKxsfYK9u5whWSH59PEEt9+j
 ERJ580ubmpMGubM/YV/VrYWTC5J7MQGxK0tHOdqQrK0XS1ME0UWRMaXjCErrccv0XEhVbV7w8
 lrcAeVqBJ9vkXNzPmfEc4EodfNjo2mkpCuOWZfXf5fyxXPoFqDIGF29wTLjRKOvZ/Sqp7XtZT
 qqNU6BC+9XSIFta3bn+i+JN2yawypy0TKxaZulk3p/Pi6hI+BcL1hKM/hoTBh+W2y4GJyp/qC
 2lfCzqDjGS3VBuUcv9WuGsMhgvAweA3nNMTyESAnqywEid1SjRVhoTCUS8zifLc/AuDmaB+or
 Oo8kYrIhiEnrXwE7j/xPMScO21r/WW9X5zExt7rRCciQTdHnsXoo8aA74MN02sHSI5Ppkm/Kk
 CZRtZpeQsB+SMtn/z73U2yJGVfsydehliliGBTDjSlS1UZ88GCDC4Md1hkp8kUiqBMFsWXReC
 gHVzbgniXMfn4RMh7s+/Kg42VhyhBspV+RTyU7/zpBT+0miq/qAQ7m4WZGhdOz0qYXW5KDZ+b
 z13dDgCgBM+SNLYX8lRc1Si7Ra4HSvQPAZITv9MlCb2IU+lHrFSrO0mA7R940ND/dzGObXVLZ
 SiaUXYJGJajKltY3QJH0bllmykNJo3xJqzvqDxXSsFaOMUxYfW3M0oIaSdN+Bm54D4E1ts4qW
 v7r0kvPObZKfYi81LYuA==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 30, 2019 at 4:58 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Makes sense w.r.t. time32 situation.
>
> I still think that in spite of that there's still something weird
> happening with the mips VDSO.

Agreed.

> Here's a register dump before the call:
>
>  $ 0   : 0000000000000000 0000000000000001 0000000010000000 fffffffffffffffc
>  $ 4   : 0000000000000002 000000007fff2e40 0000000000000000 0000000000000001
>  $ 8   : 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>  $12   : 0000000000000000 000000000000000a ffffffff80000000 000000007fffffda
>  $16   : 0000000010001ba8 0000005800000015 0000000010000000 0000000010000000
>  $20   : 0000000010000000 0000000010000000 0000000000000000 0000000077ff2ae8
>  $24   : 0000000000000005 0000000077fa1d18
>  $28   : 0000000010019cf0 000000007fff2e40 0000000000000000 0000000010000c30
>  Hi    : 0000000000000000
>  Lo    : 0000000000000000
>  epc   : 0000000077fa1d18 0x77fa1d18
>  ra    : 0000000010000c30 0x10000c30
>
> And here it is immediately after:
>
>  $ 0   : 0000000000000000 0000000000000001 ffffffffffffffa7 000000007fff5000
>  $ 4   : 0000000000000002 000000007fff2e40 0000000077ff2000 0000000000000001
>  $ 8   : 0000000000000006 0000000000000020 0000000000000002 0000000000000000
>  $12   : 0000000000000000 0000000000001852 ffffffff80156160 000000007fffffda
>  $16   : 0000000010001ba8 0000005800000015 0000000010000000 0000000010000000
>  $20   : 0000000010000000 0000000010000000 0000000000000000 0000000077ff2b00
>  $24   : 0000000000000005 0000000000000000
>  $28   : 000000007fff5000 000000007fff2e30 0000000000000000 0000000077fa1e00
>  Hi    : 0000000000000000
>  Lo    : 0000000000000000
>  epc   : 0000000077fa1e00 0x77fa1e00
>  ra    : 0000000077fa1e00 0x77fa1e00

Is this immediately before/after the syscall instruction or the
indirect function call?

> I wonder if a toolchain option or compiler bug or something is causing
> the vdso to not restore certain registers (gp? ra?).

Here is the assembler output I see for the o32 vdso, hopefully I got all
the relevant bits:

 # /git/arm-soc/lib/vdso/gettimeofday.c:130:    if (unlikely(ret))
        .set    noreorder
        .set    nomacro
        beqz    $2,$L86  #,,
        lw      $28,16($sp)      #,
        .set    macro
        .set    reorder

$L46:
 # /git/arm-soc/arch/mips/include/asm/vdso/gettimeofday.h:118:
register struct old_timespec32 *ts asm("a1") = _ts;
        move    $5,$16   # ts, ts
 # /git/arm-soc/arch/mips/include/asm/vdso/gettimeofday.h:119:
register clockid_t clkid asm("a0") = _clkid;
        move    $4,$17   # clkid, clock
 # /git/arm-soc/arch/mips/include/asm/vdso/gettimeofday.h:121:
register long nr asm("v0") = __NR_clock_gettime;
        li      $2,4263                 # 0x10a7         # nr,
 # /git/arm-soc/arch/mips/include/asm/vdso/gettimeofday.h:124:  asm volatile(
#APP
 # 124 "/git/arm-soc/arch/mips/include/asm/vdso/gettimeofday.h" 1
               syscall

 # 0 "" 2
 # /git/arm-soc/arch/mips/vdso/vgettimeofday.c:18: }
#NO_APP
        lw      $31,60($sp)      #,
        lw      $19,56($sp)      #,
 # /git/arm-soc/arch/mips/include/asm/vdso/gettimeofday.h:131:  return
error ? -ret : ret;
        subu    $3,$0,$2         # <retval>, ret
        selnez  $3,$3,$7         # tmp406, <retval>, error
        seleqz  $2,$2,$7         # tmp407, ret, error
        or      $3,$3,$2         # <retval>, tmp406, tmp407
 # /git/arm-soc/arch/mips/vdso/vgettimeofday.c:18: }
        lw      $18,52($sp)      #,
        lw      $17,48($sp)      #,
        lw      $16,44($sp)      #,
        move    $2,$3    #, <retval>
        .set    noreorder
        .set    nomacro
        jr      $31      #
        addiu   $sp,$sp,64       #,,
        .set    macro
        .set    reorder

gp ($28) and ra ($31) sound like good guesses to me,

SP ($r29) changed from 000000007fff2e40
to 000000007fff2e30, if that is not the intention, it would clearly explain why
anything afterwards crashes, but that seems unlikely.

r3 contains the error code -ENOSYS on mips, so that's good.

$23 is supposed to be preserved across function calls and is
consequently not part of the clobber list but is modified.

$25 is part of the clobber list and is also modified, but there
is no code to save/restore it in the assembler output.

      Arnd
