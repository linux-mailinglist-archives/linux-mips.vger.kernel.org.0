Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8440A2A94CA
	for <lists+linux-mips@lfdr.de>; Fri,  6 Nov 2020 11:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgKFKx5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Nov 2020 05:53:57 -0500
Received: from elvis.franken.de ([193.175.24.41]:41178 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbgKFKx4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Nov 2020 05:53:56 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kazNR-0000vt-02; Fri, 06 Nov 2020 11:53:53 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A9E3BC4DDA; Fri,  6 Nov 2020 11:49:47 +0100 (CET)
Date:   Fri, 6 Nov 2020 11:49:47 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: cm: add missing iounmap() on error in
 mips_cm_probe()
Message-ID: <20201106104947.GD9806@alpha.franken.de>
References: <20201028091546.136258-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028091546.136258-1-miaoqinglang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 28, 2020 at 05:15:46PM +0800, Qinglang Miao wrote:
> Add the missing iounmap() of iounmap(mips_gcr_base) before
> return from mips_cm_probe() in the error handling case.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  arch/mips/kernel/mips-cm.c | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
