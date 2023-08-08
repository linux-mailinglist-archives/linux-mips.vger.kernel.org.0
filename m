Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE9F774CF9
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 23:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236234AbjHHVXq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 17:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236384AbjHHVXg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 17:23:36 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31AAB19B0
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 14:22:56 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-63c70dc7ed2so41771906d6.0
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691529775; x=1692134575;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAfKJttSc6RMc1kx0NwaeBECgsM9wq/2wY2wW3WfpNE=;
        b=oIVhyAjqBOJNoiGz6lvKgE8mlWUf2Y/T25UZpV5fAES7nnfjTe4zOepgKsThzfr3rE
         y9xJXQRJ6v0Rrxd4idkaeVA589BXOhLh0McwPExujxhjgbCO286PfZaJRi6zM9KBT1Kb
         oHnntKzPAa9/nIbdiwWSQnLF3P38vkNNIIRKVe81qwqF8YsfVtS3x85Pq3RYeOju7XAG
         vYJ2zX9418NYXXvLRD7WUEFqFERiqjmaU5IbqfhVFQxRUHQj//99P02W0ujfZJnlAhp8
         0XxnfG1ipbiYlim5bUEx21nnsxbJuS5mlX8rNeP/4Fj/3Vr13oBxWY1Y8j+z6ETNRpBA
         uMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691529775; x=1692134575;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAfKJttSc6RMc1kx0NwaeBECgsM9wq/2wY2wW3WfpNE=;
        b=EbYRpmSLwk6jFWKj3LOjgTBFkgpjhhkiOkCabpyO5jsOsUovLzIHIiNyOK4WCJJiaC
         2Q6BH7NkpWhicj/ejzJYKdrIWl3yAm8Cv9V7fajeAEk+nc59CbSNigG91mQaBUaBxjme
         oj0uYw6uDz9Jtmzy0VVzvUQdcWjT7jM/KmLQ6DcQ9KQ8Q4aeMLNZLJVPOTGg/vlg22JU
         1QKu/pbL3Q/EMnbRO5r69dHZ9e3Vm8+fNYIfrhwncDUBFc9a0OKQzvBBz96kCCBwwlVT
         Al/rkgYomgVvMxZr1hF+hs6F4WHV6HcG3daF9T2SdqYlLhMh5QYr/qEE87QrBcDCNOTz
         bE+g==
X-Gm-Message-State: AOJu0Yz2lJUWhlPi32iS9RBXnRh0e8GJuL+j72rp0WEik7/Mi5FKLgn6
        HlPW3rXO/qGQT/RTieY1gXp00UjDNqJh1w==
X-Google-Smtp-Source: AGHT+IHYG2JV8Jokbcp3rDkyodhSV1xwHvPv8yyV4J6pG+XC97wbTohly6+IfKZGBSDcPcG+5D7lWA==
X-Received: by 2002:a05:6214:440f:b0:62f:fd5d:4ff with SMTP id oj15-20020a056214440f00b0062ffd5d04ffmr610950qvb.21.1691529775208;
        Tue, 08 Aug 2023 14:22:55 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d28-20020a0caa1c000000b0063f78bc8685sm3262319qvb.139.2023.08.08.14.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 14:22:54 -0700 (PDT)
Message-ID: <48b77305-6b92-c453-d222-aad9a8834c69@gmail.com>
Date:   Tue, 8 Aug 2023 14:22:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: soft and hard float n32 and n64 binaries getting illegal
 instructions on Cobalt Qube2
Content-Language: en-US
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>
References: <733b4eec-6297-e72e-0803-a32a25d83072@gmail.com>
 <alpine.DEB.2.21.2308051412570.38537@angie.orcam.me.uk>
 <3afb0b00-e4f2-15a7-c68f-8b2475dc9f77@gmail.com>
 <alpine.DEB.2.21.2308081027580.38537@angie.orcam.me.uk>
 <alpine.DEB.2.21.2308081153240.38537@angie.orcam.me.uk>
 <e161f63c-e573-7bb6-b988-d949c8ef0ac4@gmail.com>
 <alpine.DEB.2.21.2308082044400.38537@angie.orcam.me.uk>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2308082044400.38537@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/8/23 12:54, Maciej W. Rozycki wrote:
> On Tue, 8 Aug 2023, Florian Fainelli wrote:
> 
>> Now GDB tells me the faulting instruction is the following:
>>
>> #0  0x77dcf190 in _dlstart_data () from target/lib/ld-musl-mipsn32el.so.1
>> #1  0x77e28bfc in ?? () from target/lib/ld-musl-mipsn32el.so.1
>> (gdb) display/i $pc
>> 2: x/i $pc
>> => 0x77dcf190 <_dlstart_data+17976>:    dclz    v1,a0
> 
>   So this is a MIPS64r1 instruction and Cobalt Qube2 is what, MIPS III?

It goes all the way through MIPS IV:

isa                     : mips1 mips2 mips3 mips4

> It looks like you've got a broken binary that expects a higher ISA version
> than what your hardware supports.  Assuming that you have built it with
> the correct compilation options (which I take it is the case given that
> your installation mostly works), you need to sort it out with the supplier
> of your software.  Perhaps there's inline assembly there that has been
> guarded incorrectly (though it shouldn't be necessary as GCC is itself
> able to produce DCLZ where suitable).

It is my bad having assumed that the RM5231 CPU was MIPS64R1 capable and 
I completely forgot that it was not the case, thanks a lot for your 
help. I have now told GCC to build for -march=mips4 by default and it 
works properly.

I will in in that corner over there to hide ->
-- 
Florian

