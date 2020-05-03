Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 702231C2AB2
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 10:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgECIGh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 04:06:37 -0400
Received: from [115.28.160.31] ([115.28.160.31]:56088 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1727097AbgECIGh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 04:06:37 -0400
X-Greylist: delayed 463 seconds by postgrey-1.27 at vger.kernel.org; Sun, 03 May 2020 04:06:37 EDT
Received: from [192.168.9.172] (unknown [112.65.48.54])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A2B52600B4;
        Sun,  3 May 2020 15:58:51 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1588492731; bh=R9p9DMohNtMlYgqreHjWr+IAq0RqUD6bptnfm3ZgVtA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NTw4w7ciQMd1YCIdQdepZJJvyvJX70Dc5nWmweUe4tZMG/FboKjGIPbrWd6S1UwhB
         fpb37cFSldu+ibs5TVoGy5CqgbzHOpVIt5y/mrvBV1BGQ13RrfA8c1OD51ql2ViStS
         6qszhuRDMdwb4MSyogbujxJWssScdnRDeqmuHbX0=
Subject: Re: [PATCH 4/4] MIPS: emulate CPUCFG instruction on older Loongson64
 cores
To:     Huacai Chen <chenhc@lemote.com>, WANG Xuerui <git@xen0n.name>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20200502133846.40590-1-git@xen0n.name>
 <20200502133846.40590-5-git@xen0n.name>
 <CAAhV-H5U+KHzORKVjrteYggF24WUAz+dsNL_-YJ_0vKvo2Mw1A@mail.gmail.com>
From:   Wang Xuerui <i@xen0n.name>
Message-ID: <da2aa0e8-ee8c-18a1-ee04-b57678ed1bfc@xen0n.name>
Date:   Sun, 3 May 2020 15:58:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:77.0) Gecko/20100101
 Thunderbird/77.0a1
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5U+KHzORKVjrteYggF24WUAz+dsNL_-YJ_0vKvo2Mw1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/3/20 2:31 PM, Huacai Chen wrote:

> Hi, Xuerui,
>
> On Sat, May 2, 2020 at 9:47 PM WANG Xuerui <git@xen0n.name> wrote:
>> +
>> +static int simulate_loongson3_csr_cpucfg(struct pt_regs *regs,
>> +                                       unsigned int opcode)
> Maybe simulate_loongson3_cpucfg() is a better name?

Fair point, I was thinking CPUCFG is a part of bigger CSR instructions, 
so kept the prefix; I don't know what other CSR instructions are 
accessible from user-space anyway. (Loongson, could you guys *please* 
release the ISA docs btw?)

Anyway, by removing the "csr" part it feels more consistent with other 
parts of the patch. I'll send v2 soon.

