Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0F6614C6C0
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2020 08:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgA2HOt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jan 2020 02:14:49 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:50476 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgA2HOs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jan 2020 02:14:48 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1iwhYR-0003r2-Ta; Wed, 29 Jan 2020 08:14:28 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 66BB8101227; Wed, 29 Jan 2020 08:14:27 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     Christophe Leroy <christophe.leroy@c-s.fr>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        Arnd Bergmann <arnd@arndb.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andrew Lutomirski <luto@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list\:MIPS" <linux-mips@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Subject: Re: [RFC PATCH v4 10/11] lib: vdso: Allow arches to override the ns shift operation
In-Reply-To: <CALCETrX5B0SEJN2WG7rzuzbGhWa_dEwVVpMu6deXof3H+K_LdQ@mail.gmail.com>
References: <cover.1579196675.git.christophe.leroy@c-s.fr> <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr> <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com> <877e1rfa40.fsf@nanos.tec.linutronix.de> <CALCETrX5B0SEJN2WG7rzuzbGhWa_dEwVVpMu6deXof3H+K_LdQ@mail.gmail.com>
Date:   Wed, 29 Jan 2020 08:14:27 +0100
Message-ID: <87mua64tv0.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Andy Lutomirski <luto@kernel.org> writes:

> On Thu, Jan 16, 2020 at 11:57 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> Andy Lutomirski <luto@kernel.org> writes:
>> > On Thu, Jan 16, 2020 at 9:58 AM Christophe Leroy
>> >
>> > Would mul_u64_u64_shr() be a good alternative?  Could we adjust it to
>> > assume the shift is less than 32?  That function exists to benefit
>> > 32-bit arches.
>>
>> We'd want mul_u64_u32_shr() for this. The rules for mult and shift are:
>>
>
> That's what I meant to type...

Just that it does not work. The math is:

     ns = d->nsecs;   // That's the nsec value shifted left by d->shift

     ns += ((cur - d->last) & d->mask) * mult;

     ns >>= d->shift;

So we cannot use mul_u64_u32_shr() because we need the addition there
before shifting. And no, we can't drop the fractional part of
d->nsecs. Been there, done that, got sporadic time going backwards
problems as a reward. Need to look at that again as stuff has changed
over time.

On x86 we enforce that mask is 64bit, so the & operation is not there,
but due to the nasties of TSC we have that conditional

    if (cur > last)
       return (cur - last) * mult;
    return 0;

Christophe, on PPC the decrementer/RTC clocksource masks are 64bit as
well, so you can spare that & operation there too.

Thanks,

        tglx



