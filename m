Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9EC36FD65
	for <lists+linux-mips@lfdr.de>; Fri, 30 Apr 2021 17:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhD3PMk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Apr 2021 11:12:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:55858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229819AbhD3PMj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Apr 2021 11:12:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39F88613B4;
        Fri, 30 Apr 2021 15:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619795510;
        bh=45dt6NERsMIsJ4AaWz0oUtcNhoaNV5B6r1s1SXdPLNc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UKxRQKX5DFWQT9/VeGheTFshJt1BinzHdic8QJr7D4yYgCTZa+jUxDElsxJT2j1cj
         5hAR6SxlWCL0M3SWC0fBcwl4lDcPmydZ4tzhYNpxQzlWEfRqEfkFBXEhI1Pn15otVg
         m6HVtkdDfW2sVmXobhWo2MCd9frs6KbzecRVhAY0+WIXICI4alO4geVDkBzy96y+oD
         RbOiUW1kbDOllru/JhnI+GxhF+c737SqTK1uu3++TzNa75KqaYcq3EUSrQl1BagEOE
         7K1Fnfh5Kd+w+PmbAt3U9MCEaUw68dAj6X2sJ2sHjR4nCh+iR+LTdFtc/vWAE8Jgd8
         q6OhyRhUuYOvA==
Date:   Fri, 30 Apr 2021 18:11:44 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [RFT PATCH] MIPS: Octeon: drop dependency on CONFIG_HOLES_IN_ZONE
Message-ID: <YIweMMiWyMXTsijo@kernel.org>
References: <20210418093512.668-1-rppt@kernel.org>
 <20210429210632.GA11767@alpha.franken.de>
 <YIvPZNM23Gpt8MAN@kernel.org>
 <20210430104256.GA6148@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430104256.GA6148@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 30, 2021 at 12:42:56PM +0200, Thomas Bogendoerfer wrote:
> On Fri, Apr 30, 2021 at 12:35:32PM +0300, Mike Rapoport wrote:
> > Hi Thomas,
> > 
> > On Thu, Apr 29, 2021 at 11:06:32PM +0200, Thomas Bogendoerfer wrote:
> > > On Sun, Apr 18, 2021 at 12:35:12PM +0300, Mike Rapoport wrote:
> > > > I'd really appreciate if somebody with access to an Octeon system could
> > > > test this patch.
> > > 
> > > Tested on an Ubiquiti edgerouter 12. Works with problem and I haven't
> > > even seen a change in memory output.
> > 
> > Is "works with problem" a misprint or something went wrong?
> 
> that should have been "without problem".

Thanks for the clarification :)

> All good in my test, but that was more or less booting and checking
> memory log messages. 

Well, this is way better than build testing I did. The commit 465aaed0030b
("MIPS: Octeon: Select CONFIG_HOLES_IN_ZONE") that added
CONFIG_HOLES_IN_ZONE for Octeons talked about crashes at boot time, so
boot testing seems appropriate.

The only concern, is peculiar memory configuration Octeon may have with
Linux and non-Linux "partitions" that will be different on different
systems, but nevertheless I think the generic mm nowadays is robust enough
to cope with those without CONFIG_HOLES_IN_ZONE.

I presumed the patch would go via MIPS tree, so it's you call Thomas.

-- 
Sincerely yours,
Mike.
