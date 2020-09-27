Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B7E27A41F
	for <lists+linux-mips@lfdr.de>; Sun, 27 Sep 2020 22:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgI0UzR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Sep 2020 16:55:17 -0400
Received: from elvis.franken.de ([193.175.24.41]:60551 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgI0UzR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Sep 2020 16:55:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kMdhT-0006KU-00; Sun, 27 Sep 2020 22:55:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 13CF4C102E; Sun, 27 Sep 2020 22:22:05 +0200 (CEST)
Date:   Sun, 27 Sep 2020 22:22:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Pujin Shi <shipujin.t@gmail.com>
Cc:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Kees Cook <keescook@chromium.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: Fix build error
Message-ID: <20200927202205.GA9767@alpha.franken.de>
References: <20200927092610.1378-1-shipujin.t@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927092610.1378-1-shipujin.t@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 27, 2020 at 05:26:10PM +0800, Pujin Shi wrote:
> arch/mips/mm/init.c: In function 'mem_init':
> ././include/linux/compiler_types.h:319:38: error: call to '__compiletime_assert_321' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)

this is exactly what we want, so there is nothing to fix in this spot.
The only real fix is change page table format for 32bit to get more
PTE bits...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
