Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220AE30AE72
	for <lists+linux-mips@lfdr.de>; Mon,  1 Feb 2021 18:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhBARvw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Feb 2021 12:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhBARvv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Feb 2021 12:51:51 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E37C061573;
        Mon,  1 Feb 2021 09:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=MFF04QL/6jp421ma8zFR1ehIuwZl4YQf365pm4P/HRc=; b=Uspd2UcfpBHaQrFU35B2cHTI3G
        yLF0RxLoTqXCI8m9GwbvnARm0pVUXuWBhJiXHKDqPweendoZQD/KBGoN0uiDh/MeL3ME9rRn42OA4
        lpHTu4fJrwQDplwKA6wVBMwGzFHataqGnGoYnTaPOCJcCNHPd6MGhPMNMEPeK+ISxDWhS3FacesJx
        Q8DBoOs95H3qPMkiwKxp0zkgtYDKRjSK94oIsY2RiZO26u+cSI7xUBnd7sLodr+BQunRnb5gGyNgX
        89lplbx1JhdDyXnw9sC2fRssEWP9c8QQcs74GnMCgVKVIquZALF6p/Ta+lrDdjdCOLnh6s7ssDmoh
        SHFHbFyw==;
Received: from [2601:1c0:6280:3f0::9abc]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l6dLv-0000sq-GV; Mon, 01 Feb 2021 17:51:07 +0000
Subject: Re: [PATCH] arch: mips: kernel: Made couple of spelling fixes and a
 sentence construction in smp.c
To:     Bert Vermeulen <bert@biot.com>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        tsbogend@alpha.franken.de, peterz@infradead.org,
        frederic@kernel.org, mingo@kernel.org, peterx@redhat.com,
        afzal.mohd.ma@gmail.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210201111757.8019-1-unixbhaskar@gmail.com>
 <48dfc60a-c03c-f9d8-a9aa-268f6ae252eb@biot.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5b12db9b-7c06-faf7-1816-09453f48eb1e@infradead.org>
Date:   Mon, 1 Feb 2021 09:51:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <48dfc60a-c03c-f9d8-a9aa-268f6ae252eb@biot.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/1/21 8:51 AM, Bert Vermeulen wrote:
> On 2/1/21 12:17 PM, Bhaskar Chowdhury wrote:
>> s/debugees/debuge's/
> 
> Definitely not.
> 

and preferably "inter-CPU".

-- 
~Randy
netiquette: https://people.kernel.org/tglx/notes-about-netiquette
