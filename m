Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F782E6BA1
	for <lists+linux-mips@lfdr.de>; Tue, 29 Dec 2020 00:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbgL1Wzy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Dec 2020 17:55:54 -0500
Received: from elvis.franken.de ([193.175.24.41]:43912 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729590AbgL1V6F (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Dec 2020 16:58:05 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ku0W4-0005wv-00; Mon, 28 Dec 2020 22:57:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 04DC9C05C3; Mon, 28 Dec 2020 22:38:21 +0100 (CET)
Date:   Mon, 28 Dec 2020 22:38:21 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bert Vermeulen <bert@biot.com>
Cc:     Paul Burton <paulburton@kernel.org>,
        "open list:MIPS GENERIC PLATFORM" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arch: mips: Remove unused BOARD_INGENIC Kconfig option
Message-ID: <20201228213821.GA24617@alpha.franken.de>
References: <20201222203239.1489040-1-bert@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222203239.1489040-1-bert@biot.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 22, 2020 at 09:32:39PM +0100, Bert Vermeulen wrote:
> Board support depends on MACH_INGENIC, not BOARD_INGENIC.

you are missing the point here. BOARD_INGENIC is for enabling
Ingenic boards in a generic kernel, while MACH_INGENIC is for
building a Ingenic only kernel (usually for size/performance reasons).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
