Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68ADF12DE63
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jan 2020 10:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgAAJrS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Jan 2020 04:47:18 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:39895 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgAAJrS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 Jan 2020 04:47:18 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd1be872;
        Wed, 1 Jan 2020 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=f4mgsSbWhcX4nb7z42nkbcoWQxI=; b=iOuTX6
        vXDXalEy4fj2MK3JPzn4z1XtUrC7p+tzNZ6YaTqvuibNZZN83SNrnnoMrDAkEaTr
        vfClH+1tOZlQDkWKrKffSwI9FDTPbAYrEh8j8XxHa6IkoFjbWeNidMqVo84F41s4
        Ff7p72Tl9YSoqEMRZbQkb0yNejek/TKQBM1/pHpB3qvfN9Ecz5P1+feFkIwn8lnX
        iNq86kR3cNi0+wcxbrCwirwtZYwnd0eZpOClk9fpO2o2912GvTCXsOH4dZmbMUfk
        zqgeMjZQsZ3nec14r+4mkhRB1zoXShLERiSRtxjv4XQGYqSaXwBN9UIbyDhhaok/
        2n+KkxuYds3CVFKw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4ae2b616 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Wed, 1 Jan 2020 08:48:55 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id k8so35773047otl.13;
        Wed, 01 Jan 2020 01:47:16 -0800 (PST)
X-Gm-Message-State: APjAAAWgtoic/A8xMvPvm3w2t210Z4KggP5i/d+SbdNyVa20mC1h9Hen
        6qF0SW2+ll3DT7ea8oQkBGlI7sEB/qKTJu0Cg1I=
X-Google-Smtp-Source: APXvYqyIGS/wGj0v8cKxqgpqX78Pmba4r9awIczCf4DM7aqu48j7WnOiSxJVH0qsSeYGd1jM3RtIAnq5f01SqVXXCsg=
X-Received: by 2002:a9d:674f:: with SMTP id w15mr87300086otm.243.1577872035434;
 Wed, 01 Jan 2020 01:47:15 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com>
 <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
 <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
 <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
 <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com>
 <CAHmME9rnnoFwh=EHAgdQFM+c33D9mgCoVML_+d=Js=pXPnsxKQ@mail.gmail.com>
 <CAK8P3a1AYGbgf6mmL-863+PXPBQw3AAtp5wQPL5duLCONGhHuw@mail.gmail.com>
 <CAHmME9r2G4viiF4sYqpuYOnFCtjWpjugqenoEeUrsU6MGBeSuQ@mail.gmail.com>
 <CAHmME9rCCei_CL1evDYQ44Eu8erbjx_jDzbpKeXD4jTGBu8v8A@mail.gmail.com>
 <CAHmME9q0z4RBhy7AETo0sPt+SfV7=zFra0iyZ-Sm54c-WG6CVg@mail.gmail.com> <20200101041056.xionott76qbrffih@lantea.localdomain>
In-Reply-To: <20200101041056.xionott76qbrffih@lantea.localdomain>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Wed, 1 Jan 2020 10:47:04 +0100
X-Gmail-Original-Message-ID: <CAHmME9pvMmnN_=enz7k_hU=KjEtOiDL6dFa42E3mLPDdZ+M1cg@mail.gmail.com>
Message-ID: <CAHmME9pvMmnN_=enz7k_hU=KjEtOiDL6dFa42E3mLPDdZ+M1cg@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     Paul Burton <paulburton@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 1, 2020 at 5:08 AM Paul Burton <paulburton@kernel.org> wrote:
>
> Hi Jason,
>
> On Tue, Dec 31, 2019 at 05:14:41PM +0100, Jason A. Donenfeld wrote:
> > Here's a "one click" reproducer:
> > https://data.zx2c4.com/mips-musl-libc-weird-crash-time32-compat.tar.xz
> >
> > Untar that and hit `make -j$(nproc)`, and you'll get a freshly built
> > and crashing kernel+userland.
>
> Thanks for the test case. It seems like the VDSO code isn't saving &
> restoring $gp/$28, even though it's meant to be callee-saved in both the
> n32 & n64 ABIs. With some digging I found that the below seems to
> resolve the issue. Could you check whether it works for you?
>
> I'm still not quite sure *why* this happens; perhaps GCC just decides it
> doesn't need to save & restore $gp/$28 when it spots that it's being
> "used" for __current_thread_info (even though that's never actually
> referenced in the VDSO)?
>
> Just moving the declaration of __current_thread_info inside the
> current_thread_info() function seems to do the trick too, and is
> probably a bit neater.
>
> Thanks,
>     Paul
>
> ---
> diff --git a/arch/mips/include/asm/thread_info.h b/arch/mips/include/asm/thread_info.h
> index 4993db40482c..ac33959bbb1f 100644
> --- a/arch/mips/include/asm/thread_info.h
> +++ b/arch/mips/include/asm/thread_info.h
> @@ -50,7 +50,11 @@ struct thread_info {
>  }
>
>  /* How to get the thread information struct from C.  */
> +#ifdef __VDSO__
> +register struct thread_info *__current_thread_info __asm__("$0");
> +#else
>  register struct thread_info *__current_thread_info __asm__("$28");
> +#endif
>
>  static inline struct thread_info *current_thread_info(void)
>  {

Holy guacamole, nice catch. That's interesting behavior indeed...

I'll leave it to you to submit for 5.5?
