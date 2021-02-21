Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE4D320E70
	for <lists+linux-mips@lfdr.de>; Sun, 21 Feb 2021 23:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbhBUW7P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Feb 2021 17:59:15 -0500
Received: from elvis.franken.de ([193.175.24.41]:44611 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232152AbhBUW7H (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 21 Feb 2021 17:59:07 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lDxgF-0001Gf-00; Sun, 21 Feb 2021 23:58:23 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 11DD2C05CE; Sun, 21 Feb 2021 23:39:29 +0100 (CET)
Date:   Sun, 21 Feb 2021 23:39:29 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v11] block: Add n64 cart driver
Message-ID: <20210221223928.GA8374@alpha.franken.de>
References: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jan 23, 2021 at 09:53:27AM +0200, Lauri Kasanen wrote:
> This adds support for the Nintendo 64 console's carts. Carts are a
> read-only media ranging from 8mb to 64mb.
> 
> Only one cart can be connected at once, and switching it requires a
> reboot.
> 
> No module support to save RAM, as the target has 8mb RAM.
> 
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>  drivers/block/Kconfig   |   6 ++
>  drivers/block/Makefile  |   1 +
>  drivers/block/n64cart.c | 189 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 196 insertions(+)
>  create mode 100644 drivers/block/n64cart.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
