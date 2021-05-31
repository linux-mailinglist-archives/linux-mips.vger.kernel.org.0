Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA2939681A
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 20:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhEaSul (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 14:50:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:39870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230174AbhEaSuk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 14:50:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D01416136E;
        Mon, 31 May 2021 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622486940;
        bh=uZQ4hjCYk7ih5FfmEF29XAW17p2cSE/QFyhl2Ea4ySw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OQvD8F929NH58CF8oTBVGn36npvqZMDPkFOXE3AsO4uylOF2eG37ICRHk29MYIpFV
         T4vuemJ2j18q2afDhCHTHT36xt/CRb0uIBm8+WxTaLIjcBoARY0EV3bFmhx2wPUqYn
         axlcPlGvfhjNHv2G6gZGB6g+P5YNb9/WKlW7KFJ7K7GIcVCJyMY8eM+NtmoVjh9EtH
         DqrZwZUkxtYz1+h+b3JpdcwASSVz98pbml5MT+ko3jR+O5qDIzzofRjgDbjuKS+70w
         aWC3CN7JDA4xbQAkxLbas5HRPShKhA40lpoRSPrmFf6RAuQyT88GZqfJBuNn63+TCd
         AyeopB5k8aUFQ==
Received: by mail-wm1-f50.google.com with SMTP id f20-20020a05600c4e94b0290181f6edda88so84825wmq.2;
        Mon, 31 May 2021 11:49:00 -0700 (PDT)
X-Gm-Message-State: AOAM533EQbJRKOIbMC+TSPxp6QTVO9fBHd7QX13Yb4eM67QV1zViesLO
        idPmU6Hud6HPbsSf4wzzu49a8zYkCqHAdlzl54s=
X-Google-Smtp-Source: ABdhPJzbEG+ZcvnFkCSV6IHkDnP12JJjwSWbDQhrFskKKZGPmEpuOs+pJ6UdB1UxJNHhUhjBxGHkXZWscBGE5NfZwYs=
X-Received: by 2002:a1c:7d15:: with SMTP id y21mr423290wmc.120.1622486939359;
 Mon, 31 May 2021 11:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210531173429.2467403-1-arnd@kernel.org> <c4161b44-1628-9b75-083d-2715fa366596@gmail.com>
In-Reply-To: <c4161b44-1628-9b75-083d-2715fa366596@gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 31 May 2021 20:47:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a18oCcDrEur9MdtG8OZb1BhJZ8LnApdfMu+-ssnTuW2qg@mail.gmail.com>
Message-ID: <CAK8P3a18oCcDrEur9MdtG8OZb1BhJZ8LnApdfMu+-ssnTuW2qg@mail.gmail.com>
Subject: Re: [PATCH 0/7] clk: clean up legacy clock interfaces
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-clk@vger.kernel.org, Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 31, 2021 at 8:44 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Awesome, thank you very much!
>
> I see only this cover-letter email, will we see the rest of the patches?
> The patches 1-7 have only linux-clk@vger.kernel.org in the recipients.

Oops, I meant to send with --cc-cover, sorry about that, and sorry for the
coming duplicate mails on linux-clk@v.g.o.

       Arnd
