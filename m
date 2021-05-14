Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2326380FC3
	for <lists+linux-mips@lfdr.de>; Fri, 14 May 2021 20:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhENSdM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 May 2021 14:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhENSdL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 May 2021 14:33:11 -0400
Received: from nbd.name (nbd.name [IPv6:2a01:4f8:221:3d45::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132B4C061574;
        Fri, 14 May 2021 11:32:00 -0700 (PDT)
Received: from [2a04:4540:1401:5900:2d8:61ff:fef0:a7c3]
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1lhcbL-0007kM-KJ; Fri, 14 May 2021 20:31:55 +0200
Subject: Re: [PATCH] MIPS: ralink: of: fix build of rt2880_wdt watchdog module
To:     Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, kernel test robot <lkp@intel.com>
References: <20210514131750.52867-1-krzysztof.kozlowski@canonical.com>
 <2b427eca-fd6c-d099-337f-39cfbd85cb46@roeck-us.net>
From:   John Crispin <john@phrozen.org>
Message-ID: <2b9afccc-31d0-92c4-d64a-03a3ce139337@phrozen.org>
Date:   Fri, 14 May 2021 20:31:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2b427eca-fd6c-d099-337f-39cfbd85cb46@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 14.05.21 15:48, Guenter Roeck wrote:
> On 5/14/21 6:17 AM, Krzysztof Kozlowski wrote:
>> When rt2880_wdt watchdog driver is built as a module, the
>> rt_sysc_membase needs to be exported (it is being used via inlined
>> rt_sysc_r32):
>>
>>    ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] 
>> undefined!
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> I don't see a recent change in the code. Has that problem been there
> all along ?
>
>
yes it has ...

Acked-by: John Crispin <john@phrozen.org>

