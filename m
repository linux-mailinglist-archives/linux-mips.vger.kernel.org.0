Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A774A29AB7B
	for <lists+linux-mips@lfdr.de>; Tue, 27 Oct 2020 13:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750721AbgJ0MLM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Oct 2020 08:11:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:52165 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750661AbgJ0MLL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Oct 2020 08:11:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kXNoj-0002cz-01; Tue, 27 Oct 2020 13:11:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BB5D6C05A5; Tue, 27 Oct 2020 13:10:43 +0100 (CET)
Date:   Tue, 27 Oct 2020 13:10:43 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: ingenic: remove unused platform_data header file
Message-ID: <20201027121043.GB13777@alpha.franken.de>
References: <20201026192040.GA350265@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026192040.GA350265@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 26, 2020 at 08:20:40PM +0100, Sam Ravnborg wrote:
> There are no users of this headers file in the kernel.
> All users are likely migrated to device tree which is a good thing.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> Cc: linux-mips@vger.kernel.org
> ---
> 
> I noticed this while surfing around in platform_data for no apperant
> reason. So no fancy tooling or some such involved.
> 
> 	Sam
> 
>  .../linux/platform_data/jz4740/jz4740_nand.h  | 25 -------------------
>  1 file changed, 25 deletions(-)
>  delete mode 100644 include/linux/platform_data/jz4740/jz4740_nand.h

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
