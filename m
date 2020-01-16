Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7488613D808
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 11:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgAPKff convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 16 Jan 2020 05:35:35 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:51161 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgAPKff (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 05:35:35 -0500
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1is2Uf-00048X-Ra; Thu, 16 Jan 2020 11:35:17 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 7755E101B66; Thu, 16 Jan 2020 11:35:17 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Christophe Leroy <christophe.leroy@c-s.fr>, luto@kernel.org
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        vincenzo.frascino@arm.com, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [RFC PATCH v3 08/12] lib: vdso: allow arches to provide vdso data pointer
In-Reply-To: <b5fddcf8-99ff-fc0d-40c0-0eb81ad4e94a@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr> <381e547dbb3c48fd39d6cf208033bba38ad048fb.1578934751.git.christophe.leroy@c-s.fr> <87ftghbpuu.fsf@nanos.tec.linutronix.de> <d2de3211-9d7c-513e-fe0f-8bdce623fb65@c-s.fr> <b5fddcf8-99ff-fc0d-40c0-0eb81ad4e94a@c-s.fr>
Date:   Thu, 16 Jan 2020 11:35:17 +0100
Message-ID: <87k15rwuxm.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 15/01/2020 à 07:15, Christophe Leroy a écrit :
>  From your point of view, what should I do:
> A/ __arch_get_vdso_data() handled entirely at arch level and arches 
> handing over the vdso data pointer to generic C VDSO functions all the 
> time (as in my v2 series) ?

No. That's again moving the same code to all architectures.

> B/ Data pointer being handed over all the way up for arches wanting to 
> do so, no changes at all for others (as in my v3 series) ?

Too much ifdeffery

> C/ __arch_get_vdso_data() being called at the outermost generic level 
> for arches not interested in handling data pointer from the caller (as 
> suggested by Thomas) ?
>
> Andy, with A/ you were concerned about arches being able to do PC 
> related accesses. Would it be an issue for C/ as well ? If not, I guess 
> C/ would be cleaner than B/ allthought not as clean as A which doesn't 
> add any #ifdefery at all.

You can avoid ifdeffery with C if you do:

static __maybe_unused int
__cvdso_data_clock_gettime(clockid_t clock, struct __kernel_timespec *ts,
                           const struct vdso_data *vd)
{
        .....
}

static __maybe_unused int
__cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
{
        const struct vdso_data *vd = __arch_get_vdso_data();

        return __cvdso_data_clock_gettime(clock, ts, vd);
}

and then use __cvdso_data_clock_gettime on PPC and let the other archs
unmodified.

Thanks,

        tglx
