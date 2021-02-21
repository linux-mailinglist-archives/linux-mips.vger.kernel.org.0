Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC3B320E71
	for <lists+linux-mips@lfdr.de>; Sun, 21 Feb 2021 23:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbhBUW7P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Feb 2021 17:59:15 -0500
Received: from elvis.franken.de ([193.175.24.41]:44617 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232157AbhBUW7I (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 21 Feb 2021 17:59:08 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lDxgF-0001Gf-01; Sun, 21 Feb 2021 23:58:23 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C1E72C07AD; Sun, 21 Feb 2021 23:39:45 +0100 (CET)
Date:   Sun, 21 Feb 2021 23:39:45 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Cc:     linux-mips@vger.kernel.org, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com
Subject: Re: [PATCH 0/9] n64: small cleanups
Message-ID: <20210221223945.GB8374@alpha.franken.de>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 25, 2021 at 03:32:34PM -0800, Chaitanya Kulkarni wrote:
> Hi Lauri,
> 
> This cleanup series is based on the top of v11 that adds kernel coding
> style fixes in the various places without changing the functionality.
> 
> Instead of sending a one big patch I've made small patches which are
> easier to review, integrate, blame and revert in case of any error.
> 
> I've got the reviewed-by tag from the driver owner offline which
> is added to the series.
> 
> -ck
> 
> Chaitanya Kulkarni (9):
>   n64: use pr_fmt to avoid duplicate string
>   n64: move module info at the end
>   n64: move module param at the top
>   n64: use enums for reg
>   n64: use sector SECTOR_SHIFT instead 512
>   n64: remove curly brackets
>   n64: cosmetics changes
>   n64: cleanup n64cart_probe()
>   n64: store dev instance into disk private data
> 
>  drivers/block/n64cart.c | 87 ++++++++++++++++++-----------------------
>  1 file changed, 38 insertions(+), 49 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
