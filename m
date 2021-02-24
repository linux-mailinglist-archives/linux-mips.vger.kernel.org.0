Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE3232460B
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 23:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbhBXWA5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 17:00:57 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:36922 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbhBXWA5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 17:00:57 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id F306792009C; Wed, 24 Feb 2021 23:00:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id EEC6892009B;
        Wed, 24 Feb 2021 23:00:14 +0100 (CET)
Date:   Wed, 24 Feb 2021 23:00:14 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jim Wilson <jimw@sifive.com>
cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        GCC Development <gcc@gcc.gnu.org>, syq@debian.org,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Matthew Fortune <mfortune@gmail.com>,
        Binutils <binutils@sourceware.org>
Subject: Re: HELP: MIPS PC Relative Addressing
In-Reply-To: <CAFyWVaayq1ZVuwakdG6gAAKGf9hZTBFygVtgxnZGM39023t6TA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2102242254060.1900@angie.orcam.me.uk>
References: <3ddc0595-c443-868e-c0a4-08ae8934f116@flygoat.com> <alpine.DEB.2.21.2102241813420.1900@angie.orcam.me.uk> <CAFyWVaayq1ZVuwakdG6gAAKGf9hZTBFygVtgxnZGM39023t6TA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 24 Feb 2021, Jim Wilson wrote:

> >  I commented on it once, in the course of the FDPIC design project, and I
> > find it broken by design.  Sadly it has made it into the RISC-V psABI and
> > it is hard to revert at this time, too many places have started relying on
> > it.
> >
> 
> It was already a production ABI before you asked for the change.  And
> changing a production ABI is extremely difficult.  You were not the first
> to complain about this, and you probably won't be the last.

 Thanks for chiming in.

 I accepted it as a fact of life, but we don't have to follow the mistake 
with the MIPS psABI.  If you ever decide to have a RISC-V NewABI just as 
MIPS did at one point, then you can reevaluate the choices made.  At least 
there are no REL relocations there with RISC-V, it was a gross mistake to 
have them with MIPS o32.  I think we can try switching away from them with 
R6, or at least evaluate what would be required to do so.

  Maciej
