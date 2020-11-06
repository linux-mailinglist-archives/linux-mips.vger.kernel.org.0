Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076D72A94C1
	for <lists+linux-mips@lfdr.de>; Fri,  6 Nov 2020 11:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgKFKxz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Nov 2020 05:53:55 -0500
Received: from elvis.franken.de ([193.175.24.41]:41171 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbgKFKxy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Nov 2020 05:53:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kazNR-0000vt-00; Fri, 06 Nov 2020 11:53:53 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 88451C4DDA; Fri,  6 Nov 2020 11:49:15 +0100 (CET)
Date:   Fri, 6 Nov 2020 11:49:15 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Jiri Kosina <trivial@kernel.org>, linux-mips@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Kconfig: fix a few trivial spelling mistakes
Message-ID: <20201106104915.GB9806@alpha.franken.de>
References: <20201027183430.56772-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027183430.56772-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 27, 2020 at 06:34:30PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are a few spelling mistakes in the Kconfig, fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/mips/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
