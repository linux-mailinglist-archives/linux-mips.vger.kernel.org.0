Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4CC32DFBD
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 03:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhCECqd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 21:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhCECqd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 21:46:33 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 09A0BC061574;
        Thu,  4 Mar 2021 18:46:33 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 9FBF692009C; Fri,  5 Mar 2021 03:46:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 9AAB592009B;
        Fri,  5 Mar 2021 03:46:31 +0100 (CET)
Date:   Fri, 5 Mar 2021 03:46:31 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Add comment about CONFIG_MIPS32_O32 in
 loongson3_defconfig when build with Clang
In-Reply-To: <d4802e65-52a0-f927-3e7c-80044c5bba80@flygoat.com>
Message-ID: <alpine.DEB.2.21.2103050324151.51127@angie.orcam.me.uk>
References: <1614820544-10686-1-git-send-email-yangtiezhu@loongson.cn> <alpine.DEB.2.21.2103042356150.51127@angie.orcam.me.uk> <d4802e65-52a0-f927-3e7c-80044c5bba80@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 5 Mar 2021, Jiaxun Yang wrote:

> >   Huh?  Is that a joke?  From the o32 psABI's point of view a MIPS64 CPU is
> > exactly the same as a MIPS32 one (for whatever ISA revision), so there's
> > nothing to support there really other than the CPU/ISA name.
> 
> Clang treat MIPS32 as a different backend so we may need some extra effort....
> 
> TBH it is a toolchain issue and kernel workaround seems bogus.
> 
> From my point view we can "s/mips64r2/mips32r2" when doing syscall checks
> to workaround clang issue instead of disable it for kernel.

 I had something like this in mind, but obviously that has to be done in a 
consistent manner across all the possible 64-bit `-march=...' selections, 
as I suppose that is where the problem comes from.  So we'd have to handle 
things like say `octeon'.  But I'd like to see the invocation line to be 
sure (I could try and check that myself, but I don't have Clang and it's 
the patch submitter's job anyway to explain things and not the reviewer's 
to chase them).

 Maybe we could cheat and wire everything to a single setting so as to 
keep the hack to the minimum, but we need to know what the right setting 
is from the Clang people.

 NB only MIPS IV is special in that it has 32-bit extensions beyond MIPS 
III but not a corresponding 32-bit ISA.  The corresponding 32-bit ISA for 
MIPS III is MIPS II, and obviously all the modern MIPS ISAs come in pairs.  
So it's only MIPS IV where o32 may want special support (at the hardware 
level the ISA had the CP0.Status.XX bit to control the ISA extensions), 
and I guess only a few people care at this point, though some are present 
on this mailing list.

  Maciej
