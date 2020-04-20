Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365C41B02E8
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 09:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgDTH1k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 03:27:40 -0400
Received: from elvis.franken.de ([193.175.24.41]:47913 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbgDTH1k (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 03:27:40 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jQQqA-00070o-01; Mon, 20 Apr 2020 09:27:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C3D0DC0181; Mon, 20 Apr 2020 09:02:40 +0200 (CEST)
Date:   Mon, 20 Apr 2020 09:02:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: MIPS ioremap cleanups v2
Message-ID: <20200420070240.GB4627@alpha.franken.de>
References: <20200416150011.820984-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416150011.820984-1-hch@lst.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 16, 2020 at 05:00:04PM +0200, Christoph Hellwig wrote:
> Hi Thomas,
> 
> below is a bunch of cleanups for the MIPS ioremap code.  Compile tested
> only.
> 
> Changes since v1:
>  - don't remove cpu_has_64bit_gp_regs
>  - add a new prep patch to stop txx9aclc-ac97 from poking into ioremap
>    internals

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
