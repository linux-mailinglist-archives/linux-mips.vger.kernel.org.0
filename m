Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED14C49BB
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 10:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfJBIkL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 04:40:11 -0400
Received: from fd.dlink.ru ([178.170.168.18]:59120 "EHLO fd.dlink.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726102AbfJBIkL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 04:40:11 -0400
Received: by fd.dlink.ru (Postfix, from userid 5000)
        id D7B671B2183D; Wed,  2 Oct 2019 11:40:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru D7B671B2183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
        t=1570005607; bh=F/IImWl+zGV8HHk4syqSMQxRBbec12CQzhKX7+Rf7vI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=fDz7GWnDsqfcoBG38GtQMqseEuq5Jxfk23h+PqGO1s5fo9A6DQYP0rw80IS3FD/LJ
         jdRFnLypl7bDR9DXzxC9gt8oQ5sbw65HluIFAhS8WDC4rRZTFHLUy6ps4gEuRi43UZ
         lg+eDmnv40yysP+Cn9z81zTkPfn55EHYiYSji9Ro=
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on mail.dlink.ru
X-Spam-Level: 
X-Spam-Status: No, score=-99.2 required=7.5 tests=BAYES_50,USER_IN_WHITELIST
        autolearn=disabled version=3.4.1
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
        by fd.dlink.ru (Postfix) with ESMTP id 3E5061B2183D;
        Wed,  2 Oct 2019 11:40:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 3E5061B2183D
Received: by mail.rzn.dlink.ru (Postfix, from userid 5000)
        id 1E8631B2013B; Wed,  2 Oct 2019 11:40:03 +0300 (MSK)
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTPA id 5ABC31B20311;
        Wed,  2 Oct 2019 11:39:59 +0300 (MSK)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 02 Oct 2019 11:39:59 +0300
From:   Alexander Lobakin <alobakin@dlink.ru>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Dmitry Korotin <dkorotin@wavecomp.com>,
        Paul Burton <pburton@wavecomp.com>, linux-mips@vger.kernel.org,
        linux-mips-owner@vger.kernel.org
Subject: Re: [PATCH] mips: Kconfig: Add ARCH_HAS_FORTIFY_SOURCE
In-Reply-To: <20191001231400.cjge7xocdesmx7pf@pburton-laptop>
References: <CY4PR22MB04717E7C68389573AADA4E99AFB00@CY4PR22MB0471.namprd22.prod.outlook.com>
 <1563c90e9d9ed42bd1dedd552fa0316a@dlink.ru>
 <20191001231400.cjge7xocdesmx7pf@pburton-laptop>
Message-ID: <9875943eab33d7a1ee52183c8593333b@dlink.ru>
X-Sender: alobakin@dlink.ru
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

Paul Burton wrote 02.10.2019 02:14:
> Hi Alexander,
> 
> On Tue, Oct 01, 2019 at 03:49:56PM +0300, Alexander Lobakin wrote:
>> Maybe it's time to remove the "rather naive" block under CONFIG_32BIT 
>> at all
>> and use C implementations in all cases? I'm interested in what does 
>> Paul
>> think abous this.
> 
> That's not a bad idea - it's something I've already been considering
> doing anyway as I slowly prep for nanoMIPS support. The reason I 
> haven't
> pulled the trigger yet is that I haven't had time to verify the
> performance impact - I expect it to be minimal, perhaps even 
> beneficial,
> but it'd be good to get numbers from a few machines to check that.

Yep, I thought about performance changes too. strcpy() and strncpy() are
considered deprecated for now (Documentation/process/deprecated.rst), so
we might take only strcmp() and strncmp() into the scope.
I have some R3k and interAptiv boards and could investigate into this 
and
share the results. For now I can say that switching to C functions 
reduces
the total size of the text section and entire vmlinux.

> Thanks,
>     Paul

Regards,
ᚷ ᛖ ᚢ ᚦ ᚠ ᚱ
