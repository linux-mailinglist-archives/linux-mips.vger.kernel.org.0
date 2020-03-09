Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96DAC17DEDE
	for <lists+linux-mips@lfdr.de>; Mon,  9 Mar 2020 12:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgCILoH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Mar 2020 07:44:07 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:43639 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgCILoH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Mar 2020 07:44:07 -0400
Received: by mail-io1-f54.google.com with SMTP id n21so8747352ioo.10
        for <linux-mips@vger.kernel.org>; Mon, 09 Mar 2020 04:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a7Fn/ysZi27k5qcwQE2SFpFqlS2suD8Fxcr6X+5F0Fk=;
        b=L41pRj4U0plrl3O+KBLLoBG6EiEi+71Wx4/sDHw70pZ2ZDGcRafC+zhQv0hGhjrK33
         zAj/FcoWKG/rRv6YMd3IdrkPSlNMw4z2JCER2NJFRezsUb9wA0RhpXz/KOO1qYPbvyU0
         sogggLjXLB6eNPMqM0wucKcJasRA0S0laQbXtOyEpdvypopNR+QckoGX5IAONuhwwjWA
         rHKdSFj7SBI2eO0gaIsTrxLIdfXOx3gqcPrCCXLDVlgbUIvh0KqNaYVyuCAQM4EocbbZ
         wJS3kZy3wbEcBnnyoUqMRvGBmHWi3Dut5oTdpW1/+IV9YeuKhkQcAtudFInpgerNPIDD
         rRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a7Fn/ysZi27k5qcwQE2SFpFqlS2suD8Fxcr6X+5F0Fk=;
        b=jC1V/fgEOe+fLm+ylBcg43hz4IlAFrqup9yCfAhct9bSbmePs9w3T/oPxwmEImulkO
         FJ2XdaMDaIroBIrfJGVgg3jDIdnpgtIGoLzmxUrnieKyKDDKKdGJQogpZ3RvQbNaTZnT
         X6QqXL43PuIMYMC61weZfCwldAHajZM2E3YWdFyyetqe/uK2G/hsJT0YgTZNkg7w9cv9
         m7C4k9s5aDfCT82qS4JaorNd4e9oqhXOWsRYHd5ZdjrOt/zSKVe/J2hZNLEdEVFY0FDW
         GlCnv517lUW0ratTFqehfVI4GOXANf6gL42pokqqLEbGKxsP9Lp/eIJSt22wXkDBQh5n
         12Kg==
X-Gm-Message-State: ANhLgQ1+4qyJqcc6RrfhhlcDB1e9PFHQ18Fqsd0IavPLrbUrDz1j7ITq
        rgDLsz1LxoMovXv8dGDoIdnHlFZGr+eXBcID1EVUrE8g
X-Google-Smtp-Source: ADFU+vuoxvpfgWNG99agTYOnbxAyC2j23mhqFInvcuY2Z8odGXnSrwEFcWC2jsYFNU1ATP+jnrGIHOPjDulWGG+gr+g=
X-Received: by 2002:a5d:9707:: with SMTP id h7mr12903558iol.112.1583754247081;
 Mon, 09 Mar 2020 04:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200227144910.GA25011@alpha.franken.de> <CA+QBN9DRUMkd+cOvHMJfe_-7rdhUpb=BiC7BBWN2ZS5-fNXtfw@mail.gmail.com>
 <20200304162249.GA14388@alpha.franken.de>
In-Reply-To: <20200304162249.GA14388@alpha.franken.de>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Mon, 9 Mar 2020 19:43:55 +0800
Message-ID: <CAAhV-H6gMpKbuJ-=Cxf1pmw3Crm_bpZ2BFcr_BLgUCeF7dF0UQ@mail.gmail.com>
Subject: Re: MIPS Hardware support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "dtb ." <carlojpisani@gmail.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

I come from Lemote Inc., the largest Loongson ODM/OEM corporation, I
have all kinds of Loongson-3 machines (with RS780, SR5690, LS2H or
LS7A bridges) and a few Loongson-2H/2K machines.

I'm working hard together with Jiaxun Yang to modernize Loongson-3's
kernel, thank you.

Huacai

On Thu, Mar 5, 2020 at 12:29 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Mar 02, 2020 at 09:35:09AM +0100, dtb . wrote:
> > when (which kernel future release?) do you think it will be possible
> > to have a working PCI subsystem with SGI IP30? I'd love to use a
> > PCI_EHCI card, and a PCI_SATA card for a couple of practical projects.
>
> 32bit DMA support for bridge (which is needed at least for EHCI) is
> on my todo list, but it's not top priority.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
