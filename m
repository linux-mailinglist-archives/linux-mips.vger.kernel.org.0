Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E4869AB9A
	for <lists+linux-mips@lfdr.de>; Fri, 17 Feb 2023 13:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjBQMfO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Feb 2023 07:35:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjBQMfO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Feb 2023 07:35:14 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F054BE8E
        for <linux-mips@vger.kernel.org>; Fri, 17 Feb 2023 04:35:12 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id l8so786060wrv.2
        for <linux-mips@vger.kernel.org>; Fri, 17 Feb 2023 04:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ulodh2s1JoWOl+tuXSPL0lutsfuMxf0JZzlK5FzFZjo=;
        b=OtpGArm1ZFpOZIJ8J3qFJ+1snmCnrz1HAO9FCrzl1YNQ0/Dwlcl8WOs46Y4vYR4YxR
         H26kqUWew6cpCf7WyOeIsVsEuQcv8vTdSnfjWjc0cmAdGOqMJp/nHN8jDDA8GUI3WcWu
         YA77JD1A0WaNt9YVLz4EwBftIfTZJIrHnUcdclQhmFIdC4VI1PE6A9oEZK4FA25ps7MY
         YI7XWMtQuHxomMEdx99DHOuRLH8DXkQfh+DZTRZ7WPgih02jwqpb8Cc0NhbJwxyT27xz
         025vYoiR8UYJmFik8pmQoOrumnNcRAV36LtCZL9jmXYzekm9TpED+MhXtkSb+lKAYeyD
         YIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ulodh2s1JoWOl+tuXSPL0lutsfuMxf0JZzlK5FzFZjo=;
        b=dbB1+H0H+EGxqgr53W/CdOTnY1v0NGFiDQnpcHs+JqAv+qbdNHplJixOwmt0znBWSt
         U+xl1YEjfb4ZOhyn0Ye6UeeecCpfKFSkbu+kf/fQzbiRZjVDMJun222INrgouB2cPZJg
         wblMk5JZzi96YDkbrDyIcyYM/ts+r1j5NLeGQV8CuTD3xDRfiovFn/t9eH02a9olD1Fx
         ZsP0yt7iUsRx7/2XLRctNywRn4dEX1Lt2QCSbcJXTOl/alVF8gebypmstvbXMy0veElw
         /yGeAxeJu/ySfVhS6GLAhgpYk/Z8lcHy2APxXyyni0+ZOIQ6TloYZzJd3XqsCq6ax08E
         2/wQ==
X-Gm-Message-State: AO0yUKUdONzCAlo5R5HyDjeuaQN2V+to/ULyy/x3WJ1ln4SZh0gus/Lw
        9IOx4Bis+AfmU5SflZKvhybgAw==
X-Google-Smtp-Source: AK7set+UTJc+bQ8j4x9nFLzmFQMKhMUdty9MeSaF9k7F0Kwe7y+KqIEPGfXmVGFigvbkO7JwtDBXlQ==
X-Received: by 2002:adf:e241:0:b0:2c5:54a7:363e with SMTP id bl1-20020adfe241000000b002c554a7363emr610075wrb.3.1676637311390;
        Fri, 17 Feb 2023 04:35:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id v5-20020adff685000000b002c559def236sm3352450wrp.57.2023.02.17.04.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 04:35:10 -0800 (PST)
Message-ID: <1dac9eee-f0b9-a6f0-9fed-359242ccb02e@linaro.org>
Date:   Fri, 17 Feb 2023 13:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] module: fix MIPS module_layout -> module_memory
Content-Language: en-US
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-mips@vger.kernel.org
References: <20230214005400.17137-1-rdunlap@infradead.org>
 <59c0ba61-c5d6-b74f-0fbd-844b08d13e5d@linaro.org>
 <2e17b8f6-0c2d-e705-63b9-47077b442d68@infradead.org>
 <20230217115812.GB7701@alpha.franken.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230217115812.GB7701@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/2/23 12:58, Thomas Bogendoerfer wrote:
> On Tue, Feb 14, 2023 at 08:52:04AM -0800, Randy Dunlap wrote:
>>
>>
>> On 2/13/23 23:22, Philippe Mathieu-Daudé wrote:
>>> Hi Randy,
>>>
>>> On 14/2/23 01:54, Randy Dunlap wrote:
>>>> Correct the struct's field/member name from mod_mem to mem.
>>>>
>>>> Fixes this build error:
>>>> ../arch/mips/kernel/vpe.c: In function 'vpe_elfload':
>>>> ../arch/mips/kernel/vpe.c:643:41: error: 'struct module' has no member named 'mod_mem'
>>>>     643 |         v->load_addr = alloc_progmem(mod.mod_mem[MOD_TEXT].size);
>>>>
>>>> Fixes: 2ece476a2346 ("module: replace module_layout with module_memory")
>>>
>>> On which tree is your patch based?
>>
>> linux-next-20230213.
> 
> so I can't apply, because this is not in mips-next tree. It should be
> applied to the tree, where this commit is coming from.

Or squashed...

