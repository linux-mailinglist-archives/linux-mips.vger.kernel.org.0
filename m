Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029691B02EB
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 09:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgDTH1n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 03:27:43 -0400
Received: from elvis.franken.de ([193.175.24.41]:47915 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbgDTH1k (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 03:27:40 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jQQqA-00070o-04; Mon, 20 Apr 2020 09:27:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 157C1C0181; Mon, 20 Apr 2020 09:22:57 +0200 (CEST)
Date:   Mon, 20 Apr 2020 09:22:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] Add missing ifdefs to SGI Platform files for IP22, IP32
Message-ID: <20200420072257.GE4627@alpha.franken.de>
References: <87be6e36-04de-684b-0361-91de9ce2c731@gentoo.org>
 <20200416163051.GA24457@alpha.franken.de>
 <f4c06481-7fa3-d84c-5aa9-f991daef058c@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4c06481-7fa3-d84c-5aa9-f991daef058c@gentoo.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 16, 2020 at 07:18:35PM -0400, Joshua Kinard wrote:
> On 4/16/2020 12:30, Thomas Bogendoerfer wrote:
> > On Mon, Mar 30, 2020 at 11:25:52PM -0400, Joshua Kinard wrote:
> >> The attached patch fixes the SGI-specific Platform files to only be
> >> included when their specific platform is actually built.  Both the
> >> IP27 and IP30 Platform files already have such ifdefs in place.  This
> >> patch adds the same to the IP22 and IP32 Platform files.
> > 
> > looking at all other Platform files, I fail to see why this is needed.
> > It looks like removing the ifdefs from IP27 and IP30 is the way to
> > go. What do I miss here ?
> > 
> > Thomas.
> 
> I ran into an issue long ago where an IP32 kernel tried dragging in some of
> the directives in IP30 because of the missing ifdef checks, thus causing the
> build to fail.

do you still see this problem ? If yes, I'd like to understand why first.
If no, what about dropping this patch ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
