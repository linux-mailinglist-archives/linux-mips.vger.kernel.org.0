Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52022AAD1D
	for <lists+linux-mips@lfdr.de>; Sun,  8 Nov 2020 20:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbgKHTET (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Nov 2020 14:04:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:41900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728593AbgKHTES (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 8 Nov 2020 14:04:18 -0500
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 182162222F
        for <linux-mips@vger.kernel.org>; Sun,  8 Nov 2020 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604862257;
        bh=G3mBFGlukO1nFx4YqidcYEcNmTme4p2P3ZdH+j7gafc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KKc4WUz9Em9SWDIh+KRRGEGU7PjvugeFoUnanYblzQ6NRxJsQR5QLoqkr5fEa01W0
         vllgsLbdmgLGfWQV7Vn5VcygJq0C5iKd8LLf4jypKu0rAgIXo1Us8ien1Q73S7TBjn
         Zma+rSpP8xjwvB7/ZU65R6AmsKSgMMtBmAS85N2U=
Received: by mail-lf1-f43.google.com with SMTP id j205so1750779lfj.6
        for <linux-mips@vger.kernel.org>; Sun, 08 Nov 2020 11:04:17 -0800 (PST)
X-Gm-Message-State: AOAM530pt8spJY4OpdR3xjXvfvL9rR+3whrWx+9fTFf+4vs9AhVXiZw3
        puWlMSmxy1f8Ab6Fu/0js09z2NcnBdrOD1mm7FMv4A==
X-Google-Smtp-Source: ABdhPJxjD2LU3VlRJBp1Tg40gqDBVMvZgDYQA5JtYVojn/CIpU7K+H2jw6ZNUPR/CRJtJQsfwtLOZVs1ajk33pYp5WE=
X-Received: by 2002:a05:6000:1252:: with SMTP id j18mr14108850wrx.18.1604862255135;
 Sun, 08 Nov 2020 11:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20201108051730.2042693-1-dima@arista.com> <20201108051730.2042693-15-dima@arista.com>
In-Reply-To: <20201108051730.2042693-15-dima@arista.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Sun, 8 Nov 2020 11:04:03 -0800
X-Gmail-Original-Message-ID: <CALCETrUYJB3SMFEfD0CiVk9FMAA7uGqescaQLokuPRcPUbYoqg@mail.gmail.com>
Message-ID: <CALCETrUYJB3SMFEfD0CiVk9FMAA7uGqescaQLokuPRcPUbYoqg@mail.gmail.com>
Subject: Re: [PATCH 14/19] mm: Add user_landing in mm_struct
To:     Dmitry Safonov <dima@arista.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Nov 7, 2020 at 9:18 PM Dmitry Safonov <dima@arista.com> wrote:
>
> Instead of having every architecture to define vdso_base/vdso_addr etc,
> provide a generic mechanism to track landing in userspace.
> It'll minimize per-architecture difference, the number of callbacks to
> provide.
>
> Originally, it started from thread [1] where the need for .close()
> callback on vm_special_mapping was pointed, this generic code besides
> removing duplicated .mremap() callbacks provides a cheaper way to
> support munmap() on vdso mappings without introducing .close() callbacks
> for every architecture (with would bring even more code duplication).

I find the naming odd.  It's called "user_landing", which is
presumably a hard-to-understand shorthand for "user mode landing pad
for return from a signal handler if SA_RESTORER is not set".  But,
looking at the actual code, it's not this at all -- it's just the vDSO
base address.

So how about just calling it vdso_base?  I'm very much in favor of
consolidating and cleaning up, and improving the vdso remap/unmap
code, but I'm not convinced that we should call it anything other than
the vdso base.

--Andy
