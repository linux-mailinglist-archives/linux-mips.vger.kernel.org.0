Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42654288096
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 05:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730126AbgJIDA6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 23:00:58 -0400
Received: from relay2.mymailcheap.com ([217.182.66.162]:49511 "EHLO
        relay2.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728854AbgJIDA5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Oct 2020 23:00:57 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 7DE3C3EDEC;
        Fri,  9 Oct 2020 05:00:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id BDC632A179;
        Thu,  8 Oct 2020 23:00:53 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1602212453;
        bh=RlFIh/NoCr3bDbQDOEvj+VzN9rzRRMO64Gn3oOSIA5A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Rqerc93mlqTBRqBdYJvorMPjdCOjY2O3Fc7khodfS4F1ZUhN6LOPrT9UlcC8wxCNR
         V0rwbimp0x3WSu6CSJHFK02y2D5ccYVUZP7XGwlbCDWLjkgwZ2vEZGF+5ifoPAMeO5
         qVDknOW6bTefty/cRnYvLrkyhMSShu0kl+5CvO7Y=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id eBAvMIH4C6Q0; Thu,  8 Oct 2020 23:00:52 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Thu,  8 Oct 2020 23:00:52 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id B150A40FED;
        Fri,  9 Oct 2020 03:00:51 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="s+dypCzG";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [146.196.55.70])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 52B4840FEC;
        Fri,  9 Oct 2020 03:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1602212444;
        bh=RlFIh/NoCr3bDbQDOEvj+VzN9rzRRMO64Gn3oOSIA5A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=s+dypCzGJCIxfsEkhJ3RFH9JraoliWZWlqJSRihWsMatW+4Me9Agw0FARQwhvR9Dn
         zNkyEHS94AWBHkjEQRhnWnklPtiEDg/jDODPRX31dZ4DPu0nF+ppnZxXtlMHchFxvo
         YoO+RBop/H5/Dih6a93nEVRtLtNFIyYtf9OlO4dI=
Subject: Re: [PATCH v2] MIPS: replace add_memory_region with memblock
To:     Serge Semin <fancer.lancer@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20201008084357.42780-1-tsbogend@alpha.franken.de>
 <20201008152006.4khkbzsxqmmz76rw@mobilestation>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <631aa35e-2575-3ec0-ec0f-7d45e49b8373@flygoat.com>
Date:   Fri, 9 Oct 2020 11:00:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201008152006.4khkbzsxqmmz76rw@mobilestation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B150A40FED
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_TWELVE(0.00)[12];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         FREEMAIL_TO(0.00)[gmail.com,alpha.franken.de];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[hauke-m.de,gmail.com,broadcom.com,linux-mips.org,phrozen.org,vger.kernel.org,lists.infradead.org];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/10/8 23:20, Serge Semin 写道:

[...]
>
>> -		add_memory_region(LOONGSON_HIGHMEM_START,
>> -				  highmemsize << 20, BOOT_MEM_RAM);
>> -
>> -	add_memory_region(LOONGSON_PCI_MEM_END + 1, LOONGSON_HIGHMEM_START -
>> -			  LOONGSON_PCI_MEM_END - 1, BOOT_MEM_RESERVED);
>> -
>> +		memblock_add(LOONGSON_HIGHMEM_START, highmemsize << 20);
> The same question. Is it ok to discard the
> [LOONGSON_PCI_MEM_END+1:LOONGSON_HIGHMEM_START-LOONGSON_PCI_MEM_END-1] region
> removal operation?
Hi all,

I can confirm this reservation can be removed.
It was used to ensure HIGHMEM won't overlap PCI MMIO region when
firmware was unreliable.
But I do think we shouldn't care this case as an unreliable firmware 
shouldn't
ship with any devices for end users.

Also it won't affect display of /proc/iomem, now we're on age of 
DeviceTree :-)

Thanks.

- Jiaxun

>
> -Sergey
>
>>   #endif /* !CONFIG_64BIT */
>>   }
>>   
