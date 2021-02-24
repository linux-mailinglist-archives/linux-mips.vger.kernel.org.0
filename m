Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95CB0324330
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 18:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234736AbhBXRb3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 12:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbhBXRb2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 12:31:28 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 257FEC061574
        for <linux-mips@vger.kernel.org>; Wed, 24 Feb 2021 09:30:48 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id C461592009C; Wed, 24 Feb 2021 18:30:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id B59DD92009B;
        Wed, 24 Feb 2021 18:30:45 +0100 (CET)
Date:   Wed, 24 Feb 2021 18:30:45 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        binutils@sourceware.org, gcc@gcc.gnu.org, syq@debian.org,
        Matthew Fortune <mfortune@gmail.com>
Subject: Re: HELP: MIPS PC Relative Addressing
In-Reply-To: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com>
Message-ID: <alpine.DEB.2.21.2102241813420.1900@angie.orcam.me.uk>
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 24 Feb 2021, Jiaxun Yang wrote:

> For RISC-V, %pcrel_lo shall point to the label of corresponding %pcrel_hi,
> like
> 
> .LA0:
>     auipc    a0, %pcrel_hi(sym)
>     addi      a0, a0, %pcrel_lo(.LA0)

 I commented on it once, in the course of the FDPIC design project, and I 
find it broken by design.  Sadly it has made it into the RISC-V psABI and 
it is hard to revert at this time, too many places have started relying on 
it.

> However, for MIPS %pcrel_lo simply calculate LO16 of the symbol to current
> PC, thus PC relative addressing will look like:
> 
> .LA0:
>     auipc  a0, %pcrel_hi(sym)
> .LA1:
>     addi    a0, %pcrel_lo(sym + (.LA1 - .LA0))
> 
> I found it's very difficult for GCC to generate this kind of pcrel_lo
> expression,
> RTX label_ref can't be lower into such LOW_SUM expression.

 You may want to use composed relocations to refer to .LA1 (R_MIPS_32) and 
.LA0 (R_MIPS_SUB).  There may or may not be linker updates needed; unlike 
the RISC-V one the MIPS BFD backend already supports composed relocations 
with the usual ELF gABI semantics.  It would be good to switch to RELA at 
this point universally too; none of new stuff will work with old linkers 
anyway.

 HTH,

  Maciej
