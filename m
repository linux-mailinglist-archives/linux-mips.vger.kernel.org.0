Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0E1447323
	for <lists+linux-mips@lfdr.de>; Sun,  7 Nov 2021 14:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbhKGNum (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Nov 2021 08:50:42 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:30696 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbhKGNum (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Nov 2021 08:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636292865;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=0iOoYrlW0W1dhedF3b0qomHYAYJFS+pAzW9ZnnfcvEM=;
    b=PsCDzRfKVtGOtujmTnNxjNWxdh5si21K1/0L3pjFbeDOtzzbquY26IRSsHOlz+g33M
    m+4jZNzQkrBVcyMt81/av2wJIa+xcb9Mxo5SQQBUf4aXT4fiS0d7eLEzEQdxvnw/H3kP
    o+yXXw1rembp92Ue3DbQbSbvGNCjRVkmCs4rJtsuU6umJEtJL2GuffpiUwu5BbZctWDc
    AEO2lok8oa3eI06aG0SsaY2lHi0A0iNB3lGMlgNfcR8TGTxi+Mw+pmuEDkmdQFEhz4sA
    SBLsBH1dRqYramJpqMvQyFDNnXYiDnX5SSxFVTX3I+Xos20aOhM8GATKkWSBTLStXd4M
    Brhw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jcR+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
    with ESMTPSA id 902c63xA7DliFoQ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Sun, 7 Nov 2021 14:47:44 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 0/3] mtd: Ingenic NAND fix for JZ4740
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20211009184952.24591-1-paul@crapouillou.net>
Date:   Sun, 7 Nov 2021 14:47:43 +0100
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
Content-Transfer-Encoding: 7bit
Message-Id: <968356A9-2A88-48B1-B31F-55C22BCE620E@goldelico.com>
References: <20211009184952.24591-1-paul@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 09.10.2021 um 20:49 schrieb Paul Cercueil <paul@crapouillou.net>:
> 
> Hi,
> 
> Looks like NAND support has been broken on the JZ4740 SoC for a while;

Yes, I remember someone telling that something was fundamentally broken
and impossible to be fixed a while ago.

> it looks like it comes from the fact that the "hw_oob_first" mechanism
> was dropped from the NAND core and moved to the Davinci driver.
> 
> It turns out the JZ4740 SoC needs it too; I didn't notice it when
> writing the new ingenic-nand driver (to replace the old jz4740-nand
> driver) most likely because my Device Tree had the "nand-ecc-mode" set
> to "hw_oob_first".
> 
> I am not very sure about patch [1/3]; to me the original code does not
> make sense, and it didn't work out-of-the-box on the JZ4740 without it.
> By applying patch [1/3] the function nand_read_page_hwecc_oob_first()
> can be reused for the JZ4740 SoC as well. But I did not test patch [1/3]
> on Davinci.

would this also work for jz4780 NAND?

BR,
Nikolaus

