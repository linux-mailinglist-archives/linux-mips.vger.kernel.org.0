Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 814E819ECDD
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 19:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgDERXG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Apr 2020 13:23:06 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:47900 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgDERXG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Apr 2020 13:23:06 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23991372AbgDERXDyMN9m (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Sun, 5 Apr 2020 19:23:03 +0200
Date:   Sun, 5 Apr 2020 18:23:03 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     linux-mips@vger.kernel.org, Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: malta: Set load address for 32bit kernel
 correctly
In-Reply-To: <96C9B1A0-2F89-4650-B0A4-6A6242A2AA0A@flygoat.com>
Message-ID: <alpine.LFD.2.21.2004051817310.4156324@eddie.linux-mips.org>
References: <20200405082451.694910-1-jiaxun.yang@flygoat.com> <alpine.LFD.2.21.2004051738000.4156324@eddie.linux-mips.org> <96C9B1A0-2F89-4650-B0A4-6A6242A2AA0A@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 6 Apr 2020, Jiaxun Yang wrote:

> > Given the description above I think it should be done uniformly and 
> >automatically across all platforms by trimming the address supplied
> >with 
> >$(load-y) to low 8 digits in a single place, that is at the place where
> >
> >the variable is consumed.  This will reduce clutter across Makefile 
> >fragments, avoid inconsistencies and extra work to handle individual 
> >platforms as the problem is triggered over and over again, and limit
> >the 
> >risk of mistakes.
> 
> I was intended to do like this but failed to find a proper way.
> 
> Makefile isn't designed for any kind of calculation.
> And shell variables are 64-bit signed so it can't hold such a huge variable.
> 
> Just wish somebody can give me a way to do like:
> 
> ifndef CONFIG_64BIT
> load-y = $(load-y) & 0xffffffff
> endif

 Use the usual shell tools like `sed', `cut', `awk', or whatever we use in 
the kernel build already for other purposes.  There's no need to do any 
actual calculation here to extract the last 8 characters (and the leading 
`0x' prefix).  At worst you can write a small C program, compile it with 
the build system compiler and run, as we already do for some stuff.

  Maciej
