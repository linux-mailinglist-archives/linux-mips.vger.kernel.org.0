Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F15142FC
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2019 01:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfEEX0K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 May 2019 19:26:10 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38188 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727593AbfEEX0K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 May 2019 19:26:10 -0400
Received: by mail-wm1-f66.google.com with SMTP id f2so8086829wmj.3;
        Sun, 05 May 2019 16:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GTmkkYp9O4ChnQbD0P34NvBTj03oJKXiiUjMEPHMjOg=;
        b=DjiZaw4k/ddENfDxC45oDHS5/3B2Mb2/mxGkJtb6KaEvZSS7GvnWwFQm0+20dKMxgl
         59gsmOIs41zruDD7UdH8WpVRdTX3/JBVZFZV/khHXjtXKoBVX+Q3MyrRUV0S03nlddcA
         oZRUBPyD/xVb12jrpl8EQAVmiECxf27PZesq4UjqL8H0yEZyPrpV1SkL/M9Sba697Rz9
         Ff396RRovGfEXdMXUpZaBLCWSiix0bVfCFWxCi9yOo6Zekarb1nw9lNGTYKXakEF3+V1
         ZpeXBDAKGe7f8+MAtc2z+v/xdDfw2vbw8J38V7ehlPF4KXrOG93PDHOg/u1oei6AJxg8
         pDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GTmkkYp9O4ChnQbD0P34NvBTj03oJKXiiUjMEPHMjOg=;
        b=HzR0vYnzbffzJAGxNqD5xEktlEspB/w/uYNsNpGbX4EwBzVdRJHsnoxXV6/S93zIU/
         4Taqg56ZSa7bexHRCFQlMH7mW+B3o8HLmJOTtHI3Ivcfuoqq9axl2GmA1hJPiLFoqWMa
         P1Q6x4yl5cXWjvFlAl9nJcPQYboiibRpQHjF3olE9ois58hrJaTP4IPfbQhOkwSatonL
         6fN7eeKxZI+yZi92fCwAhXGwO2REbjQZ2iYMCadAJfj4ZxFshjYjhizSXIQc8RTwZ6SF
         q4nfROmyqkqOER5J/RkrVuCfZuaClYGK6Ce3vNwkmPd3LViZX16kn7Y3QvPmilNGdTh1
         YV9A==
X-Gm-Message-State: APjAAAWuDg3YXnvH5QDLvrD+66G0CdpZqGv7ImkX51jQ+pHthWzcEmrU
        GxrYd34UAH0Lna98jxnQRU4=
X-Google-Smtp-Source: APXvYqw7yDQRr+PHbXEOSFZdjXwykw7Vt/GosnoZIHDynIPoA5uOE2gjpaMPTniMJEgxSylw4sRsCQ==
X-Received: by 2002:a1c:c287:: with SMTP id s129mr14661755wmf.63.1557098768189;
        Sun, 05 May 2019 16:26:08 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id f7sm1143823wrt.81.2019.05.05.16.26.04
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 16:26:07 -0700 (PDT)
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
To:     Jonas Gorski <jonas.gorski@gmail.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-2-jonas.gorski@gmail.com>
 <11dc70cb-114b-fb40-1b5e-fd71b8ced1af@amsat.org>
 <CAOiHx==tzUHU1nSf9c2+EtR0wJ=HDstRhHBCBQE5j79_uwJOLQ@mail.gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <98402178-2576-dc91-06e2-b8b4664ef348@amsat.org>
Date:   Mon, 6 May 2019 01:26:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOiHx==tzUHU1nSf9c2+EtR0wJ=HDstRhHBCBQE5j79_uwJOLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/5/19 8:57 PM, Jonas Gorski wrote:
> Hi Philippe,
> 
> On Fri, 3 May 2019 at 16:36, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Jonas,
>>
>> On 5/2/19 2:26 PM, Jonas Gorski wrote:
>>> Add binding documentation for the gated clock controller found on MIPS
>>> based BCM63XX SoCs.
>>
>> I'd have ordered this patch after the #2 of this series, or eventually
>> squashed both together. It is weird to document an unexistant feature
>> then implement it, while the opposite looks more natural.
>> (If you agree, maybe Paul can invert those when applying this series).
>>
>> Anyway:
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> You are documenting hardware, not a driver/feature. :-)
> 
> The binding is supposed to be a separate patch [1]. The natural order
> is to first describe the hardware (with the binding documentation),
> then add the actual driver making use of the binding. Checkpatch.pl
> will also warn if you use a compatible that isn't documented, which
> happens (shortly) if you first add the driver.

Oh, thanks for the pointer, this is my first DT review ;)

> Regards
> Jonas
> 
> [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/submitting-patches.txt#L8
> 
