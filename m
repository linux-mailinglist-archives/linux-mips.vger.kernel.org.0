Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFF11A3213
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 11:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDIJoq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 05:44:46 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17834 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726678AbgDIJoq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 05:44:46 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586425460; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=H39yX74lcg1/DyN1rhfjQMoM6Upn5/GGA8Z81cYA68ISRLecLA7Mosqxi8CTTDVCU9QGIuyGbi4pSyXEs2WMnlOT+/rT99RmWuybLC/lGduJ40ljQJBfbqCMi1GuCYnp+f0U6c4jXZeip6KgpIPqT1z04WgTs/4I3U18lnRbWcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586425460; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=mDp/62cVxTov2Kp4fbuoUXG4HJasEtmIN7KMz62z3Z8=; 
        b=Tf0hMjojBWUnVRNhPaTMofrFL3oTDWbpT8gvS2l9Ufz1xLP8WBLBV+v2CtTiKPHwEnvG0p6fc0onlmQZ/jxRZSKQY125wBFdvSnTW86y4g1G2Tu1lR5LerJ5uXx8fXitxvpxQXfD5o3EnQu2YefgF/JS652Z3wo6nUZw1LyvzmQ=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586425460;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=mDp/62cVxTov2Kp4fbuoUXG4HJasEtmIN7KMz62z3Z8=;
        b=VpPDIoNlDKZc/FEl92YKUnv7N46OevyMxdepJR3YRygAeyJkmLls3gvSEdu8s+4L
        xYy1D9hWxEN3ZXuULxe4XxezOJu0AAnMLqyyvINqHqfpWZ/+n0RsLw3XQog/z9sPg/L
        es3PdlbUz/MF51HvDzATxgX8QK3r71iJG2WjX7co=
Received: from flygoat-x1e (122.235.212.87 [122.235.212.87]) by mx.zoho.com.cn
        with SMTPS id 1586425458160477.20350102307873; Thu, 9 Apr 2020 17:44:18 +0800 (CST)
Date:   Thu, 9 Apr 2020 17:44:17 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Pei Huang <huangpei@loongson.cn>,
        Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson-3: Add some unaligned instructions
 emulation
Message-ID: <20200409174417.6e83e70e@flygoat-x1e>
In-Reply-To: <1586425675-31860-1-git-send-email-chenhc@lemote.com>
References: <1586425675-31860-1-git-send-email-chenhc@lemote.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu,  9 Apr 2020 17:47:55 +0800
Huacai Chen <chenhc@lemote.com> wrote:

> 1, Add unaligned gslq, gssq, gslqc1, gssqc1 emulation;
> 2, Add unaligned gsl{h, w, d}x, gss{h, w, d}x emulation;
> 3, Add unaligned gslwxc1, gsswxc1, gsldxc1, gssdxc1 emulation.

Probably you should split your changes into two patches?
The first patch moves load & store helpers to the header and the second
one adds emulation in exception handler.

Thanks.

> 
> Signed-off-by: Pei Huang <huangpei@loongson.cn>
> Signed-off-by: Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/fpu_emulator.h |   2 -
>  arch/mips/include/asm/inst.h         | 773
> ++++++++++++++++++++++++++++++++++ arch/mips/include/uapi/asm/inst.h
>   |  26 ++ arch/mips/kernel/unaligned.c         | 775
> ----------------------------------- arch/mips/loongson64/cop2-ex.c
>    | 274 ++++++++++++- 5 files changed, 1072 insertions(+), 778
> deletions(-)
> 

--
Jiaxun Yang
