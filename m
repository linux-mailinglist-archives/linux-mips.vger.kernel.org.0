Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0C945BDBD
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 13:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345097AbhKXMki (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Nov 2021 07:40:38 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:38328 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344677AbhKXMig (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Nov 2021 07:38:36 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru C40D120EE924
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <157fe249-d404-5f16-18ab-130103483ccf@omp.ru>
Date:   Wed, 24 Nov 2021 15:35:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 4/4] MIPS: loongson64: fix FTLB configuration
Content-Language: en-US
To:     Huang Pei <huangpei@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        <ambrosehua@gmail.com>
CC:     Bibo Mao <maobibo@loongson.cn>, <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
References: <20211124101241.10196-1-huangpei@loongson.cn>
 <20211124101241.10196-5-huangpei@loongson.cn>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20211124101241.10196-5-huangpei@loongson.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 24.11.2021 13:12, Huang Pei wrote:

> Commit "da1bd29742b1" ("MIPS: Loongson64: Probe CPU features via

    Sorry for more nitpicking... "" not needed around the SHA1 ID. Hadn't I 
told you it should look the same as in the Fixes: tag?

> CPUCFG") makes 'set_ftlb_enable' called under c->cputype unset,
> which leaves FTLB disabled on BOTH 3A2000 and 3A3000
> 
> Fixes: da1bd29742b1 ("MIPS: Loongson64: Probe CPU features via CPUCFG")
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
[...]

MBR, Sergey
