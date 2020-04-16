Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E639A1ACDBE
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 18:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgDPQbI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 12:31:08 -0400
Received: from elvis.franken.de ([193.175.24.41]:42182 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgDPQbH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 12:31:07 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jP7Pt-0001XT-00; Thu, 16 Apr 2020 18:31:05 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9ED84C0127; Thu, 16 Apr 2020 18:30:51 +0200 (CEST)
Date:   Thu, 16 Apr 2020 18:30:51 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] Add missing ifdefs to SGI Platform files for IP22, IP32
Message-ID: <20200416163051.GA24457@alpha.franken.de>
References: <87be6e36-04de-684b-0361-91de9ce2c731@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87be6e36-04de-684b-0361-91de9ce2c731@gentoo.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 30, 2020 at 11:25:52PM -0400, Joshua Kinard wrote:
> The attached patch fixes the SGI-specific Platform files to only be
> included when their specific platform is actually built.  Both the
> IP27 and IP30 Platform files already have such ifdefs in place.  This
> patch adds the same to the IP22 and IP32 Platform files.

looking at all other Platform files, I fail to see why this is needed.
It looks like removing the ifdefs from IP27 and IP30 is the way to
go. What do I miss here ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
