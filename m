Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABBC123E0EB
	for <lists+linux-mips@lfdr.de>; Thu,  6 Aug 2020 20:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgHFSjS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Aug 2020 14:39:18 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:34336 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbgHFS34 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Aug 2020 14:29:56 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 7639020144;
        Thu,  6 Aug 2020 18:29:44 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 81FCA3F157;
        Thu,  6 Aug 2020 14:27:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id ABEB72A7CD;
        Thu,  6 Aug 2020 20:27:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596738460;
        bh=v6+hYB3wUB+4/fro3yDhVbBnH/mkjkFI9z9KFpiDfWY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=S1ikrnLeCYGOThBERfKTcSAxsaKWw+oY22EKp6ctbJ3sm8pYcpExFdyU69jyvA8yn
         7IL6fwJ7AYeY/OvjCXQ+QJmZKvSe20EzdNzg9L6y0PMOPn2H8zxjqJFvRgBuT1fHgy
         VPl1WurgjhNCgHKVd8de4myzl+hDzQEM6ZaIosTo=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q5uWU0nKA4vN; Thu,  6 Aug 2020 20:27:39 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu,  6 Aug 2020 20:27:39 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id E93A3419D2;
        Thu,  6 Aug 2020 18:27:38 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="FR7C13jQ";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.91])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id AE74441330;
        Thu,  6 Aug 2020 18:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596738369;
        bh=v6+hYB3wUB+4/fro3yDhVbBnH/mkjkFI9z9KFpiDfWY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FR7C13jQLja842FFA+9Mfd6g4RgDFwwYpn9p508EWXpQbJO+EEISvRkT04Yu3kjs5
         8hUoJ8Za/j9z26Nqg84aOmk2fTLDqaHzLGNH4rnzeFnAZjp463C0oIv4aDmpJX9uXo
         mlCjH08OVtGlsQlenkaO2C+wplwCTvCERW2yA96I=
Subject: Re: [PATCH] MIPS: Introduce cmdline argument writecombine=
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596697741-3561-1-git-send-email-yangtiezhu@loongson.cn>
 <10e04885-b775-e7db-b927-6400382fd32d@flygoat.com>
 <cc0c8b89-748d-0d38-bcc8-1c2dbb0996bf@loongson.cn>
 <20200806101733.GA8136@alpha.franken.de>
 <9e563c75-ffaa-45b4-0e99-25a8b1eff828@flygoat.com>
 <20200806165212.GA2754@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c81440ec-a46e-06e1-9ee3-ec3bd2826c4e@flygoat.com>
Date:   Fri, 7 Aug 2020 02:26:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806165212.GA2754@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: E93A3419D2
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/7 上午12:52, Thomas Bogendoerfer 写道:
> On Thu, Aug 06, 2020 at 07:56:20PM +0800, Jiaxun Yang wrote:
>> Our current problem is Loongson's writecombine implementation seems buggy.
>> This is our platform issue rather than target hardware issue.
> ok, so simply clear cpu_data[0].writecombine for the fauly parts
@Tiezhu,

I don't know the exact faulty parts, could you please investigate it in 
Loongson?

I can remember a Loongson stuff told me the issue was solved in GS464E but
there are still users complaining about that.

In fact I can't reproduce it in all of my test systems:
3B1500 + RS780E + R5 230
3A3000 + RS780E Laptop
3A4000 + LS7A + RX550
>> And we don't even know which hardware is known to be good. The same graphic
>> card became a different story on different user's hand.
> find out what is broken and add the needed workarounds then.

Well, let's leave this task for Loongson company.
User's community don't have the ability to trace hardware behavior 
precisely.

>> I understood what Teizhu thought. For entry-level users, we don't want to
>> trouble
>> them, so we have writecombine disabled by default. However, for advanced
>> user
>> trying to tweak their system, we should leave a switch for them to get it
>> back.
> IMHO if we do it that way, we end up with millions of knobs for tweaking
> broken hardware, and nobody knows what's exactly broken. Sorry I won't go
> that way.

Haha, that was my first impression to Linux as a primary school student. 
It just
looks like an aircraft cockpit with thousands of knobs & switches, but 
to airborne
you just need to control yoke and throttle.

- Jiaxun
