Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD6B35C98E
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 17:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242758AbhDLPRL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 11:17:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:45491 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238015AbhDLPRK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 11:17:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lVyIz-0006wH-00; Mon, 12 Apr 2021 17:16:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8C8EEC02C4; Mon, 12 Apr 2021 17:07:04 +0200 (CEST)
Date:   Mon, 12 Apr 2021 17:07:04 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Chen Lifu <chenlifu@huawei.com>
Cc:     Zhang Qilong <zhangqilong3@huawei.com>, heying24@huawei.com,
        yuehaibing@huawei.com, weiyongjun1@huawei.com,
        johnny.chenyi@huawei.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: Alchemy: Use DEFINE_SPINLOCK() for spinlock
Message-ID: <20210412150704.GD23632@alpha.franken.de>
References: <20210327095225.104997-1-chenlifu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210327095225.104997-1-chenlifu@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 27, 2021 at 05:52:25PM +0800, Chen Lifu wrote:
> From: Lifu Chen <chenlifu@huawei.com>
> 
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Lifu Chen <chenlifu@huawei.com>
> ---
>  arch/mips/alchemy/common/clock.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
