Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021371ACDE8
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 18:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbgDPQld (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 12:41:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:42202 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728109AbgDPQld (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 12:41:33 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jP7Zy-0001kl-03; Thu, 16 Apr 2020 18:41:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 77EF1C0144; Thu, 16 Apr 2020 18:37:55 +0200 (CEST)
Date:   Thu, 16 Apr 2020 18:37:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     bibo mao <maobibo@loongson.cn>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
        Allison Randal <allison@lohutok.net>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: xilfpga: Removed unused header files
Message-ID: <20200416163755.GD24743@alpha.franken.de>
References: <1585208567-17979-1-git-send-email-maobibo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585208567-17979-1-git-send-email-maobibo@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 26, 2020 at 03:42:47AM -0400, bibo mao wrote:
> Header in directory asm/mach-xilfpga is not used any more.
> Remove it here, and it passes to compile with xilfpga_defconfig
> 
> Signed-off-by: bibo mao <maobibo@loongson.cn>
> ---
>  arch/mips/include/asm/mach-xilfpga/irq.h | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-xilfpga/irq.h

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
