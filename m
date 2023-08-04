Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75495770260
	for <lists+linux-mips@lfdr.de>; Fri,  4 Aug 2023 15:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbjHDN5g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Aug 2023 09:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbjHDN5e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Aug 2023 09:57:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134C9D1
        for <linux-mips@vger.kernel.org>; Fri,  4 Aug 2023 06:57:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe1c285690so3495477e87.3
        for <linux-mips@vger.kernel.org>; Fri, 04 Aug 2023 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691157447; x=1691762247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQEI9Tt3LPX/UCb4Pxuia74BKZS5am/oZbLnhTBeH5c=;
        b=P+twRb0U1gRE+80Bx8flSUxpWo6z0ySWgxLZ0xc5GQLe90SBeGJmXHiD40mlY6+PD+
         pvmK69wq1ZH1nI7NsydPcAHe76Pu+AUZorv7tBo6HU/PUbxaf/dk0Gz3hhfmhGJsBwh7
         OKwTCOa3jomyXywBP6Q2TdJfpvZqir238QN9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691157447; x=1691762247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQEI9Tt3LPX/UCb4Pxuia74BKZS5am/oZbLnhTBeH5c=;
        b=DH3XaKgtPpx4uFBZjlM/S0W+Y452pOs47TkJnyB29Xz1Ez8XKAPPKZzVJDq94CLUkn
         pxdh5Ts0VXIFZESQ1RnVeHQhsX3ins7A+jZlw14b+FgHqzvYKX493A/egS1gFKMiNil2
         lYIgyN8J6B6SaMcrP7a0HGik2ybe0ZiyVjRBMAfa1+iDOrD/DQsLufnK8FjBf1EMI7wd
         YpQNNG26ze4cIPn7EGJbsB5yrH+XImTJ2UADHn4caKo4N+PJYUjMQttzbNX+Ql+u5i1D
         7cyPUxXujR/j61NKu2xXwMO4rv+S9WmhZJ5iCd2lYzf+y0GgS33CTK4zlbIx8yJX1zWq
         LIsw==
X-Gm-Message-State: AOJu0Yxf2PZvDtwv3nFP2zVIDjqK7zprhGhKz6HBH6EsGOFB6sb5ofHU
        PaacFJY+ziexTNf2XumlRQ2iQZxwyvokpVe/Nmv1yc+6
X-Google-Smtp-Source: AGHT+IEnKXFHGxLie/7QpLN6Exdsaw1p++oOV9xOt6Q/cXP/49q7IqYlSiT2LiRskDQiZdQnXjpDQw==
X-Received: by 2002:ac2:4db8:0:b0:4fb:8b2a:5e09 with SMTP id h24-20020ac24db8000000b004fb8b2a5e09mr1359755lfe.43.1691157447046;
        Fri, 04 Aug 2023 06:57:27 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id p6-20020aa7cc86000000b0051a2d2f82fdsm1315596edt.6.2023.08.04.06.57.25
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 06:57:25 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fe32ec7201so72365e9.1
        for <linux-mips@vger.kernel.org>; Fri, 04 Aug 2023 06:57:25 -0700 (PDT)
X-Received: by 2002:a05:600c:1f90:b0:3f1:9a3d:4f7f with SMTP id
 je16-20020a05600c1f9000b003f19a3d4f7fmr49358wmb.1.1691157423841; Fri, 04 Aug
 2023 06:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230803160649.v3.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
 <ZMytyEoCARgP9VR8@dhcp22.suse.cz>
In-Reply-To: <ZMytyEoCARgP9VR8@dhcp22.suse.cz>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Aug 2023 06:56:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
Message-ID: <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] nmi_backtrace: Allow excluding an arbitrary CPU
To:     Michal Hocko <mhocko@suse.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Borislav Petkov <bp@alien8.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Pingfan Liu <kernelfans@gmail.com>,
        Qing Zhang <zhangqing@loongson.cn>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tom Rix <trix@redhat.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Valentin Schneider <vschneid@redhat.com>,
        WANG Xuerui <kernel@xen0n.name>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
        x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Fri, Aug 4, 2023 at 12:50=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Thu 03-08-23 16:07:57, Douglas Anderson wrote:
> > The APIs that allow backtracing across CPUs have always had a way to
> > exclude the current CPU. This convenience means callers didn't need to
> > find a place to allocate a CPU mask just to handle the common case.
> >
> > Let's extend the API to take a CPU ID to exclude instead of just a
> > boolean. This isn't any more complex for the API to handle and allows
> > the hardlockup detector to exclude a different CPU (the one it already
> > did a trace for) without needing to find space for a CPU mask.
> >
> > Arguably, this new API also encourages safer behavior. Specifically if
> > the caller wants to avoid tracing the current CPU (maybe because they
> > already traced the current CPU) this makes it more obvious to the
> > caller that they need to make sure that the current CPU ID can't
> > change.
>
> Yes, this looks like the best way forward.
>
> It would have been slightly safer to modify arch_trigger_cpumask_backtrac=
e
> by switching arguments so that some leftovers are captured easier.

I'm not sure I understand. Oh, you're saying make the prototype of
arch_trigger_cpumask_backtrace() incompatible so that if someone is
directly calling it then it'll be a compile-time error? I guess the
hope is that nobody is calling that directly and they're calling
through the trigger_...() functions.

For now I'm going to leave this alone.


> You also have this leftover
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 00982b133dc1..9f1743ee2b28 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -190,10 +190,6 @@ static inline bool trigger_all_cpu_backtrace(void)
>  {
>         return false;
>  }
> -static inline bool trigger_allbutself_cpu_backtrace(void)
> -{
> -       return false;
> -}

Ah yes. I missed that case. Let me send a quick v4.


>  static inline bool trigger_cpumask_backtrace(struct cpumask *mask)
>  {
>         return false;
>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Anyway
> Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!
