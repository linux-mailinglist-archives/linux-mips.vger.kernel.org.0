Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4972D2E9B0E
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 17:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbhADQ30 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 11:29:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbhADQ30 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 11:29:26 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77B7C061574
        for <linux-mips@vger.kernel.org>; Mon,  4 Jan 2021 08:28:45 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id e7so22106948ile.7
        for <linux-mips@vger.kernel.org>; Mon, 04 Jan 2021 08:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PikYwaMXPbcns4YWAYSAbwCQngotLf+x5Uo/jnWhrEk=;
        b=041+Em06OklzgT+LttY8QdRuJnkwKepmwLhY3wSX1tRwxEEqm+SbFDebQUjKelO5cj
         3vTnsxNxg8R7Kot7h/B29dqid7AG+QioYngVanc+Q8d6sGkDPDAX1Nb7oOzdfEnfw6Eu
         NCobfE3c445yDztkm0Jgk2yY+TuL+rorBDyItYPTl1gTBXR7YneDwG0QiqZFfmTqe9XV
         nsxsaUr3khX19WLmA7kfWDRf3w1vmaJcPflwTd8iBLKXL0EJoxtkRxsJdDpl1KYKuF2T
         lS7znv5lnGn504EoILVefx5JbAZyeBib07CYqLwcr1UByLOLqZrhdfmfWlqZhdAez6Dj
         k5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PikYwaMXPbcns4YWAYSAbwCQngotLf+x5Uo/jnWhrEk=;
        b=t7vheI5GfCl41cQb19amCVml8G/Dn0tZDL4rbsfyPBW59Q2gK7rSDZfk3f3xm90m3a
         TGKlz8vEbBWRuxJxzp5nmoLAOAXWlQfDqvgaWA0XAZnCI4FNb/WLpJkPbAtrb+kFweZa
         CJvX6KEHKA11yifjtkNOhD+89pbUoSA/4fwJIJ3SXgBfRIx3iWXHRXKFpMLHNKuNMETq
         Mz+HCuSZmHb5UQMCvIN6hN0H9bv90q6GAIz69nrEHdxodF312ZUyepAbGGRdfm/6Ri7g
         AvErcSIzPUyIP/zuQp1LYCC/19v1Zizt03OBRiJz3Tc06Hh6KDPqS5Krp7QXuhvCUfA9
         sFYA==
X-Gm-Message-State: AOAM533AzN8sE9xB2CE1svspqQlqCcdMqg8LMR7Oqkx/sf2+GcNctesQ
        J91rzn3Z3SmhZl7a0FOdNq0ZEA==
X-Google-Smtp-Source: ABdhPJyjWL0Rg99jLIDR6F3XEFPjeHWmxeG5RxtfWnnEOKr4/wkS9JArJl9YgTiK1H9m1pMyqGedpg==
X-Received: by 2002:a92:d7d2:: with SMTP id g18mr71766999ilq.2.1609777725135;
        Mon, 04 Jan 2021 08:28:45 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id b9sm43630512ill.5.2021.01.04.08.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:28:44 -0800 (PST)
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
To:     Lauri Kasanen <cand@gmx.com>, Keith Busch <kbusch@kernel.org>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-block@vger.kernel.org
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
 <20210104154902.GA1024941@dhcp-10-100-145-180.wdc.com>
 <20210104180115.b1d5438cd4ee21efcd557976@gmx.com>
 <20210104161332.GC1024941@dhcp-10-100-145-180.wdc.com>
 <20210104182720.48a9d74b2b55f5978735eaba@gmx.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <2e65539c-f8f2-d205-527a-0efe2ad8ac95@kernel.dk>
Date:   Mon, 4 Jan 2021 09:28:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104182720.48a9d74b2b55f5978735eaba@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/4/21 9:27 AM, Lauri Kasanen wrote:
> On Mon, 4 Jan 2021 08:13:32 -0800
> Keith Busch <kbusch@kernel.org> wrote:
> 
>>> The media is read-only (but not runtime removable).
>>
>> It's been a while, but I could swear we can save state on these carts.
>> If so, it sounds like that must be separate from the media this driver
>> is accessing, so is that capability provided through a different driver?
> 
> Saving uses a separate mechanism, and there are several depending on
> what type of cart it is (no saves, flash, eeprom, or sram). If the cart
> has no save possibility, there is an optional memory card attached to
> the joypad controller.
> 
> Currently there is no driver for any of these.

Maybe it'd make sense to make this runtime configurable through configfs
or similar, requiring boot parameters (and hence a reboot to change
them) seems pretty iffy. Similarly, why isn't it available as a module?

-- 
Jens Axboe

