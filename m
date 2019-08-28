Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53A679F770
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2019 02:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfH1AiC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 20:38:02 -0400
Received: from forward105o.mail.yandex.net ([37.140.190.183]:40335 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726078AbfH1AiB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 20:38:01 -0400
Received: from mxback25o.mail.yandex.net (mxback25o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::76])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id 6B09C4200053;
        Wed, 28 Aug 2019 03:37:57 +0300 (MSK)
Received: from smtp3p.mail.yandex.net (smtp3p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:8])
        by mxback25o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id WghB2cmymp-buEehqwS;
        Wed, 28 Aug 2019 03:37:57 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566952677;
        bh=L2Xd+9AiOoNLfOkQ5EzsvSfGq3k5Jl0vE6Xs4nSiU1Y=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=mkM8tid/f0vhI0tT9Zot6Gx4VyuFcRiS8Qq4cUwuukuXsFLIopzpHfT5csVUQe/r+
         qVUXUAY9JSC59x4agFcPvO82wXqDRzQZwvebwYHVKipQX8Lfk1kcAE1OJEItP1j0y/
         V1pdHY+SLC6UuXZeGf4ZPeRFUVuHX601EvJsAmdo=
Authentication-Results: mxback25o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp3p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id SYjjmtSgLl-bl1WrXMb;
        Wed, 28 Aug 2019 03:37:55 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH 02/13] MIPS: Loongson64: Sepreate loongson2ef/loongson64
 code
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net,
        maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.co, devicetree@vger.kernel.org
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-3-jiaxun.yang@flygoat.com>
 <20190827220506.GK30291@darkstar.musicnaut.iki.fi>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c03045cd-25df-a3b9-3b3b-cf09b7fdd3fa@flygoat.com>
Date:   Wed, 28 Aug 2019 08:37:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827220506.GK30291@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/8/28 上午6:05, Aaro Koskinen wrote:
> Hi,
>
> On Tue, Aug 27, 2019 at 04:52:51PM +0800, Jiaxun Yang wrote:
>> As later model of GSx64 family processors including 2-series-soc have
>> similar design with initial loongson3a while loongson2e/f seems less
>> identical, we seprate loongson2e/f support code out of mach-loongson64
>                  ^^^^^^^
>
> separate (typo in patch title as well)
>
>> to make our life easier.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> [...]
>
>> +config MACH_LOONGSON2EF
Hi Aaro,
> You need to update lemote2f_defconfig with his patch.

How to generate this config? We should not edit it manually right?

Thanks

--

Jiaxun Yang

> A.
