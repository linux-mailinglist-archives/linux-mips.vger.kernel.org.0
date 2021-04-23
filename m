Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C22C3691F0
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 14:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242270AbhDWMXL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Apr 2021 08:23:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:38500 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231464AbhDWMXK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 23 Apr 2021 08:23:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZupM-00019R-02; Fri, 23 Apr 2021 14:22:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B0E4BC0B3B; Fri, 23 Apr 2021 13:48:24 +0200 (CEST)
Date:   Fri, 23 Apr 2021 13:48:24 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] MIPSr6 `do_div' support and typo fixes
Message-ID: <20210423114824.GC8582@alpha.franken.de>
References: <alpine.DEB.2.21.2104222124010.44318@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2104222124010.44318@angie.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 22, 2021 at 10:36:01PM +0200, Maciej W. Rozycki wrote:
> Hi,
> 
>  As discussed over the last couple of days here are fixes for the MIPS 
> `do_div' handler and the test module.
> 
>  As my Malta does not work at the moment I have only run-time verified 
> these with a DECstation.  For additional verification I have built the 
> kernel for a MIPS32r6 configuration as well as a microMIPS one.
> 
>  Please apply.

both patches applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
