Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF8C365FA7
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 20:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbhDTSqe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 14:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233541AbhDTSqe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Apr 2021 14:46:34 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68840C06174A;
        Tue, 20 Apr 2021 11:46:02 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lYvNH-006r8h-GM; Tue, 20 Apr 2021 18:45:27 +0000
Date:   Tue, 20 Apr 2021 18:45:27 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Qing Zhang <zhangqing@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-spdx@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Ming Wang <wangming01@loongson.cn>
Subject: Re: Invalid License ID: GPL-3.0 for
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
Message-ID: <YH8hR5LkA9X5Eyfa@zeniv-ca.linux.org.uk>
References: <CAKXUXMyNf4xCF2mWr878MKDa0-8svaiR5GToQyoEVM4FbmfJ8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXUXMyNf4xCF2mWr878MKDa0-8svaiR5GToQyoEVM4FbmfJ8w@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 20, 2021 at 11:39:04AM +0200, Lukas Bulwahn wrote:
> Dear Qing,
> 
> ./scripts/spdxcheck.py reports:
> 
> arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi: 1:28 Invalid
> License ID: GPL-3.0
> 
> You have contributed this file with commit b1a792601f26 ("MIPS:
> Loongson64: DeviceTree for Loongson-2K1000") to the current
> linux-next.
> 
> Do you intend to contribute this under this non-default license
> (GPL-3.0) for the kernel project or did you simply mean the default
> license GPL-2.0?

Ouch...  That's quite likely to be impossible to distribute, since the
requirements of v2 and v3 are mutually incompatible and quite a bit of
the kernel is under v2-only, not v2-or-any-later-version.

Seriously, folks - talk to lawyers; if the result is *NOT* a mere aggregation
(i.e. is derived work wrt the kernel proper), you are in a copyright violation.

Moreover, if anything in that file is derived from others' work, you can't
use GPL-3.0 unless the terms for everything it's derived from allow
redistribution under GPL-3.0.  Anything derived from others' GPL-2.0 work
(as opposed to GPL-2.0-or-later one) can't be relicensed to GPL-3.0 at
all.
