Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F56B164506
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 14:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgBSNI5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 08:08:57 -0500
Received: from gate.crashing.org ([63.228.1.57]:38973 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgBSNI5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 Feb 2020 08:08:57 -0500
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 01JD8ATq027345;
        Wed, 19 Feb 2020 07:08:10 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 01JD88xt027342;
        Wed, 19 Feb 2020 07:08:08 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Wed, 19 Feb 2020 07:08:08 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Christophe Leroy <christophe.leroy@c-s.fr>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Subject: Re: Surprising code generated for vdso_read_begin()
Message-ID: <20200219130808.GU22482@gate.crashing.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr> <20200109200733.GS3191@gate.crashing.org> <77a8bf25-6615-6c0a-56d4-eae7aa8a8f09@c-s.fr> <20200111113328.GX3191@gate.crashing.org> <CAK8P3a11wX1zJ+TAacDTkYsrzvfdVmNrcB6OC23aFvCxF57opQ@mail.gmail.com> <305fcee5-2e1b-ea4d-9a2a-a0e8034d40a8@c-s.fr> <CAK8P3a0SfCwP04CJPThCuDmngGhwtejN8Px_UQpSwi=s_ww=bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a0SfCwP04CJPThCuDmngGhwtejN8Px_UQpSwi=s_ww=bw@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 19, 2020 at 10:52:16AM +0100, Arnd Bergmann wrote:
> On Wed, Feb 19, 2020 at 9:45 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
> > Le 16/02/2020 à 19:10, Arnd Bergmann a écrit :
> > > On Sat, Jan 11, 2020 at 12:33 PM Segher Boessenkool
> > > <segher@kernel.crashing.org> wrote:
> > >>
> > >> On Fri, Jan 10, 2020 at 07:45:44AM +0100, Christophe Leroy wrote:
> > >>> Le 09/01/2020 à 21:07, Segher Boessenkool a écrit :
> > >>>> It looks like the compiler did loop peeling.  What GCC version is this?
> > >>>> Please try current trunk (to become GCC 10), or at least GCC 9?
> > >>>
> > >>> It is with GCC 5.5
> > >>>
> > >>> https://mirrors.edge.kernel.org/pub/tools/crosstool/ doesn't have more
> > >>> recent than 8.1
> > >>
> > >> Arnd, can you update the tools?  We are at 8.3 and 9.2 now :-)  Or is
> > >> this hard and/or painful to do?
> > >
> > > To follow up on this older thread, I have now uploaded 6.5, 7.5, 8.3 and 9.2
> > > binaries, as well as a recent 10.0 snapshot.
> > >
> >
> > Thanks Arnd,
> >
> > I have built the VDSO with 9.2, I get less performant result than with
> > 8.2 (same performance as with 5.5).
> >
> > After a quick look, I see:
> > - Irrelevant NOPs to align loops and stuff, allthough -mpcu=860 should
> > avoid that.
> > - A stack frame is set for saving r31 in __c_kernel_clock_gettime. GCC
> > 8.1 don't need that, all VDSO functions are frameless with 8.1
> 
> If you think it should be fixed in gcc, maybe try to reproduce it in
> https://godbolt.org/

(Feel free to skip this step; and don't put links to godbolt (or anything
else external) in our bugzilla, please; such links go stale before you
know it.)

> and open a gcc bug against that.

Yes please :-)

> Also, please try the gcc-10 snapshot, which has the highest chance
> of getting fixes if it shows the same issue (or worse).

If it is a regression, chances are it will be backported.  (But not to
9.3, which is due in just a few weeks, just like 8.4).  If it is just a
side effect of some other change, it will probably *not* be undone, not
on trunk (GCC 10) either.  It depends.

But sure, always test trunk if you can.


Segher
