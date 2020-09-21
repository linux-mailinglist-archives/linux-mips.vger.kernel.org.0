Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9B8273480
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 23:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgIUU7n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 16:59:43 -0400
Received: from elvis.franken.de ([193.175.24.41]:49825 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727483AbgIUU7m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 16:59:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKSuS-0001Rx-05; Mon, 21 Sep 2020 22:59:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AEA1CC0FE4; Mon, 21 Sep 2020 22:26:00 +0200 (CEST)
Date:   Mon, 21 Sep 2020 22:26:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     paulburton@kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] MIPS: Make setup_elfcorehdr and setup_elfcorehdr_size
 static
Message-ID: <20200921202600.GE29322@alpha.franken.de>
References: <20200911020132.1464661-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911020132.1464661-1-yanaijie@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 11, 2020 at 10:01:32AM +0800, Jason Yan wrote:
> This addresses the following sparse warning:
> 
> arch/mips/kernel/setup.c:446:33: warning: symbol 'setup_elfcorehdr_size'
> was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  arch/mips/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
