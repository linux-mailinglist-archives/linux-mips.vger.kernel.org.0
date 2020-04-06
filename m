Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E29E019FCEC
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2020 20:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgDFSRS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Apr 2020 14:17:18 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55601 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727547AbgDFSRJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Apr 2020 14:17:09 -0400
Received: by mail-pj1-f66.google.com with SMTP id fh8so183532pjb.5
        for <linux-mips@vger.kernel.org>; Mon, 06 Apr 2020 11:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QajOetIheYc6yFfn5cGXMzoheGBlCxA/mL7SE7Ps7+Y=;
        b=i1GU0TXcRTrIK6ml6JtkYY0yUET+I0aZOROJzKxs15NqJj4ooP/Khnpk5SlXzB0pKz
         lYQvJlybxyZgU5l+H5YtrUX/lSfvM6dUy2Ji53n/c3GKaKhpNHoCzrksnmsCt0jQ6jNu
         Ema3D+STgHzRn7jQlZY/u8ckaR9CGnnE8fwBJjh/I618ZupFF675g+w3N9PGFt/I8WO6
         V0dHWeHrH69undlHyIemld5sXtywcREzJ5tvP9cD1LZgdtFthxnjyVoYU9QN/id363tp
         aL55rh4VSl9uDAaFUlV8VDQMd74Ya0Nx2EZQK5nuxqXHmy7S/nXn7+tt7GXO89JSNwaW
         zrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QajOetIheYc6yFfn5cGXMzoheGBlCxA/mL7SE7Ps7+Y=;
        b=QR9z702wLTJ+U8STNDiv+2sKoH4PhS7sXbd40Kb3tSM0bt/0aApZ2dMGx8jdZsEf6b
         zGQOc3xcfXN4i+aOHsI+z8GZDByPDkIZVyffTnwnoZyiGVWrDm3GJ40HLClJZCIL+9Gi
         pdjlslYJcocdzJTpKz2Ep6E5qSxv8XBYroQ6q1jZwqux9pNleX+TVr2UhZESDyxDMY+a
         Hpi1DDVkRNuUqHcrdqDBtCeGW1I2pybc5c4w8epcyhqNFceorKGv3aNJL1+8ysvFVZfs
         TjNYicksfMrcAJxjAwmSOmVPJeMul8hbLw1paXmzsFQZIJzYicgeZBgCn9lmgxJ8zlZC
         yy7w==
X-Gm-Message-State: AGi0PubdfqxAkfLQrr8/uKEQ2CNoukK3m9Ecmi78UgF3aeHTw8GOTwdN
        Ww4bgKn3tVLIgnrGTSSMQVcSQpuKTaiYyQoWushHPA==
X-Google-Smtp-Source: APiQypLCp7t3h+6346geWCdUsx0/lS+7zihtrFuJoEZhdpUOzAzHYdVIsmSt/wPY3djawkdqH324uD1slvMx1toMJis=
X-Received: by 2002:a17:902:bb91:: with SMTP id m17mr21132416pls.223.1586197027464;
 Mon, 06 Apr 2020 11:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200405163052.18942-1-masahiroy@kernel.org>
In-Reply-To: <20200405163052.18942-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 6 Apr 2020 11:16:57 -0700
Message-ID: <CAKwvOdmEcC7SszqpEYeT3v_gi89vAyDyofZaKkfF_YhEXu=E5A@mail.gmail.com>
Subject: Re: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and prom_free_prom_memory
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux-MIPS <linux-mips@linux-mips.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 5, 2020 at 9:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
> is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
> CONFIG_SGI_IP32 is enabled.

I'm curious if this issue is affected by other combinations of files
that each define prom_meminit with external linkage and symbol
visibility.  I would expect __weak to be used when there's a base
implementation that we expect to be overridden, but I don't think
that's what's happening in this case.  It's not clear to me which
definition would be the default, let alone the one in
arch/mips/fw/arc/memory.c.

Looks like CONFIG_SGI_IP32 selects CONFIG_FW_ARC, so it's not clear
why arch/mips/sgi-ip32/ip32-memory.c and arch/mips/fw/arc/memory.c
define different implementations of prom_meminit, and which one was
expected to be used.

Hopefully the maintainers can clarify.

>
> The use of EXPORT_SYMBOL in static libraries potentially causes a
> problem for the llvm linker [1]. So, I want to forcibly link lib-y
> objects to vmlinux when CONFIG_MODULES=y.
>
> As a groundwork, we must fix multiple definitions that have previously
> been hidden by lib-y.
>
> The prom_cleanup() in this file is already marked as __weak (because
> it is overridden by the one in arch/mips/sgi-ip22/ip22-mc.c).
> I think it should be OK to do the same for these two.
>
> [1]: https://github.com/ClangBuiltLinux/linux/issues/515
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> If MIPS maintainers ack this patch,
> I want to inser it before the following patch:
>
> https://patchwork.kernel.org/patch/11432969/
>
>  arch/mips/fw/arc/memory.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
> index dbbcddc82823..89fa6e62a3b3 100644
> --- a/arch/mips/fw/arc/memory.c
> +++ b/arch/mips/fw/arc/memory.c
> @@ -117,7 +117,7 @@ static int __init prom_memtype_classify(union linux_memtypes type)
>         return memtype_classify_arc(type);
>  }
>
> -void __init prom_meminit(void)
> +void __weak __init prom_meminit(void)
>  {
>         struct linux_mdesc *p;
>
> @@ -162,7 +162,7 @@ void __weak __init prom_cleanup(void)
>  {
>  }
>
> -void __init prom_free_prom_memory(void)
> +void __weak __init prom_free_prom_memory(void)
>  {
>         int i;
>
> --

-- 
Thanks,
~Nick Desaulniers
