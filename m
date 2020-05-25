Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7199D1E0F9D
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 15:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390781AbgEYNhf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 09:37:35 -0400
Received: from elvis.franken.de ([193.175.24.41]:38392 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388794AbgEYNhf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 May 2020 09:37:35 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jdDIM-0007yZ-00; Mon, 25 May 2020 15:37:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B5F02C0261; Mon, 25 May 2020 15:29:31 +0200 (CEST)
Date:   Mon, 25 May 2020 15:29:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
Cc:     f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM63XX: fix BCM6358 GPIO count
Message-ID: <20200525132931.GA12983@alpha.franken.de>
References: <4452917.ZOZUicq8Ig@tool>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4452917.ZOZUicq8Ig@tool>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 24, 2020 at 08:59:53PM +0200, Daniel González Cabanelas wrote:
> The BCM6358 SoC has only 38 available GPIOs. Fix it.
> 
> Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
> ---
>  arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
