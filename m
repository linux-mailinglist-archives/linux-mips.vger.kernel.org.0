Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8194527E6A1
	for <lists+linux-mips@lfdr.de>; Wed, 30 Sep 2020 12:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgI3K2u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 06:28:50 -0400
Received: from elvis.franken.de ([193.175.24.41]:36062 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728500AbgI3K2r (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Sep 2020 06:28:47 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kNZLp-0002nr-00; Wed, 30 Sep 2020 12:28:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 81B04C1038; Wed, 30 Sep 2020 12:15:32 +0200 (CEST)
Date:   Wed, 30 Sep 2020 12:15:32 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mips: Introduce some IO-accessors optimizations
Message-ID: <20200930101532.GA17271@alpha.franken.de>
References: <20200920110010.16796-1-Sergey.Semin@baikalelectronics.ru>
 <20200929211232.t4yw2d33jokmzb4i@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929211232.t4yw2d33jokmzb4i@mobilestation>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 30, 2020 at 12:12:32AM +0300, Serge Semin wrote:
> Thomas,
> Any comment on the series? The changes aren't that comprehensive, so it would
> be great to merge it in before the 5.10 merge window is opened.

for the both patches there is no user for it, so I don't see a reason
to apply it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
