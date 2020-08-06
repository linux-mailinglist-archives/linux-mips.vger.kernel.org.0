Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B15623DDC7
	for <lists+linux-mips@lfdr.de>; Thu,  6 Aug 2020 19:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730217AbgHFROf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Aug 2020 13:14:35 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:56506 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730223AbgHFRO3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Aug 2020 13:14:29 -0400
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id E72BB263D5;
        Thu,  6 Aug 2020 12:01:45 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id CC4263ECDA;
        Thu,  6 Aug 2020 13:56:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 1D2832A0FA;
        Thu,  6 Aug 2020 07:56:43 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596715003;
        bh=6G0cn3xGImope7dNhq/9bXTMK4Or6HKqo1wprFpAZGQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Gp4pAV2rRjjvLSdLhtJlkm+k0DOlUtsQdIYiAGkcALzibUavRjiz7tlLq0xxlJbax
         GfUztSoh9YctPnoSNk0d+5ZBkTbdPztN7SyCXKFAYrxeSOIxLz0xCylZ6aykCltGr0
         1yZ0MXPXoc5Q4TtI4MRqvjgH6Enuaw4BZYFp8fEw=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id l1MoxOhF7M5y; Thu,  6 Aug 2020 07:56:42 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Thu,  6 Aug 2020 07:56:41 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id F054741330;
        Thu,  6 Aug 2020 11:56:38 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="N/yZPClG";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.91])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 2089541330;
        Thu,  6 Aug 2020 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596714987;
        bh=6G0cn3xGImope7dNhq/9bXTMK4Or6HKqo1wprFpAZGQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=N/yZPClG9FCvhJhEdtgTiNcyOVYkssmiSU/y6So9kzfOHU2UX+jJx5tDsj20FXUxW
         cMMF79z5WJeIrXoEfMRWD21PIfC6j2E/epK8eila5LmEnXmlVxEWqCvNuBEh6AAIem
         oRtz6cZhaH9w50b21STRQfxjRTFLNgLbhGqVw5RE=
Subject: Re: [PATCH] MIPS: Introduce cmdline argument writecombine=
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596697741-3561-1-git-send-email-yangtiezhu@loongson.cn>
 <10e04885-b775-e7db-b927-6400382fd32d@flygoat.com>
 <cc0c8b89-748d-0d38-bcc8-1c2dbb0996bf@loongson.cn>
 <20200806101733.GA8136@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <9e563c75-ffaa-45b4-0e99-25a8b1eff828@flygoat.com>
Date:   Thu, 6 Aug 2020 19:56:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806101733.GA8136@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: F054741330
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/6 下午6:17, Thomas Bogendoerfer 写道:
> On Thu, Aug 06, 2020 at 04:32:13PM +0800, Tiezhu Yang wrote:
>> On 08/06/2020 03:39 PM, Jiaxun Yang wrote:
>>>
>>> 在 2020/8/6 下午3:09, Tiezhu Yang 写道:
>>>> Loongson processors have a writecombine issue that maybe failed to
>>>> write back framebuffer used with ATI Radeon or AMD GPU at times,
>>>> after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
>>>> mapping for MIPS"), there exists some errors such as blurred screen
>>>> and lockup, and so on.
>>>>
>>>> With this patch, disable writecombine by default for Loongson64 to
>>>> work well with ATI Radeon or AMD GPU, and it has no influence on the
>>>> other platforms due to writecombine is enabled by default.
>>>>
>>>> Additionally, if it is necessary, writecombine=on can be set manually
>>>> in the cmdline to enhance the performance for Loongson LS7A integrated
>>>> graphics in the future.
>>>>
>>>> [   60.958721] radeon 0000:03:00.0: ring 0 stalled for more than
>>>> 10079msec
>>>> [   60.965315] radeon 0000:03:00.0: GPU lockup (current fence id
>>>> 0x0000000000000112 last fence id 0x000000000000011d on ring 0)
>>>> [   60.976525] radeon 0000:03:00.0: ring 3 stalled for more than
>>>> 10086msec
>>>> [   60.983156] radeon 0000:03:00.0: GPU lockup (current fence id
>>>> 0x0000000000000374 last fence id 0x00000000000003a8 on ring 3)
>>> Hi Tiezhu,
>>>
>>> Thanks for your patch.
>>> Personally I didn't have any issue with writecombine on my test systems,
>>> but there
>>> are some complains about unstable graphic card from users. So generally a
>>> cmdline
>>> writecombine switch is necessary.
> no, if there is hardware which can't work with writecombining enabled
> the driver should disable it by it's own and not by some user switch.
> It might even be better to revert the patch enabling writecombining
> blindly and add code to enable it for hardware where it works.

Our current problem is Loongson's writecombine implementation seems buggy.
This is our platform issue rather than target hardware issue.
And we don't even know which hardware is known to be good. The same graphic
card became a different story on different user's hand.

However, turning off writecombine would cause a visible performance 
regression
on graphic.

I understood what Teizhu thought. For entry-level users, we don't want 
to trouble
them, so we have writecombine disabled by default. However, for advanced 
user
trying to tweak their system, we should leave a switch for them to get 
it back.

Thanks.

- Jiaxun

>
> Thomas.
>
