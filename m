Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E425301C7D
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jan 2021 15:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbhAXOGF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jan 2021 09:06:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:51806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbhAXOGD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 09:06:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2059D22CA2;
        Sun, 24 Jan 2021 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611497122;
        bh=Ce5H9/j5G+KvGLMowu/TOJZjEvN08WHxfayaObMsC/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SFlrOgR6BmHNIRgK9EZE9FR7yH+CyQQ3LzrB1vNocBP+3kRCS6hDsU4WLAImzY1jq
         r+LhTpldz0l2Yp3ow9ArRm9Umj6lmpvKG5y/PtPZfiFR2R69hi16x56ucWP3FNkYQB
         WTLpRnOGQgCdcjIZxOzC+Ddd9qd2FktLsI+d0MGk=
Date:   Sun, 24 Jan 2021 15:05:17 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: remove function __uncached_access()
Message-ID: <YA1+nfBoAKM7nanQ@kroah.com>
References: <20210123055926.4137197-1-siyanteng@loongson.cn>
 <YAvYM+ByagKGrWpI@kroah.com>
 <CAEensMzm-SFt88CuWo6mdxhHGTRtVK93pMF+=ux0ZVVUUU4OtA@mail.gmail.com>
 <YA0snr5rwZkHFgT/@kroah.com>
 <CAEensMxkfaGMEEtz+z7A4wjvAVmSDk8v66jJQANX9e9uHYZfzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEensMxkfaGMEEtz+z7A4wjvAVmSDk8v66jJQANX9e9uHYZfzA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jan 24, 2021 at 09:53:54PM +0800, yanteng si wrote:
> Hi Greg,
> 
> Apologies for my terminology, I was intending to make a kind reminder but
> selected the wrong wording. :-(
> 
> I will try to improve my English skills to avoid that in future.
> 
> Apologize again for the harshness.

Not a problem, I understand the difficulty of trying to communicate in
a second language very well.

greg k-h
