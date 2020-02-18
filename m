Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 759A7162E7C
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2020 19:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgBRS21 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Feb 2020 13:28:27 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39134 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgBRS21 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Feb 2020 13:28:27 -0500
Received: by mail-pf1-f194.google.com with SMTP id 84so11065691pfy.6
        for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2020 10:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d3KSdYVbADc8vhuPRBnMJ0Olj+WzBHR91Wg/nozFRYA=;
        b=IaQVxnR3uw31I9KunUQW5x8fXVHpy/6d/88oLvKBtPts2zAXC4WAIdJJWQN8rU7XFZ
         F9zes4nbRbK4WtDCM3SHBBblZhNRP6VwotM4uwx/Wy2m0TO6Ps/fsNWL3WO7Y8CmBYJV
         H4XDlwgzFvNsxnyzezcpPqGpDAbmOtjnpj8zYaDld/s2Z7y+qqodtC/Zefvx7tg/s80J
         2KYLk3CgN1goeYX3nnng1hDTQqCJk2NwClrXveS8dbtg4abUilguyuJcQA8wWr9l4kIQ
         pgaHPCredNAnrNtlgdUt4o3RF/s5wlfgY9h3wpZL0cbnXyK5ZGnkuJdxRduDs7pQqboV
         22Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d3KSdYVbADc8vhuPRBnMJ0Olj+WzBHR91Wg/nozFRYA=;
        b=jFopXFXDsKjKRWNBpegOm1ezyHekGzB5fwTMkNwqDJV/H5nHvpGdqh8E8yYh7K1yRr
         BU8HoL7rxWa8wiSKpKmLo/xSUKi7+qOMckbxzGhJS4HfEo6XKDigNNqdfsJCXMIVFoC5
         7tRfbtP0rk0c9YRRMhtwTv3v0eIbqQ+QI10Rt0/k5vb9tr1oqfWG/z77248JrXZ1nRyb
         pYmCkDUSS777RZhmm7IRjq9QD8NqL7pEpatlrq+20Qt5qGcbGURZkWaPX3V8mQQZuxSh
         IQGHkWtN4vTINFMFwrQrENcm4didneSf/eEsHIgg1TQM/YtIfmOh0EDNX64oudClIHGf
         LKHQ==
X-Gm-Message-State: APjAAAUnPbz8Z44C26M2PPjsJh/nVnNeq0m0rca43toXU+1mOlqoyzcs
        3zCCHm7pdvrbgECf1swZjFguR0bWcxdMEa7thzLc+w==
X-Google-Smtp-Source: APXvYqzxsWCTzcp7XmEp9QyDTP0RELzLF7tqcKNPMkp2zhqxWNZwVbTFpSte6uGJE1AFtMU4DAqfxwEbLUnJyq5Bg/M=
X-Received: by 2002:a63:64c5:: with SMTP id y188mr23652916pgb.10.1582050506059;
 Tue, 18 Feb 2020 10:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20200217211149.44132-1-natechancellor@gmail.com>
In-Reply-To: <20200217211149.44132-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 18 Feb 2020 10:28:15 -0800
Message-ID: <CAKwvOdnRbMrXNSMAA20UnoAUKBu5X7JO+DvNTb9pebuzQbRVcw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: vdso: Wrap -mexplicit-relocs in cc-option
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 17, 2020 at 1:11 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang does not support this option and errors out:
>
> clang-11: error: unknown argument: '-mexplicit-relocs'
>
> Clang does not appear to need this flag like GCC does because the jalr
> check that was added in commit 976c23af3ee5 ("mips: vdso: add build
> time check that no 'jalr t9' calls left") passes just fine with
>
> $ make ARCH=mips CC=clang CROSS_COMPILE=mipsel-linux-gnu- malta_defconfig arch/mips/vdso/
>
> even before commit d3f703c4359f ("mips: vdso: fix 'jalr t9' crash in
> vdso code").
>
> -mrelax-pic-calls has been supported since clang 9, which is the
> earliest version that could build a working MIPS kernel, and it is the
> default for clang so just leave it be.
>
> Fixes: d3f703c4359f ("mips: vdso: fix 'jalr t9' crash in vdso code")
> Link: https://github.com/ClangBuiltLinux/linux/issues/890
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch, and detailed context.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

With this patch applied:
$ make ARCH=mips CC=clang CROSS_COMPILE=mipsel-linux-gnu-
malta_defconfig arch/mips/vdso/
$ lvm-objdump --disassemble arch/mips/vdso/vdso.so.dbg.raw | egrep -h "jarl.*t9"
$ llvm-objdump --disassemble arch/mips/vdso/vdso.so.dbg.raw | grep jarl
So jarl instructions aren't emitted.

Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/mips/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> index 77374c1f0c77..d7fe8408603e 100644
> --- a/arch/mips/vdso/Makefile
> +++ b/arch/mips/vdso/Makefile
> @@ -33,7 +33,7 @@ endif
>  cflags-vdso := $(ccflags-vdso) \
>         $(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
>         -O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
> -       -mrelax-pic-calls -mexplicit-relocs \
> +       -mrelax-pic-calls $(call cc-option, -mexplicit-relocs) \
>         -fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
>         $(call cc-option, -fno-asynchronous-unwind-tables) \
>         $(call cc-option, -fno-stack-protector)
> --

-- 
Thanks,
~Nick Desaulniers
