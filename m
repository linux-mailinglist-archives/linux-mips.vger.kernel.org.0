Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66F9211DE3F
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2019 07:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfLMGnC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Dec 2019 01:43:02 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:43887 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfLMGnC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Dec 2019 01:43:02 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MCska-1iWoxY3YJM-008vea; Fri, 13 Dec 2019 07:43:01 +0100
Received: by mail-qk1-f174.google.com with SMTP id z14so889619qkg.9;
        Thu, 12 Dec 2019 22:43:00 -0800 (PST)
X-Gm-Message-State: APjAAAUUF72Tq10G7S60O2ZAGl9Rzlxbu7FtY5CzS7lSVjDNIY8Q7sFB
        IkEW5t37aIQvOv1ApZrbUrfsei7GxYtS0WvH1tU=
X-Google-Smtp-Source: APXvYqwHyIjH4VLQFxLMz1S1d7sFNTr1dHj2eC4zrzxLpZcvGQkCa/gHpActn9wF7EYJ0RiDspowztRBpqmdKYRtruI=
X-Received: by 2002:a37:4e4e:: with SMTP id c75mr11775015qkb.3.1576219379648;
 Thu, 12 Dec 2019 22:42:59 -0800 (PST)
MIME-Version: 1.0
References: <1576217705-2634-1-git-send-email-sunguoyun@loongson.cn>
In-Reply-To: <1576217705-2634-1-git-send-email-sunguoyun@loongson.cn>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 13 Dec 2019 07:42:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Nz10L2pQPE3L5-d0wKGD6BBKCT5HMc4Nyo-56ORSheg@mail.gmail.com>
Message-ID: <CAK8P3a2Nz10L2pQPE3L5-d0wKGD6BBKCT5HMc4Nyo-56ORSheg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Add get_thread_area syscall
To:     Guoyun Sun <sunguoyun@loongson.cn>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Firoz Khan <firoz.khan@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:kKOcqBvTequokhAvitowVT4xVP+Ot/8nUOIZAFUQD3r/V70Fowq
 q3d81o+TIpRBAMt58xZX5rWyxOgvbdljKRaXPetyyuNaCgUBchmqfgfkCZn4XOgaYa9ljt0
 7iis7JMrYP+NR4kxqVzphE0HeeKqXSyXlOYwqe4aOEyExWGukpaMuZVVTv5LpWVCI8WKoQI
 BAUt7IC6f0m0ymteqfVhQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L900IOD6uTI=:5cwsRAuLtwoNqjJDDsxAF6
 G2oSk7XPNfNegT6Wn/6XTRRhDKq3306AJuQsvpzk35Us91UVf46gC3lsLJaOYZvsVEM6YZkXA
 GCRW907gIDqUVbJBrwAb4U+WNrCIrpHZ0hk3ChYPbPhW/RedigfgxXx+/V/V1fUmrauC6SCix
 TiBlx5Jj+1EVkogoX5egrkJCcB4+OvjLKq9fd0Y2cADgWBUxVRlFvvOjImVgOZqzogYKwl0vK
 lw6lSYETEGdgL3F2bP1fVmdOkenQ8QCvDaikw5iDhaZhF/DlU1mIo/diASUDall49rlt0268g
 Pl1hm6CFn4CvL+ZZPu3HWapWnQJuSSz+ANBMKDN3Uh59V5veFYvkT19otvdfCn0vvw3tdscFG
 pd7q0KeWf48i6OGfvyAvNopxdfZrAi9aKHbz2HYGVpV4fodmRziPdsEcUmZTZ+ZEr7uMc6Wnx
 e00pNUY/AUpOQudjax4/+oyo2MRZc62xg85Ij+7SqHbkXSkcJzplTDt89wuUOyafYiJCv2PHD
 CuxZB39VUH5kcwF0ihLKHw0wY9QR3Uo2TWOjIqsrJbjoRtx/FUg1M9Asl4388nKsmMJubK8pN
 bjBtmCQDC14Itg/OEWBsrUUAsE/BItMR8V6s5iKlHpGw1e5rhvkhpmJuzpIwv9JJsGTjrSZKv
 3DUXCbs0o/7FUhJvyyywUhE2ciTqo1Mcihf+luc9uWdcp3eBLNdNxHnHUaURkwuBU6RgfDZNL
 DkK+uqb0UtCZsA/RaOlw5ABy/KrejbQPwfLxbkchX6/uP16Q6MTXE+U+gX+mXpyMfM2v71ewC
 3iYSrct4Aa9Zi4dlv15nie81Qv1e41oUFi1IlvOduUvB/TTBb6AnjnMPG5puENigN0g6LT/Q8
 jzOOmU1X+FSGP2H4EYJw==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 13, 2019 at 7:15 AM Guoyun Sun <sunguoyun@loongson.cn> wrote:
>
> CRIU(https://criu.org/) tools will dump TLS(Thread Local Storage) by
> get_thread_area during checkpoint and restore TLS by set_thread_area during
> restore. without syscall get_thread_area, criu restore will fail on MIPS
> platform.because a variable with GCC __thread is invalid.
>
> The following function will be called when criu restore

> diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
> index e7c5ab3..7da83d0 100644
> --- a/arch/mips/kernel/syscalls/syscall_n32.tbl
> +++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
> @@ -374,3 +374,4 @@
>  433    n32     fspick                          sys_fspick
>  434    n32     pidfd_open                      sys_pidfd_open
>  435    n32     clone3                          __sys_clone3
> +436    n32     get_thread_area                 sys_get_thread_area

Please use a number in the arch-specific range below 393. The numbers
at the bottom are meant for syscalls that are common for all
architectures.

        Arnd
