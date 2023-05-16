Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEA0704A22
	for <lists+linux-mips@lfdr.de>; Tue, 16 May 2023 12:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbjEPKJs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 May 2023 06:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbjEPKJp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 May 2023 06:09:45 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F881BC3
        for <linux-mips@vger.kernel.org>; Tue, 16 May 2023 03:09:33 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4501ac903d6so7526500e0c.1
        for <linux-mips@vger.kernel.org>; Tue, 16 May 2023 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684231773; x=1686823773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lEOYeeU5eTLm7de7UnRvbY+9wcsAqP7XOcqCDjWADA=;
        b=gK8/96Mwc9pJtoGDw27JnaeCATyvSkorVev6aES+s3evOWGv2eZ4S4ZQmr3dLrS1ji
         P75ZaYIR630JDnG938lXkgTpAzoCDm25UQTJicgxSxrC3C5xMLuqUAPnjpjFrMhTltvf
         5nOShkedMWMDsdiQC31T8R7CGcauuP/Smnv++IlvHsPbYsldV+8gK/muWzPtBUnpiWnm
         Edf/xMXcnyiN3A+Aoitl4bcEl0LNRK/bxRLNRAcSY4buq6wTKN2GYV7kQg0AX0DercuO
         4x6z9zmJyS5hNtZA48bVcCbR5vHvKIoMRTebZWJTjQO8cX5BYJGXGALHEndzBJd2BeEM
         QaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684231773; x=1686823773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lEOYeeU5eTLm7de7UnRvbY+9wcsAqP7XOcqCDjWADA=;
        b=BBnTxO2XEmvtaDwMQa3vlMulmdNBcoXbrayP6YUmrV9MLeOPR1h5w8B96Vbg8Lc0dN
         ToPBkZLTC/Ap0Tsq7MapG6ePEpxWR1gV9IGVVYk+04AQa3nO5h+TV3Q918FqTcciCRd7
         7XiyAsv/OKHUuGwtoKY0Tecj5ghZuNVSEwvYihYGD5z0KNmOppUqVkB1DKXfL5FBEen5
         iqj4l3kV+vjUjT2eXBHYVymZeM7e0Y7ZvHJJRMUh+oNEi8pn8iChvNAM177tAprXBGQ6
         3FaBI8e/z5hmtjg7fUxxcDZr562JGh+8cc+sPqy+kuRPfrouyhaMchWdL1+IhrIb/Kqb
         avIA==
X-Gm-Message-State: AC+VfDw7tEQ0Za/5EdvIWNrBJGwBHbZP38a/nu6RM5TeLYvCwCl2MYl6
        MwR9HDhUnPICZEtpfdtj8grBiPFAThXF0IMtrakFtA==
X-Google-Smtp-Source: ACHHUZ6TLbLYd474B27i7fOyl3BsnPpQ4fbmukWnlRJS2Ui51PNk1Fw9UBPkdN9uxCCarlSOI3HX0KcO/kJKITuV9Sk=
X-Received: by 2002:a1f:6dc6:0:b0:44f:eb0a:77db with SMTP id
 i189-20020a1f6dc6000000b0044feb0a77dbmr13395898vkc.11.1684231772863; Tue, 16
 May 2023 03:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org> <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
 <ZFvGqD//pm/lZb+p@FVFF77S0Q05N.cambridge.arm.com> <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
In-Reply-To: <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Tue, 16 May 2023 15:39:21 +0530
Message-ID: <CAFA6WYOU8HW2JVBfCeFEkn-5cd81TM-x=ArUKeaSi3NzxgKaGQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] arm64: Add framework to turn an IPI as NMI
To:     Doug Anderson <dianders@chromium.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Marc Zyngier <maz@kernel.org>, ito-yuichi@fujitsu.com,
        kgdb-bugreport@lists.sourceforge.net, Chen-Yu Tsai <wens@csie.org>,
        Masayoshi Mizuma <msys.mizuma@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <swboyd@chromium.org>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-perf-users@vger.kernel.org,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Ben Dooks <ben-linux@fluff.org>,
        Borislav Petkov <bp@alien8.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jinyang He <hejinyang@loongson.cn>,
        Joey Gouly <joey.gouly@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
        Pierre Gondois <Pierre.Gondois@arm.com>,
        Qing Zhang <zhangqing@loongson.cn>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
        x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 10 May 2023 at 22:20, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, May 10, 2023 at 9:30=E2=80=AFAM Mark Rutland <mark.rutland@arm.co=
