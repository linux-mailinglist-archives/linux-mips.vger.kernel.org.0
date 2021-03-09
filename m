Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E122332A14
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 16:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbhCIPRv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 10:17:51 -0500
Received: from elvis.franken.de ([193.175.24.41]:35367 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231815AbhCIPRc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Mar 2021 10:17:32 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lJe70-0002C8-00; Tue, 09 Mar 2021 16:17:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E2D1AC1BA6; Tue,  9 Mar 2021 16:07:29 +0100 (CET)
Date:   Tue, 9 Mar 2021 16:07:29 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     sboyd@kernel.org, robh+dt@kernel.org, john@phrozen.org,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 5/6] staging: mt7621-dts: use valid vendor 'mediatek'
 instead of invalid 'mtk'
Message-ID: <20210309150729.GA12267@alpha.franken.de>
References: <20210309052226.29531-1-sergio.paracuellos@gmail.com>
 <20210309052226.29531-6-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309052226.29531-6-sergio.paracuellos@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 09, 2021 at 06:22:25AM +0100, Sergio Paracuellos wrote:
> Vendor listed for mediatek in kernel vendor file 'vendor-prefixes.yaml'
> contains 'mediatek' as a valid vendor string. Some nodes in the device
> tree are using an invalid vendor string vfor 'mtk' instead. Fix all of
> them in dts file. Update also ralink mt7621 related code to properly
> match new strings. Even there are used in the device tree there are
> some strings that are not referred anywhere but have been also updated
> with new vendor name. These are 'mtk,mt7621-wdt', 'mtk,mt7621-nand',
> 'mtk,mt7621-mc', and 'mtk,mt7621-cpc'.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c              |  6 +++---

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
