Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCF8313B5A0
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2020 00:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgANXGV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jan 2020 18:06:21 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:45372 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728650AbgANXGU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jan 2020 18:06:20 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1irVG6-0000Gr-Ci; Wed, 15 Jan 2020 00:06:02 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id D20E7105BC2; Wed, 15 Jan 2020 00:06:01 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Christophe Leroy <christophe.leroy@c-s.fr>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Subject: Re: [RFC PATCH v3 08/12] lib: vdso: allow arches to provide vdso data pointer
In-Reply-To: <381e547dbb3c48fd39d6cf208033bba38ad048fb.1578934751.git.christophe.leroy@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr> <381e547dbb3c48fd39d6cf208033bba38ad048fb.1578934751.git.christophe.leroy@c-s.fr>
Date:   Wed, 15 Jan 2020 00:06:01 +0100
Message-ID: <87ftghbpuu.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Christophe Leroy <christophe.leroy@c-s.fr> writes:
>  
>  static __maybe_unused int
> +#ifdef VDSO_GETS_VD_PTR_FROM_ARCH
> +__cvdso_clock_gettime_common(const struct vdso_data *vd, clockid_t clock,
> +		      struct __kernel_timespec *ts)
> +{
> +#else
>  __cvdso_clock_gettime_common(clockid_t clock, struct __kernel_timespec *ts)
>  {
>  	const struct vdso_data *vd = __arch_get_vdso_data();
> +#endif
>  	u32 msk;

If we do that, then there is no point in propagating this to the inner
functions. It's perfectly fine to have this distinction at the outermost
level.

As a related question, I noticed that you keep all that ASM voodoo in
the PPC specific code which provides the actual entry points. Is that
ASM code really still necessary? All current users of the generic VDSO
just do something like:

int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
{
        return __cvdso_clock_gettime(clock, ts);
}

in the architecture code. Is there a reason why this can't work on PPC?

Thanks,

        tglx
