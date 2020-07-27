Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8491122F709
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jul 2020 19:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbgG0Ru0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Jul 2020 13:50:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:52152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbgG0Ru0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Jul 2020 13:50:26 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2DF822070B;
        Mon, 27 Jul 2020 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595872226;
        bh=DpbVC711UQECix+vLjh9TkWry1+9XGV9rRIwKwAZg1E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QWU1RvbRokMbDds1Y48qGOfm7MMN1PlBmqCLprZaq3PTpEJxGR4hdI0WxXW2NxF1T
         U4Ab5bwoj1Ak6BU55OwVm5A7KzdQklQoYNirn7PVDCmB7RfOIr4oX7SpoEhId/ruSb
         JmLYC/L+n4WyLqLrB0mq+dwhoNFKNw+B6qTPSAf4=
Received: by mail-ot1-f49.google.com with SMTP id v21so5675879otj.9;
        Mon, 27 Jul 2020 10:50:26 -0700 (PDT)
X-Gm-Message-State: AOAM530Aw/Fm7tMm9PvOnF8qRBjsRl5DGOyl5nyXKGIDJ6NrzoK6jL/z
        XOYr+KbmkgYn9yPCcB84xVASRBMZL+QFeZvRUg==
X-Google-Smtp-Source: ABdhPJzLQ+VFFmth3kQyr6PdoZivQEsSJVM+Wbmdyi5M1azvg+1uvM+cK30w07oLnIQT1rD1U4oN04pnupX7lVaBLVU=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr2667777ote.107.1595872225565;
 Mon, 27 Jul 2020 10:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200725014529.1143208-1-jiaxun.yang@flygoat.com> <20200725014529.1143208-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20200725014529.1143208-2-jiaxun.yang@flygoat.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 27 Jul 2020 11:50:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKePrUW3-HoSnQawqhgg23XJ7MxzawD7TKt-__q3jM55g@mail.gmail.com>
Message-ID: <CAL_JsqKePrUW3-HoSnQawqhgg23XJ7MxzawD7TKt-__q3jM55g@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] of_address: Add bus type match for pci ranges parser
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 24, 2020 at 7:45 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> So the parser can be used to parse range property of ISA bus.
>
> As they're all using PCI-like method of range property, there is no need
> start a new parser.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> --
> v2: Drop useless check, fix some na for bus_addr
>         add define of of_range_parser_init according to
>         Rob's suggestion.
> v3: Abstract out has_flags. simplify define.
> ---
>  drivers/of/address.c       | 29 +++++++++++++++++------------
>  include/linux/of_address.h |  4 ++++
>  2 files changed, 21 insertions(+), 12 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
