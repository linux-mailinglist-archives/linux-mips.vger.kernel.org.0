Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022E63D8A8E
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jul 2021 11:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbhG1J1W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Jul 2021 05:27:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:59015 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231392AbhG1J1W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 28 Jul 2021 05:27:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m8fqR-0007rX-00; Wed, 28 Jul 2021 11:27:19 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9014EC11EE; Wed, 28 Jul 2021 11:25:39 +0200 (CEST)
Date:   Wed, 28 Jul 2021 11:25:39 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Aditya Srivastava <yashsri421@gmail.com>,
        linux-mips@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/3] mips: expunge kernel-doc warnings
Message-ID: <20210728092539.GA6545@alpha.franken.de>
References: <20210725160258.28950-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725160258.28950-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jul 25, 2021 at 09:02:55AM -0700, Randy Dunlap wrote:
> Remove all kernel-doc warnings from arch/mips/ (as reported by the
> kernel test robot).
> 
> [PATCH 1/3] mips: clean up (remove) kernel-doc in cavium-octeon/executive/
> [PATCH 2/3] mips: clean up kernel-doc in cavium-octeon/*.c
> [PATCH 3/3] mips: clean up kernel-doc in mm/c-octeon.c
> 
> Cc: Aditya Srivastava <yashsri421@gmail.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: kernel test robot <lkp@intel.com>
> 
>  arch/mips/cavium-octeon/executive/cvmx-bootmem.c      |   10 +-
>  arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c    |   12 +-
>  arch/mips/cavium-octeon/executive/cvmx-helper-board.c |    8 -
>  arch/mips/cavium-octeon/executive/cvmx-helper-rgmii.c |   12 +-
>  arch/mips/cavium-octeon/executive/cvmx-helper-xaui.c  |    8 -
>  arch/mips/cavium-octeon/executive/cvmx-l2c.c          |    9 --
>  arch/mips/cavium-octeon/executive/cvmx-pko.c          |   22 ++---
>  arch/mips/cavium-octeon/executive/cvmx-spi.c          |   20 ++--
>  arch/mips/cavium-octeon/flash_setup.c                 |    2 
>  arch/mips/cavium-octeon/setup.c                       |   43 +++++-----
>  arch/mips/cavium-octeon/smp.c                         |   14 +--
>  arch/mips/mm/c-octeon.c                               |   29 +++---
>  12 files changed, 93 insertions(+), 96 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
