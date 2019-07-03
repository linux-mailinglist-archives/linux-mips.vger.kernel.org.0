Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 799F65E390
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2019 14:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfGCMNv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jul 2019 08:13:51 -0400
Received: from verein.lst.de ([213.95.11.211]:51009 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbfGCMNv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Jul 2019 08:13:51 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id F19DC68B05; Wed,  3 Jul 2019 14:13:47 +0200 (CEST)
Date:   Wed, 3 Jul 2019 14:13:47 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@lst.de>, Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH 5/7 v2] MIPS: use the generic uncached segment support
 in dma-direct
Message-ID: <20190703121347.GB7671@lst.de>
References: <20190430110032.25301-1-hch@lst.de> <20190430110032.25301-6-hch@lst.de> <20190430201041.536amvinrcvd2wua@pburton-laptop> <20190430202947.GA30262@lst.de> <20190430211105.ielntedm46uqamca@pburton-laptop> <20190501131339.GA890@lst.de> <20190501171355.7wnrutfnax5djkpx@pburton-laptop> <20190603064855.GA22023@lst.de> <CAK8P3a0+mmc_DsHZZeM85xGUUB8zc50ROUu3=i3UN1XwD8UGeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0+mmc_DsHZZeM85xGUUB8zc50ROUu3=i3UN1XwD8UGeQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 03, 2019 at 10:54:05AM +0200, Arnd Bergmann wrote:
> I think this is the cause of some kernelci failures in current
> linux-next builds:

Yes, Guenther reported this already and I sent a fix.  I've been waiting
for an ACK from the mips maintaines, but given the breakage I
might as well just pull it in without an ACK.
