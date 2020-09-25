Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24150277EBA
	for <lists+linux-mips@lfdr.de>; Fri, 25 Sep 2020 05:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgIYDzb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 23:55:31 -0400
Received: from relay1.mymailcheap.com ([144.217.248.102]:47904 "EHLO
        relay1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgIYDza (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Sep 2020 23:55:30 -0400
X-Greylist: delayed 136979 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 23:55:29 EDT
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 0F7033F1C5;
        Fri, 25 Sep 2020 03:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id E80C72A3B8;
        Thu, 24 Sep 2020 23:55:27 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1601006127;
        bh=1bnZ6qZaVzFKQNiNPYAyMj2T8q5mWYVVBOffi9Mp0FI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=slr7UiNCy5nj4KtI5+h5dGJSAj2vSvbnnrOU9GcJfJTbc5RxVjOP4AIs7Dx/1cRl3
         kvquiorxwxxYFvMVifISsBJ+oWR0lu9Z1NyO3DRpxzA7PB2J1Cwu6IVltWTM7iGyJf
         ka0TGs02R4t9U4VX/Y4oVS5kRHUHl8SnHYcPA4yg=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id IKenFOBDlmen; Thu, 24 Sep 2020 23:55:26 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Thu, 24 Sep 2020 23:55:26 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 8599B40EAE;
        Fri, 25 Sep 2020 03:55:24 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="KcYjIss+";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 546B040FE5;
        Fri, 25 Sep 2020 03:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1601006072;
        bh=1bnZ6qZaVzFKQNiNPYAyMj2T8q5mWYVVBOffi9Mp0FI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KcYjIss+5mLJpwlenuukW6Fj9qRPxAqKJFadbjdDuKl5Ydm9p1ZHCP2HbwmaZhC2t
         LmrzJBeSmt+o+Inp6Vpf3VR3p/8DVgPtjLC/X9/96fM7+dUzTz1KYNx5ocM77e39oz
         LQ1y/mjg4oNQdTzQvxWq5whw6yTo09qAg6oYthvY=
Subject: Re: [PATCH 1/2] mips: Add strong UC ordering config
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200920110010.16796-1-Sergey.Semin@baikalelectronics.ru>
 <20200920110010.16796-2-Sergey.Semin@baikalelectronics.ru>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <57fb837a-d884-b368-7a72-d010b5e52f2a@flygoat.com>
Date:   Fri, 25 Sep 2020 11:54:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.0
MIME-Version: 1.0
In-Reply-To: <20200920110010.16796-2-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8599B40EAE
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[9];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[gmail.com,baikalelectronics.ru,linux-mips.org,vger.kernel.org];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/9/20 19:00, Serge Semin Ð´µÀ:
> In accordance with [1, 2] memory transactions using CCA=2 (Uncached
> Cacheability and Coherency Attribute) are always strongly ordered. This
> means the younger memory accesses using CCA=2 are never allowed to be
> executed before older memory accesses using CCA=2 (no bypassing is
> allowed), and Loads and Stores using CCA=2 are never speculative. It is
> expected by the specification that the rest of the system maintains these
> properties for processor initiated uncached accesses. So the system IO
> interconnect doesn't reorder uncached transactions once they have left the
> processor subsystem. Taking into account these properties and what [3]
> says about the relaxed IO-accessors we can infer that normal Loads and
> Stores from/to CCA=2 memory and without any additional execution barriers
> will fully comply with the {read,write}X_relaxed() methods requirements.
>
> Let's convert then currently generated relaxed IO-accessors to being pure
> Loads and Stores. Seeing the commit 3d474dacae72 ("MIPS: Enforce strong
> ordering for MMIO accessors") and commit 8b656253a7a4 ("MIPS: Provide
> actually relaxed MMIO accessors") have already made a preparation in the
> corresponding macro, we can do that just by replacing the "barrier"
> parameter utilization with the "relax" one. Note the "barrier" macro
> argument can be removed, since it isn't fully used anyway other than being
> always assigned to 1.
>
> Of course it would be fullish to believe that all the available MIPS-based
> CPUs completely follow the denoted specification, especially considering
> how old the architecture is. Instead we introduced a dedicated kernel
> config, which when enabled will convert the relaxed IO-accessors to being
> pure Loads and Stores without any additional barriers around. So if some
> CPU supports the strongly ordered UC memory access, it can enable that
> config and use a fully optimized relaxed IO-methods. For instance,
> Baikal-T1 architecture support code will do that.
>
> [1] MIPS Coherence Protocol Specification, Document Number: MD00605,
>      Revision 01.01. September 14, 2015, 4.2 Execution Order Behavior,
>      p. 33
>
> [2] MIPS Coherence Protocol Specification, Document Number: MD00605,
>      Revision 01.01. September 14, 2015, 4.8.1 IO Device Access, p. 58
>
> [3] "LINUX KERNEL MEMORY BARRIERS", Documentation/memory-barriers.txt,
>      Section "KERNEL I/O BARRIER EFFECTS"
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Maciej W. Rozycki <macro@linux-mips.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>


Based on #mipslinus discussions, I suspect this option can be selected by
most modern MIPS processors including all IMG/MTI cores,
Ingenic and Loongson.

Thanks.

- Jiaxun

> ---
>   arch/mips/Kconfig          |  8 ++++++++
>   arch/mips/include/asm/io.h | 20 ++++++++++----------
>   2 files changed, 18 insertions(+), 10 deletions(-)
>
