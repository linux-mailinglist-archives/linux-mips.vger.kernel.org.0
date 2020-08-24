Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46AA825063A
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 19:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgHXR35 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 13:29:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:60888 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728431AbgHXR3R (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 13:29:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kAGHL-0001z8-00; Mon, 24 Aug 2020 19:29:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 217BCC0DE1; Mon, 24 Aug 2020 19:28:50 +0200 (CEST)
Date:   Mon, 24 Aug 2020 19:28:50 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 00/12] Convert WAR defines to config options
Message-ID: <20200824172850.GA11179@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
 <430f374e-d87e-0302-5b83-70670125f873@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <430f374e-d87e-0302-5b83-70670125f873@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 24, 2020 at 10:10:07AM -0700, Florian Fainelli wrote:
> On 8/24/20 9:32 AM, Thomas Bogendoerfer wrote:
> > This patches convert workaround (WAR) defines into config options and
> > gets rid of mach-*/war.h files.
> 
> Most (all but octeon?) of those platforms are not particularly popular
> or widespread, but is not this going to make it harder for distributions
> and people doing CI by having an explosion in the number of
> configurations to test?

all options are only selected by arch/mips/Kconfig, so nothing should
change for any CI.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
