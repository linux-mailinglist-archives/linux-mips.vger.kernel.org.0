Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A9D298F34
	for <lists+linux-mips@lfdr.de>; Mon, 26 Oct 2020 15:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781249AbgJZOZR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Oct 2020 10:25:17 -0400
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:55025 "EHLO
        out28-99.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781389AbgJZOZQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Oct 2020 10:25:16 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1335365|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.250114-0.00270563-0.74718;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047211;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Ioffyb2_1603722310;
Received: from 192.168.10.195(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Ioffyb2_1603722310)
          by smtp.aliyun-inc.com(10.147.41.178);
          Mon, 26 Oct 2020 22:25:11 +0800
Subject: Re: [PATCH 00/13] MIPS: Convert Ingenic to a generic board
To:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        =?UTF-8?B?5ryG6bmP5oyv?= <aric.pzqi@ingenic.com>,
        dongsheng.qiu@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, xuwanhao@wanyeetech.com
References: <20200803170124.231110-1-paul@crapouillou.net>
 <ab985296-8441-4006-210d-a71503bd01f0@wanyeetech.com>
 <L8DPEQ.71Z8YA0QXBJA@crapouillou.net>
 <alpine.LFD.2.21.2008211949220.3460685@eddie.linux-mips.org>
 <4SSFFQ.3I498N5I41LP3@crapouillou.net>
 <alpine.LFD.2.21.2008220310130.3460685@eddie.linux-mips.org>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <0ba67069-499c-7cfe-808e-a465205c4ef9@wanyeetech.com>
Date:   Mon, 26 Oct 2020 22:25:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2008220310130.3460685@eddie.linux-mips.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Maciej & Paul,

ÔÚ 2020/8/22 ÉÏÎç10:29, Maciej W. Rozycki Ð´µÀ:
> Hi Paul,
>
>>> FAOD <cpu-feature-overrides.h> is not a hack, but an optimisation measure
>>> so that features known to be hardwired for a given machine/CPU do not have
>>> to be dynamically queried every time referred.  In some cases that results
>>> in large portions of code being optimised away by the compiler as well.
>> Fair enough. Bloat-o-meter reports about ~100 KiB saved when that file is
>> present. But we can't use it in a generic kernel, unfortunately.
>   Well, run-time patching might be an alternative to get the best of both
> worlds, but someone would have to reimplement our feature selection system
> to use it.
>
>>> The hardcoded value for a feature defined in <cpu-feature-overrides.h>
>>> always has to be the same as one in the corresponding bit of the `options'
>>> member of `struct cpuinfo_mips', in this case MIPS_CPU_TLBINV.
>> In theory yes, in practice the CPU detection code is lagging behind...
>   I wasn't aware of that.  In that case it has been a design abuse which
> has been missed by the maintainer when accepting patches.  It used to be
> the case that run-time detection was accurate and overrides were rather
> lazily added.
>
>   Also I note Ingenic must have had a CPU erratum if our `decode_configs'
> doesn't just work, as the interpretation of CP0.Config[5:0] registers has
> been architectural and mandatory, and that for a reason.  It's only legacy
> MIPS I-IV processors that should require special attention here.


I think I found the cause of the problem. Ingenic XBurst2's TLBINV is 
operate on entire MMU, according to the description of the MD00090 
document, the IE value in cp0 config4 should be 3 (Ingenic's XBurst2 
Core PM document also shows that the IE value is indeed 3). But the code 
in cpu-probe.c only detects the case where the IE value is equal to 2 
(TLBINV only operate on one TLB entry). Therefore, the kernel mistakenly 
believes that X2000 does not support TLBINV during detection.


Thanks and best regards!


>    Maciej
