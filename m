Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F54B1DFDAF
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2020 10:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgEXIf5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 May 2020 04:35:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:36804 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727987AbgEXIf5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 May 2020 04:35:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jcm6r-0004rA-01; Sun, 24 May 2020 10:35:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 47B57C01D2; Sun, 24 May 2020 09:37:53 +0200 (CEST)
Date:   Sun, 24 May 2020 09:37:53 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YunQiang Su <syq@debian.org>
Cc:     linux-mips@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>
Subject: Re: MIPS: Fix exception handler memcpy()
Message-ID: <20200524073753.GB4161@alpha.franken.de>
References: <20200523155034.52907-1-syq@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523155034.52907-1-syq@debian.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 23, 2020 at 11:50:34PM +0800, YunQiang Su wrote:
> From: Ben Hutchings <ben@decadent.org.uk>
> 
> The exception handler subroutines are declared as a single char, but
> when copied to the required addresses the copy length is 0x80.
> 
> When range checks are enabled for memcpy() this results in a build
> failure, with error messages such as:
> 
> In file included from arch/mips/mti-malta/malta-init.c:15:
> In function 'memcpy',
>     inlined from 'mips_nmi_setup' at arch/mips/mti-malta/malta-init.c:98:2:
> include/linux/string.h:376:4: error: call to '__read_overflow2' declared with attribute error: detected read beyond size of object passed as 2nd parameter
>   376 |    __read_overflow2();
>       |    ^~~~~~~~~~~~~~~~~~
> 
> Change the declarations to use type char[].
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: YunQiang Su <syq@debian.org>

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
