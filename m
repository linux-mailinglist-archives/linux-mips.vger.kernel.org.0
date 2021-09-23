Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73F7415B2D
	for <lists+linux-mips@lfdr.de>; Thu, 23 Sep 2021 11:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240208AbhIWJn5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Sep 2021 05:43:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:39105 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240222AbhIWJn5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Sep 2021 05:43:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mTLFI-00072a-01; Thu, 23 Sep 2021 11:42:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D99B2C1CE2; Thu, 23 Sep 2021 11:35:47 +0200 (CEST)
Date:   Thu, 23 Sep 2021 11:35:47 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wang Haojun <jiangliuer01@gmail.com>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: loongson64: Fix no screen display during boot-up
Message-ID: <20210923093547.GB7289@alpha.franken.de>
References: <20210913114945.3497762-1-wanghaojun@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913114945.3497762-1-wanghaojun@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 13, 2021 at 07:49:45PM +0800, Wang Haojun wrote:
> The Framebuffer CONFIG_FB needs to be explicitly selected or we
> don't get any framebuffer anymore. DRM has stopped to select FB
> after commit f611b1e7624ccdbd495c19e98056 ("drm: Avoid circular
> dependencies for CONFIG_FB") because of circular dependency. So
> we should enable it in the default config file, otherwise there
> is no display before Xorg.
> 
> Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
> reviewed-by: Huacai Chen <chenhuacai@kernel.org>
> reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/configs/loongson3_defconfig | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
