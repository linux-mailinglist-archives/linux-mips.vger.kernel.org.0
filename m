Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E5C2F0270
	for <lists+linux-mips@lfdr.de>; Sat,  9 Jan 2021 18:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbhAIRvg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Jan 2021 12:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbhAIRvg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Jan 2021 12:51:36 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0BBC06179F
        for <linux-mips@vger.kernel.org>; Sat,  9 Jan 2021 09:50:56 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id i5so9782196pgo.1
        for <linux-mips@vger.kernel.org>; Sat, 09 Jan 2021 09:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rz+U26z6jIIN1uPsEdI8MtvxyqTX3edy55x6DrScyKg=;
        b=c4bK3l0yv3gmB2uDggyRYvZ392JRXxNpt6ffWyyp/6G1wJPeDMGpurfYs7It0uM9uX
         0rbU6k8DigmpdRHD2ncyKGQ0y4QPAoW6EZ/ZBwLJKVdODkTf0cM/ifGELos2JR28VEPs
         ZbpGlwQQzLfB0UKEUQoeYKrXrLKgKUGQS+7Ftnh0Cw6WReD+962gWI4p50Sli1lShulk
         zDXEekr3MqZBaGgiBbxZ2pmiq33azvRRFcMJe3KhGfONRUVPrZRBaX/FjYzoQBDXXQHZ
         yAocCh0ukK+nqdnGi+i/NwddPD3WhvVJRi8EB5puWwgflLnc0YnBtYJGSkpAFXVwzRbE
         8ehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rz+U26z6jIIN1uPsEdI8MtvxyqTX3edy55x6DrScyKg=;
        b=D4BhZkNBXhg6jeawH4it/JUl/jqO/1T5gI84HBYcAyr9ruoaleRz16fknbDb3Ep3Ig
         qtuQ0V8ZgFKwHDypjrfTZWBfFTeB2oPoENnjZMvSUUx/cd6X3IC/AlbZyc0z5umN/8aa
         XJmiVTUouSTHBS628Meyhmix4iDAXA3WZ69hebIlk2GtLwCaIlub7NcuDLAZ+Yp+0AgB
         oc8P/gut9RbmJcESlMGhKRLRWPuFmZnSSHBdT2u8gXVBzft9WopCgoa6iUK1r8yZJqvR
         FqYI/8wypZJIpC8v3tG0egUQwZZDe/smn0nnhj7PEjmvnMw35teFDFUuU64tPP/qiiP8
         DySQ==
X-Gm-Message-State: AOAM530altv0jNhU0JyjGKalk2Rpco1lOD235IqlThEgUCsE7pWmadD5
        DmYzR+vWTZEO7GyCQrs9zRCyfQ5eHjJGlyY2b5jP0w==
X-Google-Smtp-Source: ABdhPJyJP3tazaWOmwaeqbiNSqIF4LtHAbHFNqsY7t9yn3KE2WlrRzEN5UBeo4m5E5d/MzfFWhSdDcnkddpynrl5QIs=
X-Received: by 2002:a63:1142:: with SMTP id 2mr12540451pgr.263.1610214655571;
 Sat, 09 Jan 2021 09:50:55 -0800 (PST)
MIME-Version: 1.0
References: <20210109171058.497636-1-alobakin@pm.me>
In-Reply-To: <20210109171058.497636-1-alobakin@pm.me>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Sat, 9 Jan 2021 09:50:44 -0800
Message-ID: <CAKwvOdmV2tj4Uyz1iDkqCj+snWPpnnAmxJyN+puL33EpMRPzUw@mail.gmail.com>
Subject: Re: [BUG mips llvm] MIPS: malformed R_MIPS_{HI16,LO16} with LLVM
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jan 9, 2021 at 9:11 AM Alexander Lobakin <alobakin@pm.me> wrote:
>
> Machine: MIPS32 R2 Big Endian (interAptiv (multi))
>
> While testing MIPS with LLVM, I found a weird and very rare bug with
> MIPS relocs that LLVM emits into kernel modules. It happens on both
> 11.0.0 and latest git snapshot and applies, as I can see, only to
> references to static symbols.
>
> When the kernel loads the module, it allocates a space for every
> section and then manually apply the relocations relative to the
> new address.
>
> Let's say we have a function phy_probe() in drivers/net/phy/libphy.ko.
> It's static and referenced only in phy_register_driver(), where it's
> used to fill callback pointer in a structure.
>
> The real function address after module loading is 0xc06c1444, that
> is observed in its ELF st_value field.
> There are two relocs related to this usage in phy_register_driver():
>
> R_MIPS_HI16 refers to 0x3c010000
> R_MIPS_LO16 refers to 0x24339444
>
> The address of .text is 0xc06b8000. So the destination is calculated
> as follows:
>
> 0x00000000 from hi16;
> 0xffff9444 from lo16 (sign extend as it's always treated as signed);
> 0xc06b8000 from base.
>
> = 0xc06b1444. The value is lower than the real phy_probe() address
> (0xc06c1444) by 0x10000 and is lower than the base address of
> module's .text, so it's 100% incorrect.
>
> This results in:
>
> [    2.204022] CPU 3 Unable to handle kernel paging request at virtual
> address c06b1444, epc == c06b1444, ra == 803f1090
>
> The correct instructions should be:
>
> R_MIPS_HI16 0x3c010001
> R_MIPS_LO16 0x24339444
>
> so there'll be 0x00010000 from hi16.
>
> I tried to catch those bugs in arch/mips/kernel/module.c (by checking
> if the destination is lower than the base address, which should never
> happen), and seems like I have only 3 such places in libphy.ko (and
> one in nf_tables.ko).
> I don't think it should be handled somehow in mentioned source code
> as it would look rather ugly and may break kernels build with GNU
> stack, which seems to not produce such bad codes.
>
> If I should report this to any other resources, please let me know.
> I chose clang-built-linux and LKML as it may not happen with userland
> (didn't tried to catch).

Thanks for the report.  Sounds like we may indeed be producing an
incorrect relocation.  This is only seen for big endian triples?

Getting a way for us to deterministically reproduce would be a good
first step.  Which config or configs beyond defconfig, and which
relocations specifically are you observing this with?
-- 
Thanks,
~Nick Desaulniers
