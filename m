Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63CB03065C3
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 22:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbhA0VMA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 16:12:00 -0500
Received: from elvis.franken.de ([193.175.24.41]:60503 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233893AbhA0VLw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 16:11:52 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l4s5l-0003cQ-02; Wed, 27 Jan 2021 22:11:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 226C8C0AAF; Wed, 27 Jan 2021 22:06:27 +0100 (CET)
Date:   Wed, 27 Jan 2021 22:06:27 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Chengyang Fan <cy.fan@huawei.com>
Cc:     linux-mips@vger.kernel.org, joe@perches.com
Subject: Re: [PATCH] MIPS: asm: spram: remove unneeded semicolon
Message-ID: <20210127210627.GC21002@alpha.franken.de>
References: <20210125094825.1718501-1-cy.fan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125094825.1718501-1-cy.fan@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 25, 2021 at 05:48:25PM +0800, Chengyang Fan wrote:
> Remove a superfluous semicolon after function definition.
> 
> Signed-off-by: Chengyang Fan <cy.fan@huawei.com>
> ---
>  arch/mips/include/asm/spram.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
