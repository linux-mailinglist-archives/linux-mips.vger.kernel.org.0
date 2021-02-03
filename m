Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04CD30D7C6
	for <lists+linux-mips@lfdr.de>; Wed,  3 Feb 2021 11:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbhBCKlW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 05:41:22 -0500
Received: from elvis.franken.de ([193.175.24.41]:49434 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233731AbhBCKlK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 05:41:10 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7FaD-0005T6-02; Wed, 03 Feb 2021 11:40:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 90170C0D4A; Wed,  3 Feb 2021 11:37:41 +0100 (CET)
Date:   Wed, 3 Feb 2021 11:37:41 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: malta-time: remove unneeded semicolon
Message-ID: <20210203103741.GC7586@alpha.franken.de>
References: <1612234349-63858-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612234349-63858-1-git-send-email-yang.lee@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 02, 2021 at 10:52:29AM +0800, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./arch/mips/mti-malta/malta-time.c:141:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/mips/mti-malta/malta-time.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
