Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F41C36F8A0
	for <lists+linux-mips@lfdr.de>; Fri, 30 Apr 2021 12:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhD3KpL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Apr 2021 06:45:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:53688 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhD3KpL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Apr 2021 06:45:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lcQdB-0000fk-00; Fri, 30 Apr 2021 12:44:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4D9AEC0D8F; Fri, 30 Apr 2021 12:42:56 +0200 (CEST)
Date:   Fri, 30 Apr 2021 12:42:56 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [RFT PATCH] MIPS: Octeon: drop dependency on CONFIG_HOLES_IN_ZONE
Message-ID: <20210430104256.GA6148@alpha.franken.de>
References: <20210418093512.668-1-rppt@kernel.org>
 <20210429210632.GA11767@alpha.franken.de>
 <YIvPZNM23Gpt8MAN@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIvPZNM23Gpt8MAN@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 30, 2021 at 12:35:32PM +0300, Mike Rapoport wrote:
> Hi Thomas,
> 
> On Thu, Apr 29, 2021 at 11:06:32PM +0200, Thomas Bogendoerfer wrote:
> > On Sun, Apr 18, 2021 at 12:35:12PM +0300, Mike Rapoport wrote:
> > > I'd really appreciate if somebody with access to an Octeon system could
> > > test this patch.
> > 
> > Tested on an Ubiquiti edgerouter 12. Works with problem and I haven't
> > even seen a change in memory output.
> 
> Is "works with problem" a misprint or something went wrong?

that should have been "without problem". All good in my test, but that
was more or less booting and checking memory log messages. 

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
