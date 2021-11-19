Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3464578D8
	for <lists+linux-mips@lfdr.de>; Fri, 19 Nov 2021 23:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbhKSWh2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Nov 2021 17:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbhKSWh2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Nov 2021 17:37:28 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBB9C061574;
        Fri, 19 Nov 2021 14:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=pEv7n/rwp4AbqdGgl0buYp4REzvZ/H86NZ3L+eGWaUs=; b=QHLAKw5h/vhKbPQHB+6GH9lr4e
        dXMMka2g4LHxukNMqiFN4UQjnnkRYTfNxdIjHqOM0pGLoccq7YnkyUZbMOwZiEx1XSJCISQdSFbNM
        KzMEVUyeo+Y4FLwL28a6+nBvnGpvQiUq2xVMISIYArMRXnk7SWdtQX/GSZUeseqw8q1kFtNbyoL/a
        yNHn3o6076/8fT4HJ7zDnuhfvHI7iYLFkLxHWrhMY+hf5MztIpVdwJnOf+rI3U6pyDMofzRpKA/jw
        wLifB2AEIrUa//Chd8lFvmfkOh15VFFi7RG2B2LmaN8NrM8Dl04pn1AxIqRE4EGAEqd+n62ERReOM
        rqMKH/aA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1moCSd-00Bhfs-Mg; Fri, 19 Nov 2021 22:34:23 +0000
Subject: Re: [PATCH] MIPS: boot/compressed/: add __ashldi3 to target for ZSTD
 compression
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        list@opendingux.net
References: <20211119175052.401771-1-paul@crapouillou.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5ae0b5d2-3e99-1cf1-d1b7-2f92f0ec0cfa@infradead.org>
Date:   Fri, 19 Nov 2021 14:34:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211119175052.401771-1-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/19/21 9:50 AM, Paul Cercueil wrote:
> Just like before with __bswapdi2(), for MIPS pre-boot when
> CONFIG_KERNEL_ZSTD=y the decompressor function will use __ashldi3(), so
> the object file should be added to the target object file.
> 
> Fixes these build errors:
> 
> mipsel-linux-ld: arch/mips/boot/compressed/decompress.o: in function `FSE_buildDTable_internal':
> decompress.c:(.text.FSE_buildDTable_internal+0x48): undefined reference to `__ashldi3'
> mipsel-linux-ld: arch/mips/boot/compressed/decompress.o: in function `FSE_decompress_wksp_body_default':
> decompress.c:(.text.FSE_decompress_wksp_body_default+0xa8): undefined reference to `__ashldi3'
> mipsel-linux-ld: arch/mips/boot/compressed/decompress.o: in function `ZSTD_getFrameHeader_advanced':
> decompress.c:(.text.ZSTD_getFrameHeader_advanced+0x134): undefined reference to `__ashldi3'
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

I haven't seen this build error but the patch looks
fine to me.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>   arch/mips/boot/compressed/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> index 2861a05c2e0c..f27cf31b4140 100644
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -52,7 +52,7 @@ endif
>   
>   vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o
>   
> -vmlinuzobjs-$(CONFIG_KERNEL_ZSTD) += $(obj)/bswapdi.o
> +vmlinuzobjs-$(CONFIG_KERNEL_ZSTD) += $(obj)/bswapdi.o $(obj)/ashldi3.o
>   
>   targets := $(notdir $(vmlinuzobjs-y))
>   
> 


-- 
~Randy
