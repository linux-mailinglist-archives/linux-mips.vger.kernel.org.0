Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AC632AF85
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237928AbhCCAZv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448710AbhCBPeW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Mar 2021 10:34:22 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA6A7C061A32
        for <linux-mips@vger.kernel.org>; Tue,  2 Mar 2021 07:30:09 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id EC24992009C; Tue,  2 Mar 2021 16:30:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E428892009B;
        Tue,  2 Mar 2021 16:30:06 +0100 (CET)
Date:   Tue, 2 Mar 2021 16:30:06 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Jim Wilson <jimw@sifive.com>, GCC Development <gcc@gcc.gnu.org>,
        syq@debian.org, "open list:MIPS" <linux-mips@vger.kernel.org>,
        Matthew Fortune <mfortune@gmail.com>,
        Binutils <binutils@sourceware.org>
Subject: Re: HELP: MIPS PC Relative Addressing
In-Reply-To: <7494335f-703e-f9f8-30dd-6e41249c3873@flygoat.com>
Message-ID: <alpine.DEB.2.21.2103021335450.19637@angie.orcam.me.uk>
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com> <CAFyWVab4Z4BH5RxZWXJnxerjAYDNnCndMvksCHsKkFUU1q1w9g@mail.gmail.com> <7494335f-703e-f9f8-30dd-6e41249c3873@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 2 Mar 2021, Jiaxun Yang wrote:

> After spending days poking with AUIPC, I suddenly found we indeed have ALUIPC
> instruction in MIPS R6, which will clear low 16bit of AUIPC result.
> 
> So the whole thing now looks easier, we can have R_MIPS_PC_PAGE and
> R_MIPS_PC_OFST and avoid  all mess we met in RISC-V.
> 
> A pcrel loading could be as simple as:
> aluipc     a0, %pcrel_page(sym)
> addiu      a0, %pcrel_ofst(sym)

 Yes, it should work, but you'll have to 64KiB-align the module in the 
static link.

 You may not need a new relocation for the low part as it looks to me like 
the semantics of plain LO16 fits (though its REL handling peculiarities 
may indeed favour an entirely new "clean" relocation"), but it's a design 
detail and the general principle seems right to me.

 I'm not sure though why you try to avoid composed relocations given we've
had them for 20+ years now.  Relocations are just calculation operators 
for expressions evaluated at link time rather than assembly or high-level 
language compilation time.  And just like we don't invent single operators 
for complex combinations of `+', `&', `%', `<<', etc. and instead compose 
the exiting ones in expressions used in various programming languages to 
get the desired calculation, we don't need to do that for relocation and 
we can just have a collection of simple relocation operators to choose 
from and combine.

  Maciej
