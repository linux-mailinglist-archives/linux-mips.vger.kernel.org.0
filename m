Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD153E1102
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 11:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237185AbhHEJRg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 05:17:36 -0400
Received: from elvis.franken.de ([193.175.24.41]:46897 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232009AbhHEJRg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 05:17:36 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mBZV8-0005ti-06; Thu, 05 Aug 2021 11:17:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F1B6CC052F; Thu,  5 Aug 2021 11:16:57 +0200 (CEST)
Date:   Thu, 5 Aug 2021 11:16:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Rui Wang <wangrui@loongson.cn>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Rui Wang <r@hev.cc>
Subject: Re: [RFC PATCH v2] locking/atomic: arch/mips: Fix
 atomic{_64,}_sub_if_positive
Message-ID: <20210805091657.GF5979@alpha.franken.de>
References: <20210729093152.146256-1-wangrui@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729093152.146256-1-wangrui@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 29, 2021 at 05:31:52PM +0800, Rui Wang wrote:
> This looks like a typo and that caused atomic64 test failed.
> 
> Signed-off-by: Rui Wang <wangrui@loongson.cn>
> ---
>  arch/mips/include/asm/atomic.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next with slightly edited subject.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
