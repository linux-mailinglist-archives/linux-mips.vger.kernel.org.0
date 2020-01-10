Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 948F513784C
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2020 22:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbgAJVIB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jan 2020 16:08:01 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:59790 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbgAJVIB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jan 2020 16:08:01 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1iq1VU-0004ld-Ub; Fri, 10 Jan 2020 22:07:49 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 6009B105BDB; Fri, 10 Jan 2020 22:07:48 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list\:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>
Subject: Re: [RFC PATCH v2 05/10] lib: vdso: inline do_hres()
In-Reply-To: <CAK8P3a36OgFuY72b_i6+0xBNGnaxS1SsRid+HrgQHPZtUJp3LQ@mail.gmail.com>
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <d0f8dfb26c025d3e3eee1b5f610161ca19b942df.1577111367.git.christophe.leroy@c-s.fr> <CAK8P3a36OgFuY72b_i6+0xBNGnaxS1SsRid+HrgQHPZtUJp3LQ@mail.gmail.com>
Date:   Fri, 10 Jan 2020 22:07:48 +0100
Message-ID: <87o8vbrpej.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:
> On Mon, Dec 23, 2019 at 3:31 PM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>> do_hres() is called from several places, so GCC doesn't inline
>> it at first.
>>
>> do_hres() takes a struct __kernel_timespec * parameter for
>> passing the result. In the 32 bits case, this parameter corresponds
>> to a local var in the caller. In order to provide a pointer
>> to this structure, the caller has to put it in its stack and
>> do_hres() has to write the result in the stack. This is suboptimal,
>> especially on RISC processor like powerpc.
>>
>> By making GCC inline the function, the struct __kernel_timespec
>> remains a local var using registers, avoiding the need to write and
>> read stack.
>>
>> The improvement is significant on powerpc.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>
> Good idea, I can see how this ends up being an improvement
> for most of the callers.
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

  https://lore.kernel.org/r/20191112012724.250792-3-dima@arista.com

On the way to be applied.

Thanks,

        tglx
