Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7648813FA3A
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 21:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387443AbgAPULR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 15:11:17 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46450 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387437AbgAPULR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 15:11:17 -0500
Received: by mail-pl1-f193.google.com with SMTP id y8so8794791pll.13;
        Thu, 16 Jan 2020 12:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Tm23PxhXo55Di3dhtZ2C51EXGzICtg127cF/oILr50A=;
        b=rz3lxLhxXoqePSgakl8djESfGyMpk1CkyVl/OVsGJEw9UDKuIRgQAe+fDaB46He53C
         +G74+Gy1dXYXyHSWIabHMvFH8bugWoOC4neIc/CjSC3VFxOmhC81YWM8ZSb7JHq1eRXd
         K9dWa19NRYx2/sz67IytkCUSiv1nQL1+BhRPPURbrujEFH2WD7GZRu+IByQ249lCBFiH
         ZbBttFBfjOwPbxEdc8Ht5d5cZF8N3YL42lLbivqA2nBjceHvNIywMOiMDIY6BM7cfWo0
         gr1QYjXPpqoj8+zYOMI/kvdu6r10RGFa5X0WLEPEFUBG1sltcIH3xJpLLZvKrUI7rQdZ
         2eZg==
X-Gm-Message-State: APjAAAWRHNSIyMSgYXVhL2bkrQfGa+RT32UaDTldC7qItZMjAbI/j9cM
        HgSU/Jx+a/WsHmMWojvbGGs=
X-Google-Smtp-Source: APXvYqxALxH6RE6QR8Q0mmczdgGt4YUBXj86LMzvHDaKHxeqPk5YH8lJTwPvLsDAldKhkyPFv9VgzQ==
X-Received: by 2002:a17:90a:21a7:: with SMTP id q36mr1112343pjc.140.1579205476399;
        Thu, 16 Jan 2020 12:11:16 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id r66sm27423056pfc.74.2020.01.16.12.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 12:11:15 -0800 (PST)
Date:   Thu, 16 Jan 2020 12:11:14 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        paul.burton@mips.com, luto@kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: vdso: Define BUILD_VDSO32 when building a 32bit
 kernel
Message-ID: <20200116201114.44l7ou24ppz2jjjt@pburton-laptop>
References: <20190830135902.20861-1-vincenzo.frascino@arm.com>
 <20190830135902.20861-3-vincenzo.frascino@arm.com>
 <87d0bjfaqa.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87d0bjfaqa.fsf@nanos.tec.linutronix.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Thu, Jan 16, 2020 at 08:43:41PM +0100, Thomas Gleixner wrote:
> The confinement of the 32bit specific VDSO functions missed to define
> BUILD_VDSO32 when building a 32bit MIPS kernel:
> 
> arch/mips/vdso/vgettimeofday.c: In function ‘__vdso_clock_gettime’:
> arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of function ‘__cvdso_clock_gettime32’
> 
> arch/mips/vdso/vgettimeofday.c: In function ‘__vdso_clock_getres’:
> arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of function ‘__cvdso_clock_getres_time32’
> 
> Force the define for 32bit builds in the VDSO Makefile.
> 
> Fixes: bf279849ad59 ("lib/vdso: Build 32 bit specific functions in the right context")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Presuming you want to take this through timers/core along with the patch
it fixes:

    Acked-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

> ---
>  arch/mips/vdso/Makefile |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> --- a/arch/mips/vdso/Makefile
> +++ b/arch/mips/vdso/Makefile
> @@ -18,6 +18,10 @@ ccflags-vdso := \
>  	$(filter -mno-loongson-%,$(KBUILD_CFLAGS)) \
>  	-D__VDSO__
>  
> +ifndef CONFIG_64BIT
> +ccflags-vdso += -DBUILD_VDSO32
> +endif
> +
>  ifdef CONFIG_CC_IS_CLANG
>  ccflags-vdso += $(filter --target=%,$(KBUILD_CFLAGS))
>  endif
