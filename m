Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529863281BE
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 16:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236895AbhCAPEV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 10:04:21 -0500
Received: from elvis.franken.de ([193.175.24.41]:33721 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236876AbhCAPEB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Mar 2021 10:04:01 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lGk4s-00041h-03; Mon, 01 Mar 2021 16:03:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 516F0C03C2; Mon,  1 Mar 2021 15:51:01 +0100 (CET)
Date:   Mon, 1 Mar 2021 15:51:01 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: cavium: Replace DEFINE_SIMPLE_ATTRIBUTE with
 DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <20210301145101.GF11261@alpha.franken.de>
References: <1614154206-19069-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614154206-19069-1-git-send-email-yang.lee@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 24, 2021 at 04:10:06PM +0800, Yang Li wrote:
> Fix the following coccicheck warning:
> ./arch/mips/cavium-octeon/oct_ilm.c:65:0-23: WARNING:
> reset_statistics_ops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/mips/cavium-octeon/oct_ilm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
