Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3446C2C34B6
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 00:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389049AbgKXXiC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Nov 2020 18:38:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:40234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389053AbgKXXiA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Nov 2020 18:38:00 -0500
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2DA142173E
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2020 23:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606261079;
        bh=IwPutqnzffVWLVgZ0+96yDw632rmm4npFzWcdbhrh3w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Mx/Ha9tjQe4rRpNBQ0xfJZe1ChYY+cYAeooVYt0DgRDOHxESwFWIKx9do7ZsgMR7k
         RDK/y20HWHmytlddVdSyeY1jMhoQW0TOfiNaEb0SDzQvwId4jki7qunR2ne3ree06B
         oJxHRDTLIEBcMrRrQd+ChviR34YG485LRpza79Yw=
Received: by mail-ej1-f51.google.com with SMTP id z5so425011ejp.4
        for <linux-mips@vger.kernel.org>; Tue, 24 Nov 2020 15:37:59 -0800 (PST)
X-Gm-Message-State: AOAM530npE8tw5ilCfiQfHE8wr1Thr3aqlaD73HjpzIdYqWgojwbf47Z
        e+9F+AczNF1P0SALxTGgRqvG4xbUiJSvlqV649Ogxw==
X-Google-Smtp-Source: ABdhPJzJW6y7fwGJpes1ee3tiyG9TtqlzPFcjvNqd3lrS8IvLMQkSGHKwFYIoMVL3AaQ9toEgXmZn3M1xP8eTv9x/8E=
X-Received: by 2002:a5d:5482:: with SMTP id h2mr953819wrv.18.1606261076917;
 Tue, 24 Nov 2020 15:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20201124002932.1220517-1-dima@arista.com> <20201124002932.1220517-15-dima@arista.com>
In-Reply-To: <20201124002932.1220517-15-dima@arista.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Tue, 24 Nov 2020 15:37:45 -0800
X-Gmail-Original-Message-ID: <CALCETrVGY6i5pmT-NpG84My=MYo4oLFBcNvSTtRq6jhC_mNP8A@mail.gmail.com>
Message-ID: <CALCETrVGY6i5pmT-NpG84My=MYo4oLFBcNvSTtRq6jhC_mNP8A@mail.gmail.com>
Subject: Re: [PATCH v2 14/19] mm: Add vdso_base in mm_struct
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

On Mon, Nov 23, 2020 at 4:29 PM Dmitry Safonov <dima@arista.com> wrote:
>
> Instead of having every architecture to define vdso_base/vdso_addr etc,
> provide a generic mechanism to track vdso_base for landing in userspace.
> It'll minimize per-architecture difference, the number of callbacks to
> provide.
>
> Originally, it started from thread [1] where the need for .close()
> callback on vm_special_mapping was pointed, this generic code besides
> removing duplicated .mremap() callbacks provides a cheaper way to
> support munmap() on vdso mappings without introducing .close() callbacks
> for every architecture (with would bring even more code duplication).

I admit I'm slightly dubious about passing in the old vma and
comparing its start address as opposed to using some more explicit "is
this the vdso" check, but I guess I'm okay with that.
