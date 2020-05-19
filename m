Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3801D99DD
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 16:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgESOdm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 10:33:42 -0400
Received: from [115.28.160.31] ([115.28.160.31]:38170 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726203AbgESOdm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 May 2020 10:33:42 -0400
Received: from [192.168.9.172] (unknown [112.64.119.234])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C1340600B4;
        Tue, 19 May 2020 22:33:38 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1589898819; bh=A/XUKKkjAJEOp1UpZDyzCVHUaOyRicNrsBEohRz7E00=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=uk1SMfiycjkwrwiDiMp5gC8jDZpqya7Gp7aVj6Kv0Uy6J+QX2ze2Qo+viO1/zy3M/
         UTrVTpNFAJrgUIk+R8mnOE3KruYDVSb9aWUcR+JskI77mX7niSJ3JUbyDOm5FbTya8
         SZS7AUsHxZU0QwtlFh71+vnwcx8OWnQP1fOmtrUU=
Subject: Re: [PATCH v2 RESEND 4/4] MIPS: emulate CPUCFG instruction on older
 Loongson64 cores
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20200503103304.40678-5-git@xen0n.name>
 <20200503105012.43246-1-git@xen0n.name>
 <20200517083754.GB3939@alpha.franken.de>
 <2982d83e-bcf2-2515-bcd2-b80bd1f20223@xen0n.name>
 <20200517151735.GA8048@alpha.franken.de>
 <574fa5af-709d-1f52-af8e-7af815a4ab7e@xen0n.name>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <5398722d-3dec-7c16-0d4c-9367b7b43628@xen0n.name>
Date:   Tue, 19 May 2020 22:33:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <574fa5af-709d-1f52-af8e-7af815a4ab7e@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/18/20 10:44 AM, WANG Xuerui wrote:

>
> Sure. I'll move these into cpucfg-emul.c to minimize intrusion to 
> cpu-probe.c.
>
> I'll send v3 later today (in my timezone) after I go home.
>
Sorry, but my development machine is experiencing some connectivity 
problems, plus this week is rather busier than normal.

v3 probably won't be ready until maybe Thursday. Will try my best to 
submit before the 5.8 merge window though...

