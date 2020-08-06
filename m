Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9DF23D97F
	for <lists+linux-mips@lfdr.de>; Thu,  6 Aug 2020 12:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgHFKin (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Aug 2020 06:38:43 -0400
Received: from [115.28.160.31] ([115.28.160.31]:34530 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1729371AbgHFKgY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Aug 2020 06:36:24 -0400
Received: from hanazono.local (unknown [58.33.27.210])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 460476006D;
        Thu,  6 Aug 2020 18:26:53 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1596709613; bh=72yqEUWNLfVUrnKtkeWf6AZaFSEy3MP5VW3cQu6vR04=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GwQrlQeGEejtXKU5Qk/mhYtlA2KK7TdnpScCU8cMr1Omj1iuTp94+NJ1d0HaT05aT
         eA7C1G6GdKEe+vc8Eso6p9kku115jscJqASE2e4kiK9pIyUn0J+90DefZs1E3KldGK
         It8k1NB8L4UNdOQjbVeNQQ05/9LcpN/46fKeogSg=
Subject: Re: [PATCH v2] MIPS: Provide Kconfig option for default IEEE 754
 conformance mode
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     WANG Xuerui <git@xen0n.name>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200801061147.1412187-1-jiaxun.yang@flygoat.com>
 <d03a350c-842c-c041-f11b-017ec68e3de4@flygoat.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <9823ab9b-1f02-c8af-7d62-80a1d24aaaa3@xen0n.name>
Date:   Thu, 6 Aug 2020 18:26:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:81.0)
 Gecko/20100101 Thunderbird/81.0a1
MIME-Version: 1.0
In-Reply-To: <d03a350c-842c-c041-f11b-017ec68e3de4@flygoat.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,


On 2020/8/5 21:59, Jiaxun Yang wrote:
>
>
> ÔÚ 2020/8/1 14:11, Jiaxun Yang Ð´µÀ:
>> Requested by downstream distros, a Kconfig option for default
>> IEEE 754 conformance mode allows them to set their mode to
>> relaxed by default.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Reviewed-by: WANG Xuerui <git@xen0n.name>
>> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
>> Reviewed-by: Huacai Chen <chenhc@lemote.com>
>>
>> -- 
>> v2: Reword according to Xuerui's suggestion.
>> ---
> Hi Thomas,
>
> Is it possible to get this patch into 5.9 merge window?
> I think it have got enough review tag, and the config option was
> requested
> by a Debian developer. The next Debian release will take 5.9 lts
> kernel and
> they don't want to ship a non-bootable kernel in a major release.

I have an idea. Can the downstream packagers make use of the builtin
command line config options, to inject the "ieee754=relaxed" or whatever
option necessary? If it is acceptable this patch should not be necessary
in the short term.

>
> Thanks.
>
> - Jiaxun
