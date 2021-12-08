Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0752646CA37
	for <lists+linux-mips@lfdr.de>; Wed,  8 Dec 2021 02:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242904AbhLHBxW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Dec 2021 20:53:22 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:45812 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243074AbhLHBxV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Dec 2021 20:53:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E7180B81F24
        for <linux-mips@vger.kernel.org>; Wed,  8 Dec 2021 01:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AC2C341C5
        for <linux-mips@vger.kernel.org>; Wed,  8 Dec 2021 01:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638928188;
        bh=i4KySOyMMRll2HmfVdr0ne/7foHzDjllo+7rdrRGQOA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o6+ne1ucwghe93OnznVctqK75lyZ5pvmv2HuHufncSN9KSS8utuFro5fmV0EHRrYW
         aBLFx45nC96ogRxejeiVCojKuay0wruEhXp3ep9aG6R6HHvRnyIMvNGYmo3rFzVQ0k
         wk3pk4TYEusbFJVD/ItZs2C1hvT5A8yrhsCzyA2dyWs774Blb/tFvXMCHNsx9wHu0J
         Ws3K5dYJ2IrDicdyOT3z/RX0opXvSP4ueIA3zE56oumH1BEmYdc2F64r380zZ3Yu+Q
         I5WpOXM4W2e16QFiZXjSSI/CNfmUwYTWL/YFvtRRyY5yFUpQp+t8BC4vvW65XmYwZh
         94g12BtkOz6/Q==
Received: by mail-vk1-f176.google.com with SMTP id 84so621159vkc.6
        for <linux-mips@vger.kernel.org>; Tue, 07 Dec 2021 17:49:48 -0800 (PST)
X-Gm-Message-State: AOAM533UbtqNSbhe8HR/g5zpVWMHrGZBQ4GRHyApifoNyg8ugz/O07iK
        0ypKuNHOXWx8e65qn/qxMWcHm3cHVEyQhrCSJGE=
X-Google-Smtp-Source: ABdhPJyoLcKQXBZMQhn6JyUCVs/5LFuUlc3Za2VKIG5si2erVIugzirYrebO6y7hDZtVlNphXHRaesvoYJkYWCPWHrk=
X-Received: by 2002:a05:6122:178b:: with SMTP id o11mr58270015vkf.17.1638928187738;
 Tue, 07 Dec 2021 17:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20211207162919.GB19327@alpha.franken.de>
In-Reply-To: <20211207162919.GB19327@alpha.franken.de>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Wed, 8 Dec 2021 09:49:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4pdPZqnF0-YuM8f9TKHsezjSvLhviNTsZ2TkSisgrxdg@mail.gmail.com>
Message-ID: <CAAhV-H4pdPZqnF0-YuM8f9TKHsezjSvLhviNTsZ2TkSisgrxdg@mail.gmail.com>
Subject: Re: Loongson3 PCI/EHCI
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Wed, Dec 8, 2021 at 8:58 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> Hi,
>
> I'm getting lots of
>
> [    2.940587] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    2.946478] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    2.952374] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    2.958270] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    2.964166] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    2.970062] pci 0000:00:04.1: EHCI: unrecognized capability ff
>
> while booting on a Loongson-3A R4 (Loongson-3A4000) @ 1800MHz system.
> What I'm missing ?
This is a hardware issue of LS7A bridge.

>
> I'm also seeing
>
> [    1.222546] pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x4 m
> ay corrupt adjacent RW1C bits
> [    1.232314] pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0x4 m
> ay corrupt adjacent RW1C bits
>
> which look suspicous...
This can be avoid and I have send a patch, but hasn't accepted yet.
https://lore.kernel.org/linux-pci/20211011074604.854340-2-chenhuacai@loongson.cn/T/#u

Huacai
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
