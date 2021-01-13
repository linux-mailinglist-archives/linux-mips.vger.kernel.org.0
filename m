Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63482F48F8
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 11:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbhAMKou (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 05:44:50 -0500
Received: from elvis.franken.de ([193.175.24.41]:47762 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727655AbhAMKos (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 05:44:48 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kzddE-00021m-00; Wed, 13 Jan 2021 11:44:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DD936C029F; Wed, 13 Jan 2021 11:07:22 +0100 (CET)
Date:   Wed, 13 Jan 2021 11:07:22 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     menglong8.dong@gmail.com
Cc:     alexander.sverdlin@nokia.com, paulburton@kernel.org,
        gustavo@embeddedor.com, dong.menglong@zte.com.cn,
        colin.king@canonical.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: OCTEON: fix unreachable code in
 octeon_irq_init_ciu
Message-ID: <20210113100722.GA10351@alpha.franken.de>
References: <20210111132725.4513-1-dong.menglong@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111132725.4513-1-dong.menglong@zte.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 11, 2021 at 05:27:25AM -0800, menglong8.dong@gmail.com wrote:
> From: Menglong Dong <dong.menglong@zte.com.cn>
> 
> The type of 'r' in octeon_irq_init_ciu is 'unsigned int', so 'r < 0'
> can't be true.
> 
> Fix this by change the type of 'r' and 'i' from 'unsigned int'
> to 'int'. As 'i' won't be negative, this change works.
> 
> Fixes: 99fbc70f8547 ("MIPS: Octeon: irq: Alloc desc before configuring IRQ")
> Signed-off-by: Menglong Dong <dong.menglong@zte.com.cn>
> Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
> v2:
> - change 'Fixes' from 64b139f97c01 to 99fbc70f8547
> ---
>  arch/mips/cavium-octeon/octeon-irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
