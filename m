Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9719E18168B
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 12:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgCKLIG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 07:08:06 -0400
Received: from elvis.franken.de ([193.175.24.41]:34081 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgCKLIG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 07:08:06 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jBzDZ-00012x-00
        for linux-mips@vger.kernel.org; Wed, 11 Mar 2020 12:08:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5A3B5C0FE6; Wed, 11 Mar 2020 12:07:54 +0100 (CET)
Date:   Wed, 11 Mar 2020 12:07:54 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: Re: MIPS Hardware support
Message-ID: <20200311110754.GA10734@alpha.franken.de>
References: <20200227144910.GA25011@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 27, 2020 at 03:49:10PM +0100, Thomas Bogendoerfer wrote:
> [..]

Thank you everybody for giving me information about your hardware.

So we have following system types without users:

LASAT Networks platforms (LASAT)
IMG Pistachio SoC based boards (MACH_PISTACHIO)
NEC EMMA2RH Mark-eins board (NEC_MARKEINS)
NEC VR4100 series based machines (MACH_VR41XX)
NXP STB220 board (NXP_STB220)
NXP 225 board (NXP_STB225)
PMC-Sierra MSP chipsets (PMC_MSP)
Toshiba TX39 series based machines (MACH_TX39XX)
Toshiba TX49 series based machines (MACH_TX49XX)
Mikrotik RB532 boards (MIKROTIK_RB532)
Cavium Networks Octeon SoC based boards (CAVIUM_OCTEON_SOC)
Netlogic XLR/XLS based systems (NLM_XLR_BOARD)
Netlogic XLP based systems (NLM_XLP_BOARD)

As you might have guessed already I'm thinking about dropping dead platforms.

Looking at git history these are my candicates for dropping in 5.8:

LASAT Networks platforms (LASAT)
NEC EMMA2RH Mark-eins board (NEC_MARKEINS)
PMC-Sierra MSP chipsets (PMC_MSP)

If there are still users of that platforms, please speak up !!!

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
