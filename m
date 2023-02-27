Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D91C6A4EFE
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 23:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjB0W4L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 17:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjB0W4L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 17:56:11 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D1910BDFF
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 14:56:09 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pWmPg-0007zQ-01; Mon, 27 Feb 2023 23:56:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5870DC0F89; Mon, 27 Feb 2023 23:54:08 +0100 (CET)
Date:   Mon, 27 Feb 2023 23:54:08 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, philmd@linaro.org
Subject: Re: [PATCH v2 0/2] MIPS Booting fixes
Message-ID: <20230227225408.GA23071@alpha.franken.de>
References: <20230227184614.70026-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227184614.70026-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 27, 2023 at 06:46:12PM +0000, Jiaxun Yang wrote:
> Hi all,
> 
> This patchset fixes two issues that was found when doing reboot
> stress test on Malta/Boston FPGA board with various MIPS cores.
> 
> Perhaps they should go through the mips-fixes tree.
> 
> Thanks
> 
> Jiaxun Yang (2):
>   MIPS: smp-cps: Don't rely on CP0_CMGCRBASE
>   MIPS: cevt-r4k: Offset the value used to clear compare interrupt
> 
>  arch/mips/include/asm/smp-cps.h |  4 ++++
>  arch/mips/kernel/cevt-r4k.c     |  4 ++--
>  arch/mips/kernel/cps-vec.S      | 35 ++++++++++++++-------------------
>  arch/mips/kernel/smp-cps.c      |  2 ++
>  4 files changed, 23 insertions(+), 22 deletions(-)
> 
> -- 
> 2.37.1 (Apple Git-137.1)

applied to mips-next (will send in a second PR for this merge window).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
