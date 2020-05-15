Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30D31D470F
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 09:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgEOHaE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 03:30:04 -0400
Received: from elvis.franken.de ([193.175.24.41]:54057 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbgEOHaE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 03:30:04 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jZUnC-0007EJ-00; Fri, 15 May 2020 09:30:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D1827C049E; Fri, 15 May 2020 09:21:40 +0200 (CEST)
Date:   Fri, 15 May 2020 09:21:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP27: Use the _AC() macro in spaces.h
Message-ID: <20200515072140.GA6722@alpha.franken.de>
References: <132be102-33ab-a70a-217b-7dbbecbca9be@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <132be102-33ab-a70a-217b-7dbbecbca9be@gentoo.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 14, 2020 at 11:24:22PM -0400, Joshua Kinard wrote:
> From: Joshua Kinard <kumba@gentoo.org>
> 
> The attached patch wraps several of the macros in IP27's spaces.h
> header file with the _AC() macro.  This matches most of the other
> spaces.h files in the MIPS tree.
> 
> Signed-off-by: Joshua Kinard <kumba@gentoo.org>
> ---
>  arch/mips/include/asm/mach-ip27/spaces.h |   12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
