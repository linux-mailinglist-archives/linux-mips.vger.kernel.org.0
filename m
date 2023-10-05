Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40AB87BA050
	for <lists+linux-mips@lfdr.de>; Thu,  5 Oct 2023 16:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236392AbjJEOf4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Oct 2023 10:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235751AbjJEOeW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Oct 2023 10:34:22 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8326A6E
        for <linux-mips@vger.kernel.org>; Wed,  4 Oct 2023 23:34:18 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3248ac76acbso570255f8f.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Oct 2023 23:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696487656; x=1697092456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hAGnF6ivb9XCkOa0cJSmkl42J0d0u2NBYDWoXIvrcGA=;
        b=L5IV3LnWLMZdlbi5AOr0h0w+p/Rp4qQU3q1CD6x1KYACQ0tDqvYuqMY8nr/Tvvltml
         J5UzF1aaYEAEEoENq7j20LRzJepLoYzZMsdRQ4LXnCmoyIPO1Qbz7DZjPiVWttOptOp7
         k8htvW9bEdmnkxF7O73midHTCeI7ZiMQhsFFCNe00v+8kXo6R3slyrk/HcDqTZJ/0SJO
         h7d+yqrBIzVT3O7KOu+5aq9tYnl+U0kX3HJb/n3ST9bT40UZSq+qo2Qy1HYjsqxM5TYC
         KMVcVz/zxnq94NcYlSTr47vY0jmXPF7v6RASjf6fZTUHK2XqTfmtKEbY+fH1Pg2SIr2w
         ns3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696487656; x=1697092456;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAGnF6ivb9XCkOa0cJSmkl42J0d0u2NBYDWoXIvrcGA=;
        b=Ae32y6kaRRmAXKv3kXGnkuqwSo/bUsjCvhAvOISK29OINDihgj4J8kZVw9CDPXxtOM
         Jd0+tuEOKOTsvDR2pR138MkDroLJ42q1IZ5czSHCaB0XB6nr2vQawI7AAEqslxRqLvaV
         aXtRM1t0Lv/YioJv2yT6Z8SdcjAgofe3WAYl9x46vhRi1UQp86Mh4bN36BSe6L/i6Ug9
         g2oycsxYkjZYrGfGq2wI2lQDAiKynzP6vhsiih3NLfyaJCiNbB5O55hcVzLHohr+va2y
         cioIk8nbPl5tpOInioC/BlxeEj9Eb2+OrlI9UOREN94wEQk0m3SxjF5x8IvGPd/201Ct
         SnLA==
X-Gm-Message-State: AOJu0YwhyWz07JTsKCdvLZxlNSUTwItspEIJtGIm2CAcXCFop95ehwk8
        MmCcKKbDQcm0eW/L9mMpYfGTFw==
X-Google-Smtp-Source: AGHT+IHfu1g/GRdrcugnUpqlXYMQCy3BPpNW7d/xBS1RRTEcQ3OcEzpLb8O0GphuzAvpN62W7P2H6g==
X-Received: by 2002:adf:d08e:0:b0:319:74b5:b67d with SMTP id y14-20020adfd08e000000b0031974b5b67dmr3741813wrh.66.1696487656662;
        Wed, 04 Oct 2023 23:34:16 -0700 (PDT)
Received: from [192.168.69.115] (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr. [176.171.211.120])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d60ce000000b0032763287473sm946899wrt.75.2023.10.04.23.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 23:34:16 -0700 (PDT)
Message-ID: <9415563e-1429-8bca-25e2-12b474c3c5c8@linaro.org>
Date:   Thu, 5 Oct 2023 08:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 04/11] dt-bindings: Add vendor prefix for Mobileye Vision
 Technologies Ltd.
Content-Language: en-US
To:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?Q?Th=c3=a9o_Lebrun?= <theo.lebrun@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231004161038.2818327-1-gregory.clement@bootlin.com>
 <20231004161038.2818327-5-gregory.clement@bootlin.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231004161038.2818327-5-gregory.clement@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/10/23 18:10, Gregory CLEMENT wrote:
> Mobileye Vision Technologies Ltd. is a company developing autonomous
> driving technologies and advanced driver-assistance systems (ADAS)
> including cameras, computer chips and software.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


