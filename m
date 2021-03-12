Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1549E33909E
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 16:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbhCLPDb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 10:03:31 -0500
Received: from elvis.franken.de ([193.175.24.41]:53061 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232086AbhCLPCt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 10:02:49 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lKjJN-0002Tu-00; Fri, 12 Mar 2021 16:02:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 28F12C1E4A; Fri, 12 Mar 2021 16:00:00 +0100 (CET)
Date:   Fri, 12 Mar 2021 16:00:00 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH  mips/linux.git 0/5] firmware: bcm47xx_nvram: refactor
 finding & reading NVRAM
Message-ID: <20210312150000.GA3743@alpha.franken.de>
References: <20210308090320.9765-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210308090320.9765-1-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 08, 2021 at 10:03:15AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This patchset refactors driver part finding and reading NVRAM.
> 
> It been tested on BCM4706. Updated code checks the same offsets as
> before. Driver still finds & copies NVRAM content.
> 
> It's a new patchset replacing previous single-patch attempt:
> [PATCH V2 mips/linux.git] firmware: bcm47xx_nvram: refactor finding & reading NVRAM
> 
> Rafał Miłecki (5):
>   firmware: bcm47xx_nvram: rename finding function and its variables
>   firmware: bcm47xx_nvram: add helper checking for NVRAM
>   firmware: bcm47xx_nvram: extract code copying NVRAM
>   firmware: bcm47xx_nvram: look for NVRAM with for instead of while
>   firmware: bcm47xx_nvram: inline code checking NVRAM size
> 
>  drivers/firmware/broadcom/bcm47xx_nvram.c | 92 ++++++++++++-----------
>  1 file changed, 47 insertions(+), 45 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
