Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645E73259AE
	for <lists+linux-mips@lfdr.de>; Thu, 25 Feb 2021 23:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbhBYWbg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Feb 2021 17:31:36 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:36966 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbhBYWbf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Feb 2021 17:31:35 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 8C1A792009C; Thu, 25 Feb 2021 23:30:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 84DEF92009B;
        Thu, 25 Feb 2021 23:30:52 +0100 (CET)
Date:   Thu, 25 Feb 2021 23:30:52 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Jim Wilson <jimw@sifive.com>, GCC Development <gcc@gcc.gnu.org>,
        syq@debian.org,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Matthew Fortune <mfortune@gmail.com>,
        Binutils <binutils@sourceware.org>
Subject: Re: HELP: MIPS PC Relative Addressing
In-Reply-To: <9f1b8ad3-77cc-468c-8f95-28af52616756@www.fastmail.com>
Message-ID: <alpine.DEB.2.21.2102252301540.44210@angie.orcam.me.uk>
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com> <CAFyWVab4Z4BH5RxZWXJnxerjAYDNnCndMvksCHsKkFUU1q1w9g@mail.gmail.com> <db8c2df9-9487-8bfd-e205-3f88854dfa12@flygoat.com> <alpine.DEB.2.21.2102250344270.1900@angie.orcam.me.uk>
 <9f1b8ad3-77cc-468c-8f95-28af52616756@www.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 25 Feb 2021, Jiaxun Yang wrote:

> > > I'll take this approach first, add "lla, dlla" pseudo-instructions to
> > > assembler and seeking optimization
> > > in future.
> > 
> >  The DLA and LA macros are supposed to do that already, no need to invent 
> > new names.
> 
> Hmm, how could we tell if the symbol is local?
> Global symbols still needs to be load from GOT.

 Just do what all the other MIPS/GAS macros do in this situation.  GAS 
knows whether a given symbol is local or external.

> I saw RISC-V dealt that by “lla” pesudo-op which indicate the symbol is local.

 But RISC-V is not MIPS.  Despite the similarities in the ISA its assembly 
language and psABI conventions are subtly different throughout.

> > > Btw I found we don't have any document for MIPS pseudo-instructions. RISC-V
> > > put them in ISA manual
> > > but it is not the case for MIPS. Is it possible to have one in binutils?
> > 
> >  There are MIPS assembly language books available; I'm fairly sure Dominic 
> > Sweetman's "See MIPS Run" has a chapter (I don't have the book at hand).  
> > I don't think GNU binutils documentation is supposed to describe the 
> > assembly dialects supported, except maybe for GNU extensions (pseudo-ops).
> 
> Yeah I saw See MIPS Run, but it's not a mandatory specification.
> Without a specification we may have different implementation across 
> toolchains and trouble users.

 I do not oppose a normative document, though there are ISAs for which 
several independently developed assembly dialects exist (e.g. x86).

 Traditionally GAS was meant as an assembler solely for GCC output, so it 
used to be adapted as a need arose.  Having a formal specification would 
hinder such quick adaptation.  I think we need to weigh pros and cons 
carefully.

 NB most macros date back to the IRIX if not MIPSCO compiler.  Semantics 
has been documented in books and is pretty straightforward to apply in a 
mechanical manner to new machine instructions that need macroisation.

  Maciej
