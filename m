Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC90819239F
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 10:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgCYJFO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 05:05:14 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:46006 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgCYJFO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Mar 2020 05:05:14 -0400
X-Greylist: delayed 586 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Mar 2020 05:05:13 EDT
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 46C883F226;
        Wed, 25 Mar 2020 09:55:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2m8-KGu0_NoS; Wed, 25 Mar 2020 09:55:25 +0100 (CET)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id DBF2E3F398;
        Wed, 25 Mar 2020 09:55:24 +0100 (CET)
Date:   Wed, 25 Mar 2020 09:55:24 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: remove cpu_has_64bit_gp_regs and
 cpu_has_64bit_addresses
Message-ID: <20200325085524.GA28706@sx9>
References: <20200324161525.754181-1-hch@lst.de>
 <20200324161525.754181-2-hch@lst.de>
 <alpine.LFD.2.21.2003250226450.2689954@eddie.linux-mips.org>
 <20200325083012.GA21605@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200325083012.GA21605@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> The only use of cpu_has_64bit_addresses is the choice of the ioremap
> code base.  Which ioremap code does the R5900 want to use?  If it
> doesn't match CONFIG_64BIT having a config option for the ioremap
> implementation seems much more sensible, and can be added with the
> R5900 patch set (do you have a link to it?).

I suppose this would be relevant for the n32 ABI, but initially we only
have o32 for the R5900. The (slightly outdated) patch series under review
is available here:

https://lore.kernel.org/linux-mips/cover.1567326213.git.noring@nocrew.org/T/

Regarding cpu_has_64bit_gp_regs: another unusual aspect of the R5900 is
its 128-bit GPRs. :)

Fredrik
