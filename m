Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4E122C04C
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jul 2020 09:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgGXH6R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 03:58:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:45488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgGXH6R (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Jul 2020 03:58:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A89C52068F;
        Fri, 24 Jul 2020 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595577497;
        bh=MrwCiCK2poXyalIQcTVioocFhr5gBVdyQlm3J3yoT6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SZ5SE4UEtBCEwHakT4CT424khXj0IXDrQsmyhCYSmXsOe/zJUUwFQzzeS25E9bTrf
         EXegxWvE0nG3QyGlvBO1BrM1L9HyK8V8JdCtkY+b/KffvBEIMcHQU68w2uMzpfWhQn
         T2p09xeGgeOXqQOm0BCOWV6Hnrg+Yr1G7lkqzEpc=
Date:   Fri, 24 Jul 2020 09:58:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jiri Slaby <jslaby@suse.cz>
Cc:     linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] newport_con: vc_color is now in state
Message-ID: <20200724075819.GA3955149@kroah.com>
References: <202007241318.wXYkumEO%lkp@intel.com>
 <20200724062735.18229-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724062735.18229-1-jslaby@suse.cz>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 24, 2020 at 08:27:35AM +0200, Jiri Slaby wrote:
> Since commit 28bc24fc46f9 (vc: separate state), vc->vc_color is known as
> vc->state.color. Somehow both me and 0-day bot missed this driver during
> the conversion.
> 
> So fix the driver now.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> ---
>  drivers/video/console/newport_con.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

You forgot the "Reported-by:" line :(

I'll go add it, thanks for the fix.

greg k-h
