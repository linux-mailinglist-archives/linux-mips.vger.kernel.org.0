Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81963319B77
	for <lists+linux-mips@lfdr.de>; Fri, 12 Feb 2021 09:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhBLIrK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Feb 2021 03:47:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:58438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhBLIrJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Feb 2021 03:47:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 183BC64DEA;
        Fri, 12 Feb 2021 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613119588;
        bh=bO137mz/8aJj4gBEHwiun0O1/gC0qRXtCtcKT7Nkfy0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0H/ncv0AgbQiidabpL8pfcLbuP9+0o+CjvGLr1/FyYzD7wFuoYWtSkKARKmwBLPlp
         G9O1tmJ0+BwayVnu7vPz2FKtpJjMfkl3Z3I/KneluOOg6xB/TxFsDz2Bt80Z+dFFe9
         bezXBac7AofaLrbMOfDI5kHbDCU5CJNwoSqiNjV4=
Date:   Fri, 12 Feb 2021 09:46:26 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     sboyd@kernel.org, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, robh+dt@kernel.org, john@phrozen.org,
        linux-clk@vger.kernel.org
Subject: Re: [RESEND PATCH v5 5/6] staging: mt7621-dts: use valid vendor
 'mediatek' instead of invalid 'mtk'
Message-ID: <YCZAYhyJJRSi+axv@kroah.com>
References: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
 <20210212074330.4650-6-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212074330.4650-6-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 12, 2021 at 08:43:29AM +0100, Sergio Paracuellos wrote:
> Vendor listed for mediatek in kernel vendor file 'vendor-prefixes.yaml'
> contains 'mediatek' as a valid vendor string. Some nodes in the device
> tree are using an invalid vendor string vfor 'mtk' instead. Fix all of
> them in dts file. Update also ralink mt7621 related code to properly
> match new strings. Even there are used in the device tree there are
> some strings that are not referred anywhere but have been also updated
> with new vendor name. These are 'mtk,mt7621-wdt', 'mtk,mt7621-nand',
> 'mtk,mt7621-mc', and 'mtk,mt7621-cpc'.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c              |  6 +++---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 12 ++++++------
>  2 files changed, 9 insertions(+), 9 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
