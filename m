Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5212252C75
	for <lists+linux-mips@lfdr.de>; Wed, 26 Aug 2020 13:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgHZLbG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Aug 2020 07:31:06 -0400
Received: from elvis.franken.de ([193.175.24.41]:34969 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728955AbgHZL3W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 26 Aug 2020 07:29:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kAtbM-0004Yl-00; Wed, 26 Aug 2020 13:28:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 20EB8C0DE4; Wed, 26 Aug 2020 13:12:35 +0200 (CEST)
Date:   Wed, 26 Aug 2020 13:12:35 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] MIPS: SGI-IP27: No need for kmalloc.h
Message-ID: <20200826111235.GA7046@alpha.franken.de>
References: <20200825090907.66681-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825090907.66681-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 25, 2020 at 11:09:04AM +0200, Thomas Bogendoerfer wrote:
> SG -IP27 is always cache coherent so we can use generic kmalloc.h and
> remove the ip27 specific one.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/mach-ip27/kmalloc.h | 8 --------
>  1 file changed, 8 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-ip27/kmalloc.h

patches 1-4 applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
