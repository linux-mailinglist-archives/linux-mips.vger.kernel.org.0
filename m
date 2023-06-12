Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BECBA72BE5A
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jun 2023 12:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbjFLKJn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Jun 2023 06:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237453AbjFLKG2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Jun 2023 06:06:28 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2FC65B8
        for <linux-mips@vger.kernel.org>; Mon, 12 Jun 2023 02:48:40 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30fbcfdc7b6so673631f8f.3
        for <linux-mips@vger.kernel.org>; Mon, 12 Jun 2023 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563319; x=1689155319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlNSyW01k9RQ6r3TAUIxxl3gEy3tIBaKB2a3SyuONic=;
        b=xxOQI6NNANXTOWzWS32SlBLOHCGyjc8GT/MPA9syGH0nXWWJ9aMkSIyACTIqtJwwz7
         aYWnV86EdevV+5dsjqn/qWqqczxClLrLQQkvtDcNgXhqZGaAeGj/d3yarqk68XqjrEmb
         Vo/6ODEO9VnUPhXuJJhSWUIAW5cDYN4C85WUsQ6TrLtbhacAo23MyP+vXkEf2jTd8Gzy
         wFDB79XoTZeiYS0mYd7BIygw/punojTzRtBal0junmkVOpebP+ZN6XoUMx/gYLFJQhJ/
         PW7nmS7FcxFY3huNztvPY2T5+uvK+tVCpZxRsOLksYhr7rItDRC4yBSMBji1/Z9DKL7X
         TEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563319; x=1689155319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlNSyW01k9RQ6r3TAUIxxl3gEy3tIBaKB2a3SyuONic=;
        b=YNfmAbMmWQEG/jhdMdWxCj5bD6ttrDi87A8vBUEp9kdmz/nZximDJG5jmfCLe4re05
         +1dumMeyu0W7MXJHXdDamRBdlYebi63Mt4l7OgH655ToubkcYl1rOO5rMXjPD9QMZ5kF
         +hgHKTuHLPAER5RoTXfirs9ko1XJL52VP3h8HwgWGOlkXxVLtFjgsueFoISu3eh9RcRq
         a/c19481dgXyCwvtycPbIWEMFuYYglQBN3SxQuYlpzlPqr74+RvPh2ftN9uHHlAscg5Z
         TnynYe46EToHWgXyDkmtzURm9yOpVBm3BxjFC8yOnaWKUVC9KGXE0dZo+4lP5NugXRP5
         kwkQ==
X-Gm-Message-State: AC+VfDz+w+MtgOCY9QD1D+LbsMD8GUO1dX9S6YT9wrJ9pKg3KdVsMn5c
        1c9j45dhAS8ESqEJ+67Dp/A6uw==
X-Google-Smtp-Source: ACHHUZ6J0MuzEgB+zY5N5cGweR8g3pcXTay98BeXBUo3Yy7hzVoM691gG3iZCVtdC3Kll3oHg6ecTg==
X-Received: by 2002:a5d:6e0c:0:b0:30e:45a5:9476 with SMTP id h12-20020a5d6e0c000000b0030e45a59476mr4219195wrz.1.1686563318849;
        Mon, 12 Jun 2023 02:48:38 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id t12-20020adfe10c000000b00307acec258esm11905152wrz.3.2023.06.12.02.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 02:48:38 -0700 (PDT)
Message-ID: <ea22bff7-ecd2-018e-77a1-1d2edaa21355@linaro.org>
Date:   Mon, 12 Jun 2023 10:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Build regressions/improvements in v6.4-rc6
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kernel@vger.kernel.org
Cc:     linux-um@lists.infradead.org, linux-spi@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <CAHk-=wgmbjQu3bVSa5JJhEymeQhkr7N3cjg-CoNLVituUnfW8w@mail.gmail.com>
 <20230612090911.1579029-1-geert@linux-m68k.org>
 <9c7f3e17-c1-1a3a-7e87-9b1ea25d9d7@linux-m68k.org>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <9c7f3e17-c1-1a3a-7e87-9b1ea25d9d7@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/12/23 10:28, Geert Uytterhoeven wrote:
>> JFYI, when comparing v6.4-rc6[1] to v6.4-rc5[3], the summaries are:
>>  - build errors: +5/-6
> 
>   + /kisskb/src/drivers/spi/spi-stm32-qspi.c: error: ‘op’ is used
> uninitialized [-Werror=uninitialized]:  => 523:27, 564:27

Seems that the report is not correct for this particular case as op is
filled either by memcpy or memset before use.
