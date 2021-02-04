Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91FE230F47E
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 15:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236376AbhBDOD0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Feb 2021 09:03:26 -0500
Received: from elvis.franken.de ([193.175.24.41]:52100 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236475AbhBDOBV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Feb 2021 09:01:21 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7fBQ-0004tX-00; Thu, 04 Feb 2021 15:00:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1AEF7C0D53; Thu,  4 Feb 2021 14:59:19 +0100 (CET)
Date:   Thu, 4 Feb 2021 14:59:19 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ralink: manage low reset lines
Message-ID: <20210204135919.GA13761@alpha.franken.de>
References: <20210203092140.12458-1-sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203092140.12458-1-sander@svanheule.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 03, 2021 at 10:21:41AM +0100, Sander Vanheule wrote:
> Reset lines with indices smaller than 8 are currently considered invalid
> by the rt2880-reset reset controller.
> 
> The MT7621 SoC uses a number of these low reset lines. The DTS defines
> reset lines "hsdma", "fe", and "mcm" with respective values 5, 6, and 2.
> As a result of the above restriction, these resets cannot be asserted or
> de-asserted by the reset controller. In cases where the bootloader does
> not de-assert these lines, this results in e.g. the MT7621's internal
> switch staying in reset.
> 
> Change the reset controller to only ignore the system reset, so all
> reset lines with index greater than 0 are considered valid.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
> This patch was tested on a TP-Link EAP235-Wall, with an MT7621DA SoC.
> The bootloader on this device would leave reset line 2 ("mcm") asserted,
> which caused the internal switch to be unresponsive on an uninterrupted
> boot from flash.
> 
> When tftpboot was used in the bootloader to load an initramfs, it did
> initialise the internal switch, and cleared the mcm reset line. In this
> case the switch could be used from the OS. With this patch applied, the
> switch works both in an initramfs, and when (cold) booting from flash.
> 
>  arch/mips/ralink/reset.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
