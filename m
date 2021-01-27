Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FB9305B5C
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 13:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbhA0M3Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 07:29:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:47260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237723AbhA0M0t (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 07:26:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B2D32072C;
        Wed, 27 Jan 2021 12:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611750360;
        bh=c+rvTTAy3/RltaAS9eh/Peer88or8rDm5YWwa9XBHMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gmM2vpzK7dUHZs+JIP0IPVqY4xfJpMlmNcW+2pgnARwySYWIZYfVnG12WRCNpDGJj
         WvajqgD2xdLlOSzAu/tZcz2C2RvrRB+U59I0IlGEblN5VS7lDoJzxRz1ah41h/gvdD
         1aI9GEB2c9iRrbhj2yv4+fxJTSCX1lhXmNM+HAcw=
Date:   Wed, 27 Jan 2021 13:25:57 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>, siyanteng01@gmail.com,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 2/2] MIPS: mm:remove function __uncached_access()
Message-ID: <YBFb1aQCI4zMoJcI@kroah.com>
References: <20210127023806.3753812-1-siyanteng@loongson.cn>
 <20210127023806.3753812-2-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127023806.3753812-2-siyanteng@loongson.cn>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 27, 2021 at 10:38:06AM +0800, Yanteng Si wrote:
> MIPS can now use the default uncached_access like other archs.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/mips/mm/cache.c | 8 --------
>  drivers/char/mem.c   | 7 -------
>  2 files changed, 15 deletions(-)
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
