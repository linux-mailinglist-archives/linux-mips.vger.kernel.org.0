Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A7A1DAB00
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 08:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgETGsG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 02:48:06 -0400
Received: from elvis.franken.de ([193.175.24.41]:60046 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726475AbgETGsF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 02:48:05 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jbIWJ-0007pg-01; Wed, 20 May 2020 08:48:03 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 08C34C014C; Wed, 20 May 2020 08:45:21 +0200 (CEST)
Date:   Wed, 20 May 2020 08:45:21 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: ingenic: Add missing include
Message-ID: <20200520064520.GB7630@alpha.franken.de>
References: <20200519212230.313365-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519212230.313365-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 19, 2020 at 11:22:30PM +0200, Paul Cercueil wrote:
> Add missing include which adds the prototype to plat_time_init().
> 
> Fixes: f932449c11da ("MIPS: ingenic: Drop obsolete code, merge the rest in setup.c")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reported-by: kbuild test robot <lkp@intel.com>
> ---
>  arch/mips/jz4740/setup.c | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
