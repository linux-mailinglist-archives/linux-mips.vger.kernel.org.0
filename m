Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F135A3A5B73
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 04:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbhFNCFf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Jun 2021 22:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232269AbhFNCFf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Jun 2021 22:05:35 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B7A6EC061574
        for <linux-mips@vger.kernel.org>; Sun, 13 Jun 2021 19:03:32 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 0A65892009C; Mon, 14 Jun 2021 04:03:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id F0AB592009B;
        Mon, 14 Jun 2021 04:03:28 +0200 (CEST)
Date:   Mon, 14 Jun 2021 04:03:28 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Huacai Chen <chenhuacai@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: Loongson64: Remove a "set but not used" variable
In-Reply-To: <20210514103217.2051315-1-chenhuacai@loongson.cn>
Message-ID: <alpine.DEB.2.21.2106140400510.61948@angie.orcam.me.uk>
References: <20210514103217.2051315-1-chenhuacai@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 14 May 2021, Huacai Chen wrote:

> This fix build warning:
> 
>    arch/mips/loongson64/env.c: In function 'prom_init_env':
> >> arch/mips/loongson64/env.c:50:14: warning: variable 'device' set but not used [-Wunused-but-set-variable]
>       50 |  u16 vendor, device;
>          |              ^~~~~~
>    {standard input}: Assembler messages:
>    {standard input}:788: Error: found '(', expected: ')'
>    {standard input}:788: Error: found '(', expected: ')'
>    {standard input}:788: Error: non-constant expression in ".if" statement
>    {standard input}:788: Error: junk at end of line, first unrecognized character is `('
>    {standard input}:801: Error: found '(', expected: ')'
>    {standard input}:801: Error: found '(', expected: ')'
>    {standard input}:801: Error: non-constant expression in ".if" statement
>    {standard input}:801: Error: junk at end of line, first unrecognized character is `('

 What's this chain of assembler error messages doing here?  Surely it does 
not come from the compiler warning and is not related to the patch posted, 
and therefore it has no place in the commit description.  Have you checked 
where it's actually coming from?

  Maciej
