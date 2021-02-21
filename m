Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3BF320A7A
	for <lists+linux-mips@lfdr.de>; Sun, 21 Feb 2021 14:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhBUNOx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Feb 2021 08:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhBUNOc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Feb 2021 08:14:32 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3DBC061786
        for <linux-mips@vger.kernel.org>; Sun, 21 Feb 2021 05:13:52 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id a4so8375192pgc.11
        for <linux-mips@vger.kernel.org>; Sun, 21 Feb 2021 05:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZzhsAzI+WwVZdpOkDos1+vbKvp69jC1HTeXXKiCZqmo=;
        b=wX9aoRjkttXuVHotMvkxJlXH4a6/x1WTC0NIBNRcbPP/ZJiB/Qw8xMFCw838fEyLR+
         huUhbIPkPz8FAk7ECfSHYxa3Z+045Ufvos5mOaI4D1OOeqYwOFwAGjLpCFUYeWh9zENQ
         12M8gsCTfYKYbpHmcDbNx9ACPNV5rHyMgfYu7MVVoNGq4wpuYejME9cbPBEQQNG+ren+
         BIx07LplzByJ9c4xR9fc7V4+Si8MEBuWXOw8igK0sRuxz1lLl5gyY22GDYrl/EZXyJoi
         OARvftvTs2tOVkqt/C7EIyx9bHfrhDaAn+xivMEfdJ13RQan58cxlSu9+5eEU2uUvWqu
         V2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZzhsAzI+WwVZdpOkDos1+vbKvp69jC1HTeXXKiCZqmo=;
        b=sLWAEo3IAzU6JddI0g6KyMtIJtDRFq1vkTuJQqMseggmdxONAyf+oTLMJg8+NEsTGA
         m+V8ZshXyit85wvQiWHmIKP60vE8+VvvyZnVUcWSbbh8/tAKH8qMSmODVScKpX2hi9vZ
         qEAJUND7IitjItUijf3hAJ4dnZz5V3oGcJsQSKePOOG9D36jENutML83mgqEv2Jc6P3q
         qu5roF5nEbSGG2kc0h0DbskjfBagSdtoGYI8lvOPIzrEgFNWdCyO3YhLLHhIcUZP+a8E
         cJSShBfwF0UHnfwgUXixxamryxSsh+hjd5NeRb+cwCxJ6hmhPouENtXzgnhRUatx6sW2
         WdgA==
X-Gm-Message-State: AOAM530oiS6eIJ8ZoGV70t3bxsVchTfKAgnwcOiP94xQeaLY73rgwqKE
        mA2+Nv5d2yCb5Jz5NOAPZw4DSQ==
X-Google-Smtp-Source: ABdhPJwN4Xl8Yqv5LLznbNU+sXyTh+ABxiKKbIL7xelk4+AbJDaScYfDIWMOLxmQA0uZVs0m1EpTOQ==
X-Received: by 2002:aa7:9356:0:b029:1dd:644a:d904 with SMTP id 22-20020aa793560000b02901dd644ad904mr17697411pfn.18.1613913231729;
        Sun, 21 Feb 2021 05:13:51 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id fz24sm14966856pjb.35.2021.02.21.05.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 05:13:50 -0800 (PST)
Subject: Re: [PATCH v11] block: Add n64 cart driver
To:     Lauri Kasanen <cand@gmx.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-mips@vger.kernel.org,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>
References: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
 <20210123124210.GB458363@infradead.org>
 <20210206192837.5ecec54cc5ac120ade1d5060@gmx.com>
 <20210211102314.GD7985@alpha.franken.de>
 <20210221085421.882c8f0b8b51f44272beb471@gmx.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <6c003ea4-2d4e-c50a-25de-00f3ed55b0c2@kernel.dk>
Date:   Sun, 21 Feb 2021 06:13:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221085421.882c8f0b8b51f44272beb471@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/20/21 11:54 PM, Lauri Kasanen wrote:
> On Thu, 11 Feb 2021 11:23:14 +0100
> Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:
> 
>> On Sat, Feb 06, 2021 at 07:28:37PM +0200, Lauri Kasanen wrote:
>>> On Sat, 23 Jan 2021 12:42:10 +0000
>>> Christoph Hellwig <hch@infradead.org> wrote:
>>>
>>>> Looks good,
>>>>
>>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>>
>>> Hi,
>>>
>>> Ping on this patch. Thomas, do you want to pick it up?
>>
>> well that's up to the block maintainer. I'm open to take it
>> trhough mips-next, but then I need an acked-by for it.
> 
> Hi,
> 
> Ping 2. Jens, I know you're busy, but just a mention this is on your
> TODO list would be fine.

That's fine, you can add my acked-by to the driver.

-- 
Jens Axboe

