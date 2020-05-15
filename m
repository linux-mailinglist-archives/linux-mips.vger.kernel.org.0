Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD091D4713
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 09:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgEOHaF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 03:30:05 -0400
Received: from elvis.franken.de ([193.175.24.41]:54056 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbgEOHaE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 03:30:04 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jZUnC-0007EJ-01; Fri, 15 May 2020 09:30:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CB717C04A0; Fri, 15 May 2020 09:22:03 +0200 (CEST)
Date:   Fri, 15 May 2020 09:22:03 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ralink: Don't include objects twice
Message-ID: <20200515072203.GB6722@alpha.franken.de>
References: <20200514143401.66888-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514143401.66888-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 14, 2020 at 04:34:00PM +0200, Thomas Bogendoerfer wrote:
> With the change of platform file inclusion object were included via
> platform-y and core-y. Remove the core-y part to fix it.
> 
> Fixes: 26bff9eb49201aeb ("MIPS: Only include the platformfile needed")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/ralink/Platform | 1 -
>  1 file changed, 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
