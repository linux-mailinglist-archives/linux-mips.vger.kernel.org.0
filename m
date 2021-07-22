Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC513D21CA
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jul 2021 12:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhGVJ3x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 05:29:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:45359 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231491AbhGVJ3x (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 05:29:53 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m6Ves-0007ey-01; Thu, 22 Jul 2021 12:10:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0C9C1C11EE; Thu, 22 Jul 2021 12:07:44 +0200 (CEST)
Date:   Thu, 22 Jul 2021 12:07:44 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Ganesan Ramalingam <ganesanr@broadcom.com>,
        John Crispin <blogic@openwrt.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: netlogic: fix kernel-doc complaints in fmn-config.c
Message-ID: <20210722100743.GB7340@alpha.franken.de>
References: <20210720043432.1684-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720043432.1684-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 19, 2021 at 09:34:32PM -0700, Randy Dunlap wrote:
> Clean up kernel-doc warnings in netlogic/xlr/fmn-config.c by using
> correct kernel-doc format. Fixes these warnings:
> 
> arch/mips/netlogic/xlr/fmn-config.c:106: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Configure bucket size and credits for a device. 'size' is the size of
> arch/mips/netlogic/xlr/fmn-config.c:181: warning: expecting prototype for Setup the FMN details for each devices according to the device available(). Prototype was for xlr_board_info_setup() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Ganesan Ramalingam <ganesanr@broadcom.com>
> Cc: John Crispin <blogic@openwrt.org>
> Cc: Aditya Srivastava <yashsri421@gmail.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/netlogic/xlr/fmn-config.c |   15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
