Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79421D293E
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 09:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgENH5f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 03:57:35 -0400
Received: from elvis.franken.de ([193.175.24.41]:53047 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725952AbgENH5K (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 03:57:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jZ8js-0005U5-05; Thu, 14 May 2020 09:57:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C4A2BC0493; Thu, 14 May 2020 09:49:16 +0200 (CEST)
Date:   Thu, 14 May 2020 09:49:16 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 05/11] MIPS: constify sysrq_key_op
Message-ID: <20200514074916.GF5880@alpha.franken.de>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
 <20200513214351.2138580-5-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513214351.2138580-5-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 13, 2020 at 10:43:45PM +0100, Emil Velikov wrote:
> With earlier commits, the API no longer discards the const-ness of the
> sysrq_key_op. As such we can add the notation.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
> Please keep me in the CC list, as I'm not subscribed to the list.
> 
> IMHO it would be better it this gets merged this via the tty tree.
> ---
>  arch/mips/kernel/sysrq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
