Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF20137827
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2020 21:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgAJU43 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jan 2020 15:56:29 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:59751 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbgAJU43 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jan 2020 15:56:29 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1iq1KD-0004bR-TU; Fri, 10 Jan 2020 21:56:10 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 400F9105BDB; Fri, 10 Jan 2020 21:56:09 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Andy Lutomirski <luto@kernel.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andrew Lutomirski <luto@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list\:MIPS" <linux-mips@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Subject: Re: [RFC PATCH v2 01/10] lib: vdso: ensure all arches have 32bit fallback
In-Reply-To: <CALCETrULuV5iAU3kSjMdcpV6DFGEw1z2so0DfDca6hoLB4X4cA@mail.gmail.com>
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr> <CALCETrULuV5iAU3kSjMdcpV6DFGEw1z2so0DfDca6hoLB4X4cA@mail.gmail.com>
Date:   Fri, 10 Jan 2020 21:56:09 +0100
Message-ID: <87sgknrpxy.fsf@nanos.tec.linutronix.de>
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

> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>> In order to simplify next step which moves fallback call at arch
>> level, ensure all arches have a 32bit fallback instead of handling
>> the lack of 32bit fallback in the common code based
>> on VDSO_HAS_32BIT_FALLBACK
>
> I don't like this.  You've implemented what appear to be nonsensical
> fallbacks (the 32-bit fallback for a 64-bit vDSO build?  There's no
> such thing).
>
> How exactly does this simplify patch 2?

There is a patchset from Vincenzo which fell through the cracks which
addresses the VDS_HAS_32BIT_FALLBACK issue properly. I'm about to pick
it up. See:

 https://lore.kernel.org/lkml/20190830135902.20861-1-vincenzo.frascino@arm.com/

Thanks,

        tglx
