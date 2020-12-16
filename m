Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC672DBF3D
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 12:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgLPLP6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Dec 2020 06:15:58 -0500
Received: from relay2.mymailcheap.com ([217.182.66.162]:41523 "EHLO
        relay2.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgLPLP5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Dec 2020 06:15:57 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 3CFEA3EDEC;
        Wed, 16 Dec 2020 12:14:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 7D8412A0C9;
        Wed, 16 Dec 2020 06:14:23 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1608117263;
        bh=XrfmpW4smFnOvefjNb/Q7XUqfv9lAI9XIsZQfajzkdY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=X9mF4E/O1AwOjT5Jf2ugEWE5ACLHQAJ4g7+0B6bi+Wl7iGeS06AFzQ3Tj/bxv5ED6
         Zkk20nXbaLZK0bxPWpxG32PsEaBhQUmqVT0Mn2i1zru89AEdjM9oO48xkGiAANbrV8
         pSUHm1p8QbNVsmz9M1Hd6zxUelvNmbBAbvIiT+78=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tbQg6KSRVCNo; Wed, 16 Dec 2020 06:14:22 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 16 Dec 2020 06:14:21 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id E91B742F19;
        Wed, 16 Dec 2020 11:14:18 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="NT4PB130";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id E198F42F19;
        Wed, 16 Dec 2020 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1608117250;
        bh=XrfmpW4smFnOvefjNb/Q7XUqfv9lAI9XIsZQfajzkdY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NT4PB130t28KZN9+LMTmAw7I7VnqFVj8UoNvVWGqqp/tAoXYzQo/GpvJdzuriuBao
         AbDZbXtgX9lbVrcfRXM6PuAzRfc1rpOpXARacbTu9Iq/zJ2FPqdN9aRzccayUOgO3v
         GDMC4FPNzHh1Er4QPBYVL6OPC82lsxiOKzTLP6Dg=
Subject: Re: [QUESTION] support perf record --call-graph dwarf for mips
To:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Archer Yan <ayan@wavecomp.com>,
        David Daney <david.daney@cavium.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
References: <97fb66bf-51f8-a491-9eb4-10b2314cf82f@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <90c7db1a-8e1a-e253-79ca-f93dbac014c2@flygoat.com>
Date:   Wed, 16 Dec 2020 19:14:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <97fb66bf-51f8-a491-9eb4-10b2314cf82f@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: E91B742F19
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/12/16 下午6:05, Tiezhu Yang 写道:
> Hi,
>
> In the current upstream mainline kernel, perf record --call-graph dwarf
> is not supported for architecture mips64. I find the following related
> patches about this feature by David Daney <david.daney@cavium.com> and
> Archer Yan <ayan@wavecomp.com> in Sep 2019.

AFAIK ddaney left Cavium at 2018 and Wave Computing Shanghai is defuncted...

Feel free to take over if you like, there is no licenses issue, just 
remember to credit
others properly.

- Jiaxun


>
> [1/2] Support mips unwinding and dwarf-regs
> https://lore.kernel.org/patchwork/patch/1126521/
>
> [2/2] Support extracting off-line stack traces from user-space with perf
> https://lore.kernel.org/patchwork/patch/1126520/
>
> Is this a work in progress?
> Could you please give me some feedback?
> Thank you for your help.
>
> Thanks,
> Tiezhu
