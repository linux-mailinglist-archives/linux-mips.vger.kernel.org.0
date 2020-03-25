Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F2D19242A
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 10:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgCYJd3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 05:33:29 -0400
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:4530 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgCYJd3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Mar 2020 05:33:29 -0400
X-Greylist: delayed 519 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Mar 2020 05:33:28 EDT
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 67D863F5CD;
        Wed, 25 Mar 2020 10:24:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -0.5
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 tagged_above=-999 required=6.31
        tests=[BAYES_05=-0.5] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TBJjejvUvc7c; Wed, 25 Mar 2020 10:24:47 +0100 (CET)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D5C313F4D8;
        Wed, 25 Mar 2020 10:24:46 +0100 (CET)
Date:   Wed, 25 Mar 2020 10:24:46 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: remove cpu_has_64bit_gp_regs and
 cpu_has_64bit_addresses
Message-ID: <20200325092446.GB28706@sx9>
References: <20200324161525.754181-1-hch@lst.de>
 <20200324161525.754181-2-hch@lst.de>
 <alpine.LFD.2.21.2003250226450.2689954@eddie.linux-mips.org>
 <20200325083012.GA21605@lst.de>
 <20200325085524.GA28706@sx9>
 <20200325085852.GA23786@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200325085852.GA23786@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> > The (slightly outdated) patch series under review
> > is available here:
> > 
> > https://lore.kernel.org/linux-mips/cover.1567326213.git.noring@nocrew.org/T/
> 
> You don't happen to have a git tree available somewhere?

https://github.com/frno7/linux/tree/ps2-v5.4

is stable at v5.4,

https://github.com/frno7/linux/tree/ps2-master

has more experimental stuff (also at v5.4 at the moment). There are some
(work-in-progress) notes on the R5900 psABI, that may be of interest, here:

https://github.com/frno7/linux/wiki/R5900-processor-specific-ABI-(psABI)

Fredrik
