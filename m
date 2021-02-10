Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7669B316B07
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 17:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhBJQUv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 11:20:51 -0500
Received: from elvis.franken.de ([193.175.24.41]:40677 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231642AbhBJQUu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 11:20:50 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l9sDm-0002jH-00; Wed, 10 Feb 2021 17:20:06 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9243CC0E2C; Wed, 10 Feb 2021 17:19:42 +0100 (CET)
Date:   Wed, 10 Feb 2021 17:19:42 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Waiman Long <longman@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20210210161942.GA5683@alpha.franken.de>
References: <20210210144556.10932-1-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210144556.10932-1-longman@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 09:45:56AM -0500, Waiman Long wrote:
> The queued rwlock code has a dependency on the current spinlock
> implementation (likely to be qspinlock), but not vice versa. Including
> qrwlock.h before qspinlock.h can be problematic when expanding qrwlock
> functionality.
> 
> If both qspinlock.h and qrwlock.h are to be included, the qrwlock.h
> include should always be after qspinlock.h. Update the current set of
> asm/spinlock.h files to enforce that.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  arch/arm64/include/asm/spinlock.h  | 2 +-
>  arch/mips/include/asm/spinlock.h   | 2 +-
>  arch/xtensa/include/asm/spinlock.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

which tree should this go through ? I can take it via mips-next,
if everybody agrees.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
