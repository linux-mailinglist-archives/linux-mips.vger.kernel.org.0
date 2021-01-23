Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7083D3013D4
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 09:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbhAWIDo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 03:03:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:42494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbhAWIDo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 03:03:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C3AC224D4;
        Sat, 23 Jan 2021 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611388983;
        bh=cKIcBBrekRmpGL22jvV5jYJrMxFmRQS5lvobfRAuSm8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kGbhQMb4Sc5P9vJm5HUEKLUkP/st9QTGH/rebdnftDf4bS+goZVi7AF8fS8Sovq5J
         Wbq0xyXRUmigTXzka3LZVKe3iti8UYny7ewDwAVIo8MGOJkbI1TlnmiPkzBXS6Zf+o
         Dc+/GfZ3gteINmMgYCF4RRhnLK8tZ5XYxK8IH+IE=
Date:   Sat, 23 Jan 2021 09:02:59 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>, siyanteng01@gmail.com,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: remove function __uncached_access()
Message-ID: <YAvYM+ByagKGrWpI@kroah.com>
References: <20210123055926.4137197-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210123055926.4137197-1-siyanteng@loongson.cn>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jan 23, 2021 at 01:59:26PM +0800, Yanteng Si wrote:
> Remove unnecessary functions.
> 

Why is it unnecessary?  Please explain more as this looks to be removing
logic...

thanks,

greg k-h
