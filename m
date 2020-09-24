Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2DE2776E2
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 18:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgIXQjE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 12:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgIXQjE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Sep 2020 12:39:04 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04C7C0613CE;
        Thu, 24 Sep 2020 09:39:04 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 63BDA2CB;
        Thu, 24 Sep 2020 16:39:03 +0000 (UTC)
Date:   Thu, 24 Sep 2020 10:39:01 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] Documentation: kernel-parameters: fix formatting of
 MIPS "machtype"
Message-ID: <20200924103901.22d3fda7@lwn.net>
In-Reply-To: <c9059e35-188d-a749-1907-767b53479328@infradead.org>
References: <c9059e35-188d-a749-1907-767b53479328@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 18 Sep 2020 17:52:02 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> For the "machtype" boot parameter,
> fix word spacing, line wrap, and plural of "laptops".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: linux-mips@vger.kernel.org
> ---
>  Documentation/admin-guide/kernel-parameters.txt |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20200917.orig/Documentation/admin-guide/kernel-parameters.txt
> +++ linux-next-20200917/Documentation/admin-guide/kernel-parameters.txt
> @@ -2596,8 +2596,8 @@
>  			(machvec) in a generic kernel.
>  			Example: machvec=hpzx1
>  
> -	machtype=	[Loongson] Share the same kernel image file between different
> -			 yeeloong laptop.
> +	machtype=	[Loongson] Share the same kernel image file between
> +			different yeeloong laptops.
>  			Example: machtype=lemote-yeeloong-2f-7inch

Applied, thanks.

jon
