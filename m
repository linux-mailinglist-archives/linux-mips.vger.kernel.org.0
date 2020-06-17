Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458331FCC14
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 13:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgFQLRd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 07:17:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:35899 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726565AbgFQLRb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jun 2020 07:17:31 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jlW4P-0006Ho-04; Wed, 17 Jun 2020 13:17:29 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 02B47C06C3; Wed, 17 Jun 2020 13:14:55 +0200 (CEST)
Date:   Wed, 17 Jun 2020 13:14:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM63xx: add endif comments
Message-ID: <20200617111455.GE9940@alpha.franken.de>
References: <20200608101828.3383942-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200608101828.3383942-1-noltari@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 08, 2020 at 12:18:28PM +0200, Álvaro Fernández Rojas wrote:
> There are plenty of ifdefs in board_bcm963xx.c without endif comments.
> Let's make the code easier to follow by adding proper comments.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  arch/mips/bcm63xx/boards/board_bcm963xx.c | 33 +++++++++++------------
>  1 file changed, 15 insertions(+), 18 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
