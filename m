Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A9F13FA75
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 21:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387470AbgAPUVN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 15:21:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:39342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733229AbgAPUVN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jan 2020 15:21:13 -0500
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B76BA2176D
        for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2020 20:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579206073;
        bh=OJ3J83vIabY7xpZcvf2DhJwhjwaTMS+skFpIApuBtEg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JwJh0aadu+1koOsCzuKbeJgCqbsIVa6wXIh8eamq0w+FvzAqXxq1gzv8bKewX5JJr
         0LAd9SvjVMiaRKM5KNjw31n84OCJ2j4cgsYpXVB0SkUt2m3i7hsGJGrA4rHRu2s8jX
         GTY3J7+SCPPk/KJcvWhkGBpCaGlX6oQ/4joEhUUo=
Received: by mail-wr1-f41.google.com with SMTP id z3so20511439wru.3
        for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2020 12:21:12 -0800 (PST)
X-Gm-Message-State: APjAAAVNOvjUBRdMlaW/5UijpsnBx0n5YjLwIGeAGdrFXWCg/rciamag
        5ZvSrpIyqJD7jGENi1Cu4XlKGgFiPavfGdJ1xfG7ow==
X-Google-Smtp-Source: APXvYqyJFUWBWMkFpVuosDSd8/lQDbzy6zF5xwHRHcZ1pdoSXL/YmNp4uOFO1NJDoLptUYmOV9mv1qxrQ7fzMgsykOE=
X-Received: by 2002:adf:8041:: with SMTP id 59mr4939370wrk.257.1579206071239;
 Thu, 16 Jan 2020 12:21:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579196675.git.christophe.leroy@c-s.fr> <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr>
 <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com> <877e1rfa40.fsf@nanos.tec.linutronix.de>
In-Reply-To: <877e1rfa40.fsf@nanos.tec.linutronix.de>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 16 Jan 2020 12:20:59 -0800
X-Gmail-Original-Message-ID: <CALCETrX5B0SEJN2WG7rzuzbGhWa_dEwVVpMu6deXof3H+K_LdQ@mail.gmail.com>
Message-ID: <CALCETrX5B0SEJN2WG7rzuzbGhWa_dEwVVpMu6deXof3H+K_LdQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 10/11] lib: vdso: Allow arches to override the ns
 shift operation
To:     Thomas Gleixner <tglx@linutronix.de>
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
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 16, 2020 at 11:57 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Andy Lutomirski <luto@kernel.org> writes:
> > On Thu, Jan 16, 2020 at 9:58 AM Christophe Leroy
> >
> > Would mul_u64_u64_shr() be a good alternative?  Could we adjust it to
> > assume the shift is less than 32?  That function exists to benefit
> > 32-bit arches.
>
> We'd want mul_u64_u32_shr() for this. The rules for mult and shift are:
>

That's what I meant to type...

>      1 <= mult <= U32_MAX
>
>      1 <= shift <= 32
>
> If we want to enforce a shift < 32 we need to limit that conditionally
> in the calculation/registration function.
>
> Thanks,
>
>         tglx
>
