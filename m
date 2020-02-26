Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01FAF1701B5
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 15:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgBZO7g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 09:59:36 -0500
Received: from elvis.franken.de ([193.175.24.41]:38970 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726063AbgBZO7g (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 26 Feb 2020 09:59:36 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1j6y9t-0001cq-00; Wed, 26 Feb 2020 15:59:33 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4FF4BC0E99; Wed, 26 Feb 2020 15:59:17 +0100 (CET)
Date:   Wed, 26 Feb 2020 15:59:17 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Paul Burton <paulburton@kernel.org>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix CONFIG_MIPS_CMDLINE_DTB_EXTEND handling
Message-ID: <20200226145917.GA12722@alpha.franken.de>
References: <20200225152810.45048-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225152810.45048-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 25, 2020 at 12:28:09PM -0300, Paul Cercueil wrote:
> The CONFIG_MIPS_CMDLINE_DTB_EXTEND option is used so that the kernel
> arguments provided in the 'bootargs' property in devicetree are extended
> with the kernel arguments provided by the bootloader.
> 
> The code was broken, as it didn't actually take any of the kernel
> arguments provided in devicetree when that option was set.
> 
> Fixes: 7784cac69735 ("MIPS: cmdline: Clean up boot_command_line
> initialization")
> Cc: stable@vger.kernel.org
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/kernel/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
