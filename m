Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6098B45F013
	for <lists+linux-mips@lfdr.de>; Fri, 26 Nov 2021 15:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377796AbhKZOqV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Nov 2021 09:46:21 -0500
Received: from mga06.intel.com ([134.134.136.31]:13942 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349336AbhKZOoV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 26 Nov 2021 09:44:21 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="296474562"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="296474562"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 06:41:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="599022304"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 06:41:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mqcPN-00AoIi-3u;
        Fri, 26 Nov 2021 16:41:01 +0200
Date:   Fri, 26 Nov 2021 16:41:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v1 1/1] MIPS: TXx9: Convert SPI platform data to software
 nodes
Message-ID: <YaDx/MaMuajAEp1H@smile.fi.intel.com>
References: <20211126102339.28908-1-andriy.shevchenko@linux.intel.com>
 <CAK8P3a3GuGgdp7Gq5N9XKTGhKbBUym9BiEb94RWyL1CDxS0ffw@mail.gmail.com>
 <CAMuHMdV4HVn+GcCBNQ+1-Kva2XiHQ03L5y9JLXH7qONtBvkV+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV4HVn+GcCBNQ+1-Kva2XiHQ03L5y9JLXH7qONtBvkV+w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 26, 2021 at 01:16:22PM +0100, Geert Uytterhoeven wrote:
> On Fri, Nov 26, 2021 at 11:58 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Fri, Nov 26, 2021 at 11:23 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:

...

> Probably all of this can be removed, given the SPI controller driver
> itself was removed in commit 74523a5dae0c96d6 ("spi: txx9: Remove
> driver")?

Even better! Let Thomas speak on this.

-- 
With Best Regards,
Andy Shevchenko


