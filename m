Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8A22119034
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 19:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbfLJS6Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Dec 2019 13:58:24 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33374 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbfLJS6Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Dec 2019 13:58:24 -0500
Received: by mail-pf1-f195.google.com with SMTP id y206so299572pfb.0;
        Tue, 10 Dec 2019 10:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UW49RSnxihrnuMgbN96e6Xz1xJTwO9rSFv/c0td/t5U=;
        b=QfMnnxnqz8nU4ReukI3QXDJ44/9FytQIfnZT7wnbNWk5P3vhGy01HZL/TZ2HfwPB6P
         b0Z+zBR0WiNQosZZXyLw4bmZnYgVh7r2mx8QUBwZctUIOwT+wNoYtQEoa469oGlmdXfw
         BWeVGJP6MeyHixG1RPhZzS1vBZqR5Z39jopHht07gyMFg8vQ/jWDNgUwsFFdEQPAFw7q
         Q0p5DpUE+Z82d97fqR7optENQfu8Ez2bxK2T7N26mQnNdeV0M4Q0hlPGssEjeCnT9pwq
         1YR0FtftqipLFxgUJpaAqA2G1kHap2VGPUFkclqQoSIOy7RVn8qz7Y48O6/KO+gn1d4v
         /79w==
X-Gm-Message-State: APjAAAXJ1RLTLjSyI4IEDRuXYWsvWOSY9Pmgm8VdKgNkg3FSmx5dt+B+
        SN+NSNRiaHYkB0aK90ynGDUL7RA5HDs86Q==
X-Google-Smtp-Source: APXvYqx3dieBb9CWr6fX+Trh7QJDTpjuCxsmsnHVP0jlHBWx/9KE/1rp1cwayu1oJQT8jMCFIzDxWQ==
X-Received: by 2002:aa7:9d0e:: with SMTP id k14mr36697605pfp.157.1576004303795;
        Tue, 10 Dec 2019 10:58:23 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id q22sm4300058pfg.170.2019.12.10.10.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 10:58:23 -0800 (PST)
Date:   Tue, 10 Dec 2019 10:59:20 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Denis Efremov <efremov@linux.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: disable kcov instrumentation in compressed dir
Message-ID: <20191210185920.k6kunob6enrkcnn2@lantea.localdomain>
References: <20191210175002.981-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191210175002.981-1-efremov@linux.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Denis,

On Tue, Dec 10, 2019 at 08:50:02PM +0300, Denis Efremov wrote:
> This patch fixes the compilation with CONFIG_KCOV enabled.
> Otherwise linking fails with:
> ld: arch/mips/boot/compressed/piggy.o: in function `main':
> dummy.c:(.text.startup+0x8): undefined reference to `__sanitizer_cov_...'
> make[1]: *** [arch/mips/boot/compressed/Makefile:101: vmlinuz] Error 1
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  arch/mips/boot/compressed/Makefile | 3 +++
>  1 file changed, 3 insertions(+)

This one's identical to this patch which was merged to mips-fixes
yesterday:

    https://git.kernel.org/mips/c/3f0a2abff9aa

Thanks,
    Paul

> diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> index 172801ed35b8..d859f079b771 100644
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -29,6 +29,9 @@ KBUILD_AFLAGS := $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
>  	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) \
>  	-DKERNEL_ENTRY=$(VMLINUX_ENTRY_ADDRESS)
>  
> +# Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
> +KCOV_INSTRUMENT		:= n
> +
>  # decompressor objects (linked with vmlinuz)
>  vmlinuzobjs-y := $(obj)/head.o $(obj)/decompress.o $(obj)/string.o
>  
> -- 
> 2.20.1
> 
