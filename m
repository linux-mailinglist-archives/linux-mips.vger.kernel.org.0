Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D21B108B33
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2019 10:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfKYJuV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Nov 2019 04:50:21 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40438 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfKYJuV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Nov 2019 04:50:21 -0500
Received: by mail-ot1-f65.google.com with SMTP id m15so12021637otq.7;
        Mon, 25 Nov 2019 01:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bMQwMvsg+lPwUnZvGgrwp3V8xVxHE9IKpDMhB02XS+s=;
        b=KPXh2cpuLsOEO3INDBtgCoz9MuPEqBlfu0qZ6AXelvopW/BWi871N/E8oc4BkzviAT
         tV2UG9t5S5xVnztUwf+esj5RpWAQXAEqoUrbsh18EW8HZj44L3/sVV7zoqPfq6hZ01jy
         8Tu2LWEkOdyU2rMCHjxfeHaWeKEOA9i9+gbWxOPUlG7/E0bf31j4sML71BJFMLF7LBf1
         OAREgVV464kip6jyTLW0PE9xhxhbDDf4hICrgVvoSkD9DGCyrgV3stGlH4xVbo/whsOM
         J8cXMnytd6wGKrsVpEYn70NcW6xlYRxj1K5K3UvNaX+rN6pjl3vgN0T5Hzc5ahM7GWwO
         ftDA==
X-Gm-Message-State: APjAAAXXWhjUOAY35HrcTnq4mgR/cndX3EME+GaL249DijmwiD8rg4iW
        hn8ZZq9rhJSaGWTUK0LAIogGd1dIidzyCrw87WVjrb2x
X-Google-Smtp-Source: APXvYqxCudGtj7rgIRB+xAwBzb8X+EExCAa/giJ2DnWTgefeyJAR6CwVpd7366ZFc1VH/0nORYt5XfeoW8QzIGbWoAw=
X-Received: by 2002:a05:6830:1047:: with SMTP id b7mr18387980otp.107.1574675420457;
 Mon, 25 Nov 2019 01:50:20 -0800 (PST)
MIME-Version: 1.0
References: <20191125094110.14667-1-geert@linux-m68k.org>
In-Reply-To: <20191125094110.14667-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Nov 2019 10:50:09 +0100
Message-ID: <CAMuHMdX-N2AHHpBVJCqkh1RoMxFXhGikGn4mj9E7sj0qkR4ukg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.4
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 25, 2019 at 10:44 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.4[1] to v5.4-rc8[3], the summaries are:
>   - build errors: +3/-0

  + /kisskb/src/drivers/staging/octeon/ethernet-spi.c: error:
'OCTEON_IRQ_RML' undeclared (first use in this function):  => 224:12,
198:19
  + /kisskb/src/drivers/staging/octeon/ethernet-spi.c: error:
'OCTEON_IRQ_RML' undeclared (first use in this function); did you mean
'OCTEON_IS_MODEL'?:  => 198:19, 224:12
  + /kisskb/src/drivers/staging/octeon/ethernet-tx.c: error:
'OCTEON_IRQ_TIMER1' undeclared (first use in this function):  =>
716:11, 705:18

mips-gcc8/mips-allmodconfig

All seen before, but hidden in v5.4-rcX (X > 5) by other build failures.

[1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/219d54332a09e8d8741c1e1982f5eae56099de85/
(232 out of 242 configs)
[3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/af42d3466bdc8f39806b26f593604fdc54140bcb/
(232 out of 242 configs)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
