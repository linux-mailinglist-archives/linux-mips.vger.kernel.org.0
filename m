Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB8A1C84F6
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 10:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgEGIjX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 04:39:23 -0400
Received: from elvis.franken.de ([193.175.24.41]:43283 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgEGIjX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 04:39:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jWc3t-0006Ql-01; Thu, 07 May 2020 10:39:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A7B1EC03A8; Thu,  7 May 2020 10:37:37 +0200 (CEST)
Date:   Thu, 7 May 2020 10:37:37 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Remove dead code in pci.h
Message-ID: <20200507083737.GA8924@alpha.franken.de>
References: <20200506134250.32550-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506134250.32550-1-yanaijie@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 06, 2020 at 09:42:50PM +0800, Jason Yan wrote:
> This code has been marked dead for more than 10 years. Seems no need to
> keep it now.
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  arch/mips/include/asm/mach-rc32434/pci.h | 3 ---
>  1 file changed, 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
