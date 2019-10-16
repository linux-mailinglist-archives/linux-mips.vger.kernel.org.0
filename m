Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49065D8B35
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2019 10:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391658AbfJPIkV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Oct 2019 04:40:21 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56295 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389897AbfJPIkV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Oct 2019 04:40:21 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id F1DF9E000C;
        Wed, 16 Oct 2019 08:40:17 +0000 (UTC)
Date:   Wed, 16 Oct 2019 10:40:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Joshua Kinard <kumba@gentoo.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: ds1685: add indirect access method and remove
 plat_read/plat_write
Message-ID: <20191016084017.GZ3125@piout.net>
References: <20191014214621.25257-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014214621.25257-1-tbogendoerfer@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/10/2019 23:46:21+0200, Thomas Bogendoerfer wrote:
> SGI Octane (IP30) doesn't have RTC register directly mapped into CPU
> address space, but accesses RTC registers with an address and data
> register.  This is now supported by additional access functions, which
> are selected by a new field in platform data. Removed plat_read/plat_write
> since there is no user and their usage could introduce lifetime issue,
> when functions are placed in different modules.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
> Changes in v2:
> 
> - check if rtc->read and rtc->write are setup
> - spell out indirect in function names and explain difference
>   between standard and indirect functions
> 
>  arch/mips/sgi-ip32/ip32-platform.c |  2 +-
>  drivers/rtc/rtc-ds1685.c           | 78 +++++++++++++++++++++++++-------------
>  include/linux/rtc/ds1685.h         |  8 ++--
>  3 files changed, 58 insertions(+), 30 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
