Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC7B318DDE
	for <lists+linux-mips@lfdr.de>; Thu, 11 Feb 2021 16:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbhBKPLi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Feb 2021 10:11:38 -0500
Received: from elvis.franken.de ([193.175.24.41]:45826 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229777AbhBKPFZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Feb 2021 10:05:25 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lADA4-0007u5-00; Thu, 11 Feb 2021 15:41:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 53C82C0E70; Thu, 11 Feb 2021 15:41:03 +0100 (CET)
Date:   Thu, 11 Feb 2021 15:41:03 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Waiman Long <longman@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ben Gardon <bgardon@google.com>
Subject: Re: [PATCH] locking/arch: Move qrwlock.h include after qspinlock.h
Message-ID: <20210211144103.GA12529@alpha.franken.de>
References: <20210210144556.10932-1-longman@redhat.com>
 <20210210161942.GA5683@alpha.franken.de>
 <64241753-49cb-a49d-63e3-e2ef5820836d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64241753-49cb-a49d-63e3-e2ef5820836d@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 11, 2021 at 01:59:35PM +0100, Paolo Bonzini wrote:
> On 10/02/21 17:19, Thomas Bogendoerfer wrote:
> > >   arch/arm64/include/asm/spinlock.h  | 2 +-
> > >   arch/mips/include/asm/spinlock.h   | 2 +-
> > >   arch/xtensa/include/asm/spinlock.h | 2 +-
> > >   3 files changed, 3 insertions(+), 3 deletions(-)
> > which tree should this go through ? I can take it via mips-next,
> > if everybody agrees.
> 
> The breakage is in the KVM tree, and the existing patch has acked-by from
> the locking primitives folks.  So I'll queue it there in order to limit the
> range that breaks bisection.

if it's not too late you can add by 

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
