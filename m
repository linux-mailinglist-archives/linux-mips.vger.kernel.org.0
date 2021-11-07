Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22A24474FA
	for <lists+linux-mips@lfdr.de>; Sun,  7 Nov 2021 19:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhKGSqa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 7 Nov 2021 13:46:30 -0500
Received: from aposti.net ([89.234.176.197]:49656 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229713AbhKGSqa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Nov 2021 13:46:30 -0500
Date:   Sun, 07 Nov 2021 18:43:33 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/3] mtd: Ingenic NAND fix for JZ4740
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>, list@opendingux.net,
        linux-mtd@lists.infradead.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        Riccardo Mottola <riccardo.mottola@libero.it>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Paul Boddie <paul@boddie.org.uk>
Message-Id: <LCT72R.SB2TF0MK7Q3B@crapouillou.net>
In-Reply-To: <968356A9-2A88-48B1-B31F-55C22BCE620E@goldelico.com>
References: <20211009184952.24591-1-paul@crapouillou.net>
        <968356A9-2A88-48B1-B31F-55C22BCE620E@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le dim., nov. 7 2021 at 14:47:43 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> 
>>  Am 09.10.2021 um 20:49 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  Hi,
>> 
>>  Looks like NAND support has been broken on the JZ4740 SoC for a 
>> while;
> 
> Yes, I remember someone telling that something was fundamentally 
> broken
> and impossible to be fixed a while ago.

You mean MLC NAND, and that's still broken.

>>  it looks like it comes from the fact that the "hw_oob_first" 
>> mechanism
>>  was dropped from the NAND core and moved to the Davinci driver.
>> 
>>  It turns out the JZ4740 SoC needs it too; I didn't notice it when
>>  writing the new ingenic-nand driver (to replace the old jz4740-nand
>>  driver) most likely because my Device Tree had the "nand-ecc-mode" 
>> set
>>  to "hw_oob_first".
>> 
>>  I am not very sure about patch [1/3]; to me the original code does 
>> not
>>  make sense, and it didn't work out-of-the-box on the JZ4740 without 
>> it.
>>  By applying patch [1/3] the function 
>> nand_read_page_hwecc_oob_first()
>>  can be reused for the JZ4740 SoC as well. But I did not test patch 
>> [1/3]
>>  on Davinci.
> 
> would this also work for jz4780 NAND?

The JZ4780 NAND driver does work, but UBI refuses to use the CI20's 
NAND as it's a MLC.

-Paul


