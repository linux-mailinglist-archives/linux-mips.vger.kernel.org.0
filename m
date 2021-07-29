Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795843DA09E
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 11:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235427AbhG2Jx5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 05:53:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:32864 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231488AbhG2Jx4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Jul 2021 05:53:56 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m92jg-00021m-00; Thu, 29 Jul 2021 11:53:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4BF29C11F4; Thu, 29 Jul 2021 11:44:46 +0200 (CEST)
Date:   Thu, 29 Jul 2021 11:44:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: Fix spelling contraction "cant" -> "can't"
Message-ID: <20210729094446.GA8286@alpha.franken.de>
References: <20210728102612.171012-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728102612.171012-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 28, 2021 at 11:26:12AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a pr_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/mips/alchemy/devboards/db1200.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