m> wrote:
> >
> > On Wed, May 10, 2023 at 08:28:17AM -0700, Doug Anderson wrote:
> > > Hi,
> >
> > Hi Doug,
> >
> > > On Wed, Apr 19, 2023 at 3:57=E2=80=AFPM Douglas Anderson <dianders@ch=
romium.org> wrote:
> > > > This is an attempt to resurrect Sumit's old patch series [1] that
> > > > allowed us to use the arm64 pseudo-NMI to get backtraces of CPUs an=
d
> > > > also to round up CPUs in kdb/kgdb. The last post from Sumit that I
> > > > could find was v7, so I called this series v8. I haven't copied all=
 of
> > > > his old changelongs here, but you can find them from the link.
> > > >

Thanks Doug for picking up this work and for all your additions/improvement=
s.

> > > > Since v7, I have:
> > > > * Addressed the small amount of feedback that was there for v7.
> > > > * Rebased.
> > > > * Added a new patch that prevents us from spamming the logs with id=
le
> > > >   tasks.
> > > > * Added an extra patch to gracefully fall back to regular IPIs if
> > > >   pseudo-NMIs aren't there.
> > > >
> > > > Since there appear to be a few different patches series related to
> > > > being able to use NMIs to get stack traces of crashed systems, let =
me
> > > > try to organize them to the best of my understanding:
> > > >
> > > > a) This series. On its own, a) will (among other things) enable sta=
ck
> > > >    traces of all running processes with the soft lockup detector if
> > > >    you've enabled the sysctl "kernel.softlockup_all_cpu_backtrace".=
 On
> > > >    its own, a) doesn't give a hard lockup detector.
> > > >
> > > > b) A different recently-posted series [2] that adds a hard lockup
> > > >    detector based on perf. On its own, b) gives a stack crawl of th=
e
> > > >    locked up CPU but no stack crawls of other CPUs (even if they're
> > > >    locked too). Together with a) + b) we get everything (full locku=
p
> > > >    detect, full ability to get stack crawls).
> > > >
> > > > c) The old Android "buddy" hard lockup detector [3] that I'm
> > > >    considering trying to upstream. If b) lands then I believe c) wo=
uld
> > > >    be redundant (at least for arm64). c) on its own is really only
> > > >    useful on arm64 for platforms that can print CPU_DBGPCSR somehow
> > > >    (see [4]). a) + c) is roughly as good as a) + b).
> >
> > > It's been 3 weeks and I haven't heard a peep on this series. That
> > > means nobody has any objections and it's all good to land, right?
> > > Right? :-P

For me it was months waiting without any feedback. So I think you are
lucky :) or atleast better than me at poking arm64 maintainers.

> >
> > FWIW, there are still longstanding soundness issues in the arm64 pseudo=
-NMI
> > support (and fixing that requires an overhaul of our DAIF / IRQ flag
> > management, which I've been chipping away at for a number of releases),=
 so I
> > hadn't looked at this in detail yet because the foundations are still s=
omewhat
> > dodgy.
> >
> > I appreciate that this has been around for a while, and it's on my queu=
e to
> > look at.
>
> Ah, thanks for the heads up! We've been thinking about turning this on
> in production in ChromeOS because it will help us track down a whole
> class of field-generated crash reports that are otherwise opaque to
> us. It sounds as if maybe that's not a good idea quite yet? Do you
> have any idea of how much farther along this needs to go? ...of
> course, we've also run into issues with Mediatek devices because they
> don't save/restore GICR registers properly [1]. In theory, we might be
> able to work around that in the kernel.
>
> In any case, even if there are bugs that would prevent turning this on
> for production, it still seems like we could still land this series.
> It simply wouldn't do anything until someone turned on pseudo NMIs,
> which wouldn't happen till the kinks are worked out.

I agree here. We should be able to make the foundations robust later
on. IMHO, until we turn on features surrounding pseudo NMIs, I am not
sure how we can have true confidence in the underlying robustness.

-Sumit

>
> ...actually, I guess I should say that if all the patches of the
> current series do land then it actually _would_ still do something,
> even without pseudo-NMI. Assuming the last patch looks OK, it would at
> least start falling back to using regular IPIs to do backtraces. That
> wouldn't get backtraces on hard locked up CPUs but it would be better
> than what we have today where we don't get any backtraces. This would
> get arm64 on par with arm32...
>
> [1] https://issuetracker.google.com/281831288
