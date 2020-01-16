Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2BD413FA11
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 20:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgAPT5Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 14:57:24 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:53194 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgAPT5X (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 14:57:23 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1isBGJ-0000KB-UP; Thu, 16 Jan 2020 20:57:04 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 6000B101226; Thu, 16 Jan 2020 20:57:03 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Andy Lutomirski <luto@kernel.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
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
In-Reply-To: <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com>
References: <cover.1579196675.git.christophe.leroy@c-s.fr> <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr> <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com>
Date:   Thu, 16 Jan 2020 20:57:03 +0100
Message-ID: <877e1rfa40.fsf@nanos.tec.linutronix.de>
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
> On Thu, Jan 16, 2020 at 9:58 AM Christophe Leroy
>
> Would mul_u64_u64_shr() be a good alternative?  Could we adjust it to
> assume the shift is less than 32?  That function exists to benefit
> 32-bit arches.

We'd want mul_u64_u32_shr() for this. The rules for mult and shift are:

     1 <= mult <= U32_MAX

     1 <= shift <= 32

If we want to enforce a shift < 32 we need to limit that conditionally
in the calculation/registration function.

Thanks,

        tglx

