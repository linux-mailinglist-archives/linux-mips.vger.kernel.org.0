Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA2C8191881
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 19:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgCXSHh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 14:07:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:60741 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727611AbgCXSHh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 14:07:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jGnxb-0002Bo-00; Tue, 24 Mar 2020 19:07:31 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5CA33C09A4; Tue, 24 Mar 2020 18:57:05 +0100 (CET)
Date:   Tue, 24 Mar 2020 18:57:05 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Christoph Hellwig <hch@lst.de>, linux-ide@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ide/MIPS/docs: remove no longer used au1xxx-ide
 driver
Message-ID: <20200324175705.GA8911@alpha.franken.de>
References: <CGME20200324111437eucas1p1a898c365a825deb9d0dc6c99202e2f57@eucas1p1.samsung.com>
 <20200324111420.31793-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324111420.31793-1-b.zolnierkie@samsung.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 24, 2020 at 12:14:17PM +0100, Bartlomiej Zolnierkiewicz wrote:
> Hi,
> 
> Commit 54ff4a1d1732 ("MIPS: Alchemy: pata_platform for DB1200")
> from year 2014 converted the only user of au1xxx-ide IDE host
> driver (MIPS Alchemy DB1200 platform) to use pata_platform libata
> host driver instead. This patch series removes dead au1xxx-ide
> driver code & co.
> 
> Please merge through mips tree (IDE changes have been Acked by
> David Miller).
> 
> Changes since v1
> (https://lore.kernel.org/linux-ide/20200116122938.20789-1-b.zolnierkie@samsung.com/):
> - added ACKs
> 
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> 
> Bartlomiej Zolnierkiewicz (3):
>   ide: remove no longer used au1xxx-ide driver
>   MIPS: Alchemy: remove no longer used au1xxx_ide.h header
>   docs: mips: remove no longer needed au1xxx_ide.rst documentation
> 
>  Documentation/mips/au1xxx_ide.rst             | 130 ----
>  Documentation/mips/index.rst                  |   2 -
>  .../mips/include/asm/mach-au1x00/au1xxx_ide.h | 178 ------
>  drivers/ide/Kconfig                           |  17 -
>  drivers/ide/Makefile                          |   2 -
>  drivers/ide/au1xxx-ide.c                      | 597 ------------------
>  6 files changed, 926 deletions(-)
>  delete mode 100644 Documentation/mips/au1xxx_ide.rst
>  delete mode 100644 arch/mips/include/asm/mach-au1x00/au1xxx_ide.h
>  delete mode 100644 drivers/ide/au1xxx-ide.c

applied series to mips-next. While applying I've removed the one leftover
BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA in drivers/ide/Kconfig in patch 1.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
