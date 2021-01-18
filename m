Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60B22F9782
	for <lists+linux-mips@lfdr.de>; Mon, 18 Jan 2021 02:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730881AbhARBzw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 Jan 2021 20:55:52 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:53047 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730663AbhARBzu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 Jan 2021 20:55:50 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 4963F1351;
        Sun, 17 Jan 2021 20:54:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 17 Jan 2021 20:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=H
        2HkQ0D4cxZbOpysYva81N3lRKykvdF7kSIc0N/Sl9E=; b=p06LBKWonLrx4c0Qu
        7tX+BoYdZVLRfUfol6q/ViVHuxg2fchCWl0bhHFPqRtcn7DiFMj34fty1poRybR9
        BRKnYIyLjDY6jRghf8qpUkyPA6wzbJTBtHApf2ZFJ7pEJbfOgic52GYQ0d81k2aM
        i7++IMqUf/Ydq5hntultFhuYZfEfs/3qgdZ1EIjq1z8DxFs1FdC1Xp64mQduBrmS
        prDvIFqta+mBRQtDoeeyaxWnn2ZrGrhrpMr7mJ6Jhg4WTRk3xmvyL1qD0pvQx/63
        cVoms5PFId3+8tfSeLzoUKVY/G1RU5uhhNMcRvSdZedM4YSIqOIGBfQUEOS9l4+P
        SkBaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=H2HkQ0D4cxZbOpysYva81N3lRKykvdF7kSIc0N/Sl
        9E=; b=r+7hV9QRT3tzZCTJko5viu8+wL5CfzgojAUCF3TVkkEMbwUp6vQJGtqDM
        n9ikdZi7vg7mu0F0hle4V/rSR1FR/Q+o8mW9RL3PTbEJgiG28d5yr+dnpdk/yn21
        sPN7oSq/wjFrIKsbRXuP1NXUlRmyRgCGCrp+kJbbndiv8ldPDG+cthRKEGeKRCTg
        zttpTUu5RpjtHghFvE4G5H4SyVLRt68LtWm4rzuWnM+o6ECaPTS1o5CwV7HHKemk
        DhfmovaY95zNX9GBPyN+mKHQ4S/3+pooBbigNflXm9V3CDZu7o8iEH/i5RbxTFb/
        SOvEHR9mTKb/G3HPilEMNgnNqymLA==
X-ME-Sender: <xms:Y-oEYDj4Uoj9nVOuePR8NgTX2PDlh1-u94r-CGMLY_7Um4Ojd7p9xw>
    <xme:Y-oEYAAc7EFdE6mQBs6dlLOiq2blNS6txQDjcV6uKUbfxVOO7ZXfqdAAHXt9sIic5
    ewXFd-gyWai9BZ9fdM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesthekre
    dttdeftfenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefleduiedtvdekffeggf
    eukeejgeeffeetlefghfekffeuteeijeeghefhueffvdenucfkphepgeehrdeffedrhedt
    rddvheegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Y-oEYDFEEPpFcZiiRelUJtD97nVtHKEXKxKUrAIQbNQd-h8GQz-Xhg>
    <xmx:Y-oEYAR7QLYTeWJTtI82PkGXhXffnpZnGkrQa465uFUp76YywXqWAw>
    <xmx:Y-oEYAy97aPoSLUDVkESzB41Jf9jIdxu1s9J8_w9RsVtSdbx549uzg>
    <xmx:Y-oEYL_flk20bLHPUnXgfZnARJ2pPcYyX6FQ9UvNxjGXXbg4jit_SsBb8VA>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 11E72240057;
        Sun, 17 Jan 2021 20:54:40 -0500 (EST)
Subject: Re: [PATCH] mips: cacheinfo: Remove unnecessary increment of level
To:     Souptick Joarder <jrdr.linux@gmail.com>, tsbogend@alpha.franken.de,
        yangtiezhu@loongson.cn
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1610786400-3629-1-git-send-email-jrdr.linux@gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <6f86e131-c799-ac6f-83a6-4780f52b38df@flygoat.com>
Date:   Mon, 18 Jan 2021 09:54:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610786400-3629-1-git-send-email-jrdr.linux@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ÔÚ 2021/1/16 ÏÂÎç4:40, Souptick Joarder Ð´µÀ:
> kernel test robot throws below warning ->
>
> arch/mips/kernel/cacheinfo.c:112:3: warning: Variable 'level' is
> modified but its new value is never used. [unreadVariable]
>
> Remove unnecessary increment of level at the end.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   arch/mips/kernel/cacheinfo.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
> index 5f9d0eb..c858ae3 100644
> --- a/arch/mips/kernel/cacheinfo.c
> +++ b/arch/mips/kernel/cacheinfo.c
> @@ -109,7 +109,6 @@ static int __populate_cache_leaves(unsigned int cpu)
>   
>   	if (c->tcache.waysize) {
>   		populate_cache(tcache, this_leaf, level, CACHE_TYPE_UNIFIED);
> -		level++;
>   	}
>   
>   	this_cpu_ci->cpu_map_populated = true;

