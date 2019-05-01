Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9833210781
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 13:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfEALd3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 May 2019 07:33:29 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34638 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfEALd3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 May 2019 07:33:29 -0400
Received: by mail-pg1-f196.google.com with SMTP id c13so7230930pgt.1;
        Wed, 01 May 2019 04:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0p8KwRB28czlaGQ7jCTVfloESbGnbWWlQ1Azi5oU8aY=;
        b=ScaBtyen1IG9lI8poQ4+4IK/gGFQQZYTclkQPC1q9kCYc9Ch7n5DzA0LnJMWyPRL2s
         EgTk3vqX1ajyOcBb5l4Q/Kc6rSpRWwnlAy9yGC7Y/mZd32NNtGHzUzisRolJiuJ8QLve
         ZAi5nnVCPMMaDUk0kipKYH/si9jWxU9YLdcge6hvPXQeaRJhRdlnaGrphODmT5zhj8PQ
         XdOGnOwaWxMOU9VP4ezQmyvwQZT6RMtiPir6MIUYZKyiSOt10K1HCksGpu6vc4cZUQk2
         UW4kvYukHlY8RDBh4S4oh6O4gMgzhhkwT6H4gUiNfK9df1FSzVl/qTxzziPB95JUJAbJ
         F0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0p8KwRB28czlaGQ7jCTVfloESbGnbWWlQ1Azi5oU8aY=;
        b=Oe9O4SrmxvGZE2t2QgzHdSWv7ac3GTLfW9vp6Vtjg+7p+UxDI1A8UdExlT2FTOyx4L
         bR3a4RNKkw2pFlI7MJTF/VyLTmHnLwtO2OzHX4TZ3qH7/OWVEFeJLWQ4vHYey7heQYmb
         xaJjGX5Hh3pQhCQx83JDpBlatSShZ+a71CpKmXQVh00rZstEy8IRWAi+pmlePS3/h8ND
         OND6JFLiPT1bvOlmKmKE2tJVFa4tgPUjovS22K2l903sT3gxn8S53TXrOUEvU9ISzK48
         kpyPbHqeQFkjYuorT1XKeFmqurFb/PLpV5bH7ZvXlPpVTVA6BDP/pAhpOM2Wpg43sS3D
         OwFQ==
X-Gm-Message-State: APjAAAXmxUGzqyvyADVZlGg7EDgZLEqksp4/FurypsX5tMEWiqgo1lsc
        cOx73R2gIW0OYkQwe9Y8v4KsNlrS
X-Google-Smtp-Source: APXvYqw88xr0s8VBYKvX91eC18O0Mb22TOUHd+/98bTc4kANUmNbGe8tOkRFtuqXE3ioflXg0pfMBg==
X-Received: by 2002:a63:fb58:: with SMTP id w24mr37789532pgj.444.1556710408622;
        Wed, 01 May 2019 04:33:28 -0700 (PDT)
Received: from ?IPv6:2409:251:20c0:100:fe80:8e59:9ae1:e028? ([2409:251:20c0:100:fe80:8e59:9ae1:e028])
        by smtp.gmail.com with ESMTPSA id r24sm51157410pfd.120.2019.05.01.04.33.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 04:33:27 -0700 (PDT)
Subject: Re: [RFC v2 2/5] dt-bindings: clk: add document for ralink clock
 driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     John Crispin <john@phrozen.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
References: <20190405000129.19331-1-drvlabo@gmail.com>
 <20190405000129.19331-3-drvlabo@gmail.com>
 <155622059236.15276.15417177789148260137@swboyd.mtv.corp.google.com>
From:   NOGUCHI Hiroshi <drvlabo@gmail.com>
Message-ID: <1fe454d3-f24e-4169-5f57-97d516a16cc8@gmail.com>
Date:   Wed, 1 May 2019 20:33:24 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155622059236.15276.15417177789148260137@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2019/04/26 4:29, Stephen Boyd wrote:
>> +Required properties:
>> + - compatible: must be "ralink,rt2880-clock"
>> + - #clock-cells: must be 1
>> + - ralink,sysctl: a phandle to a ralink syscon register region
>> + - clock-indices: identifying number.
>> +       These must correspond to the bit number in CLKCFG1.
> 
> These look like driver level details that we're putting in the DT so we
> can compress the number space that consumers use. Is that right? If so,
> I don't get it. Can we not use this property?

I understand that the bit numbers in clock gating register are hardware 
resource informations.
Therefore, it is not strange that they are described in DT, I think.


>> +       Clock consumers use one of them as #clock-cells index.
>> + - clock-output-names: array of gating clocks' names
>> + - clocks: array of phandles which points the parent clock
>> +       for gating clocks.
>> +       If gating clock does not need parent clock linkage,
>> +       we bind to dummy clock whose frequency is zero.
>> +
>> +
>> +Example:
>> +
>> +/* dummy parent clock node */
>> +dummy_ck: dummy_ck {
>> +       #clock-cells = <0>;
>> +       compatible = "fixed-clock";
>> +       clock-frequency = <0>;
>> +};
> 
> Would this ever exist in practice? If not, please remove from the
> example so we don't get the wrong idea.

I referred to arch/arm/boot/dts/.
omap24xx-clocks.dtsi : defines dummy_ck
omap2420-clocks.dtsi : refers dummy_ck


In practice, There is no problem in specifying another existing clock,
eg MT7620_CLK_PERIPH which is always active.


>> +
>> +clkctrl: clkctrl {
>> +       compatible = "ralink,rt2880-clock";
>> +       #clock-cells = <1>;
>> +       ralink,sysctl = <&sysc>;
>> +
>> +       clock-indices =
>> +                       <12>,
>> +                       <16>, <17>, <18>, <19>,
>> +                       <20>,
>> +                       <26>;
>> +       clock-output-names =
>> +                       "uart0",
>> +                       "i2c", "i2s", "spi", "uart1",
>> +                       "uart2",
>> +                       "pcie0";
>> +       clocks =
>> +                       <&pll MT7620_CLK_PERIPH>,
>> +                       <&pll MT7620_CLK_PERIPH>, <&pll MT7620_CLK_PCMI2S>, <&pll MT7620_CLK_SYS>, <&pll MT7620_CLK_PERIPH>,
>> +                       <&pll MT7620_CLK_PERIPH>,
>> +                       <&dummy_ck>;
>> +       };
>> +};
>> +
>> +/* consumer which refers "uart0" clock */
>> +uart0: uartlite@c00 {
>> +       compatible = "ns16550a";
>> +       reg = <0xc00 0x100>;
>> +
>> +       clocks = <&clkctrl 12>;
> 
> So 12 matches in indices and then that is really "uart0" clk?
> 
>> +       clock-names = "uart0";
>> +

That is right.
rt2880-clock driver is implemented to let clock cell indices match 
indcies in "clock-indices" property.
