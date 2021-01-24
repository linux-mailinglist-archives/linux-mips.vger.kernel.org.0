Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403CF301A7D
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jan 2021 09:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbhAXIQN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jan 2021 03:16:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:48774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726475AbhAXIQL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 03:16:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0D6622582;
        Sun, 24 Jan 2021 08:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611476130;
        bh=dpJxdbijqmbajykfREYtId7ScUeW2zgzZ0KFnH6n8+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Su5JFxorUmFBkEO+cQOTmTnqRrrtptAbXcv3eHfkamQvPy6LCA1Eiw373YZhrYE3U
         pxhftEYAikrnoQpK/gff4a9vW2ho+bQKrTrM6MtjRfEVeHiLeDj+ReYnQouEzy+cSx
         D88YYscpEqr9h7hu/38f+Fa3r4vqlpzDbBS0B6kw=
Date:   Sun, 24 Jan 2021 09:15:26 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: mm: remove function __uncached_access()
Message-ID: <YA0snr5rwZkHFgT/@kroah.com>
References: <20210123055926.4137197-1-siyanteng@loongson.cn>
 <YAvYM+ByagKGrWpI@kroah.com>
 <CAEensMzm-SFt88CuWo6mdxhHGTRtVK93pMF+=ux0ZVVUUU4OtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEensMzm-SFt88CuWo6mdxhHGTRtVK93pMF+=ux0ZVVUUU4OtA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jan 24, 2021 at 03:51:48PM +0800, yanteng si wrote:
> hi,Greg
> 
> I have sent patch v2,  please pay attention!

*plonk*
