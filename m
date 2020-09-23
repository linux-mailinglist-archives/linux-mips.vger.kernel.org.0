Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5F5274F38
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 04:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgIWCqB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 22:46:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41129 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726835AbgIWCqB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Sep 2020 22:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600829160;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yFl7X3RZX/t9Bt2pfDI/ltPnjdZAcydrWhFfcJxomVk=;
        b=g6nISIh/R9hgy/l9YdxM+lP0wOKqsuTVTAPyZikLGwA1T44bz0UtidtVCATRPmAtF86JNd
        1WOioFmY7zQjXxX4sLGNArvRXiaYh4aF9r362vtCggk5DPPmSqAU8x8QscMADuYcv25Sjj
        lwodIF5vW97Iqvu7gXHDpchhbRd5uDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-Xxn4qfmdOtOOOiSXOS7AVA-1; Tue, 22 Sep 2020 22:45:56 -0400
X-MC-Unique: Xxn4qfmdOtOOOiSXOS7AVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E83C0801AE8;
        Wed, 23 Sep 2020 02:45:54 +0000 (UTC)
Received: from localhost (ovpn-12-42.pek2.redhat.com [10.72.12.42])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3161027CB7;
        Wed, 23 Sep 2020 02:45:50 +0000 (UTC)
Date:   Wed, 23 Sep 2020 10:45:48 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>, linux-mips@vger.kernel.org,
        kexec@lists.infradead.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/3] MIPS: Crash kernel should be able to see old memories
Message-ID: <20200923024548.GL25604@MiWiFi-R3L-srv>
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/23/20 at 10:30am, Huacai Chen wrote:
> Kexec-tools use mem=X@Y to pass usable memories to crash kernel, but in
> commit a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map") all
> BIOS passed memories are removed by early_parse_mem(). I think this is
> reasonable for a normal kernel but not for a crash kernel, because a
> crash kernel should be able to see all old memories, even though it is
> not supposed to use them.

I am not familiar with MIPS code, but we analyze and fill memmap= to
pass usable memory to crashkenrel in kexec-tools, do you mean you are
specifying memmap= or mem= by hand?

And we don't have mem=X@Y, only mem=nn[KMG].

> 
> Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/kernel/setup.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 4c04a86..e2804a2 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -392,8 +392,10 @@ static int __init early_parse_mem(char *p)
>  	 */
>  	if (usermem == 0) {
>  		usermem = 1;
> +#ifndef CONFIG_CRASH_DUMP
>  		memblock_remove(memblock_start_of_DRAM(),
>  			memblock_end_of_DRAM() - memblock_start_of_DRAM());
> +#endif
>  	}
>  	start = 0;
>  	size = memparse(p, &p);
> -- 
> 2.7.0
> 

