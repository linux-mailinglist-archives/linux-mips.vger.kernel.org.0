Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DC327A9DB
	for <lists+linux-mips@lfdr.de>; Mon, 28 Sep 2020 10:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgI1Io7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Sep 2020 04:44:59 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33891 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgI1Io7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Sep 2020 04:44:59 -0400
Received: by mail-ot1-f67.google.com with SMTP id h17so173766otr.1;
        Mon, 28 Sep 2020 01:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+DcW7q0H0ZVFIUEi3RFzHxCg7FFHcjF7fHnrcfvM4IU=;
        b=q2II+y7eJnnKG7wQa6jQz4uKjayn+Az5/8T+nWygerrZFWV+6u6Vvzh5bXS+68NebE
         LsIF8o1yIDwfoHSvQvwVeaDvury4sY6Sflx0bftRW1Ue+FLy0DVFntB8D8F9H+IV2pqb
         uQdQcO4aj4eb0DUr1r6SaUuTzXD6XWVeCRM7luiOwUQ5CKJXa5hnKFQH8UsJ6nHtox71
         0BVqZLTjwx+YgZSHH2g82kj2p9aMEAevbecDSc8VnDl2aw7RpYC6/urj5HA3+DEr0zZu
         34rxw0OilhEJ12m6/dY3kSdn7LMJnYaBFiz6+3FS2fJeS9eVfbdSSDVFxooLz1mmEQ+B
         z3qQ==
X-Gm-Message-State: AOAM5334j+ncvXsgdqUZe+8+ktS/FNxWS0Hu4do4/FzYYqdanr0HnV3x
        ulmiO92NsnZFMsZkYeZ0/8ZI5cxVwzgegiaBMwmct8pxgRI=
X-Google-Smtp-Source: ABdhPJxCSaOfqDvuSMKME3O5ddPQeiuqY9m+SHu/ZcFSQWMXe+d4dM+9hWcBJ5qlUCeu4diZdc0ID6SitEV89BYovdI=
X-Received: by 2002:a05:6830:1008:: with SMTP id a8mr229588otp.107.1601282698078;
 Mon, 28 Sep 2020 01:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200928063603.22564-1-geert@linux-m68k.org>
In-Reply-To: <20200928063603.22564-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Sep 2020 10:44:47 +0200
Message-ID: <CAMuHMdW-k05Czd4C9mq1ny9BhJUBt_=MW+digqE0ycTgWm2q4w@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.9-rc7
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 28, 2020 at 8:59 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.9-rc7[1] to v5.9-rc6[3], the summaries are:
>   - build errors: +5/-3

  + error: modpost: "fw_arg3" [drivers/mtd/parsers/bcm63xxpart.ko]
undefined!:  => N/A

mips-allmodconfig (It's back, first seen in v5.9-rc1)

  + error: arch/sparc/kernel/head_32.o: relocation truncated to fit:
R_SPARC_WDISP22 against `.init.text':  => (.head.text+0x5040),
(.head.text+0x5100)
  + error: arch/sparc/kernel/head_32.o: relocation truncated to fit:
R_SPARC_WDISP22 against symbol `leon_smp_cpu_startup' defined in .text
section in arch/sparc/kernel/trampoline_32.o:  => (.init.text+0xa4)
  + error: arch/sparc/kernel/process_32.o: relocation truncated to
fit: R_SPARC_WDISP22 against `.text':  => (.fixup+0xc), (.fixup+0x4)
  + error: arch/sparc/kernel/signal_32.o: relocation truncated to fit:
R_SPARC_WDISP22 against `.text':  => (.fixup+0x28), (.fixup+0x4),
(.fixup+0x10), (.fixup+0x1c), (.fixup+0x34)

Probably nothing we can do?

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/a1b8638ba1320e6684aa98233c15255eb803fac7/ (all 192 configs)

> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/ba4f184e126b751d1bffad5897f263108befc780/ (all 192 configs)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
