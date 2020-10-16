Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC292902DF
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 12:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394352AbgJPKgi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 06:36:38 -0400
Received: from elvis.franken.de ([193.175.24.41]:35958 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394146AbgJPKgi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Oct 2020 06:36:38 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kTN6B-0000ql-00; Fri, 16 Oct 2020 12:36:35 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9D53DC052B; Fri, 16 Oct 2020 12:10:48 +0200 (CEST)
Date:   Fri, 16 Oct 2020 12:10:48 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sergey Yasinsky <seregajsv@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 1/1] watchdog: pnx833x_wdt: convert to watchdog core
Message-ID: <20201016101048.GA3755@alpha.franken.de>
References: <20201016095328.14052-1-seregajsv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016095328.14052-1-seregajsv@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 16, 2020 at 12:53:27PM +0300, Sergey Yasinsky wrote:
> Convert driver from legacy to use the watchdog core and platform driver.
> Add new pnx833x_wdt_device platform device for pnx833x_wdt driver.

thank you for your patch, but pnx833x platform has been already removed
in mips-next tree (which will be merged into v5.10 soon) and I have
a patch to remove the watchdog driver waiting for submission...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
