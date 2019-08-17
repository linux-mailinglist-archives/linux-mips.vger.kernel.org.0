Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34550911EB
	for <lists+linux-mips@lfdr.de>; Sat, 17 Aug 2019 18:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbfHQQXB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Aug 2019 12:23:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36672 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfHQQXB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Aug 2019 12:23:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id k18so1822808otr.3;
        Sat, 17 Aug 2019 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KkNWyjY6i4wH5Ddws0s2bRyPMfosm9/NVsRV0Y2N3PA=;
        b=Gae8lsMgP+bqtdFraWZyNJ3QSjRTqvKKxKT4pM6SJUdpIMMZgL+pwT5603gDEytVT/
         7IfPEA5vvnTeWryo5heiMGJkAqnA08w2yfKhxvSElFgtd5W+8Jm470hzi6zroaCGJ4rw
         IRShg0E8R9s5W6TZo6nQ6/67TigSbeW3d14/CU1xYbvXmR2YdfsDfGqQbADNVpNq4OnZ
         BQtrbyMc56aC3fLcKG1YLIQxNKAHZwRXMdZ/GkmYDtfpLoKc0gIKuK/ZIJdVrw0qnGDL
         VXRtZ4uTCDCHCJ3DE3B8FJnpLOfl2Jee8DBzGa2sh+vclbL62MbrRa32N8kEoDkipkMy
         OPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KkNWyjY6i4wH5Ddws0s2bRyPMfosm9/NVsRV0Y2N3PA=;
        b=j4ZuL0vW1cEEvLqtfF4yRPXzzhQPkc6/SHG/jU45MaizEVqamTlH+kCzUWGoV5+tj8
         zKpBI+LfNQc0ms/U+G72S6T0quKnLsd68HBixk7MEwaOhBQgVe6spcO23OzsXjwPklgH
         0XawBO7BYpcPmlJdXVaQ76u0LmvDFiQ4KREMur0LbddnOsCkNPeMCt+5Ce2fXjSGsAck
         JXLxjssJNGJWsnUAZ4Nh9M5jF0QbeiEHpaMobsCWCFhHmLlA/2EU07loeAVoHv7SGe6L
         SUHxnxGUdq6ZyOXQOwjsCm6RhDQjdNZgUyhjF/TM+8Dr5Cg4iroYzQNZB6O9HuvPLNFx
         miDw==
X-Gm-Message-State: APjAAAUegvt3RMGlmQPSvFBpK7GoZIGFffEZz4og951nZeVxMpTy9MhH
        exz4UcJb4la1Os1SoiuIvJLYcW/xtXNosGSfVXY=
X-Google-Smtp-Source: APXvYqzk0u4Ilu0Q5NFLJH9XglZbvfPbUIEi9ktxQWn+FMhZXdGxFqVp2pgY+cR90FakhznowefHdiXUlijcVdJ4n0Q=
X-Received: by 2002:a05:6830:1184:: with SMTP id u4mr11456282otq.181.1566058980205;
 Sat, 17 Aug 2019 09:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190724022310.28010-1-gch981213@gmail.com> <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus> <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
In-Reply-To: <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Sun, 18 Aug 2019 00:22:49 +0800
Message-ID: <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding documentation
To:     Oleksij Rempel <fishor@gmx.net>
Cc:     Rob Herring <robh@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

On Sat, Aug 17, 2019 at 11:40 PM Oleksij Rempel <fishor@gmx.net> wrote:

> In provided link [0] the  ralink_clk_init function is reading SYSC_REG_CPLL_CLKCFG0 R/W register.
> This register is used to determine clock source,  clock freq and CPU or bus clocks.

This register should only be changed by bootloader, not kernel. So
it's read-only in kernel's perspective.

> SYSC_REG_CPLL_CLKCFG1 register is a clock gate controller. It is used to enable or disable clocks.
> Jist wild assumption. All peripheral devices are suing bus clock.

This assumption is incorrect. When this patchset is applied in
OpenWrt, I asked the author why there's still a fixed clock in
mt7621.dtsi, He told me that there's another clock for those unchanged
peripherals and he doesn't have time to write a clock provider for it.
I don't know how many undocumented clocks are there since this piece
of info is missing in datasheet.

>
> IMO - this information is enough to create full blown drivers/clk/mediatek/clk-mt7621.c

And this information isn't enough because the assumption above is incorrect :P

Regards,
Chuanhong Guo
