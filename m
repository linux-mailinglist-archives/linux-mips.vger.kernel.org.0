Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3259326DF0
	for <lists+linux-mips@lfdr.de>; Sat, 27 Feb 2021 17:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhB0QqN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Feb 2021 11:46:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbhB0QqJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Feb 2021 11:46:09 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B03E2C06174A
        for <linux-mips@vger.kernel.org>; Sat, 27 Feb 2021 08:45:27 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id B813E92009C; Sat, 27 Feb 2021 17:45:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id B61E292009B;
        Sat, 27 Feb 2021 17:45:24 +0100 (CET)
Date:   Sat, 27 Feb 2021 17:45:24 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        binutils@sourceware.org, gcc@gcc.gnu.org, syq@debian.org,
        Matthew Fortune <mfortune@gmail.com>
Subject: Re: HELP: MIPS PC Relative Addressing
In-Reply-To: <b5fcec4c-799f-fb68-6db8-a330b7c84099@flygoat.com>
Message-ID: <alpine.DEB.2.21.2102271503050.44210@angie.orcam.me.uk>
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com> <alpine.DEB.2.21.2102241813420.1900@angie.orcam.me.uk> <b5fcec4c-799f-fb68-6db8-a330b7c84099@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 25 Feb 2021, Jiaxun Yang wrote:

> >   You may want to use composed relocations to refer to .LA1 (R_MIPS_32) and
> > .LA0 (R_MIPS_SUB).  There may or may not be linker updates needed; unlike
> > the RISC-V one the MIPS BFD backend already supports composed relocations
> > with the usual ELF gABI semantics.  It would be good to switch to RELA at
> > this point universally too; none of new stuff will work with old linkers
> > anyway.
> 
> Thanks for your hint;-)
> 
> I'm unsure about how should we express composed relocations in assembly :-/

 Just like we already do; R_MIPS_SUB could be easily produced directly 
from the `-' operator.

 I note too that $pc is effectively used twice in the calculation, 
cancelling itself, so I think we can do better, though it seems to me the 
original semantics of %pcrel_hi/%pcrel_lo pseudo-ops wasn't thought well 
(I guess it was just blindly copied from %hi/%lo by adding PC-relative 
interpretation with no further thinking as to whether it is usable in 
reality).  It seems to me that we could overload the semantics of these 
pseudo-ops in a compatible manner though.

 Also are you concerned about linker relaxation you're possibly working on 
here?  I'm asking because a calculation like (.LA1 - .LA0) works out as an 
assembly constant normally, so it's not a concern really.  And as I recall 
existing MIPS linker relaxation does not rely on label symbols anyway (and 
is probably not defined for plain R6 anyway as I reckon there is nothing 
to relax at the link stage for that ISA).

 Where it might start to matter is the microMIPS ISA however; offhand I 
don't remember what exactly it looks like at R6 though.

> MIPS N32/N64 ABI is already using RELA, do you mean switch to RELA for o32
> as well?

 Yes, with "universally" I meant: "across all the ABIs".

  Maciej
