Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A47E324903
	for <lists+linux-mips@lfdr.de>; Thu, 25 Feb 2021 03:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbhBYC6W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 21:58:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235295AbhBYC6W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 21:58:22 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE75BC061574
        for <linux-mips@vger.kernel.org>; Wed, 24 Feb 2021 18:57:41 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id EEF9692009C; Thu, 25 Feb 2021 03:57:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E411E92009B;
        Thu, 25 Feb 2021 03:57:39 +0100 (CET)
Date:   Thu, 25 Feb 2021 03:57:39 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Jim Wilson <jimw@sifive.com>, GCC Development <gcc@gcc.gnu.org>,
        syq@debian.org, "open list:MIPS" <linux-mips@vger.kernel.org>,
        Matthew Fortune <mfortune@gmail.com>,
        Binutils <binutils@sourceware.org>
Subject: Re: HELP: MIPS PC Relative Addressing
In-Reply-To: <db8c2df9-9487-8bfd-e205-3f88854dfa12@flygoat.com>
Message-ID: <alpine.DEB.2.21.2102250344270.1900@angie.orcam.me.uk>
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com> <CAFyWVab4Z4BH5RxZWXJnxerjAYDNnCndMvksCHsKkFUU1q1w9g@mail.gmail.com> <db8c2df9-9487-8bfd-e205-3f88854dfa12@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 25 Feb 2021, Jiaxun Yang wrote:

> > There is a far easier way to do this, which is to just emit an assembler
> > macro, and let the assembler generate the labels and relocs.  This is what
> > the RISC-V GCC port does by default.  This prevents some optimizations like
> > scheduling the two instructions, but enables some other optimizations like
> > loop unrolling.  So it is a tossup.  Sometimes we get better code with the
> > assembler macro, and sometimes we get better code by emitting the auipc and
> > addi separately.
> 
> Thanks all,
> 
> I'll take this approach first, add "lla, dlla" pseudo-instructions to
> assembler and seeking optimization
> in future.

 The DLA and LA macros are supposed to do that already, no need to invent 
new names.

 They may not have been implemented for R6, but I'm not sure.  There was 
some resistance against macros at one point as the new generation came to 
work on the MIPS assembler and consequently inconsistencies resulted in 
the language that may not have been removed to date.

 In any case you need to use `-mno-explicit-relocs' with GCC then so as 
not to break the compiler's semantics or assumptions.

> Btw I found we don't have any document for MIPS pseudo-instructions. RISC-V
> put them in ISA manual
> but it is not the case for MIPS. Is it possible to have one in binutils?

 There are MIPS assembly language books available; I'm fairly sure Dominic 
Sweetman's "See MIPS Run" has a chapter (I don't have the book at hand).  
I don't think GNU binutils documentation is supposed to describe the 
assembly dialects supported, except maybe for GNU extensions (pseudo-ops).

  Maciej
