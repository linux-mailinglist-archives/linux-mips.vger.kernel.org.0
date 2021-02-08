Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7250931331E
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 14:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhBHNSS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 08:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbhBHNSA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 08:18:00 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E37C061786;
        Mon,  8 Feb 2021 05:17:19 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a22so1173899ljp.10;
        Mon, 08 Feb 2021 05:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5nW48CLp2tSEECQN82LkUl7IcpW33qmtAruE9r3YZHA=;
        b=YwxruBbJig8dChg9Kt5du26Oa401hw8GJP8J/SxzS7l22HbuV/w+uaXdemK7vkkMRw
         E7WqUb6FH0tz2zL8OKn6RYrD2ePNesCVrPWcdXX7nYfONmEprjgia5U6C4Y0QFFvsF3u
         DmdfNr4qV1bb/OUjuNOnhf1gJJHVnAM6oya2wt8TK1aDlRSpcMwNLj9iXx9jlsXsqFCy
         ZMARM9haLDzomyTj/6Mw8nzKQyFUybrQeoT82f8f/CqyXnnTaLNNdqjvwuptGWM3Amho
         9f4lPIc2xJmakfcUNve4hdbd4XfiZXAtkBOGFc3Q5gvFN5n15KmWat5Fv/FAFN2p5lYP
         fLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=5nW48CLp2tSEECQN82LkUl7IcpW33qmtAruE9r3YZHA=;
        b=TpxS+PiZYWJFs6qci3AODgQc5S5CIv8qFza6AnI2dRv18Pfu5FT3WX0N7XeOl42RUd
         nLiI+o1+O0JNDlt1VOpury5UH1Y2fyfJhvzVve6oo0OK2+GJ2D2e8W7er39I+SWciN+c
         SpPZcIAeopiC4MfqcLu2v0EptpnjyUcPcv2ppG8wIDhGPQAnkTkLfuZKTMAdLY7DU67K
         VCc4a/WRh2vn6UnD2LsiGueclaZNOaUccD0jo2Kn3zi8lKW81bORpVEV/2hRYiJoYP4y
         YLvBYfuFh0L58RNdQtey2YV0H34IPKcHIIKKHpko/bAmOQf16GvfNOi0HqyTkdjfxeYC
         3bTg==
X-Gm-Message-State: AOAM530Zx8fXt0wmSDxqGBwKKLRT4YnNI62FCoqUmYHS5VRWZrmISeyE
        VzUuFag/mRdGfh0YU1XMxEo=
X-Google-Smtp-Source: ABdhPJwLIG6AspA/H4FizjACjpQ/W4CsTSw5WcdircCGtEFvyRB+/xye+DpnfbsIbSY5XmaYpZSSRw==
X-Received: by 2002:a2e:9750:: with SMTP id f16mr10933455ljj.15.1612790238167;
        Mon, 08 Feb 2021 05:17:18 -0800 (PST)
Received: from ikhorn (ip-0439.rusanovka-net.kiev.ua. [94.244.4.57])
        by smtp.gmail.com with ESMTPSA id p10sm2006356lji.137.2021.02.08.05.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:17:17 -0800 (PST)
Date:   Mon, 8 Feb 2021 15:17:15 +0200
From:   Ivan Khoronzhuk <ivan.khoronzhuk@gmail.com>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Ivan Khoronzhuk <ikhoronz@cisco.com>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
        yangtiezhu@loongson.cn, rppt@kernel.org
Subject: Re: [PATCH] mips: kernel: setup: fix crash kernel resource allocation
Message-ID: <20210208131714.GA4740@ikhorn>
Mail-Followup-To: Jinyang He <hejinyang@loongson.cn>,
        Ivan Khoronzhuk <ikhoronz@cisco.com>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
        yangtiezhu@loongson.cn, rppt@kernel.org
References: <20210206125940.111766-1-ikhoronz@cisco.com>
 <01729c08-c5e3-e9c0-2ddb-a5289e536153@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <01729c08-c5e3-e9c0-2ddb-a5289e536153@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Feb 07, 2021 at 11:19:03AM +0800, Jinyang He wrote:
>On 02/06/2021 08:59 PM, Ivan Khoronzhuk wrote:
>
>>In order to avoid crash kernel corruption, its memory is reserved
>>early in memblock and as result, in time when resources are inited
>>it's not present in memblock.memory, so crash kernel memory is out
>>of ranges listed with for_each_mem_range(). To avoid it and still
>>keep memory reserved lets reseve it out of loop by inserting it in
>>iomem_resource.
>
>Hi, Ivan,
>
>I'm not familiar with memblock. If the following my ideas show my
>ignorance, please forgive me.
>
>First, not only the crash kernel is reserved early in memblock, but also
>code, data, and bss are also reserved in bootmem_init():
>
>    /* Reserve memory occupied by kernel. */
>    memblock_reserve(__pa_symbol(&_text),
>            __pa_symbol(&_end) - __pa_symbol(&_text));
>
>(CONFIG_NUMA is not enabled. NUMA platform reserved them is earlier.)
>
>If there is something unsuitable with the crash kernel, is there something
>unsuitable with the kernel memory?
>
>
>Then, for_each_mem_range() is normal memory. Although memblock_reserve()
>has used before that, it just adds memory to memblock.reserved. That means
>it will still appear in memblock.memory. Thus, here I have a question,
>do we need to use replace for_each_mem_range with for_each_mem_range_rev?

Reserve doesn't mean it's present in memblock.memory, if it memory was not
added before, like it's supposed. In my canse, seems like to local issue it
wasn't, that's why it was not present. So, traverse direction won't solve
this obviously.

>
>Finally, thank you for the patch, it makes me think a lot.
>
>Thanks,
>Jinyang
>
>>Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
>>Signed-off-by: Ivan Khoronzhuk <ikhoronz@cisco.com>
>>---
>>Based on linux-next/master
>>
>>  arch/mips/kernel/setup.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>>diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>>index 3785c72bc3bc..25e376ef2f2a 100644
>>--- a/arch/mips/kernel/setup.c
>>+++ b/arch/mips/kernel/setup.c
>>@@ -473,14 +473,15 @@ static void __init mips_parse_crashkernel(void)
>>  	crashk_res.end	 = crash_base + crash_size - 1;
>>  }
>>-static void __init request_crashkernel(struct resource *res)
>>+static void __init request_crashkernel(void)
>>  {
>>  	int ret;
>>  	if (crashk_res.start == crashk_res.end)
>>  		return;
>>-	ret = request_resource(res, &crashk_res);
>>+	/* The crashk resource shoud be located in normal mem */
>>+	ret = insert_resource(&iomem_resource, &crashk_res);
>>  	if (!ret)
>>  		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
>>  			(unsigned long)(resource_size(&crashk_res) >> 20),
>>@@ -734,8 +735,9 @@ static void __init resource_init(void)
>>  		request_resource(res, &code_resource);
>>  		request_resource(res, &data_resource);
>>  		request_resource(res, &bss_resource);
>>-		request_crashkernel(res);
>>  	}
>>+
>>+	request_crashkernel();
>>  }
>>  #ifdef CONFIG_SMP
>

-- 
Regards,
Ivan Khoronzhuk
