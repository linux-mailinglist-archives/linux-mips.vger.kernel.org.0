Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD47F44B062
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 16:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236981AbhKIPeN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 10:34:13 -0500
Received: from elvis.franken.de ([193.175.24.41]:39248 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239093AbhKIPeM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 10:34:12 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mkT5p-00033f-01; Tue, 09 Nov 2021 16:31:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A5628C2C38; Tue,  9 Nov 2021 16:29:33 +0100 (CET)
Date:   Tue, 9 Nov 2021 16:29:33 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org, jim2101024@gmail.com,
        bcm-kernel-feedback-list@broadcom.com,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Update bmips_stb_defconfig
Message-ID: <20211109152933.GB12535@alpha.franken.de>
References: <20211105195240.1400898-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105195240.1400898-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 05, 2021 at 12:52:39PM -0700, Florian Fainelli wrote:
> Align the bmips_stb_defconfig with its downstream version at:
> https://github.com/Broadcom/stblinux-4.1/blob/master/linux/arch/mips/configs/bmips_stb_defconfig
> to be slightly more useful and include support for all of these options:
> 
> - latest Broadcom STB drivers
> - support for high resolution timers
> - cpufreq
> - function tracers
> - extending command line from DTB
> - task lockup detector
> - strong stack protector support
> - IP auto-configuration
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/mips/configs/bmips_stb_defconfig | 155 ++++++++++++++++++++++++--
>  1 file changed, 147 insertions(+), 8 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
