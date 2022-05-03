Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB8D518BCD
	for <lists+linux-mips@lfdr.de>; Tue,  3 May 2022 20:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiECSH4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 May 2022 14:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240921AbiECSHt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 May 2022 14:07:49 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4352C3EA9C
        for <linux-mips@vger.kernel.org>; Tue,  3 May 2022 11:04:15 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id a10so18953487oif.9
        for <linux-mips@vger.kernel.org>; Tue, 03 May 2022 11:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R4/K6aedIUl9MohMPOlkW7bX2DydtcwCMb+CydErQh0=;
        b=CJu9kW5FihxnTA4wr5HdIEfymEuuekA79aJVNMM2F6kdV2+CmmuoX8R9fhQ+4vfzGu
         cwr0+95tIZHFde4YyKyVQIEU1uoccXZ0Wre6iNf7ZQo6N8EA9gsX+jTvyEJvXCE49T6e
         235jqkHQ/du2SkGvAqn3TvfA6e2cYQxB3dcEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R4/K6aedIUl9MohMPOlkW7bX2DydtcwCMb+CydErQh0=;
        b=ujAkvyRM7+XkiRtoSBoo5Biq9oviin/7rZK7VwjnS7af/xsqiV6LCKQeBxr0sy/+tc
         SAL7UyEVfIEm8kDUJbpoIpOV9DCiYK/jgr0FxJXGgMrmfv3oSJhVk49sBi/BklbKGIaF
         g1NG3h/TMeUjEpcWMwBEJ+/Wbi9u47TajCyVjgPm+QNmG6Ia/wn5l1+DJQVhbGin6+Vh
         BqhBu7lCe7ArqPAMF7MPdhVnE+Ar+NvvN7TvJZ9aYW6ET5DUH4GPQ72o33irV6j81CzJ
         VuOIOq91g+NU+/WaMHrAFnp2eG3xrU15bCHk4PSF3FBUd/RH6f2pD/K7LpFodIbtlr0K
         rRQg==
X-Gm-Message-State: AOAM532FCg+8jeURFyzK+nnFZXAa1Ny74JKaeFoLcZpSzA2iSR0qgSap
        CNF1FXJ3UKlq2rAEDzu63oqxx4661dEtUw==
X-Google-Smtp-Source: ABdhPJyokkKZ4eNTDISaoR8gzrUeug8lwmM8AwJk1mH5bnuXBsJ3dDMKm8uJ3BIygwIwhryB7QdKvg==
X-Received: by 2002:a05:6808:ec5:b0:2f7:4019:53be with SMTP id q5-20020a0568080ec500b002f7401953bemr2356584oiv.176.1651601054504;
        Tue, 03 May 2022 11:04:14 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id e44-20020a9d01af000000b00605da994088sm4217819ote.2.2022.05.03.11.04.13
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 11:04:13 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id r1so18782452oie.4
        for <linux-mips@vger.kernel.org>; Tue, 03 May 2022 11:04:13 -0700 (PDT)
X-Received: by 2002:a05:6808:d50:b0:322:fb1d:319d with SMTP id
 w16-20020a0568080d5000b00322fb1d319dmr2350498oik.174.1651601052906; Tue, 03
 May 2022 11:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224924.592546-1-gpiccoli@igalia.com> <20220427224924.592546-5-gpiccoli@igalia.com>
In-Reply-To: <20220427224924.592546-5-gpiccoli@igalia.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 3 May 2022 11:03:37 -0700
X-Gmail-Original-Message-ID: <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
Message-ID: <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
Subject: Re: [PATCH 04/30] firmware: google: Convert regular spinlock into
 trylock on panic path
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, bhe@redhat.com,
        pmladek@suse.com, kexec@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, Linux PM <linux-pm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
        linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net,
        halves@canonical.com, fabiomirmar@gmail.com,
        alejandro.j.jimenez@oracle.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Jonathan Corbet <corbet@lwn.net>, d.hatayama@jp.fujitsu.com,
        dave.hansen@linux.intel.com, dyoung@redhat.com,
        feng.tang@intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com,
        jgross@suse.com, john.ogness@linutronix.de,
        Kees Cook <keescook@chromium.org>, luto@kernel.org,
        mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
        peterz@infradead.org, rostedt@goodmis.org,
        senozhatsky@chromium.org, Alan Stern <stern@rowland.harvard.edu>,
        Thomas Gleixner <tglx@linutronix.de>, vgoyal@redhat.com,
        vkuznets@redhat.com, Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        David Gow <davidgow@google.com>,
        Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 27, 2022 at 3:51 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Currently the gsmi driver registers a panic notifier as well as
> reboot and die notifiers. The callbacks registered are called in
> atomic and very limited context - for instance, panic disables
> preemption, local IRQs and all other CPUs that aren't running the
> current panic function.
>
> With that said, taking a spinlock in this scenario is a
> dangerous invitation for a deadlock scenario. So, we fix
> that in this commit by changing the regular spinlock with
> a trylock, which is a safer approach.
>
> Fixes: 74c5b31c6618 ("driver: Google EFI SMI")
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: David Gow <davidgow@google.com>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  drivers/firmware/google/gsmi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
> index adaa492c3d2d..b01ed02e4a87 100644
> --- a/drivers/firmware/google/gsmi.c
> +++ b/drivers/firmware/google/gsmi.c
> @@ -629,7 +629,10 @@ static int gsmi_shutdown_reason(int reason)
>         if (saved_reason & (1 << reason))
>                 return 0;
>
> -       spin_lock_irqsave(&gsmi_dev.lock, flags);
> +       if (!spin_trylock_irqsave(&gsmi_dev.lock, flags)) {
> +               rc = -EBUSY;
> +               goto out;
> +       }

gsmi_shutdown_reason() is a common function called in other scenarios
as well, like reboot and thermal trip, where it may still make sense
to wait to acquire a spinlock. Maybe we should add a parameter to
gsmi_shutdown_reason() so that you can get your change on panic, but
we don't convert other callbacks into try-fail scenarios causing us to
miss logs.

Though thinking more about it, is this really a Good Change (TM)? The
spinlock itself already disables interrupts, meaning the only case
where this change makes a difference is if the panic happens from
within the function that grabbed the spinlock (in which case the
callback is also likely to panic), or in an NMI that panics within
that window. The downside of this change is that if one core was
politely working through an event with the lock held, and another core
panics, we now might lose the panic log, even though it probably would
have gone through fine assuming the other core has a chance to
continue.

-Evan
