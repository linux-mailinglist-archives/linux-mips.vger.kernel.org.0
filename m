Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC5B3EDD14
	for <lists+linux-mips@lfdr.de>; Mon, 16 Aug 2021 20:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhHPS2c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 14:28:32 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:57526 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhHPS2c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Aug 2021 14:28:32 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 63C801FFBD;
        Mon, 16 Aug 2021 18:27:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E41813A6D;
        Mon, 16 Aug 2021 18:27:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Fbj3CyyuGmFBZQAAMHmgww
        (envelope-from <dave@stgolabs.net>); Mon, 16 Aug 2021 18:27:56 +0000
Date:   Mon, 16 Aug 2021 11:27:50 -0700
From:   Davidlohr Bueso <dave@stgolabs.net>
To:     Huacai Chen <chenhuacai@loongson.cn>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hongchen Zhang <zhanghongchen@loongson.cn>
Subject: Re: [PATCH] futex: Fix fault_in_user_writeable()
Message-ID: <20210816182750.26i535ilc6nef5k6@offworld>
References: <20210816065417.3987596-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210816065417.3987596-1-chenhuacai@loongson.cn>
User-Agent: NeoMutt/20201120
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 16 Aug 2021, Huacai Chen wrote:

>fault_in_user_writeable() should verify R/W access but only verify W. In
>most archs W implies R, but not true in MIPS and LoongArch, so fix it.

Yuck for a find_vma() in futex.c. If this is a problem in MIPS, shouldn't
the fix be there? Furthermore it's stated that fault_in_user_writeable():

"Fault in user address and verify RW access"

And you guys seem to have proposed it already:

https://lore.kernel.org/linux-mips/20200630005845.1239974-1-liulichao@loongson.cn/

Thanks,
Davidlohr
