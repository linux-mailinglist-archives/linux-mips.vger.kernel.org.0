Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEF53304B6
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 21:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbhCGUzH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 15:55:07 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:37496 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233010AbhCGUyq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 15:54:46 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id EFA0692009D; Sun,  7 Mar 2021 21:54:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E0A2C92009B;
        Sun,  7 Mar 2021 21:54:43 +0100 (CET)
Date:   Sun, 7 Mar 2021 21:54:43 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Huang Pei <huangpei@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH] MIPS: clean up CONFIG_MIPS_PGD_C0_CONTEXT handling
In-Reply-To: <20210305071322.srv5gv5sro5p4dll@ambrosehua-HP-xw6600-Workstation>
Message-ID: <alpine.DEB.2.21.2103051752310.51127@angie.orcam.me.uk>
References: <20210227061944.266415-1-huangpei@loongson.cn> <20210227061944.266415-2-huangpei@loongson.cn> <alpine.DEB.2.21.2102282346400.44210@angie.orcam.me.uk> <20210304010623.4tyzpzgllsdy3ssg@ambrosehua-HP-xw6600-Workstation>
 <alpine.DEB.2.21.2103040227500.19637@angie.orcam.me.uk> <20210305071322.srv5gv5sro5p4dll@ambrosehua-HP-xw6600-Workstation>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 5 Mar 2021, Huang Pei wrote:

> /home/hp/projects/Linux/temp/linux-stable/arch/mips/include/asm/io.h: In function ‘phys_to_virt’:
> /home/hp/projects/Linux/temp/linux-stable/arch/mips/include/asm/io.h:122:9: error: cast to pointer 
> from integer of different size [-Werror=int-to-pointer-cast]
>   return (void *)(address + PAGE_OFFSET - PHYS_OFFSET);
> 
> 
> .........
> 
> Only change CAC_BASE Does NOT work 

 Thank you for checking.

 Right.  I don't know why it fails for `phys_to_virt' where `address' is 
of the `unsigned long' type, but there are other places where the macros 
themselves are cast to `void *'.  We may want to rework that stuff, but 
not necessarily on this occasion.

 Use an explicit cast of the macro to `s64' here then, as my other 
suggestion was.  Anything is better than hardcoded magic numbers.

  Maciej
