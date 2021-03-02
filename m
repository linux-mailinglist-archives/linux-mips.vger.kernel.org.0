Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C1032AF92
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238183AbhCCA0m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:26:42 -0500
Received: from elvis.franken.de ([193.175.24.41]:37887 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233740AbhCBXzR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Mar 2021 18:55:17 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lHEqL-00081Z-01; Wed, 03 Mar 2021 00:54:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 17999C0477; Wed,  3 Mar 2021 00:03:38 +0100 (CET)
Date:   Wed, 3 Mar 2021 00:03:38 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Ralf Baechle <ralf@linux-mips.org>,
        George Cherian <gcherian@marvell.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2] MIPS: select CPU_MIPS64 for remaining MIPS64 CPUs
Message-ID: <20210302230338.GB3808@alpha.franken.de>
References: <CAHmME9ohOsdAwGaqCQZKDynNoC2k=14g9VSFP2mTUA7txf_Ssw@mail.gmail.com>
 <20210227230236.3234498-1-Jason@zx2c4.com>
 <20210301144946.GD11261@alpha.franken.de>
 <CAHmME9qw4VSgjAugYdms7j32A0TU_2C2EFMufsjc1LfYnczZEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9qw4VSgjAugYdms7j32A0TU_2C2EFMufsjc1LfYnczZEA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 01, 2021 at 05:27:46PM +0100, Jason A. Donenfeld wrote:
> Hey Thomas,
> 
> Would you mind sending this for 5.12 in an rc at some point, rather
> than waiting for 5.13? I'd like to see this backported to 5.10 and 5.4
> for OpenWRT.

why is this so important for OpenWRT ? Just to select CRYPTO_POLY1305_MIPS ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
