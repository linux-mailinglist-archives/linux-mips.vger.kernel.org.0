Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02CB2366B35
	for <lists+linux-mips@lfdr.de>; Wed, 21 Apr 2021 14:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239969AbhDUMw3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Apr 2021 08:52:29 -0400
Received: from elvis.franken.de ([193.175.24.41]:35169 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239954AbhDUMw1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Apr 2021 08:52:27 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZCKf-0004Cw-03; Wed, 21 Apr 2021 14:51:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2C349C0840; Wed, 21 Apr 2021 14:02:14 +0200 (CEST)
Date:   Wed, 21 Apr 2021 14:02:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] MIPS: pci-legacy: revert "use generic
 pci_enable_resources"
Message-ID: <20210421120214.GD8637@alpha.franken.de>
References: <20210420052319.GA162457@roeck-us.net>
 <20210420063942.7041-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420063942.7041-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 19, 2021 at 11:39:43PM -0700, Ilya Lipnitskiy wrote:
> This mostly reverts commit 99bca615d895 ("MIPS: pci-legacy: use generic
> pci_enable_resources"). Fixes regressions such as:
>   ata_piix 0000:00:0a.1: can't enable device: BAR 0 [io  0x01f0-0x01f7] not
> 	claimed
>   ata_piix: probe of 0000:00:0a.1 failed with error -22
> 
> The only changes from the strict revert are to fix checkpatch errors:
>   ERROR: spaces required around that '=' (ctx:VxV)
>   #33: FILE: arch/mips/pci/pci-legacy.c:252:
>   +	for (idx=0; idx < PCI_NUM_RESOURCES; idx++) {
>  	        ^
> 
>   ERROR: do not use assignment in if condition
>   #67: FILE: arch/mips/pci/pci-legacy.c:284:
>   +	if ((err = pcibios_enable_resources(dev, mask)) < 0)
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
> Guenter, sorry about this - let's just revert this for now to minimize
> turmoil to the legacy PCI code. Obviously, this needs more testing
> before applying. Thanks for your report!
> 
>  arch/mips/pci/pci-legacy.c | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
