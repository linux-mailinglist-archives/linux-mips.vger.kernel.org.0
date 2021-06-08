Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D2B39EA9F
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 02:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhFHATC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Jun 2021 20:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhFHATC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Jun 2021 20:19:02 -0400
Received: from angie.orcam.me.uk (unknown [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B4ADC061574;
        Mon,  7 Jun 2021 17:17:10 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 70A1992009C; Tue,  8 Jun 2021 02:16:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 6926C92009B;
        Tue,  8 Jun 2021 02:16:54 +0200 (CEST)
Date:   Tue, 8 Jun 2021 02:16:54 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Youling Tang <tangyouling@loongson.cn>
cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH] mips: kdump: Crash kernel should be able to see old
 memories
In-Reply-To: <a04a736e-4f64-0491-165c-2544bb178d73@loongson.cn>
Message-ID: <alpine.DEB.2.21.2106080215490.1601@angie.orcam.me.uk>
References: <1618829807-12522-1-git-send-email-tangyouling@loongson.cn> <bd5b70cf-cfdf-0a4a-dfb5-08e030864138@flygoat.com> <a04a736e-4f64-0491-165c-2544bb178d73@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 20 Apr 2021, Youling Tang wrote:

> > Why depend on a config instead of a runtime variable?
> > 
> If not depend on config, we can determine whether the command line contains
> the "elfcorehdr=" parameter, because the "mem=" and "elfcorhdr=" parameters
> are automatically added in kexec-tools. So if there is an "elfcorehdr="
> parameter in the command line, it means that the currently running kernel
> is a capture kernel, and the memblock_remove() operation is not called.
> 
> The revised patch is as follows:
>         if (usermem == 0) {
>                 usermem = 1;
> -               memblock_remove(memblock_start_of_DRAM(),
> -                       memblock_end_of_DRAM() - memblock_start_of_DRAM());
> +               if (!strstr(boot_command_line, "elfcorehdr")) {
> +                       memblock_remove(memblock_start_of_DRAM(),
> +                               memblock_end_of_DRAM() -
> memblock_start_of_DRAM());
> +               }
> 
> Do you think it is feasible?

 This looks like a hack to me.  How do other platforms solve it, e.g. x86?

  Maciej
