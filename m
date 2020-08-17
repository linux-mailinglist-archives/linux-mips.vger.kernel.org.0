Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B0B246570
	for <lists+linux-mips@lfdr.de>; Mon, 17 Aug 2020 13:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgHQLb2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Aug 2020 07:31:28 -0400
Received: from elvis.franken.de ([193.175.24.41]:49790 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728168AbgHQLbV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Aug 2020 07:31:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k7dMD-0003tH-00; Mon, 17 Aug 2020 13:31:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7C81EC0D71; Mon, 17 Aug 2020 13:16:43 +0200 (CEST)
Date:   Mon, 17 Aug 2020 13:16:43 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] MIPS: BCM63xx: board improvements
Message-ID: <20200817111643.GA11725@alpha.franken.de>
References: <20200812075235.366864-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200812075235.366864-1-noltari@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 12, 2020 at 09:52:30AM +0200, Álvaro Fernández Rojas wrote:
> v4: Split license change to a new patch.
> v3: Reword DWV-S0 board commit description to avoid possible confusions.
> v2: switch to SPDX license identifier.
> 
> Álvaro Fernández Rojas (5):
>   MIPS: BCM63xx: remove duplicated new lines
>   MIPS: BCM63xx: remove EHCI from BCM6348 boards
>   MIPS: BCM63xx: enable EHCI for DWV-S0 board
>   MIPS: BCM63xx: refactor board declarations
>   MIPS: BCM63xx: switch to SPDX license identifier
> 
>  arch/mips/bcm63xx/boards/board_bcm963xx.c | 625 +++++++++++-----------
>  1 file changed, 306 insertions(+), 319 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
