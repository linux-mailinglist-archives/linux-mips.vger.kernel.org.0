Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A90A3326D24
	for <lists+linux-mips@lfdr.de>; Sat, 27 Feb 2021 14:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhB0Nlh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Feb 2021 08:41:37 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:36996 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhB0Nlg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Feb 2021 08:41:36 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 1379E92009C; Sat, 27 Feb 2021 14:40:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 06EF692009B;
        Sat, 27 Feb 2021 14:40:55 +0100 (CET)
Date:   Sat, 27 Feb 2021 14:40:54 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        George Cherian <gcherian@marvell.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: select CPU_MIPS64 for remaining MIPS64 CPUs
In-Reply-To: <20210227122605.2680138-1-Jason@zx2c4.com>
Message-ID: <alpine.DEB.2.21.2102271424100.44210@angie.orcam.me.uk>
References: <20210227122605.2680138-1-Jason@zx2c4.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 27 Feb 2021, Jason A. Donenfeld wrote:

> The CPU_MIPS64 and CPU_MIPS32 variables are supposed to be able to
> distinguish broadly between 64-bit and 32-bit MIPS CPUs. However, they

 That is not true.  The purpose of these options is to identify MIPS64 and 
MIPS32 ISA processors respectively (and the generic features these ISAs 
imply).  There are 64-bit and 32-bit MIPS processors which do not qualify, 
specifically all MIPS I, MIPS II, MIPS III, and MIPS IV implementations.

> weren't selected by the specialty CPUs, Octeon and Loongson, which meant
> it was possible to hit a weird state of:
> 
>     MIPS=y, CONFIG_64BIT=y, CPU_MIPS64=n

 This is a correct combination for MIPS III and MIPS IV processors.

> This commit rectifies the issue by having CPU_MIPS64 be selected when
> the missing Octeon or Loongson models are selected.

 From the description and/or other options selected by CPU_LOONGSON64 and 
CPU_CAVIUM_OCTEON I infer the change itself is correct, so you only need 
to rewrite the change description.

 Though overall it seems we have quite a mess here, several other CPUs, 
such as at the very least CPU_XLR and CPU_XLP, do not select this option 
either, and then we have say CPU_MIPSR2 that is selected by some CPUs 
while being conditional on other ones.  All this stuff asks for being 
rewritten in a consistent manner.

 In any case your change may have to be run-time verified though with the 
respective processors.

  Maciej
