Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8E53145A9
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 02:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhBIBdg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 20:33:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:53248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhBIBdf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Feb 2021 20:33:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27D4F64EB1
        for <linux-mips@vger.kernel.org>; Tue,  9 Feb 2021 01:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612834373;
        bh=lYqM7/lEWVHAKYtC3FaKyuSyTQEiG+A88HRLRq2L/eY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZBQ6ukWtHuipcG3zvrgoT6W4JhM+d6BXfLBdOcB7uPi3OJWrDO8tqXSZ+6hCrvlfW
         kMGwvRMBjFmnfwOqkS4NR+hlgwtkUb+7nY7PiC/Wr0teXmbh2ZoZ63DhqEOR2rvNwP
         erzQOKDSqoIjrCnNiaat4IIG1v+0uOxBoxBGh5tPiYIYjFd22TakELSQEelUr8skmT
         kf46yE/KdtgqcYesUo2c1RidCZbRbEkvAc12afBtuzekGylXPXfCtzvvi7fQ+CSPUn
         AOmnfTATRufNEIb7kWy3HUAx8raHTowzGKRDVWvm306I1Ms29Hp8CxcUXQ+gE+WPX7
         rPQQ5C4ZEJ1ew==
Received: by mail-il1-f180.google.com with SMTP id a16so14683226ilq.5
        for <linux-mips@vger.kernel.org>; Mon, 08 Feb 2021 17:32:53 -0800 (PST)
X-Gm-Message-State: AOAM531figYVXN61Hq+Dz82deQxY6vBFlXgQwbYRang0a20hA+BVsmHU
        sB4y60o2JCs4r5S4cSFbjetiQho4svitlCPAjJ8=
X-Google-Smtp-Source: ABdhPJwsXfKFk8CbiylVGFHiRMWVw3cJyeC9NSfIWn2FvOnYn7fRHjTkyF40vscRMrbwzWdqsuWk/u83ImQBGqzQLa4=
X-Received: by 2002:a92:1e12:: with SMTP id e18mr17946547ile.270.1612834372505;
 Mon, 08 Feb 2021 17:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20210203123425.GA9574@alpha.franken.de> <a2a2cfe3-5618-43b1-a6a4-cc768fc1b9fb@www.fastmail.com>
 <20210207193952.GA21929@alpha.franken.de> <59a9a55c-2866-413f-89e3-b11e274c2d34@www.fastmail.com>
In-Reply-To: <59a9a55c-2866-413f-89e3-b11e274c2d34@www.fastmail.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Tue, 9 Feb 2021 09:32:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6jkQBmr7+_GzUSAUhN035kCzNxoS30H_PdOpKzJO1JWA@mail.gmail.com>
Message-ID: <CAAhV-H6jkQBmr7+_GzUSAUhN035kCzNxoS30H_PdOpKzJO1JWA@mail.gmail.com>
Subject: Re: KVM Guest
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org," <linux-mips@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I think it can be removed.

Huacai

On Tue, Feb 9, 2021 at 12:40 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
>
> On Mon, Feb 8, 2021, at 3:39 AM, Thomas Bogendoerfer wrote:
> > On Wed, Feb 03, 2021 at 08:52:34PM +0800, Jiaxun Yang wrote:
> > >
> > >
> > > On Wed, Feb 3, 2021, at 8:34 PM, Thomas Bogendoerfer wrote:
> > > > Hi,
> > > >
> > > > Does kvm guest kernel still work ? I'm playing with current mips-next
> > > > and starting a kvm guest kernel inside an emulated malta system also
> > > > running a mips-next kernel. The kvm guest kernel starts, but hangs
> > > > in calibrate_delay (at least that's what info registers in qemu monitor
> > > > suggests). Ayn ideas ?
> > >
> > > The current KVM guest kernel is actually a Trap-and-emul guest kernel.
> > > VZ based KVM uses the same binary with the host one, so does TCG.
> > >
> > > TE KVM is current unmaintained. I'll try to get a malta and do some test.
> >
> > hmm, so it looks broken, is unmaintained, how about removing it ?
>
> Probably. I got remote access of a CoreLV malta but no luck to boot kernel as well.
>
> + Huacai as KVM/MIPS Maintainer.
> + Philippe as QEMU/MIPS Maintainer.
> + qemu-devel for wider audience.
>
> If nobody intended to maintain it probably it's time to remove it.
>
> >
> > Thomas.
> >
> > --
> > Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> > good idea.                                                [ RFC1925, 2.3 ]
> >
>
> --
> - Jiaxun
