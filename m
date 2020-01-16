Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 422A813F9C3
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 20:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbgAPTrv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 14:47:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:42732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729499AbgAPTrv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jan 2020 14:47:51 -0500
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D15E207FF
        for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2020 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579204070;
        bh=iWPOEPrLhN/0dUzUlwpw4/5CopjoSgUDgsorKgvcJmw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZBNmytBWuC0U8dtoZhF+ykaCrw12X24OzwI/4jlMPsTBRD4Skon1q/5BmRHCR7j36
         U0SG46PBe9dZfmajYfQMP3/t6SsA/c/cTCxLI/yJ5fRxBdrzdYEx5a5LO34zOO6yIp
         MHsX6faaZ9XilvurLWm/Gziak4DDpI+m16cZOi68=
Received: by mail-wr1-f48.google.com with SMTP id q10so20411230wrm.11
        for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2020 11:47:49 -0800 (PST)
X-Gm-Message-State: APjAAAUjvExiq3P7aqxZ8etXbIJr/1pA/CIgctDTdG/S4nv+laDqUkEv
        riddwRDycFNDZrbz6MPnoI5Ug7Aa5W/6zZjYsAWomw==
X-Google-Smtp-Source: APXvYqz0S0n0mRf01AI9EVOJj9fh0guO9GsXoYIoeeHWqI3bcsdwUWPoJm22gBkYEqJCyt4y4xlERS5rQnr9jvHcuRE=
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr4976488wrn.75.1579204068445;
 Thu, 16 Jan 2020 11:47:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579196675.git.christophe.leroy@c-s.fr> <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr>
In-Reply-To: <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 16 Jan 2020 11:47:36 -0800
X-Gmail-Original-Message-ID: <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com>
Message-ID: <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 10/11] lib: vdso: Allow arches to override the ns
 shift operation
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andrew Lutomirski <luto@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 16, 2020 at 9:58 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> On powerpc/32, GCC (8.1) generates pretty bad code for the
> ns >>= vd->shift operation taking into account that the
> shift is always < 32 and the upper part of the result is
> likely to be nul. GCC makes reversed assumptions considering
> the shift to be likely >= 32 and the upper part to be like not nul.
>
> unsigned long long shift(unsigned long long x, unsigned char s)
> {
>         return x >> s;
> }
>
> results in:
>
> 00000018 <shift>:
>   18:   35 25 ff e0     addic.  r9,r5,-32
>   1c:   41 80 00 10     blt     2c <shift+0x14>
>   20:   7c 64 4c 30     srw     r4,r3,r9
>   24:   38 60 00 00     li      r3,0
>   28:   4e 80 00 20     blr
>   2c:   54 69 08 3c     rlwinm  r9,r3,1,0,30
>   30:   21 45 00 1f     subfic  r10,r5,31
>   34:   7c 84 2c 30     srw     r4,r4,r5
>   38:   7d 29 50 30     slw     r9,r9,r10
>   3c:   7c 63 2c 30     srw     r3,r3,r5
>   40:   7d 24 23 78     or      r4,r9,r4
>   44:   4e 80 00 20     blr
>
> Even when forcing the shift with an &= 31, it still considers
> the shift as likely >= 32.
>
> Define a vdso_shift_ns() macro that can be overriden by
> arches.

Would mul_u64_u64_shr() be a good alternative?  Could we adjust it to
assume the shift is less than 32?  That function exists to benefit
32-bit arches.

--Andy
