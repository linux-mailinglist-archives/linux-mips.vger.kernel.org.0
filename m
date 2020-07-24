Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2795722C47E
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jul 2020 13:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgGXLsG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 07:48:06 -0400
Received: from elvis.franken.de ([193.175.24.41]:47133 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgGXLsG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Jul 2020 07:48:06 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jywBI-0003GQ-01; Fri, 24 Jul 2020 13:48:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D1AB0C09A9; Fri, 24 Jul 2020 13:09:48 +0200 (CEST)
Date:   Fri, 24 Jul 2020 13:09:48 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM63xx: improve CFE version detection
Message-ID: <20200724110948.GB17183@alpha.franken.de>
References: <20200608092835.3377581-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200608092835.3377581-1-noltari@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 08, 2020 at 11:28:35AM +0200, Álvaro Fernández Rojas wrote:
> There are some CFE variants that start with 'cfe-vd' instead of 'cfe-v', such
> as the one used in the Huawei HG556a: "cfe-vd081.5003". In this case, the CFE
> version is stored as is (string vs number bytes).
> 
> Some newer devices have an additional version number, such as the Comtrend
> VR-3032u: "1.0.38-112.118-11".
> 
> Finally, print the string as is if the version doesn't start with "cfe-v" or
> "cfe-vd", but starts with "cfe-".
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  arch/mips/bcm63xx/boards/board_bcm963xx.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
