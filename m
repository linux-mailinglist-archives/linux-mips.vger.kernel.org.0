Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDABB27DD92
	for <lists+linux-mips@lfdr.de>; Wed, 30 Sep 2020 03:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbgI3BE0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Sep 2020 21:04:26 -0400
Received: from [157.25.102.26] ([157.25.102.26]:45110 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728943AbgI3BE0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Sep 2020 21:04:26 -0400
X-Greylist: delayed 325 seconds by postgrey-1.27 at vger.kernel.org; Tue, 29 Sep 2020 21:04:25 EDT
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id B99272BE086;
        Wed, 30 Sep 2020 01:58:58 +0100 (BST)
Date:   Wed, 30 Sep 2020 01:58:55 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Florian Lohoff <f@zz.de>
cc:     linux-mips@vger.kernel.org
Subject: Re: Undust unknown hardware / Algo P-6064
In-Reply-To: <20200910100729.c6qn22j6pfqxxu5z@pax.zz.de>
Message-ID: <alpine.LFD.2.21.2009300150520.333514@eddie.linux-mips.org>
References: <20200910100729.c6qn22j6pfqxxu5z@pax.zz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Flo,

> After i undusted a box which i moved around for years, which i
> thought to be a Swarm, i found it to be an Algorithmics P-6064. 

 Nice board, I have one of those too waiting for its time. :)

> After some maintenance it turns on and ends up in PMON.
> 
> From what Google told me there was once upon a time a linux kernel
> sourcetree within Algorithmics supporting that board. It seems this
> never made it upstream.
> 
> Are there any resources still available? Documentation? The old
> kernel source trees? Anything?

 I should have documentation somewhere, at worst printed.  The Bonito 
system controller was later reused with some Atlas/Malta daughthercards 
and is of course very similar to one we already support.  I'll see if I 
can track down old sources too.  Ping me if I don't respond soon enough.

  Maciej
