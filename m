Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD2122DD40
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 10:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgGZIcW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Jul 2020 04:32:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:49107 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbgGZIcW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Jul 2020 04:32:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jzc4y-0004Hg-00; Sun, 26 Jul 2020 10:32:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AF654C09A9; Sun, 26 Jul 2020 10:22:14 +0200 (CEST)
Date:   Sun, 26 Jul 2020 10:22:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/6] mips: delete duplicated words
Message-ID: <20200726082214.GA5032@alpha.franken.de>
References: <20200726003429.20356-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726003429.20356-1-rdunlap@infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 25, 2020 at 05:34:23PM -0700, Randy Dunlap wrote:
> Delete duplicated words in arch/mips/ header files.
> 
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> 
>  arch/mips/include/asm/io.h              |    2 +-
>  arch/mips/include/asm/octeon/cvmx-l2c.h |    2 +-
>  arch/mips/include/asm/octeon/cvmx-pip.h |    2 +-
>  arch/mips/include/asm/octeon/cvmx-pko.h |    7 +++----
>  arch/mips/include/asm/octeon/cvmx-pow.h |    8 ++++----
>  arch/mips/include/asm/octeon/octeon.h   |    2 +-
>  6 files changed, 11 insertions(+), 12 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
