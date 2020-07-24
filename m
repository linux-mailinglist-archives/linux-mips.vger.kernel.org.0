Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F15722C26D
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jul 2020 11:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgGXJig (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 05:38:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:60216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726182AbgGXJig (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Jul 2020 05:38:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 859B8206D7;
        Fri, 24 Jul 2020 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595583516;
        bh=OmyIda6YMRI/Qz7q2im7YSEctLsidA3ydJX53kNZ3xw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aHGtQpF4hHHh+3BuTzEYVpxY4dQ21eAucUKGmWZN5xJCdSt1XIsOjlyNTmlJWGn8J
         JLyutTI+1q8SGXft710HZKSZoIVctCD4S6aTtLlaACIjGMx74EZdQS2xRzfqGb8d32
         0MOUJBcNngnkhLwhq50XaqUSp2n+3Nd91d3k6R9w=
Date:   Fri, 24 Jul 2020 11:38:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Jiri Slaby <jslaby@suse.cz>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] newport_con: vc_color is now in state
Message-ID: <20200724093838.GA4169737@kroah.com>
References: <202007241318.wXYkumEO%lkp@intel.com>
 <20200724062735.18229-1-jslaby@suse.cz>
 <b1b9d90a-5fe3-947a-dc4e-8576cd143869@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1b9d90a-5fe3-947a-dc4e-8576cd143869@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 24, 2020 at 12:30:59PM +0300, Sergei Shtylyov wrote:
> On 24.07.2020 9:27, Jiri Slaby wrote:
> 
> > Since commit 28bc24fc46f9 (vc: separate state), vc->vc_color is known as
> 
>    Cgit says "Bad object id: 28bc24fc46f9" (in Linus' repo). Also, you should
> enclose the commit summary in (""), not just ()...

I've added the proper "Fixes:" tag when committing this, no worries.

greg k-h
