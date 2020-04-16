Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99AFB1ACD32
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 18:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506936AbgDPQNo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 12:13:44 -0400
Received: from verein.lst.de ([213.95.11.211]:53074 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506930AbgDPQNj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 12:13:39 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7880268BEB; Thu, 16 Apr 2020 18:13:35 +0200 (CEST)
Date:   Thu, 16 Apr 2020 18:13:34 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/7] ASoC: txx9: don't work around too small
 resource_size_t
Message-ID: <20200416161334.GA13919@lst.de>
References: <20200416150011.820984-1-hch@lst.de> <20200416150011.820984-2-hch@lst.de> <20200416161226.GN5354@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416161226.GN5354@sirena.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 16, 2020 at 05:12:26PM +0100, Mark Brown wrote:
> On Thu, Apr 16, 2020 at 05:00:05PM +0200, Christoph Hellwig wrote:
> > The txx9 sound driver deends on HAS_TXX9_ACLC, which is only set for
> > three tx49xx SOCs, and thus always has a 64-bit phys_addr_t and
> > resource_size_t.  Instead of poking into ioremap internals to work
> > around a potentially too small resource_size_t just add a BUILD_BUG_ON
> > to catch such a case.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> or can I just apply this independently of the rest of the series?

No, once ioremap is moved out of line the driver would otherwise
fail to compile as it doesn't pull in the defintitions anymore.
