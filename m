Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685CA1D66AB
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2020 10:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgEQIzp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 04:55:45 -0400
Received: from elvis.franken.de ([193.175.24.41]:56344 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727076AbgEQIzo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 04:55:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jaF5B-0003F8-03; Sun, 17 May 2020 10:55:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 48AABC04D6; Sun, 17 May 2020 10:41:05 +0200 (CEST)
Date:   Sun, 17 May 2020 10:41:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v3 1/2] MIPS: Loongson: Build ATI Radeon GPU driver as
 module
Message-ID: <20200517084105.GD3939@alpha.franken.de>
References: <1589595349-31656-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589595349-31656-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 16, 2020 at 10:15:48AM +0800, Tiezhu Yang wrote:
> When ATI Radeon GPU driver has been compiled directly into the kernel
> instead of as a module, we should make sure the firmware for the model
> (check available ones in /lib/firmware/radeon) is built-in to the kernel
> as well, otherwise there exists the following fatal error during GPU init,
> change CONFIG_DRM_RADEON=y to CONFIG_DRM_RADEON=m to fix it.
> 
> [    1.900997] [drm] Loading RS780 Microcode
> [    1.905077] radeon 0000:01:05.0: Direct firmware load for radeon/RS780_pfp.bin failed with error -2
> [    1.914140] r600_cp: Failed to load firmware "radeon/RS780_pfp.bin"
> [    1.920405] [drm:r600_init] *ERROR* Failed to load firmware!
> [    1.926069] radeon 0000:01:05.0: Fatal error during GPU init
> [    1.931729] [drm] radeon: finishing device.
> 
> Fixes: 024e6a8b5bb1 ("MIPS: Loongson: Add a Loongson-3 default config file")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> v2:
>   - Modify the patch subject and update the commit message
> 
> v3:
>   - No changes
> 
>  arch/mips/configs/loongson3_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
