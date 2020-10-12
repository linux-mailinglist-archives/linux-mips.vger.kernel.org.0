Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE2A28B252
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 12:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387601AbgJLKiR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 06:38:17 -0400
Received: from elvis.franken.de ([193.175.24.41]:58415 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387595AbgJLKiR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-04; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C6052C1140; Mon, 12 Oct 2020 12:30:48 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:30:48 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mikhail Gusarov <dottedmag@dottedmag.net>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: octeon: Add Ubiquiti E200 and E220 boards
Message-ID: <20201012103048.GD7765@alpha.franken.de>
References: <20201010100858.65438-1-dottedmag@dottedmag.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201010100858.65438-1-dottedmag@dottedmag.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Oct 10, 2020 at 12:08:58PM +0200, Mikhail Gusarov wrote:
> These boards are used in
> - Ubiquiti EdgeRouter (E200),
> - Ubiquiti EdgeRouter Pro (E200) and
> - Ubiquiti Security Gateway Pro 4 (E220).
> 
> Signed-off-by: Mikhail Gusarov <dottedmag@dottedmag.net>
> ---
>  arch/mips/include/asm/octeon/cvmx-bootinfo.h | 4 ++++
>  1 file changed, 4 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
